-- ============================================================
-- BANQUE DE QUESTIONS — Conjugaison (Sec. 1, Français)
-- PFEQ-FRA-SEC1-CONJ | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-CONJ') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Temps simples de base (34 questions) ───────────────────

('Présent indicatif — parler', 1, 20000, 'PARLER au présent : je parle, tu parles, il parle, nous parlons, vous parlez, ils parlent.',
 '{"type":"mcq","question":"Conjugue le verbe PARLER à la 3e personne du pluriel, présent de l''indicatif.","options":["ils parle","ils parlent","ils parlons","ils parlez"],"answer":"ils parlent"}'),

('Présent indicatif — finir', 1, 20000, 'FINIR au présent : je finis, tu finis, il finit, nous finissons, vous finissez, ils finissent.',
 '{"type":"mcq","question":"Conjugue le verbe FINIR à la 1re personne du pluriel, présent de l''indicatif.","options":["nous finissons","nous finissez","nous finissent","nous finissons-là"],"answer":"nous finissons"}'),

('Présent indicatif — être', 1, 20000, 'ÊTRE au présent : je suis, tu es, il est, nous sommes, vous êtes, ils sont.',
 '{"type":"mcq","question":"Conjugue le verbe ÊTRE à la 2e personne du singulier, présent de l''indicatif.","options":["tu as","tu es","tu ais","tu aies"],"answer":"tu es"}'),

('Présent indicatif — avoir', 1, 20000, 'AVOIR au présent : j''ai, tu as, il a, nous avons, vous avez, ils ont.',
 '{"type":"mcq","question":"Conjugue le verbe AVOIR à la 3e personne du singulier, présent de l''indicatif.","options":["il as","il est","il a","il ave"],"answer":"il a"}'),

('Présent indicatif — aller', 1, 20000, 'ALLER est irrégulier : je vais, tu vas, il va, nous allons, vous allez, ils vont.',
 '{"type":"mcq","question":"Conjugue le verbe ALLER à la 1re personne du singulier, présent de l''indicatif.","options":["je alle","je vas","je vais","j''allons"],"answer":"je vais"}'),

('Imparfait — parler', 1, 25000, 'PARLER à l''imparfait : je parlais, tu parlais, il parlait, nous parlions, vous parliez, ils parlaient.',
 '{"type":"mcq","question":"Conjugue PARLER à la 3e personne du singulier, imparfait de l''indicatif.","options":["il parlait","il parle","il parlera","il parla"],"answer":"il parlait"}'),

('Imparfait — être', 1, 25000, 'ÊTRE à l''imparfait : j''étais, tu étais, il était, nous étions, vous étiez, ils étaient.',
 '{"type":"mcq","question":"Conjugue ÊTRE à la 1re personne du singulier, imparfait de l''indicatif.","options":["j''était","j''étais","j''ai été","j''ères"],"answer":"j''étais"}'),

('Imparfait — avoir', 1, 25000, 'AVOIR à l''imparfait : j''avais, tu avais, il avait, nous avions, vous aviez, ils avaient.',
 '{"type":"mcq","question":"Conjugue AVOIR à la 3e personne du pluriel, imparfait de l''indicatif.","options":["ils avaient","ils avons","ils ont","ils avaient-là"],"answer":"ils avaient"}'),

('Futur simple — parler', 1, 25000, 'PARLER au futur : je parlerai, tu parleras, il parlera, nous parlerons, vous parlerez, ils parleront.',
 '{"type":"mcq","question":"Conjugue PARLER à la 2e personne du singulier, futur simple.","options":["tu parlais","tu parle","tu parleras","tu parlera"],"answer":"tu parleras"}'),

('Futur simple — être', 1, 25000, 'ÊTRE au futur : je serai, tu seras, il sera, nous serons, vous serez, ils seront.',
 '{"type":"mcq","question":"Conjugue ÊTRE à la 1re personne du pluriel, futur simple.","options":["nous serons","nous serez","nous étions","nous serions"],"answer":"nous serons"}'),

