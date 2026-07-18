import { NextRequest, NextResponse } from 'next/server'
import { createAdminClient } from '@/lib/supabase/admin'
import { createClient } from '@/lib/supabase/server'
import { Resend } from 'resend'
import { sql } from '@/lib/db'

const resend = new Resend(process.env.RESEND_API_KEY)

function buildEmailHtml(data: {
  student_name: string
  parent_email: string
  xp_this_week: number
  sessions_this_week: number
  streak: number
  total_xp: number
  avg_accuracy: number
  top_skill: string | null
  weak_skill: string | null
  rapport_url: string
}): string {
  const { student_name, xp_this_week, sessions_this_week, streak, total_xp, avg_accuracy, top_skill, weak_skill, rapport_url } = data

  return `<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Rapport hebdomadaire Savoila</title>
</head>
<body style="margin:0;padding:0;background:#f9fafb;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="padding:32px 16px;">
    <tr><td align="center">
      <table width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;background:#fff;border-radius:16px;border:1px solid #e5e7eb;overflow:hidden;">

        <!-- Header -->
        <tr>
          <td style="background:linear-gradient(135deg,#4f46e5,#7c3aed);padding:32px;text-align:center;">
            <div style="font-size:32px;margin-bottom:8px;">📚</div>
            <h1 style="color:#fff;margin:0;font-size:22px;font-weight:700;">Rapport hebdomadaire</h1>
            <p style="color:rgba(255,255,255,0.8);margin:4px 0 0;font-size:14px;">${student_name} — Savoila</p>
          </td>
        </tr>

        <!-- Stats -->
        <tr>
          <td style="padding:28px;">
            <table width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td width="33%" style="text-align:center;padding:12px;background:#f0f9ff;border-radius:12px;">
                  <div style="font-size:28px;font-weight:800;color:#4f46e5;">${sessions_this_week}</div>
                  <div style="font-size:11px;color:#6b7280;margin-top:2px;">sessions</div>
                </td>
                <td width="4%"></td>
                <td width="33%" style="text-align:center;padding:12px;background:#fffbeb;border-radius:12px;">
                  <div style="font-size:28px;font-weight:800;color:#f59e0b;">+${xp_this_week} ⭐</div>
                  <div style="font-size:11px;color:#6b7280;margin-top:2px;">XP cette semaine</div>
                </td>
                <td width="4%"></td>
                <td width="33%" style="text-align:center;padding:12px;background:#fff7ed;border-radius:12px;">
                  <div style="font-size:28px;font-weight:800;color:#f97316;">${streak} 🔥</div>
                  <div style="font-size:11px;color:#6b7280;margin-top:2px;">jours consécutifs</div>
                </td>
              </tr>
            </table>

            <!-- Précision -->
            ${avg_accuracy > 0 ? `
            <div style="margin-top:20px;background:#f8fafc;border-radius:12px;padding:16px;">
              <p style="margin:0 0 8px;font-size:13px;color:#374151;font-weight:600;">Précision cette semaine</p>
              <div style="background:#e5e7eb;border-radius:999px;height:10px;overflow:hidden;">
                <div style="background:linear-gradient(90deg,#4f46e5,#7c3aed);height:10px;width:${Math.min(100, avg_accuracy)}%;border-radius:999px;"></div>
              </div>
              <p style="margin:6px 0 0;font-size:12px;color:#6b7280;text-align:right;">${avg_accuracy}% de bonnes réponses</p>
            </div>` : ''}

            <!-- Points forts -->
            <table width="100%" cellpadding="0" cellspacing="0" style="margin-top:20px;">
              ${top_skill ? `
              <tr>
                <td style="padding:10px;background:#f0fdf4;border-radius:10px;margin-bottom:8px;">
                  <span style="font-size:15px;">🌟</span>
                  <span style="font-size:13px;color:#166534;font-weight:600;margin-left:6px;">Point fort : ${top_skill}</span>
                </td>
              </tr>` : ''}
              ${weak_skill ? `
              <tr><td style="height:8px;"></td></tr>
              <tr>
                <td style="padding:10px;background:#fefce8;border-radius:10px;">
                  <span style="font-size:15px;">💪</span>
                  <span style="font-size:13px;color:#854d0e;font-weight:600;margin-left:6px;">À renforcer : ${weak_skill}</span>
                </td>
              </tr>` : ''}
            </table>

            <!-- XP total -->
            <p style="margin:20px 0 0;font-size:13px;color:#6b7280;text-align:center;">
              Total cumulé : <strong style="color:#374151;">${total_xp} XP</strong>
            </p>

            <!-- CTA -->
            <div style="margin-top:24px;text-align:center;">
              <a href="${rapport_url}"
                style="display:inline-block;background:linear-gradient(135deg,#4f46e5,#7c3aed);color:#fff;text-decoration:none;padding:12px 28px;border-radius:10px;font-size:14px;font-weight:600;">
                Voir le rapport complet →
              </a>
              <p style="margin:10px 0 0;font-size:11px;color:#9ca3af;">Ce lien est valide 7 jours — aucune connexion requise</p>
            </div>
          </td>
        </tr>

        <!-- Footer -->
        <tr>
          <td style="background:#f9fafb;border-top:1px solid #e5e7eb;padding:16px;text-align:center;">
            <p style="margin:0;font-size:11px;color:#9ca3af;">
              Savoila — Plateforme éducative adaptative pour le Québec<br/>
              Vous recevez cet courriel car vous êtes parent sur Savoila.
            </p>
          </td>
        </tr>

      </table>
    </td></tr>
  </table>
</body>
</html>`
}

