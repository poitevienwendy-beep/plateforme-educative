-- Supplément SEC1_FRA_conjugaison : +79 questions (71 → 150)
-- PFEQ-FRA-SEC1-CONJ

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-CONJ') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (26 questions)
('Présent de l''indicatif : être', 1, 18000, 'Conjugaison de «être» au présent : je suis, tu es, il est, nous sommes, vous êtes, ils sont.',
 '{"type":"mcq","question":"Quelle est la forme correcte de «être» à la 2e personne du singulier, présent ?","options":["suis","es","est","êtes"],"answer":"es"}'),

('Présent de l''indicatif : avoir', 1, 18000, 'Conjugaison de «avoir» au présent : j''ai, tu as, il a, nous avons, vous avez, ils ont.',
 '{"type":"mcq","question":"Quelle est la forme correcte de «avoir» à la 3e personne du pluriel, présent ?","options":["avons","avez","ont","as"],"answer":"ont"}'),

('Présent : verbe du 1er groupe en -er', 1, 18000, 'Terminaisons du 1er groupe au présent : -e, -es, -e, -ons, -ez, -ent.',
 '{"type":"mcq","question":"Conjugue «chanter» à la 3e personne du pluriel, présent.","options":["chante","chantez","chantent","chantons"],"answer":"chantent"}'),

('Présent : verbe du 2e groupe en -ir', 1, 18000, 'Terminaisons du 2e groupe au présent : -is, -is, -it, -issons, -issez, -issent.',
 '{"type":"mcq","question":"Conjugue «finir» à la 3e personne du singulier, présent.","options":["finis","finit","finissons","finissent"],"answer":"finit"}'),

('Présent : verbe «aller»', 1, 20000, '«Aller» est irrégulier : je vais, tu vas, il va, nous allons, vous allez, ils vont.',
 '{"type":"mcq","question":"Conjugue «aller» à la 1re personne du singulier, présent.","options":["alle","vas","vais","aille"],"answer":"vais"}'),

('Présent : verbe «faire»', 1, 20000, '«Faire» est irrégulier : je fais, tu fais, il fait, nous faisons, vous faites, ils font.',
 '{"type":"mcq","question":"Conjugue «faire» à la 2e personne du pluriel, présent.","options":["faisez","faites","faisons","font"],"answer":"faites"}'),

('Présent : verbe «prendre»', 1, 20000, '«Prendre» : je prends, tu prends, il prend, nous prenons, vous prenez, ils prennent.',
 '{"type":"mcq","question":"Conjugue «prendre» à la 3e personne du pluriel, présent.","options":["prennent","prends","prend","prenons"],"answer":"prennent"}'),

('Imparfait : terminaisons', 1, 20000, 'Terminaisons de l''imparfait : -ais, -ais, -ait, -ions, -iez, -aient.',
 '{"type":"mcq","question":"Quelle est la terminaison de l''imparfait à la 1re personne du pluriel ?","options":["-ais","-ait","-ions","-iez"],"answer":"-ions"}'),

('Imparfait : verbe «parler»', 1, 20000, 'Imparfait de «parler» : je parlais, tu parlais, il parlait, nous parlions, vous parliez, ils parlaient.',
 '{"type":"mcq","question":"Conjugue «parler» à la 3e personne du singulier, imparfait.","options":["parle","parlait","parlera","parlait"],"answer":"parlait"}'),

('Imparfait : verbe «être»', 1, 20000, 'Imparfait de «être» : j''étais, tu étais, il était, nous étions, vous étiez, ils étaient.',
 '{"type":"mcq","question":"Conjugue «être» à la 1re personne du singulier, imparfait.","options":["suis","serai","étais","étions"],"answer":"étais"}'),

('Futur simple : terminaisons', 1, 20000, 'Terminaisons du futur : -rai, -ras, -ra, -rons, -rez, -ront.',
 '{"type":"mcq","question":"Quelle est la terminaison du futur simple à la 3e personne du pluriel ?","options":["-rai","-ra","-rons","-ront"],"answer":"-ront"}'),

('Futur simple : verbe du 1er groupe', 1, 20000, 'Futur du 1er groupe = infinitif + terminaisons. Parler : je parlerai.',
 '{"type":"mcq","question":"Conjugue «travailler» à la 1re personne du singulier, futur simple.","options":["travaille","travaillais","travaillerai","travaillera"],"answer":"travaillerai"}'),