('Futur simple — avoir', 1, 25000, 'AVOIR au futur : j''aurai, tu auras, il aura, nous aurons, vous aurez, ils auront.',
 '{"type":"mcq","question":"Conjugue AVOIR à la 2e personne du pluriel, futur simple.","options":["vous aviez","vous aurez","vous aurait","vous avons"],"answer":"vous aurez"}'),

('Conditionnel présent — parler', 1, 30000, 'PARLER au conditionnel : je parlerais, tu parlerais, il parlerait, nous parlerions, vous parleriez, ils parleraient.',
 '{"type":"mcq","question":"Conjugue PARLER à la 3e personne du singulier, conditionnel présent.","options":["il parlerait","il parlait","il parlera","il parle"],"answer":"il parlerait"}'),

('Passé composé avec avoir', 1, 25000, 'Passé composé = avoir conjugué au présent + participe passé du verbe.',
 '{"type":"mcq","question":"Conjugue MANGER au passé composé, 1re personne du singulier.","options":["j''ai mangé","j''ai mangée","j''avais mangé","j''aurais mangé"],"answer":"j''ai mangé"}'),

('Passé composé avec être', 1, 25000, 'Les verbes de mouvement et les pronominaux se conjuguent avec être. Le PP s''accorde avec le sujet.',
 '{"type":"mcq","question":"Conjugue PARTIR au passé composé, 3e personne du singulier féminin.","options":["elle a partie","elle est partie","elle est parti","elle a parti"],"answer":"elle est partie"}'),

('Présent — verbe en -er irrégulier (appeler)', 1, 25000, 'APPELER double le L devant une terminaison muette : j''appelle, tu appelles, il appelle, nous appelons, vous appelez, ils appellent.',
 '{"type":"mcq","question":"Conjugue APPELER à la 1re personne du singulier, présent de l''indicatif.","options":["j''apele","j''appel","j''appelle","j''appels"],"answer":"j''appelle"}'),

('Présent — vouloir', 1, 25000, 'VOULOIR au présent : je veux, tu veux, il veut, nous voulons, vous voulez, ils veulent.',
 '{"type":"mcq","question":"Conjugue VOULOIR à la 3e personne du pluriel, présent de l''indicatif.","options":["ils voulons","ils veulent","ils voulaient","ils veulez"],"answer":"ils veulent"}'),

('Présent — pouvoir', 1, 25000, 'POUVOIR au présent : je peux, tu peux, il peut, nous pouvons, vous pouvez, ils peuvent.',
 '{"type":"mcq","question":"Conjugue POUVOIR à la 3e personne du singulier, présent de l''indicatif.","options":["il pouvait","il peux","il peut","il pouvoir"],"answer":"il peut"}'),

('Présent — savoir', 1, 25000, 'SAVOIR au présent : je sais, tu sais, il sait, nous savons, vous savez, ils savent.',
 '{"type":"mcq","question":"Conjugue SAVOIR à la 1re personne du singulier, présent de l''indicatif.","options":["je savais","je suis","je sait","je sais"],"answer":"je sais"}'),

('Présent — faire', 1, 25000, 'FAIRE au présent : je fais, tu fais, il fait, nous faisons, vous faites, ils font.',
 '{"type":"mcq","question":"Conjugue FAIRE à la 2e personne du pluriel, présent de l''indicatif.","options":["vous faisez","vous faites","vous font","vous faisons"],"answer":"vous faites"}'),

('Présent — venir', 1, 25000, 'VENIR au présent : je viens, tu viens, il vient, nous venons, vous venez, ils viennent.',
 '{"type":"mcq","question":"Conjugue VENIR à la 3e personne du pluriel, présent de l''indicatif.","options":["ils venons","ils venaient","ils viennent","ils venez"],"answer":"ils viennent"}'),

('Présent — prendre', 1, 25000, 'PRENDRE au présent : je prends, tu prends, il prend, nous prenons, vous prenez, ils prennent.',
 '{"type":"mcq","question":"Conjugue PRENDRE à la 1re personne du singulier, présent de l''indicatif.","options":["je prende","je prend","je prends","je prenons"],"answer":"je prends"}'),