export async function POST(req: NextRequest) {
  try {
    const { searchParams } = new URL(req.url)
    const studentId = searchParams.get('studentId') ?? searchParams.get('childId')
    if (!studentId) return NextResponse.json({ error: 'studentId requis' }, { status: 400 })

    // Vérifier que le parent est connecté et possède cet élève
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return NextResponse.json({ error: 'Non autorisé' }, { status: 401 })

    // postgres direct — parent_child_links et children absents du cache PostgREST
    const [linkRow] = await sql<{ display_name: string }[]>`
      SELECT c.display_name
      FROM parent_child_links pcl
      JOIN children c ON c.id = pcl.child_id
      WHERE pcl.parent_id = ${user.id}::uuid AND pcl.child_id = ${studentId}::uuid
    `
    if (!linkRow) return NextResponse.json({ error: 'Élève introuvable' }, { status: 404 })

    const childName = linkRow.display_name ?? 'Votre enfant'

    // Récupérer les données du rapport via admin client
    const admin = createAdminClient()
    const { data: reportData } = await admin.rpc('get_weekly_report_data', { p_child_id: studentId })

    // Fallback si la fonction RPC n'existe pas encore
    const safeReport = reportData ?? {
      student_name: childName,
      xp_this_week: 0,
      sessions_this_week: 0,
      streak: 0,
      total_xp: 0,
      avg_accuracy: 0,
      top_skill: null,
      weak_skill: null,
    }

    const appUrl = process.env.NEXT_PUBLIC_APP_URL ?? 'http://localhost:3000'
    const weekStart = new Date()
    weekStart.setDate(weekStart.getDate() - weekStart.getDay() + 1) // lundi de la semaine courante
    const weekStartStr = weekStart.toISOString().slice(0, 10)

    // Générer le jeton magique pour ce rapport
    const { data: tokenRow, error: tokenError } = await admin
      .from('report_tokens')
      .insert({
        child_id: studentId,
        parent_id: user.id,
        week_start: weekStartStr,
        report_data: safeReport,
      })
      .select('token')
      .single()

    if (tokenError || !tokenRow) {
      console.error('Token generation error:', tokenError)
      return NextResponse.json({ error: 'Erreur génération token' }, { status: 500 })
    }

    const rapport_url = `${appUrl}/rapport/${tokenRow.token}`

    const html = buildEmailHtml({
      ...safeReport,
      parent_email: user.email ?? '',
      rapport_url,
    })

    if (!process.env.RESEND_API_KEY) {
      // Mode dev sans clé Resend : retourner le HTML pour prévisualisation
      return new NextResponse(html, {
        headers: { 'Content-Type': 'text/html; charset=utf-8' },
      })
    }

    const { data: emailData, error: emailError } = await resend.emails.send({
      from: 'Savoila <rapports@savoila.com>',
      to: [user.email!],
      subject: `Rapport hebdomadaire de ${safeReport.student_name} — Savoila`,
      html,
    })

    if (emailError) {
      console.error('Resend error:', emailError)
      return NextResponse.json({ error: emailError.message }, { status: 500 })
    }

    return NextResponse.json({ ok: true, emailId: emailData?.id, rapport_url })
  } catch (err) {
    console.error('weekly-report error:', err)
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 })
  }
}