('Futur simple : verbe «venir»', 1, 22000, '«Venir» est irrégulier au futur : je viendrai, tu viendras, il viendra...',
 '{"type":"mcq","question":"Conjugue «venir» à la 3e personne du singulier, futur simple.","options":["vient","venait","viendra","viendr"],"answer":"viendra"}'),

('Futur simple : verbe «avoir»', 1, 22000, 'Futur de «avoir» : j''aurai, tu auras, il aura, nous aurons, vous aurez, ils auront.',
 '{"type":"mcq","question":"Conjugue «avoir» à la 2e personne du pluriel, futur simple.","options":["avez","aviez","aurez","aurons"],"answer":"aurez"}'),

('Passé composé : formation', 1, 22000, 'Passé composé = auxiliaire (avoir/être) au présent + participe passé.',
 '{"type":"mcq","question":"Quelle est la bonne formation du passé composé ?","options":["infinitif + -é","imparfait + participe passé","avoir/être au présent + participe passé","futur + participe passé"],"answer":"avoir/être au présent + participe passé"}'),

('Passé composé avec avoir : manger', 1, 22000, 'Passé composé de «manger» : j''ai mangé (auxiliaire avoir + p.p. mangé).',
 '{"type":"mcq","question":"Conjugue «manger» à la 3e personne du singulier, passé composé.","options":["il mangea","il a mangé","il avait mangé","il mange"],"answer":"il a mangé"}'),

('Passé composé avec être : partir', 1, 22000, 'Passé composé de «partir» avec être : je suis parti(e).',
 '{"type":"mcq","question":"Conjugue «partir» à la 1re personne du singulier (masculin), passé composé.","options":["j''ai parti","je suis partis","je suis parti","j''étais parti"],"answer":"je suis parti"}'),

('Verbes conjugués avec être au passé composé', 1, 20000, 'Verbes avec être au p.c. : aller, venir, partir, arriver, naître, mourir, rester, retourner...',
 '{"type":"mcq","question":"Lequel de ces verbes se conjugue avec «être» au passé composé ?","options":["manger","écrire","arriver","lire"],"answer":"arriver"}'),