('Imparfait — finir', 1, 25000, 'FINIR à l''imparfait : je finissais, tu finissais, il finissait, nous finissions, vous finissiez, ils finissaient.',
 '{"type":"mcq","question":"Conjugue FINIR à la 3e personne du pluriel, imparfait de l''indicatif.","options":["ils finissaient","ils finissent","ils finissaient-là","ils finissons"],"answer":"ils finissaient"}'),

('Futur — aller', 1, 25000, 'ALLER au futur : j''irai, tu iras, il ira, nous irons, vous irez, ils iront.',
 '{"type":"mcq","question":"Conjugue ALLER à la 1re personne du singulier, futur simple.","options":["j''allerai","j''irai","j''irarai","j''allais"],"answer":"j''irai"}'),

('Futur — venir', 1, 25000, 'VENIR au futur : je viendrai, tu viendras, il viendra, nous viendrons, vous viendrez, ils viendront.',
 '{"type":"mcq","question":"Conjugue VENIR à la 3e personne du singulier, futur simple.","options":["il venira","il viendra","il venait","il venira"],"answer":"il viendra"}'),

('Passé composé — faire', 1, 25000, 'Participe passé de FAIRE = fait. Auxiliaire avoir.',
 '{"type":"mcq","question":"Conjugue FAIRE au passé composé, 3e personne du pluriel.","options":["ils ont fait","ils ont fais","ils ont faits","ils ont faire"],"answer":"ils ont fait"}'),

('Passé composé — venir', 1, 25000, 'VENIR se conjugue avec être au passé composé. PP : venu(e)(s).',
 '{"type":"mcq","question":"Conjugue VENIR au passé composé, 1re personne du singulier (masculin).","options":["je suis venu","j''ai venu","je suis venus","j''ai venu"],"answer":"je suis venu"}'),

('Identifier le temps d''un verbe', 1, 20000, 'Les terminaisons -ait, -aient signalent l''imparfait. Les terminaisons -ai, -as signalent le futur.',
 '{"type":"mcq","question":"À quel temps est le verbe souligné : « Elles CHANTAIENT joyeusement » ?","options":["Présent","Imparfait","Futur","Passé composé"],"answer":"Imparfait"}'),

('Identifier le temps — futur', 1, 20000, 'Terminaison -ons au présent (nous parlons) ou -erons au futur (nous parlerons).',
 '{"type":"mcq","question":"À quel temps est conjugué le verbe : « Nous ARRIVERONS demain » ?","options":["Présent","Imparfait","Futur simple","Conditionnel"],"answer":"Futur simple"}'),

('Impératif présent', 1, 25000, 'L''impératif n''existe qu''à 3 personnes : 2e sing., 1re pl., 2e pl. Le -s de la 2e sing. disparaît pour les verbes en -er.',
 '{"type":"mcq","question":"Conjugue PARLER à l''impératif présent, 2e personne du singulier.","options":["Parles","Parlons","Parle","Parlez"],"answer":"Parle"}'),

('Impératif présent — pluriel', 1, 25000, 'MANGER à l''impératif, 2e personne du pluriel = Mangez.',
 '{"type":"mcq","question":"Conjugue MANGER à l''impératif présent, 2e personne du pluriel.","options":["Mangez","Mangeons","Mange","Mangent"],"answer":"Mangez"}'),

('Infinitif — identifier', 1, 20000, 'L''infinitif est la forme non conjuguée du verbe. Il ne varie pas en personne.',
 '{"type":"mcq","question":"Lequel de ces verbes est à l''infinitif ?","options":["il mange","nous mangeons","manger","il mangera"],"answer":"manger"}'),

('Participe présent', 1, 25000, 'Le participe présent se forme avec le radical de nous au présent + -ant. Mangeons → mangeant.',
 '{"type":"mcq","question":"Quel est le participe présent du verbe CHANTER ?","options":["chantant","chanté","chantait","chantés"],"answer":"chantant"}'),

