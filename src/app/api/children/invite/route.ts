import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { sql } from '@/lib/db'
import { Resend } from 'resend'

const resend = new Resend(process.env.RESEND_API_KEY)

/**
 * POST /api/children/invite
 * Envoie une invitation par courriel à un enfant (mode autonomie secondaire).
 * Génère le lien via Supabase Admin, envoie l'email via Resend (meilleure délivrabilité).
 * Body: { child_id: string, child_email: string }
 */
export async function POST(request: Request) {
  try {
    const supabase = await createClient()
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    if (authError || !user) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 })
    }

    const { child_id, child_email } = await request.json()

    if (!child_id || !child_email || !child_email.includes('@')) {
      return NextResponse.json({ error: 'Données invalides' }, { status: 400 })
    }

    // Vérifier que ce parent possède cet enfant
    const [link] = await sql`
      SELECT child_id FROM parent_child_links
      WHERE parent_id = ${user.id}::uuid AND child_id = ${child_id}::uuid
    `
    if (!link) {
      return NextResponse.json({ error: 'Accès refusé' }, { status: 403 })
    }

    const [child] = await sql`
      SELECT id, display_name, grade_level FROM children WHERE id = ${child_id}::uuid
    `
    if (!child) {
      return NextResponse.json({ error: 'Enfant introuvable' }, { status: 404 })
    }

    const admin = createAdminClient()
    const redirectTo = `${process.env.NEXT_PUBLIC_SITE_URL}/api/children/link-account?child_id=${child_id}`

    // Générer le lien d'invitation sans envoyer l'email Supabase
    // type 'invite' crée le compte + retourne action_link sans email automatique
    let actionLink: string | null = null

    const { data: genData, error: genErr } = await admin.auth.admin.generateLink({
      type: 'invite',
      email: child_email,
      options: {
        redirectTo,
        data: {
          is_child: true,
          child_id: child_id,
          display_name: child.display_name,
          parent_id: user.id,
        },
      },
    })

    if (genErr) {
      // Compte déjà existant → magic link pour se reconnecter
      if (genErr.message?.includes('already been registered') || genErr.message?.includes('User already registered')) {
        const { data: ml, error: mlErr } = await admin.auth.admin.generateLink({
          type: 'magiclink',
          email: child_email,
          options: { redirectTo },
        })
        if (mlErr || !ml) {
          return NextResponse.json({ error: 'Ce courriel est déjà utilisé et ne peut être réinvité.' }, { status: 409 })
        }
        actionLink = ml.properties?.action_link ?? null
      } else {
        return NextResponse.json({ error: 'Erreur génération lien: ' + genErr.message }, { status: 500 })
      }
    } else {
      actionLink = genData?.properties?.action_link ?? null
    }

    if (!actionLink) {
      return NextResponse.json({ error: 'Impossible de générer le lien d\'invitation.' }, { status: 500 })
    }

    // Envoyer via Resend (meilleure délivrabilité que le SMTP Supabase par défaut)
    const { error: emailErr } = await resend.emails.send({
      from: 'Savoila <noreply@savoila.com>',
      to: child_email,
      subject: `${child.display_name}, tu es invité(e) sur Savoila ! 🎓`,
      html: buildInviteHtml({ displayName: child.display_name, actionLink }),
    })

    if (emailErr) {
      console.error('[invite] Resend error:', emailErr)
      return NextResponse.json({ error: 'Erreur envoi courriel: ' + emailErr.message }, { status: 500 })
    }

    // Sauvegarder le mode autonomie + courriel
    await sql`
      UPDATE children
      SET
        autonomy_mode = TRUE,
        child_email   = ${child_email},
        child_pin_hash = NULL,
        child_system_password = NULL
      WHERE id = ${child_id}::uuid
    `

    return NextResponse.json({
      success: true,
      message: `Invitation envoyée à ${child_email}`,
    })
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : 'Erreur serveur'
    console.error('[invite]', err)
    return NextResponse.json({ error: message }, { status: 500 })
  }
}

function buildInviteHtml({ displayName, actionLink }: { displayName: string; actionLink: string }): string {
  return `<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Invitation Savoila</title>
</head>
<body style="margin:0;padding:0;background:#f9fafb;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="padding:32px 16px;">
    <tr><td align="center">
      <table width="100%" cellpadding="0" cellspacing="0" style="max-width:520px;background:#fff;border-radius:16px;border:1px solid #e5e7eb;overflow:hidden;">

        <!-- Header -->
        <tr>
          <td style="background:linear-gradient(135deg,#4f46e5,#7c3aed);padding:32px;text-align:center;">
            <div style="font-size:40px;margin-bottom:8px;">🎓</div>
            <h1 style="color:#fff;margin:0;font-size:22px;font-weight:700;">Bienvenue sur Savoila !</h1>
            <p style="color:rgba(255,255,255,0.85);margin:6px 0 0;font-size:14px;">La plateforme éducative québécoise</p>
          </td>
        </tr>

        <!-- Body -->
        <tr>
          <td style="padding:32px;">
            <p style="margin:0 0 16px;font-size:16px;color:#111827;">
              Bonjour <strong>${displayName}</strong> ! 👋
            </p>
            <p style="margin:0 0 24px;font-size:15px;color:#374151;line-height:1.6;">
              Ton parent t'a inscrit(e) sur <strong>Savoila</strong>, une plateforme pour pratiquer
              les mathématiques et le français du secondaire québécois de façon amusante.
            </p>
            <p style="margin:0 0 24px;font-size:15px;color:#374151;line-height:1.6;">
              Clique sur le bouton ci-dessous pour créer ton compte et commencer à apprendre ! 🚀
            </p>

            <!-- CTA -->
            <table width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center" style="padding:8px 0 24px;">
                  <a href="${actionLink}"
                     style="display:inline-block;background:linear-gradient(135deg,#4f46e5,#7c3aed);color:#fff;font-weight:700;font-size:16px;text-decoration:none;padding:16px 40px;border-radius:12px;">
                    Créer mon compte →
                  </a>
                </td>
              </tr>
            </table>

            <p style="margin:0 0 8px;font-size:13px;color:#6b7280;">
              Si le bouton ne fonctionne pas, copie ce lien dans ton navigateur :
            </p>
            <p style="margin:0 0 24px;font-size:12px;color:#4f46e5;word-break:break-all;">
              ${actionLink}
            </p>

            <hr style="border:none;border-top:1px solid #e5e7eb;margin:0 0 20px;" />
            <p style="margin:0;font-size:12px;color:#9ca3af;text-align:center;">
              Ce lien est valide 24 heures. Si tu n'attendais pas cet email, ignore-le.
            </p>
          </td>
        </tr>

      </table>
    </td></tr>
  </table>
</body>
</html>`
}
