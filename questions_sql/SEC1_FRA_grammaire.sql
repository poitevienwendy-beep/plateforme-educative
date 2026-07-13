-- ============================================================
-- BANQUE DE QUESTIONS — Grammaire (Sec. 1, Français)
-- PFEQ-FRA-SEC1-GR | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-GR') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Identification des classes de mots (34 questions) ─────

('Nature du mot : nom commun', 1, 20000, 'Un nom commun désigne une réalité générale (personne, animal, chose, idée). Il peut être précédé d''un déterminant.',
 '{"type":"mcq","question":"Dans la phrase « Le chien court dans le parc », quel mot est un nom commun ?","options":["Le","court","chien","dans"],"answer":"chien"}'),

('Nature du mot : nom propre', 1, 20000, 'Un nom propre désigne une réalité unique et s''écrit avec une majuscule.',
 '{"type":"mcq","question":"Lequel de ces mots est un nom propre ?","options":["ville","montagne","Québec","rivière"],"answer":"Québec"}'),

('Nature du mot : déterminant', 1, 20000, 'Un déterminant accompagne toujours un nom et introduit le groupe nominal. (le, la, les, un, une, des, mon, ma…)',
 '{"type":"mcq","question":"Dans la phrase « Une belle fleur pousse là », quel mot est un déterminant ?","options":["belle","fleur","pousse","Une"],"answer":"Une"}'),

('Nature du mot : adjectif', 1, 20000, 'L''adjectif qualifie ou classifie un nom. Il s''accorde en genre et en nombre avec le nom qu''il accompagne.',
 '{"type":"mcq","question":"Dans la phrase « Ce gros chien noir aboie », quels mots sont des adjectifs ?","options":["Ce, chien, aboie","gros, noir","Ce, aboie","chien, aboie"],"answer":"gros, noir"}'),

('Nature du mot : verbe', 1, 20000, 'Le verbe exprime une action ou un état. Il se conjugue selon le temps, la personne et le nombre.',
 '{"type":"mcq","question":"Dans la phrase « Les élèves étudient avec sérieux », quel mot est le verbe ?","options":["élèves","étudient","sérieux","avec"],"answer":"étudient"}'),

('Nature du mot : pronom', 1, 20000, 'Un pronom remplace un nom ou un groupe nominal déjà mentionné (il, elle, ils, elles, lui, leur…)',
 '{"type":"mcq","question":"Dans la phrase « Marie est arrivée. Elle est contente. », quel mot est un pronom ?","options":["Marie","arrivée","Elle","contente"],"answer":"Elle"}'),

('Nature du mot : adverbe', 1, 20000, 'L''adverbe est invariable. Il modifie un verbe, un adjectif ou un autre adverbe. (vite, souvent, très, bien…)',
 '{"type":"mcq","question":"Dans la phrase « Il court très vite », lequel est un adverbe ?","options":["Il","court","très","l''ensemble très vite"],"answer":"l''ensemble très vite"}'),

('Nature du mot : préposition', 1, 20000, 'La préposition unit deux éléments de la phrase (à, de, dans, sur, sous, avec, pour, par, en…). Elle est invariable.',
 '{"type":"mcq","question":"Laquelle de ces listes contient seulement des prépositions ?","options":["le, la, les, un","à, de, dans, avec","et, ou, mais, donc","très, bien, jamais, souvent"],"answer":"à, de, dans, avec"}'),

('Nature du mot : conjonction', 1, 20000, 'La conjonction de coordination relie des mots ou des propositions (mais, ou, et, donc, or, ni, car).',
 '{"type":"mcq","question":"Dans la phrase « J''aime le football, mais je préfère le basketball », quel mot est une conjonction ?","options":["J''aime","football","mais","préfère"],"answer":"mais"}'),

('Groupe nominal identification', 1, 25000, 'Le GN contient au minimum un déterminant + un nom. Il peut être enrichi d''un adjectif ou d''un complément du nom.',
 '{"type":"mcq","question":"Quel est le groupe nominal (GN) dans la phrase « Le grand chien de ma voisine aboie » ?","options":["aboie","de ma voisine","Le grand chien de ma voisine","ma voisine aboie"],"answer":"Le grand chien de ma voisine"}'),