('Passé simple introduction', 1, 30000, 'Le passé simple s''utilise à l''écrit pour des actions passées et délimitées. -er → -a (sing.), -èrent (pl. 3e).',
 '{"type":"mcq","question":"À quel temps est le verbe dans : « Le roi parla à la foule » ?","options":["Imparfait","Passé composé","Passé simple","Plus-que-parfait"],"answer":"Passé simple"}'),

('Conditionnel présent — être', 1, 30000, 'ÊTRE au conditionnel : je serais, tu serais, il serait, nous serions, vous seriez, ils seraient.',
 '{"type":"mcq","question":"Conjugue ÊTRE à la 1re personne du singulier, conditionnel présent.","options":["je serai","j''étais","je serais","je sois"],"answer":"je serais"}'),

-- ── DIFFICULTÉ 2 — Temps composés et concordance (33 questions) ───────────

('Plus-que-parfait formation', 2, 35000, 'Plus-que-parfait = imparfait d''avoir ou être + participe passé. Il exprime une action antérieure à une autre au passé.',
 '{"type":"mcq","question":"Conjugue MANGER au plus-que-parfait, 1re personne du singulier.","options":["j''ai mangé","j''avais mangé","j''aurais mangé","j''eus mangé"],"answer":"j''avais mangé"}'),

('Plus-que-parfait — sens', 2, 35000, 'Le plus-que-parfait exprime une action passée AVANT une autre action passée.',
 '{"type":"mcq","question":"Dans « Quand il est arrivé, elle AVAIT DÉJÀ MANGÉ », que signifie le plus-que-parfait ?","options":["Elle mange après lui","Elle a mangé avant lui","Elle mangeait en même temps","Elle mangera plus tard"],"answer":"Elle a mangé avant lui"}'),

('Futur antérieur formation', 2, 35000, 'Futur antérieur = futur de avoir/être + participe passé. Exprime une action future AVANT une autre action future.',
 '{"type":"mcq","question":"Conjugue PARTIR au futur antérieur, 3e personne du singulier féminin.","options":["elle sera partie","elle aura parti","elle est partie","elle sera partis"],"answer":"elle sera partie"}'),

('Conditionnel passé formation', 2, 35000, 'Conditionnel passé = conditionnel présent d''avoir/être + participe passé.',
 '{"type":"mcq","question":"Conjugue VENIR au conditionnel passé, 1re personne du singulier.","options":["je serais venu","je suis venu","je serai venu","j''aurais venu"],"answer":"je serais venu"}'),

('Subjonctif présent — regular verb', 2, 40000, 'PARLER au subjonctif : que je parle, que tu parles, qu''il parle, que nous parlions, que vous parliez, qu''ils parlent.',
 '{"type":"mcq","question":"Conjugue PARLER au subjonctif présent, 1re personne du pluriel.","options":["que nous parlons","que nous parlions","que nous parlez","que nous parlent"],"answer":"que nous parlions"}'),

('Subjonctif présent — être', 2, 40000, 'ÊTRE au subjonctif : que je sois, que tu sois, qu''il soit, que nous soyons, que vous soyez, qu''ils soient.',
 '{"type":"mcq","question":"Conjugue ÊTRE au subjonctif présent, 3e personne du singulier.","options":["qu''il est","qu''il soit","qu''il sera","qu''il ait"],"answer":"qu''il soit"}'),

('Subjonctif présent — avoir', 2, 40000, 'AVOIR au subjonctif : que j''aie, que tu aies, qu''il ait, que nous ayons, que vous ayez, qu''ils aient.',
 '{"type":"mcq","question":"Conjugue AVOIR au subjonctif présent, 1re personne du pluriel.","options":["que nous avons","que nous aurons","que nous ayons","que nous avons"],"answer":"que nous ayons"}'),

('Emploi du subjonctif', 2, 40000, 'Le subjonctif est requis après des verbes de volonté (vouloir que), d''émotion, de doute, et certaines conjonctions (bien que, pour que, avant que).',
 '{"type":"mcq","question":"Dans laquelle de ces phrases doit-on utiliser le subjonctif ?","options":["Je crois qu''il vient.","Il est certain qu''elle réussit.","Je veux qu''il vienne.","Je sais qu''il partira."],"answer":"Je veux qu''il vienne."}'),