('Impératif présent : 2e personne du singulier', 1, 20000, 'Impératif présent des verbes en -er : pas de «s» à la 2e personne du singulier. «Chante !» (pas «Chantes !»).',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif (2e personne du singulier) de «écouter» ?","options":["Écoutes !","Écoute !","Écoutes-toi !","Écoutez !"],"answer":"Écoute !"}'),

('Impératif présent : 1re personne du pluriel', 1, 20000, 'Impératif 1re personne du pluriel : terminaison -ons.',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif (1re pers. du pluriel) de «finir» ?","options":["Finissons !","Finissez !","Finissent !","Finissons-nous !"],"answer":"Finissons !"}'),

('Choisir l''auxiliaire : être ou avoir', 1, 22000, 'Les verbes pronominaux et certains verbes de mouvement prennent être. Les autres prennent avoir.',
 '{"type":"mcq","question":"Quel auxiliaire prend «tomber» au passé composé ?","options":["avoir","être","les deux","aucun"],"answer":"être"}'),

('Présent : verbe «pouvoir»', 1, 22000, '«Pouvoir» : je peux, tu peux, il peut, nous pouvons, vous pouvez, ils peuvent.',
 '{"type":"mcq","question":"Conjugue «pouvoir» à la 3e personne du singulier, présent.","options":["peut","peux","pouvons","peuvent"],"answer":"peut"}'),

('Présent : verbe «vouloir»', 1, 22000, '«Vouloir» : je veux, tu veux, il veut, nous voulons, vous voulez, ils veulent.',
 '{"type":"mcq","question":"Conjugue «vouloir» à la 3e personne du pluriel, présent.","options":["voulons","voulez","veulent","veut"],"answer":"veulent"}'),

('Présent : verbe «savoir»', 1, 22000, '«Savoir» : je sais, tu sais, il sait, nous savons, vous savez, ils savent.',
 '{"type":"mcq","question":"Conjugue «savoir» à la 1re personne du singulier, présent.","options":["savons","savent","sais","sait"],"answer":"sais"}'),

('Temps de base : passé, présent, futur', 1, 18000, 'Présent = maintenant. Imparfait/p.c. = passé. Futur = plus tard.',
 '{"type":"mcq","question":"Le verbe «jouait» est à quel temps ?","options":["Présent","Futur","Imparfait","Passé composé"],"answer":"Imparfait"}'),

('Reconnaître le passé composé', 1, 18000, 'Le passé composé est formé de l''auxiliaire au présent + participe passé.',
 '{"type":"mcq","question":"Quelle phrase est au passé composé ?","options":["Il chantait.","Il chantera.","Il a chanté.","Il chante."],"answer":"Il a chanté."}'),

-- DIFFICULTÉ 2 (27 questions)
('Plus-que-parfait : formation', 2, 30000, 'Plus-que-parfait = auxiliaire à l''imparfait + participe passé. «J''avais mangé.»',
 '{"type":"mcq","question":"Quelle est la formation du plus-que-parfait ?","options":["avoir/être au futur + p.p.","avoir/être au présent + p.p.","avoir/être à l''imparfait + p.p.","avoir/être au passé simple + p.p."],"answer":"avoir/être à l''imparfait + p.p."}'),

('Plus-que-parfait : verbe «dormir»', 2, 30000, 'P.-q.-p. de «dormir» : j''avais dormi, tu avais dormi, il avait dormi...',
 '{"type":"mcq","question":"Conjugue «dormir» à la 3e personne du singulier, plus-que-parfait.","options":["il avait dormi","il avait dormit","il avait dormi","il aura dormi"],"answer":"il avait dormi"}'),

('Futur antérieur : formation', 2, 30000, 'Futur antérieur = auxiliaire au futur + participe passé. «J''aurai fini.»',
 '{"type":"mcq","question":"Quelle est la formation du futur antérieur ?","options":["avoir/être au présent + p.p.","avoir/être au futur simple + p.p.","avoir/être à l''imparfait + p.p.","avoir/être au passé composé + p.p."],"answer":"avoir/être au futur simple + p.p."}'),

('Futur antérieur : exemple', 2, 30000, 'Futur antérieur de «manger» : j''aurai mangé.',
 '{"type":"mcq","question":"Quelle phrase illustre correctement le futur antérieur ?","options":["J''ai mangé avant.","J''aurai mangé avant qu''il arrive.","Je mangerai avant.","J''avais mangé avant."],"answer":"J''aurai mangé avant qu''il arrive."}'),

('Conditionnel présent : formation', 2, 32000, 'Conditionnel présent = infinitif + terminaisons : -rais, -rais, -rait, -rions, -riez, -raient.',
 '{"type":"mcq","question":"Quelle est la terminaison du conditionnel présent à la 3e personne du singulier ?","options":["-rait","-rais","-rons","-raient"],"answer":"-rait"}'),

('Conditionnel présent : verbe «aller»', 2, 32000, 'Conditionnel de «aller» : j''irais, tu irais, il irait, nous irions, vous iriez, ils iraient.',
 '{"type":"mcq","question":"Conjugue «aller» à la 1re personne du singulier, conditionnel présent.","options":["j''alerais","j''allais","j''irais","je vais"],"answer":"j''irais"}'),

('Conditionnel passé : formation', 2, 32000, 'Conditionnel passé = auxiliaire au conditionnel + participe passé. «J''aurais mangé.»',
 '{"type":"mcq","question":"Conjugue «partir» à la 3e personne du singulier, conditionnel passé.","options":["il partirait","il est parti","il serait parti","il sera parti"],"answer":"il serait parti"}'),

('Subjonctif présent : concept', 2, 32000, 'Le subjonctif exprime le doute, la volonté, la nécessité. «Il faut que tu viennes.»',
 '{"type":"mcq","question":"Dans quelle phrase le verbe est-il au subjonctif ?","options":["Je viens demain.","Il faut que je vienne.","Je venais souvent.","Je suis venu hier."],"answer":"Il faut que je vienne."}'),

('Subjonctif présent : terminaisons', 2, 32000, 'Terminaisons du subjonctif présent : -e, -es, -e, -ions, -iez, -ent.',
 '{"type":"mcq","question":"Quelle est la terminaison du subjonctif à la 1re personne du pluriel ?","options":["-ons","-ions","-iez","-ent"],"answer":"-ions"}'),

('Subjonctif : verbe «avoir»', 2, 32000, 'Subjonctif de «avoir» : que j''aie, que tu aies, qu''il ait, que nous ayons, que vous ayez, qu''ils aient.',
 '{"type":"mcq","question":"Conjugue «avoir» au subjonctif, 3e personne du singulier.","options":["ait","a","aie","ayons"],"answer":"ait"}'),

('Subjonctif : verbe «être»', 2, 32000, 'Subjonctif de «être» : que je sois, que tu sois, qu''il soit, que nous soyons, que vous soyez, qu''ils soient.',
 '{"type":"mcq","question":"Conjugue «être» au subjonctif, 3e personne du pluriel.","options":["sont","étaient","soient","seraient"],"answer":"soient"}'),

('Distinguer imparfait et passé composé', 2, 30000, 'Imparfait = action continue/habituelle au passé. P.c. = action ponctuelle/achevée au passé.',
 '{"type":"mcq","question":"Quelle phrase exprime une action habituelle dans le passé ?","options":["Il est tombé.","Il tombait souvent.","Il tombe.","Il tombera."],"answer":"Il tombait souvent."}'),

('Temps des verbes et contexte narratif', 2, 30000, 'Dans un récit, l''imparfait décrit le contexte et le passé composé raconte les événements.',
 '{"type":"mcq","question":"Dans «Il pleuvait quand elle est arrivée», quel temps décrit le contexte ?","options":["«est arrivée» (passé composé)","«pleuvait» (imparfait)","Les deux décrivent le contexte","Ni l''un ni l''autre"],"answer":"«pleuvait» (imparfait)"}'),

('Passé simple : forme', 2, 32000, 'Passé simple du 1er groupe : -ai, -as, -a, -âmes, -âtes, -èrent.',
 '{"type":"mcq","question":"Conjugue «chanter» à la 3e personne du singulier, passé simple.","options":["chantait","a chanté","chanta","chanterait"],"answer":"chanta"}'),

('Passé simple : verbe «venir»', 2, 32000, 'Passé simple de «venir» : je vins, tu vins, il vint, nous vînmes, vous vîntes, ils vinrent.',
 '{"type":"mcq","question":"Conjugue «venir» à la 3e personne du singulier, passé simple.","options":["venait","vint","venu","est venu"],"answer":"vint"}'),

('Futur simple : verbe «être»', 2, 28000, 'Futur de «être» : je serai, tu seras, il sera, nous serons, vous serez, ils seront.',
 '{"type":"mcq","question":"Conjugue «être» à la 3e personne du pluriel, futur simple.","options":["sont","étaient","seront","soient"],"answer":"seront"}'),

('Imparfait : verbe «avoir»', 2, 28000, 'Imparfait de «avoir» : j''avais, tu avais, il avait, nous avions, vous aviez, ils avaient.',
 '{"type":"mcq","question":"Conjugue «avoir» à la 2e personne du pluriel, imparfait.","options":["avez","aurez","aviez","ayez"],"answer":"aviez"}'),

('Verbe pronominal : se laver', 2, 30000, 'Les verbes pronominaux se conjuguent avec un pronom réfléchi : me, te, se, nous, vous, se.',
 '{"type":"mcq","question":"Conjugue «se laver» à la 3e personne du singulier, présent.","options":["il lave","il se lave","il se laves","il se lavait"],"answer":"il se lave"}'),

('Verbe pronominal au passé composé', 2, 32000, 'Les verbes pronominaux se conjuguent avec être au p.c. «Elle s''est lavée.»',
 '{"type":"mcq","question":"Conjugue «se lever» à la 3e personne du singulier (féminin), passé composé.","options":["elle a levé","elle s''est levée","elle s''est levé","elle était levée"],"answer":"elle s''est levée"}'),

('Impératif des verbes pronominaux', 2, 30000, 'Impératif des verbes pronominaux : «Lève-toi !», «Levons-nous !», «Levez-vous !»',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif (2e pers. sing.) de «se dépêcher» ?","options":["Dépêche !","Te dépêche !","Dépêche-toi !","Dépêches-toi !"],"answer":"Dépêche-toi !"}'),

('Présent du subjonctif après «il faut que»', 2, 30000, '«Il faut que» est toujours suivi du subjonctif.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Il faut que tu ___ ce livre.»","options":["lisas","lis","lises","lise"],"answer":"lise"}'),

('Concordance des temps : si + présent', 2, 32000, 'Avec «si» de condition : si + présent, futur. «Si tu viens, je serai là.»',
 '{"type":"mcq","question":"Quelle phrase respecte la concordance des temps ?","options":["Si tu viendras, je serai là.","Si tu viens, je serai là.","Si tu venais, je serai là.","Si tu es venu, je serai là."],"answer":"Si tu viens, je serai là."}'),

('Concordance des temps : si + imparfait', 2, 32000, 'Condition au passé : si + imparfait, conditionnel présent. «Si j''avais le temps, j''irais.»',
 '{"type":"mcq","question":"Quelle phrase respecte la concordance des temps ?","options":["Si j''aurais le temps, j''irais.","Si j''avais le temps, j''irais.","Si j''ai le temps, j''irais.","Si j''eus le temps, j''irai."],"answer":"Si j''avais le temps, j''irais."}'),

('Futur simple : verbe «faire»', 2, 28000, 'Futur de «faire» : je ferai, tu feras, il fera, nous ferons, vous ferez, ils feront.',
 '{"type":"mcq","question":"Conjugue «faire» à la 1re personne du pluriel, futur simple.","options":["ferons","faisons","ferez","font"],"answer":"ferons"}'),

('Conditionnel : valeur d''hypothèse', 2, 30000, 'Le conditionnel exprime une hypothèse ou un souhait. «Je voudrais un café.»',
 '{"type":"mcq","question":"Dans «Je voudrais aller au cinéma», le conditionnel exprime...","options":["Un fait certain","Une hypothèse/un souhait","Un ordre","Un événement passé"],"answer":"Une hypothèse/un souhait"}'),

('Reconnaître l''infinitif passé', 2, 30000, 'L''infinitif passé = avoir/être + participe passé. «Après avoir mangé, il est sorti.»',
 '{"type":"mcq","question":"Dans «Après avoir terminé ses devoirs, elle est sortie», «avoir terminé» est...","options":["Un passé composé","Un infinitif passé","Un plus-que-parfait","Un futur antérieur"],"answer":"Un infinitif passé"}'),

('Impératif négatif', 2, 30000, 'Impératif négatif : «Ne mange pas !», «Ne mangeons pas !», «Ne mangez pas !»',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif négatif (2e pers. sing.) de «partir» ?","options":["Ne pas pars !","Ne pars pas !","Ne partis pas !","Pas partir !"],"answer":"Ne pars pas !"}'),

-- DIFFICULTÉ 3 (26 questions)
('Subjonctif passé : formation', 3, 45000, 'Subjonctif passé = auxiliaire au subjonctif présent + participe passé. «Bien qu''il soit parti.»',
 '{"type":"mcq","question":"Conjugue «partir» au subjonctif passé, 3e personne du singulier.","options":["qu''il partie","qu''il soit parti","qu''il serait parti","qu''il partît"],"answer":"qu''il soit parti"}'),

('Distinguer subjonctif et indicatif', 3, 45000, 'Après «douter», «craindre», «vouloir» → subjonctif. Après «savoir», «penser» + affirmation → indicatif.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Je veux que tu viens.","Je veux que tu viennes.","Je sais que tu viennes.","Je veux que tu venais."],"answer":"Je veux que tu viennes."}'),

('Subjonctif ou indicatif après «penser que»', 3, 45000, 'À l''affirmative : «Je pense qu''il vient.» (indicatif). À la négative ou interrogative : subjonctif possible.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Je pense qu''il ___»","options":["vienne","viendrait","viendra","vienne ou viendra selon le contexte"],"answer":"viendra"}'),

('Concordance des temps : si + plus-que-parfait', 3, 45000, 'Hypothèse dans le passé : si + plus-que-parfait, conditionnel passé.',
 '{"type":"mcq","question":"Complète : «Si tu ___ étudié, tu aurais réussi.»","options":["as","avais","auras","aurais"],"answer":"avais"}'),

('Discours indirect : transposition des temps', 3, 45000, 'Passé composé du discours direct → plus-que-parfait dans le discours indirect au passé.',
 '{"type":"mcq","question":"Transforme en discours indirect : «Elle a dit : ''J''ai fini.''»","options":["Elle a dit qu''elle finit.","Elle a dit qu''elle avait fini.","Elle a dit qu''elle a fini.","Elle a dit qu''elle finira."],"answer":"Elle a dit qu''elle avait fini."}'),

('Temps littéraires : passé simple vs imparfait', 3, 42000, 'En littérature, le passé simple remplace le passé composé pour les actions ponctuelles.',
 '{"type":"mcq","question":"Dans un récit littéraire au passé, quel temps remplace généralement le passé composé ?","options":["Le plus-que-parfait","Le conditionnel","Le passé simple","Le présent historique"],"answer":"Le passé simple"}'),

('Passé simple : verbe «être»', 3, 42000, 'Passé simple de «être» : je fus, tu fus, il fut, nous fûmes, vous fûtes, ils furent.',
 '{"type":"mcq","question":"Conjugue «être» à la 3e personne du singulier, passé simple.","options":["était","fut","est","aura été"],"answer":"fut"}'),

('Passé simple : verbe «avoir»', 3, 42000, 'Passé simple de «avoir» : j''eus, tu eus, il eut, nous eûmes, vous eûtes, ils eurent.',
 '{"type":"mcq","question":"Conjugue «avoir» à la 3e personne du pluriel, passé simple.","options":["eurent","avaient","ont eu","auront"],"answer":"eurent"}'),

('Passé simple : verbe «faire»', 3, 42000, 'Passé simple de «faire» : je fis, tu fis, il fit, nous fîmes, vous fîtes, ils firent.',
 '{"type":"mcq","question":"Conjugue «faire» à la 1re personne du singulier, passé simple.","options":["faisais","ferai","fis","faisait"],"answer":"fis"}'),

('Imparfait du subjonctif : notion', 3, 45000, 'L''imparfait du subjonctif est un temps littéraire. «Bien qu''il vînt» (vînt = imparfait du subjonctif de venir).',
 '{"type":"mcq","question":"L''imparfait du subjonctif est principalement utilisé...","options":["Dans la langue parlée quotidienne","Dans les textes littéraires ou soutenu","Toujours après «il faut»","Pour exprimer le futur"],"answer":"Dans les textes littéraires ou soutenu"}'),

('Verbe «naître» au passé composé', 3, 42000, '«Naître» prend l''auxiliaire «être». Je suis né(e), tu es né(e)...',
 '{"type":"mcq","question":"Conjugue «naître» à la 3e personne du singulier (féminin), passé composé.","options":["elle a née","elle est née","elle est né","elle naissait"],"answer":"elle est née"}'),

('Verbe «mourir» au passé composé', 3, 42000, '«Mourir» prend l''auxiliaire «être». Il est mort, elle est morte.',
 '{"type":"mcq","question":"Conjugue «mourir» à la 3e personne du pluriel (masculin), passé composé.","options":["ils ont mort","ils sont morts","ils sont mortes","ils ont mouri"],"answer":"ils sont morts"}'),

('Aspect : accompli vs inaccompli', 3, 42000, 'Aspect accompli : action terminée (passé composé, futur antérieur). Inaccompli : en cours (imparfait, futur).',
 '{"type":"mcq","question":"Lequel de ces temps exprime un aspect accompli ?","options":["L''imparfait","Le futur simple","Le passé composé","Le présent"],"answer":"Le passé composé"}'),

('Valeur du présent : narration historique', 3, 42000, 'Le présent de narration (présent historique) rend un événement passé plus vivant.',
 '{"type":"mcq","question":"Dans «En 1534, Cartier arrive au Canada», le présent exprime...","options":["Une action en cours maintenant","Un fait habituel","Une action historique racontée au présent","Une hypothèse"],"answer":"Une action historique racontée au présent"}'),

('Conditionnel journalistique', 3, 42000, 'Le conditionnel journalistique exprime une information non confirmée. «Le maire démissionnerait.»',
 '{"type":"mcq","question":"Dans un article de journal : «Le premier ministre aurait décidé de démissionner.» Le conditionnel exprime...","options":["Un souhait","Une information non confirmée","Un ordre","Une hypothèse future"],"answer":"Une information non confirmée"}'),

('Mode infinitif : après une préposition', 3, 40000, 'Après une préposition (à, de, pour, sans, avant de, après avoir)  → infinitif.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Il est parti sans ___ adieu.»","options":["dit","dire","disant","dise"],"answer":"dire"}'),

('Gérondif : formation et emploi', 3, 42000, 'Gérondif = «en» + participe présent. «En chantant, elle danse.» Simultanéité.',
 '{"type":"mcq","question":"Dans «Il travaille en écoutant de la musique», le gérondif exprime...","options":["La cause","La conséquence","La simultanéité","L''opposition"],"answer":"La simultanéité"}'),

('Participe présent vs adjectif verbal', 3, 45000, 'Participe présent (invariable) : «Des enfants jouant dehors.» Adjectif verbal (variable) : «Des enfants joueurs.»',
 '{"type":"mcq","question":"Dans «Des enfants chantants», «chantants» est...","options":["Un participe présent invariable","Un adjectif verbal qui s''accorde","Un gérondif","Un infinitif"],"answer":"Un adjectif verbal qui s''accorde"}'),

('Verbe «courir» au passé composé', 3, 40000, '«Courir» se conjugue avec «avoir» au p.c. «J''ai couru.»',
 '{"type":"mcq","question":"Conjugue «courir» à la 1re personne du singulier, passé composé.","options":["je suis couru","j''ai couru","j''étais couru","je courus"],"answer":"j''ai couru"}'),

('Verbe «ouvrir» au présent', 3, 40000, '«Ouvrir» se conjugue comme un verbe du 1er groupe au présent : j''ouvre, tu ouvres, il ouvre...',
 '{"type":"mcq","question":"Conjugue «ouvrir» à la 2e personne du singulier, présent.","options":["ouvris","ouvres","ouvrez","ouvre"],"answer":"ouvres"}'),

('Verbe «résoudre» au présent', 3, 42000, '«Résoudre» : je résous, tu résous, il résout, nous résolvons, vous résolvez, ils résolvent.',
 '{"type":"mcq","question":"Conjugue «résoudre» à la 3e personne du singulier, présent.","options":["résous","résout","résolvons","résolvent"],"answer":"résout"}'),

('Verbe «vaincre» au présent', 3, 42000, '«Vaincre» : je vaincs, tu vaincs, il vainc (sans c), nous vainquons...',
 '{"type":"mcq","question":"Conjugue «vaincre» à la 3e personne du singulier, présent.","options":["vainque","vaincs","vainc","vainquit"],"answer":"vainc"}'),

('Changer de mode : subjonctif ou indicatif', 3, 45000, 'Après «croire» à la négative ou interrogative, on peut employer le subjonctif.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Je ne crois pas qu''il vient.","Je ne crois pas qu''il vienne.","Je ne crois pas qu''il viendra.","Les formes en gras et les deux premières sont acceptables."],"answer":"Je ne crois pas qu''il vienne."}'),

('Temps du discours indirect : futur → conditionnel', 3, 45000, 'En discours indirect au passé, le futur du discours direct devient conditionnel présent.',
 '{"type":"mcq","question":"Discours direct : «Il dit : ''Je viendrai demain.''» Transforme en discours indirect (verbe intro au passé).","options":["Il dit qu''il viendra demain.","Il a dit qu''il viendrait demain.","Il a dit qu''il est venu.","Il a dit qu''il venait demain."],"answer":"Il a dit qu''il viendrait demain."}'),

('Expression de la durée avec «depuis»', 3, 42000, '«Depuis» + présent = action qui a commencé dans le passé et continue. «Il travaille depuis 3 ans.»',
 '{"type":"mcq","question":"Quelle forme est correcte avec «depuis» ? «Il ___ ce projet depuis deux ans.»","options":["a travaillé","avait travaillé","travaille","travailla"],"answer":"travaille"}'),

('Infinitif après «faire»', 3, 40000, 'Après «faire», le verbe reste à l''infinitif. «Il fait construire une maison.»',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Il fait construisant une maison.","Il fait construit une maison.","Il fait construire une maison.","Il fait construction une maison."],"answer":"Il fait construire une maison."}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