('Groupe verbal identification', 1, 25000, 'Le GV contient le verbe et ses compléments. Il forme la partie de la phrase après le sujet.',
 '{"type":"mcq","question":"Quel est le groupe verbal (GV) dans la phrase « Les enfants jouent dans la cour » ?","options":["Les enfants","jouent dans la cour","dans la cour","Les enfants jouent"],"answer":"jouent dans la cour"}'),

('Sujet du verbe', 1, 25000, 'Le sujet est le groupe qui fait l''action ou dont on parle. On le trouve en posant la question Qui est-ce qui ? + verbe.',
 '{"type":"mcq","question":"Dans la phrase « Les oiseaux chantent le matin », quel est le sujet ?","options":["Les oiseaux","chantent","le matin","matin"],"answer":"Les oiseaux"}'),

('Attribut du sujet', 1, 25000, 'L''attribut du sujet est relié au sujet par un verbe attributif (être, sembler, paraître, devenir…).',
 '{"type":"mcq","question":"Dans la phrase « Ce gâteau est délicieux », quel est l''attribut du sujet ?","options":["Ce gâteau","est","délicieux","Ce"],"answer":"délicieux"}'),

('Complément direct du verbe (CD)', 1, 25000, 'Le CD répond à la question Quoi ? ou Qui ? directement après le verbe, sans préposition.',
 '{"type":"mcq","question":"Dans la phrase « Luce mange une pomme », quel est le complément direct du verbe ?","options":["Luce","mange","une pomme","pomme"],"answer":"une pomme"}'),

('Complément indirect du verbe (CI)', 1, 25000, 'Le CI répond à la question À qui ? À quoi ? De qui ? De quoi ? Il est introduit par une préposition.',
 '{"type":"mcq","question":"Dans la phrase « Il parle à son ami », quel est le complément indirect ?","options":["Il","parle","à son ami","ami"],"answer":"à son ami"}'),

('Complément de phrase', 1, 25000, 'Le CP est facultatif et mobile. Il indique le temps, le lieu, la cause ou la manière. On peut le déplacer.',
 '{"type":"mcq","question":"Dans la phrase « Hier, les élèves ont bien travaillé », quel mot est un complément de phrase ?","options":["les élèves","ont travaillé","bien","Hier"],"answer":"Hier"}'),

('Accord du verbe avec le sujet', 1, 25000, 'Le verbe s''accorde en personne et en nombre avec son sujet. Sujet pluriel → verbe pluriel.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Les enfants court vite.","Les enfants courent vite.","Les enfants coure vite.","L''enfants courent vite."],"answer":"Les enfants courent vite."}'),

('Genre du nom', 1, 20000, 'Le genre (masculin/féminin) du nom est une propriété intrinsèque. Le déterminant permet de l''identifier.',
 '{"type":"mcq","question":"Quel déterminant complète correctement : « ___ température est élevée » ?","options":["Le","La","Les","Des"],"answer":"La"}'),

('Pluriel des noms', 1, 20000, 'En général, on forme le pluriel en ajoutant un -s à la fin du nom. Mais les noms en -eau font -eaux.',
 '{"type":"mcq","question":"Quel est le pluriel du mot « château » ?","options":["châteaux","châteaus","châteaus","châteauxe"],"answer":"châteaux"}'),

('Accord de l''adjectif', 1, 25000, 'L''adjectif s''accorde en genre et en nombre avec le nom ou le pronom qu''il qualifie ou avec lequel il est en relation.',
 '{"type":"mcq","question":"Laquelle de ces phrases contient un adjectif correctement accordé ?","options":["une robe bleu","des chapeaux verts","une maison grand","des fleurs rouge"],"answer":"des chapeaux verts"}'),

('Types de phrases — déclarative', 1, 20000, 'La phrase déclarative affirme ou nie quelque chose. Elle se termine par un point.',
 '{"type":"mcq","question":"Laquelle est une phrase déclarative ?","options":["Ferme la porte !","Est-ce qu''il viendra ?","Il fait beau aujourd''hui.","Comme c''est beau !"],"answer":"Il fait beau aujourd''hui."}'),