('Concordance des temps — présent', 2, 40000, 'Si le verbe principal est au présent, le verbe subordonné peut être au présent (simultané), passé composé (antériorité) ou futur (postériorité).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte selon la concordance des temps ?","options":["Je crois qu''il venait hier.","Je crois qu''il est venu hier.","Je crois qu''il viendrait hier.","Je crois qu''il venait demain."],"answer":"Je crois qu''il est venu hier."}'),

('Concordance des temps — passé', 2, 40000, 'Si le verbe principal est au passé, la subordonnée utilise l''imparfait (simultané) ou le plus-que-parfait (antériorité).',
 '{"type":"mcq","question":"Laquelle est correcte ? « Il savait que Marie ___ déjà »","options":["est partie","était partie","sera partie","avait été partait"],"answer":"était partie"}'),

('Passé récent', 2, 30000, 'Le passé récent se forme avec VENIR DE + infinitif. Il exprime une action qui vient de se produire.',
 '{"type":"mcq","question":"Comment exprimer le passé récent : « Elle vient de finir son travail » ?","options":["Elle finissait son travail.","Elle a fini son travail.","Elle vient de finir son travail.","Elle finira son travail."],"answer":"Elle vient de finir son travail."}'),

('Futur proche', 2, 30000, 'Le futur proche se forme avec ALLER (conjugué) + infinitif. Il exprime une action imminente.',
 '{"type":"mcq","question":"Lequel exprime un futur proche ?","options":["Il parte bientôt.","Il partira bientôt.","Il va partir bientôt.","Il part bientôt."],"answer":"Il va partir bientôt."}'),

('Choix imparfait vs passé composé', 2, 40000, 'Imparfait : action habituelle ou en cours. Passé composé : action ponctuelle et terminée.',
 '{"type":"mcq","question":"Quelle est la bonne phrase pour une action habituellement répétée dans le passé ?","options":["Chaque été, il a nagé dans le lac.","Chaque été, il nageait dans le lac.","Chaque été, il nagea dans le lac.","Chaque été, il nageon dans le lac."],"answer":"Chaque été, il nageait dans le lac."}'),

('Choix imparfait vs passé composé 2', 2, 40000, 'Pour une action ponctuelle qui interrompt une autre action : passé composé (l''interruption) + imparfait (l''arrière-plan).',
 '{"type":"mcq","question":"Laquelle est la phrase la mieux construite ?","options":["Quand il est entré, elle dormait.","Quand il entrait, elle a dormi.","Quand il entrait, elle dormait.","Quand il est entré, elle a dormi."],"answer":"Quand il est entré, elle dormait."}'),

('Passé simple — -ir', 2, 40000, 'FINIR au passé simple : je finis, tu finis, il finit, nous finîmes, vous finîtes, ils finirent.',
 '{"type":"mcq","question":"Conjugue FINIR au passé simple, 3e personne du pluriel.","options":["ils finissaient","ils finirent","ils ont fini","ils finit"],"answer":"ils finirent"}'),

('Passé simple — verbes irréguliers', 2, 40000, 'ÊTRE au passé simple : je fus, tu fus, il fut, nous fûmes, vous fûtes, ils furent.',
 '{"type":"mcq","question":"Conjugue ÊTRE au passé simple, 3e personne du singulier.","options":["il était","il a été","il fut","il sera"],"answer":"il fut"}'),

('Participe passé — -ir et -re', 2, 35000, 'Participes passés : finir → fini; vendre → vendu; prendre → pris; mettre → mis; voir → vu.',
 '{"type":"mcq","question":"Quel est le participe passé du verbe PRENDRE ?","options":["prendu","prenu","pris","prant"],"answer":"pris"}'),

('Participe passé — verbes irréguliers', 2, 35000, 'Participes irréguliers : être → été; avoir → eu; faire → fait; voir → vu; vouloir → voulu.',
 '{"type":"mcq","question":"Quel est le participe passé du verbe VOIR ?","options":["voyé","voiu","vu","vut"],"answer":"vu"}'),

('Emploi du conditionnel', 2, 35000, 'Le conditionnel s''emploie pour une action hypothétique, une demande polie ou une information non confirmée.',
 '{"type":"mcq","question":"Dans laquelle de ces phrases le conditionnel est-il correctement utilisé ?","options":["Si tu travailles, tu réussiras.","Si tu travaillais, tu réussirais.","Si tu travaillais, tu réussiras.","Si tu travailleras, tu réussiras."],"answer":"Si tu travaillais, tu réussirais."}'),

('Forme pronominale', 2, 35000, 'Les verbes pronominaux se conjuguent avec un pronom réfléchi (me, te, se, nous, vous, se).',
 '{"type":"mcq","question":"Conjugue SE LEVER au présent, 3e personne du singulier.","options":["il se lève","il lève","il se lèvent","il se lever"],"answer":"il se lève"}'),

('Passé composé pronominal', 2, 35000, 'Les verbes pronominaux se conjuguent avec ÊTRE au passé composé.',
 '{"type":"mcq","question":"Conjugue SE LAVER au passé composé, 3e personne du pluriel féminin.","options":["elles ont lavées","elles se sont lavé","elles se sont lavées","elles s''ont lavées"],"answer":"elles se sont lavées"}'),

('Accord PP pronominal', 2, 40000, 'PP des pronominaux réfléchis : accord avec le pronom sujet si le pronom est CD. Mais s''il est CI : pas d''accord.',
 '{"type":"mcq","question":"« Elles se sont ÉCRIT des lettres. » Pourquoi le PP « écrit » ne prend-il pas la marque du féminin ?","options":["Parce que c''est un verbe d''état","Parce que le pronom « se » est CI (à elle-même)","Parce que le verbe est irrégulier","Parce que l''auxiliaire est avoir"],"answer":"Parce que le pronom « se » est CI (à elle-même)"}'),

('Emploi du subjonctif — conjonctions', 2, 40000, 'Les conjonctions qui exigent le subjonctif : bien que, pour que, avant que, à moins que, afin que, quoique.',
 '{"type":"mcq","question":"Laquelle de ces conjonctions exige le subjonctif ?","options":["parce que","puisque","bien que","depuis que"],"answer":"bien que"}'),

('Verbe defectif — falloir', 2, 35000, 'FALLOIR est un verbe impersonnel (il faut, il fallait, il faudra, il faudrait, qu''il faille).',
 '{"type":"mcq","question":"Conjugue FALLOIR au présent de l''indicatif.","options":["je faux","il faut","vous fallez","ils fallent"],"answer":"il faut"}'),

-- ── DIFFICULTÉ 3 — Nuances et erreurs complexes (33 questions) ────────────

('Subjonctif vs indicatif — verbes de pensée', 3, 50000, 'Verbes de pensée à l''affirmatif → indicatif. Verbes de pensée à la forme négative ou interrogative → subjonctif.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Je crois qu''il vienne.","Je ne crois pas qu''il vient.","Je ne crois pas qu''il vienne.","Je crois qu''il viendrait."],"answer":"Je ne crois pas qu''il vienne."}'),

('Futur ou conditionnel dans une condition', 3, 50000, 'Dans une phrase conditionnelle : SI + imparfait → conditionnel présent. SI + présent → futur.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Si j''avais le temps, je viendrai.","Si j''ai le temps, je viendrais.","Si j''avais le temps, je viendrais.","Si j''aurais le temps, je viendrais."],"answer":"Si j''avais le temps, je viendrais."}'),

('Conditionnel passé dans hypothèse irréelle', 3, 55000, 'Hypothèse dans le passé : SI + plus-que-parfait → conditionnel passé.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Si j''avais su, je serais venu.","Si j''aurais su, je serais venu.","Si j''ai su, je serai venu.","Si j''avais su, j''aurais venu."],"answer":"Si j''avais su, je serais venu."}'),