('Types de phrases — interrogative', 1, 20000, 'La phrase interrogative pose une question. Elle se termine par un point d''interrogation.',
 '{"type":"mcq","question":"Laquelle est une phrase interrogative ?","options":["Il est parti hier.","Partez maintenant !","Où est-il allé ?","Quelle belle journée !"],"answer":"Où est-il allé ?"}'),

('Types de phrases — impérative', 1, 20000, 'La phrase impérative donne un ordre ou un conseil. Le sujet est généralement absent.',
 '{"type":"mcq","question":"Laquelle est une phrase impérative ?","options":["Tu dois partir.","Pars maintenant !","Est-ce que tu pars ?","Il part bientôt."],"answer":"Pars maintenant !"}'),

('Types de phrases — exclamative', 1, 20000, 'La phrase exclamative exprime une émotion forte. Elle se termine par un point d''exclamation.',
 '{"type":"mcq","question":"Laquelle est une phrase exclamative ?","options":["Quelle belle surprise !","Est-ce une surprise ?","Il y a une surprise.","Prépare une surprise."],"answer":"Quelle belle surprise !"}'),

('Phrase de base et ses constituants', 1, 25000, 'La phrase de base contient un sujet (S) + un prédicat (P) et parfois un complément de phrase (CP).',
 '{"type":"mcq","question":"Quelle est la structure minimale d''une phrase de base en français ?","options":["CD + GV","Sujet + Prédicat","CP + Sujet","Det + N + V"],"answer":"Sujet + Prédicat"}'),

('Pronom personnel sujet', 1, 20000, 'Les pronoms personnels sujets : je, tu, il, elle, on, nous, vous, ils, elles.',
 '{"type":"mcq","question":"Lequel de ces pronoms est un pronom personnel sujet ?","options":["me","lui","elles","leur"],"answer":"elles"}'),

('Déterminant possessif', 1, 20000, 'Les déterminants possessifs : mon, ma, mes, ton, ta, tes, son, sa, ses, notre, votre, leur, leurs.',
 '{"type":"mcq","question":"Lequel est un déterminant possessif ?","options":["ce","leurs","des","le"],"answer":"leurs"}'),

('Déterminant démonstratif', 1, 20000, 'Les déterminants démonstratifs : ce, cet, cette, ces. Ils désignent ce dont on parle.',
 '{"type":"mcq","question":"Lequel est un déterminant démonstratif ?","options":["un","mon","ces","les"],"answer":"ces"}'),

('Complément du nom', 1, 25000, 'Le complément du nom est un groupe qui complète un nom. Il est souvent introduit par « de » ou une autre préposition.',
 '{"type":"mcq","question":"Dans « le livre de mon ami », quel est le complément du nom « livre » ?","options":["mon ami","de mon ami","le livre","ami"],"answer":"de mon ami"}'),

('Subordonnée relative', 1, 25000, 'La subordonnée relative commence par un pronom relatif (qui, que, dont, où) et complète un nom.',
 '{"type":"mcq","question":"Dans « La fille qui chante est ma sœur », à quoi sert « qui chante » ?","options":["C''est le sujet","C''est une subordonnée relative","C''est le complément de phrase","C''est le prédicat"],"answer":"C''est une subordonnée relative"}'),

('Accord participe passé avec être', 1, 30000, 'Avec l''auxiliaire être, le participe passé s''accorde avec le sujet.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Elle est parti.","Elle est partie.","Elle est partis.","Elle est partié."],"answer":"Elle est partie."}'),

('Accord participe passé avec avoir', 1, 30000, 'Avec l''auxiliaire avoir, le participe passé ne s''accorde pas avec le sujet mais avec le CD si celui-ci est placé avant le verbe.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Ils ont mangée la pizza.","Ils ont mangés la pizza.","Ils ont mangé la pizza.","Ils ont mangées la pizza."],"answer":"Ils ont mangé la pizza."}'),

('Négation complète', 1, 20000, 'La négation complète nécessite deux éléments : ne (n'') + pas (jamais, plus, rien, personne…).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correctement niée ?","options":["Il mange pas.","Il ne mange pas.","Il pas mange.","Ne il mange."],"answer":"Il ne mange pas."}'),