('Passé antérieur — usage littéraire', 3, 50000, 'Le passé antérieur s''emploie dans les propositions subordonnées temporelles après des conjonctions comme « quand, lorsque, dès que » pour une action antérieure au passé simple.',
 '{"type":"mcq","question":"Dans quel temps est conjugué le verbe dans « Quand il EUT FINI, il repartit » ?","options":["Imparfait","Plus-que-parfait","Passé antérieur","Conditionnel passé"],"answer":"Passé antérieur"}'),

('Infinitif passé', 3, 50000, 'L''infinitif passé = avoir/être + participe passé. Exprime une action antérieure à une autre.',
 '{"type":"mcq","question":"Laquelle est correcte ? « Après ___ son travail, il est sorti »","options":["avoir fini","finir","avoir finit","finir de"],"answer":"avoir fini"}'),

('Gérondif', 3, 50000, 'Le gérondif = en + participe présent. Il exprime la simultanéité ou la manière.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["En marchant, il réfléchissait.","En marché, il réfléchissait.","En marchera, il réfléchissait.","En avoir marché, il réfléchissait."],"answer":"En marchant, il réfléchissait."}'),

('Subjonctif imparfait — usage formel', 3, 55000, 'Le subjonctif imparfait s''utilise dans la langue soutenue quand le verbe principal est au passé.',
 '{"type":"mcq","question":"Dans la phrase soutenue « Il voulait qu''elle PARTÎT », quel temps est utilisé ?","options":["Subjonctif présent","Subjonctif imparfait","Imparfait de l''indicatif","Conditionnel présent"],"answer":"Subjonctif imparfait"}'),

('Temps du discours indirect', 3, 55000, 'Discours direct au présent → indirect imparfait. Direct passé composé → indirect plus-que-parfait. Direct futur → indirect conditionnel.',
 '{"type":"mcq","question":"Transformez : « Il a dit : \'Je partirai demain.\' » → Il a dit qu''il...","options":["partira demain","partait demain","partirait le lendemain","partît le lendemain"],"answer":"partirait le lendemain"}'),

('Erreur — emploi du subjonctif inutile', 3, 50000, 'On n''utilise pas le subjonctif après « parce que, puisque, quand, si, depuis que ».',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Puisqu''il soit là, commençons.","Puisqu''il est là, commençons.","Puisqu''il serait là, commençons.","Puisqu''il viendrait là, commençons."],"answer":"Puisqu''il est là, commençons."}'),

('Valeur des temps narratifs', 3, 50000, 'Dans un récit littéraire, le passé simple est le temps du premier plan (actions), l''imparfait est celui du second plan (descriptions, habitudes).',
 '{"type":"mcq","question":"Dans un récit au passé, quel temps utilise-t-on pour décrire le paysage en arrière-plan ?","options":["Passé simple","Passé composé","Imparfait","Futur antérieur"],"answer":"Imparfait"}'),

('Concordance subjonctif passé', 3, 55000, 'Subjonctif passé = présent du subjonctif d''avoir/être + PP. Après verbe principal au présent, il exprime l''antériorité.',
 '{"type":"mcq","question":"Conjugue PARTIR au subjonctif passé, 3e personne du singulier féminin.","options":["qu''elle soit partie","qu''elle soit partis","qu''elle ait partie","qu''elle était partie"],"answer":"qu''elle soit partie"}'),

('Aspect perfectif vs imperfectif', 3, 55000, 'L''aspect perfectif (passé composé, passé simple) présente l''action comme achevée. L''aspect imperfectif (imparfait) présente l''action en cours.',
 '{"type":"mcq","question":"Quelle phrase présente l''action comme achevée ?","options":["Il nageait dans le lac.","Il nageait quand je l''ai vu.","Il a nagé dans le lac.","Il nage maintenant."],"answer":"Il a nagé dans le lac."}'),

('Erreur fréquente — si + conditionnel', 3, 50000, 'On ne met JAMAIS le conditionnel après « si » dans une phrase conditionnelle.',
 '{"type":"mcq","question":"Laquelle de ces phrases contient une erreur ?","options":["Si tu viens, je serai content.","Si tu venais, je serais content.","Si tu serais venu, j''aurais été content.","Si tu étais venu, j''aurais été content."],"answer":"Si tu serais venu, j''aurais été content."}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