('Ponctuation virgule énumération', 1, 20000, 'On utilise la virgule pour séparer les éléments d''une énumération.',
 '{"type":"mcq","question":"Laquelle utilise correctement la virgule dans une énumération ?","options":["J''aime les chats, les chiens et les oiseaux.","J''aime les chats les chiens, et les oiseaux.","J''aime, les chats, les chiens et les oiseaux.","J''aime les chats, les chiens, et, les oiseaux."],"answer":"J''aime les chats, les chiens et les oiseaux."}'),

-- ── DIFFICULTÉ 2 — Analyse et manipulation (34 questions) ─────────────────

('Manipulations syntaxiques — déplacement', 2, 35000, 'Le CP est un constituant qu''on peut déplacer. Si on peut le mettre en début ou en fin de phrase, c''est un CP.',
 '{"type":"mcq","question":"Dans la phrase « Les élèves ont bien travaillé hier », comment vérifier que « hier » est un complément de phrase ?","options":["On peut l''effacer et le déplacer","On peut le remplacer par un pronom","On peut l''accorder avec le sujet","On peut le mettre au pluriel"],"answer":"On peut l''effacer et le déplacer"}'),

('Subordonnée complétive', 2, 35000, 'La subordonnée complétive est introduite par « que » et joue le rôle de CD du verbe principal.',
 '{"type":"mcq","question":"Dans la phrase « Je crois qu''il viendra demain », quel rôle joue « qu''il viendra demain » ?","options":["Sujet","Complément de phrase","Complément direct du verbe","Attribut du sujet"],"answer":"Complément direct du verbe"}'),

('Pronoms relatifs qui vs que', 2, 35000, '"Qui" est sujet de la subordonnée relative. "Que" est CD de la subordonnée relative.',
 '{"type":"mcq","question":"Lequel de ces choix est correct ? « C''est l''élève ___ a eu la meilleure note »","options":["que","dont","où","qui"],"answer":"qui"}'),

('Pronom relatif que', 2, 35000, '"Que" est CD de la relative : le nom remplacé est l''objet de l''action.',
 '{"type":"mcq","question":"Lequel est correct ? « C''est le livre ___ j''ai lu »","options":["qui","dont","que","lequel"],"answer":"que"}'),

('Pronom relatif dont', 2, 35000, '"Dont" remplace un nom introduit par "de" dans la subordonnée.',
 '{"type":"mcq","question":"Lequel est correct ? « C''est le projet ___ je suis fier »","options":["que","qui","dont","lequel"],"answer":"dont"}'),

('Coordination vs subordination', 2, 35000, 'La coordination relie des propositions de même niveau (et, mais, ou…). La subordination crée une hiérarchie entre propositions.',
 '{"type":"mcq","question":"Dans « Il est parti parce qu''il était fatigué », quel type de lien y a-t-il entre les deux propositions ?","options":["Coordination","Juxtaposition","Subordination","Apposition"],"answer":"Subordination"}'),

('Fonctions dans la phrase — récapitulatif', 2, 35000, 'S, CD, CI, CP, attribut du sujet sont les grandes fonctions syntaxiques à identifier.',
 '{"type":"mcq","question":"Dans la phrase « Mes amis m''offrent un cadeau pour mon anniversaire », quel est le CD ?","options":["Mes amis","m''","un cadeau","pour mon anniversaire"],"answer":"un cadeau"}'),

('Participe passé accord avec CD antéposé', 2, 40000, 'Avec avoir, si le CD est placé AVANT le verbe (pronom), le PP s''accorde. Les livres qu''il a LUS.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Les pommes qu''elle a mangé étaient bonnes.","Les pommes qu''elle a mangées étaient bonnes.","Les pommes qu''elles a mangés étaient bonnes.","Les pommes qu''elle a mangée étaient bonnes."],"answer":"Les pommes qu''elle a mangées étaient bonnes."}'),

('Verbes attributifs', 2, 35000, 'Les verbes attributifs (être, devenir, paraître, sembler, rester, demeurer) introduisent un attribut du sujet.',
 '{"type":"mcq","question":"Quel verbe est un verbe attributif dans la phrase « Elle semble fatiguée » ?","options":["Elle","semble","fatiguée","Aucun de ces mots"],"answer":"semble"}'),

('Infinitif ou participe passé', 2, 35000, 'Après un verbe conjugué + préposition (de, à), on met généralement l''infinitif (pas le PP).',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Il commence à manger.","Il commence à mangé.","Il commence à mangée.","Il commence à mangés."],"answer":"Il commence à manger."}'),

('GN expansé avec subordonnée', 2, 35000, 'On peut enrichir un GN en ajoutant une subordonnée relative, un adjectif, un complément du nom.',
 '{"type":"mcq","question":"Laquelle de ces phrases contient un GN enrichi d''une subordonnée relative ?","options":["un grand chien","le chien de mon voisin","le chien qui aboie toute la nuit","ce chien noir"],"answer":"le chien qui aboie toute la nuit"}'),

('Transformation phrase active → passive', 2, 40000, 'Passif : le CD devient sujet + être + PP + par + ancien sujet. « Le chat mange la souris » → « La souris est mangée par le chat ».',
 '{"type":"mcq","question":"Transformez à la voix passive : « Le vent renverse les arbres »","options":["Les arbres renversent le vent.","Les arbres sont renversés par le vent.","Le vent est renversé par les arbres.","Les arbres ont été renversés."],"answer":"Les arbres sont renversés par le vent."}'),

('Accord adjectif avec plusieurs noms', 2, 40000, 'Si l''adjectif qualifie plusieurs noms de genres différents, il se met au masculin pluriel.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Un chat et une chienne noirs.","Un chat et une chienne noires.","Un chat et une chienne noir.","Un chat et une chienne noire."],"answer":"Un chat et une chienne noirs."}'),

('Position de l''adjectif', 2, 35000, 'Certains adjectifs courts changent de sens selon leur position : un grand homme (de valeur) / un homme grand (de taille).',
 '{"type":"mcq","question":"Dans « C''est un vieux médecin », que signifie la position de « vieux » avant le nom ?","options":["Il est âgé professionnellement","L''adjectif qualifie son âge","L''adjectif indique son expérience","L''adjectif est attribut"],"answer":"L''adjectif qualifie son âge"}'),

('Identification du prédicat', 2, 35000, 'Le prédicat est ce qu''on dit du sujet. Il contient le verbe et tout ce qui le suit (CD, CI, attribut, etc.).',
 '{"type":"mcq","question":"Dans la phrase « Ma sœur aime beaucoup le cinéma », quel est le prédicat ?","options":["Ma sœur","aime beaucoup le cinéma","le cinéma","aime"],"answer":"aime beaucoup le cinéma"}'),

('Subordonnée circonstancielle cause', 2, 35000, 'La subordonnée circonstancielle de cause est introduite par « parce que », « puisque », « car ».',
 '{"type":"mcq","question":"Quelle subordonnée exprime la cause ?","options":["Il travaille pour réussir.","Il travaille bien qu''il soit fatigué.","Il travaille parce qu''il aime ça.","Il travaille quand il est motivé."],"answer":"Il travaille parce qu''il aime ça."}'),

('Subordonnée circonstancielle temps', 2, 35000, 'La subordonnée de temps est introduite par quand, lorsque, avant que, après que, dès que…',
 '{"type":"mcq","question":"Laquelle est une subordonnée de temps ?","options":["Il part parce qu''il est fatigué.","Il part pour trouver du travail.","Il part quand il est prêt.","Il part bien qu''il soit occupé."],"answer":"Il part quand il est prêt."}'),

('Subordonnée concessive', 2, 35000, 'La subordonnée concessive exprime une opposition et est introduite par « bien que », « quoique » + subjonctif.',
 '{"type":"mcq","question":"Laquelle est une subordonnée concessive ?","options":["Il réussit parce qu''il travaille.","Il réussit bien qu''il soit paresseux.","Il réussit quand il le veut.","Il réussit pour impressionner ses parents."],"answer":"Il réussit bien qu''il soit paresseux."}'),

('Marqueurs de relation', 2, 35000, 'Les marqueurs de relation organisent le texte : d''abord, ensuite, enfin, cependant, donc, en effet…',
 '{"type":"mcq","question":"Quel marqueur de relation exprime une conséquence ?","options":["Cependant","D''abord","Donc","Néanmoins"],"answer":"Donc"}'),

('Type de déterminant — partitif', 2, 35000, 'Les déterminants partitifs (du, de la, des) désignent une quantité non comptable ou imprécise.',
 '{"type":"mcq","question":"Dans « Elle mange du pain et boit de l''eau », quels sont les déterminants partitifs ?","options":["Elle, l''","du, de l''","mange, boit","pain, eau"],"answer":"du, de l''"}'),

('Accord du participe passé — règle de base', 2, 35000, 'PP avec avoir : sans accord si aucun CD ou si CD placé après. PP avec être : accord avec le sujet.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Elles sont arrivés.","Elles sont arrivé.","Elles sont arrivées.","Elles est arrivées."],"answer":"Elles sont arrivées."}'),

('Identification du GPrep', 2, 35000, 'Le groupe prépositionnel (GPrep) commence par une préposition. Il peut avoir la fonction de CI, CP, ou complément du nom.',
 '{"type":"mcq","question":"Dans « Elle pense à ses vacances », quelle est la fonction de « à ses vacances » ?","options":["Sujet","Complément direct","Complément indirect","Attribut du sujet"],"answer":"Complément indirect"}'),

('Phrase emphatique (mise en relief)', 2, 40000, 'La phrase emphatique met en relief un élément avec « C''est... qui » ou « C''est... que ».',
 '{"type":"mcq","question":"Quelle phrase met en relief le sujet « Marie » ?","options":["Marie aime la musique.","C''est Marie qui aime la musique.","C''est la musique que Marie aime.","Marie, elle aime la musique."],"answer":"C''est Marie qui aime la musique."}'),

('Pronom COD vs COI', 2, 35000, 'COD pronoms : le, la, les, me, te, se, nous, vous. COI pronoms : lui, leur, me, te, se, nous, vous.',
 '{"type":"mcq","question":"Dans « Il lui parle », « lui » est...","options":["Un COD","Un COI","Un sujet","Un CP"],"answer":"Un COI"}'),

('Déterminant numéral', 2, 30000, 'Les déterminants numéraux indiquent une quantité précise : deux, trois, cent, mille…',
 '{"type":"mcq","question":"Dans « J''ai acheté trois livres », quel est le déterminant numéral ?","options":["J''ai","acheté","trois","livres"],"answer":"trois"}'),

('Reprise pronominale', 2, 35000, 'La reprise pronominale (il, elle, ils, elles, le, la, les, lui, leur) remplace un GN déjà mentionné, assurant la cohérence du texte.',
 '{"type":"mcq","question":"Dans « Mon père est médecin. Il travaille à l''hôpital. », à quoi « Il » fait-il référence ?","options":["L''hôpital","Mon père","Le médecin","Un autre médecin"],"answer":"Mon père"}'),

-- ── DIFFICULTÉ 3 — Syntaxe complexe et analyse approfondie (32 questions) ─

('Subordonnée infinitive', 3, 50000, 'Une subordonnée infinitive a un sujet propre différent du verbe principal. « Je le vois partir » = il part (lui, pas moi).',
 '{"type":"mcq","question":"Dans « J''entends les oiseaux chanter », quelle est la fonction de « chanter » ?","options":["Attribut du sujet","CD du verbe entendre","Sujet","Subordonnée infinitive jouant le rôle de CD"],"answer":"Subordonnée infinitive jouant le rôle de CD"}'),

('Antécédent du pronom relatif', 3, 50000, 'L''antécédent du pronom relatif est le nom que le pronom remplace dans la subordonnée relative.',
 '{"type":"mcq","question":"Dans « C''est le film dont il m''a parlé qui m''a le plus plu », quel est l''antécédent de « qui » ?","options":["il","le film","dont","m''a parlé"],"answer":"le film"}'),

('Accord PP verbes pronominaux', 3, 55000, 'PP des verbes pronominaux : il s''accorde avec le sujet si le pronom est CD. Si le pronom est CI, pas d''accord.',
 '{"type":"mcq","question":"Laquelle est correcte ? « Elles ___ (se laver) les mains » (le pronom réfléchi est CI)","options":["se sont lavé les mains","se sont lavées les mains","s''est lavé les mains","se sont lavés les mains"],"answer":"se sont lavé les mains"}'),

('Discours direct et indirect', 3, 50000, 'Au discours indirect, les guillemets et les deux points disparaissent, et les pronoms changent. Le verbe peut changer de temps.',
 '{"type":"mcq","question":"Transformez au discours indirect : « Il dit : \" Je suis fatigué.\" »","options":["Il dit qu''il est fatigué.","Il dit que je suis fatigué.","Il dit : il est fatigué.","Il dit étant fatigué."],"answer":"Il dit qu''il est fatigué."}'),

('Syntaxe de la phrase complexe', 3, 55000, 'Une phrase complexe contient au moins deux propositions. On peut les identifier par le nombre de verbes conjugués.',
 '{"type":"mcq","question":"Combien de propositions contient la phrase : « Quand il pleut, je reste chez moi parce que je n''aime pas me mouiller » ?","options":["1","2","3","4"],"answer":"3"}'),

('Ellipse syntaxique', 3, 50000, 'L''ellipse supprime des éléments qui peuvent être récupérés par le contexte. « Pierre aime le sport et Paul aussi. »',
 '{"type":"mcq","question":"Dans la phrase « Pierre mange une pomme et Paul, une orange », quel élément est sous-entendu ?","options":["une pomme","aussi","mange","Paul"],"answer":"mange"}'),

('Apposition', 3, 50000, 'L''apposition est un GN placé à côté d''un autre GN pour le définir ou le préciser. Elle est souvent entre virgules.',
 '{"type":"mcq","question":"Dans « Montréal, la métropole du Québec, est une ville dynamique », quel rôle joue « la métropole du Québec » ?","options":["Sujet","Complément de phrase","Apposition","Subordonnée relative"],"answer":"Apposition"}'),

('Coordination et virgule', 3, 45000, 'Avant « et » dans une longue énumération ou devant « car, or, mais, donc, or, ni », on peut mettre une virgule.',
 '{"type":"mcq","question":"Laquelle utilise correctement la virgule avant une conjonction ?","options":["Il est venu, et il est parti.","Il est venu et, il est parti.","Il est tard, mais il travaille encore.","Il travaille, et dort peu."],"answer":"Il est tard, mais il travaille encore."}'),

('Analyse complète d''une phrase', 3, 60000, 'Phrase : « Chaque matin, ma mère prépare un délicieux repas pour toute la famille. »',
 '{"type":"mcq","question":"Dans la phrase « Chaque matin, ma mère prépare un délicieux repas pour toute la famille », quel est le sujet ?","options":["Chaque matin","ma mère","prépare un délicieux repas","pour toute la famille"],"answer":"ma mère"}'),

('Erreur d''accord fréquente', 3, 50000, 'Le verbe s''accorde avec le VRAI sujet, pas avec le nom le plus proche. « Un groupe d''élèves travaille ».',
 '{"type":"mcq","question":"Laquelle de ces phrases contient l''accord correct du verbe ?","options":["La majorité des élèves sont présents.","La majorité des élèves est présente.","La majorité des élèves est présents.","La majorité des élèves sont présente."],"answer":"La majorité des élèves est présente."}'),

('Enchâssement de subordonnées', 3, 55000, 'Plusieurs subordonnées peuvent être enchâssées les unes dans les autres, créant des phrases très complexes.',
 '{"type":"mcq","question":"Dans « Je sais que tu crois qu''il viendra », combien y a-t-il de propositions subordonnées ?","options":["0","1","2","3"],"answer":"2"}'),

('Dislocation', 3, 55000, 'La dislocation est un procédé d''emphase où un GN est détaché en début ou en fin de phrase et repris par un pronom.',
 '{"type":"mcq","question":"Dans « La musique, j''en raffole », quel procédé syntaxique est utilisé ?","options":["Mise en relief par C''est...que","Dislocation à gauche","Apposition","Ellipse"],"answer":"Dislocation à gauche"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
