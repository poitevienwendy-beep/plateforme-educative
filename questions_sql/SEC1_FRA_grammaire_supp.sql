-- Supplément SEC1_FRA_grammaire : +78 questions (72 → 150)
-- PFEQ-FRA-SEC1-GR

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-GR') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (26 questions)
('Identifier un nom commun', 1, 18000, 'Un nom commun désigne une réalité générique (animal, objet, personne). Il peut être précédé d''un déterminant.',
 '{"type":"mcq","question":"Lequel de ces mots est un nom commun ?","options":["courir","Montréal","chien","beau"],"answer":"chien"}'),

('Identifier un nom propre', 1, 18000, 'Un nom propre commence par une majuscule et désigne un être ou un lieu unique.',
 '{"type":"mcq","question":"Lequel de ces mots est un nom propre ?","options":["ville","fleuve","forêt","Québec"],"answer":"Québec"}'),

('Identifier un verbe', 1, 18000, 'Un verbe exprime une action ou un état. Il se conjugue selon la personne et le temps.',
 '{"type":"mcq","question":"Lequel de ces mots est un verbe ?","options":["chaud","rapidement","manger","belle"],"answer":"manger"}'),

('Identifier un adjectif qualificatif', 1, 18000, 'Un adjectif qualificatif décrit ou qualifie un nom. Il s''accorde en genre et en nombre.',
 '{"type":"mcq","question":"Lequel de ces mots est un adjectif qualificatif ?","options":["courir","très","table","grand"],"answer":"grand"}'),

('Identifier un adverbe', 1, 18000, 'Un adverbe modifie un verbe, un adjectif ou un autre adverbe. Il est invariable.',
 '{"type":"mcq","question":"Lequel de ces mots est un adverbe ?","options":["lentement","lent","lenteur","lente"],"answer":"lentement"}'),

('Identifier une préposition', 1, 18000, 'Une préposition établit un rapport entre des mots. Exemples : à, de, en, pour, par, sur.',
 '{"type":"mcq","question":"Lequel de ces mots est une préposition ?","options":["mais","cependant","dans","lorsque"],"answer":"dans"}'),

('Identifier une conjonction de coordination', 1, 18000, 'Les conjonctions de coordination sont : mais, ou, et, donc, or, ni, car.',
 '{"type":"mcq","question":"Lequel de ces mots est une conjonction de coordination ?","options":["quand","parce que","mais","bien que"],"answer":"mais"}'),

('Identifier un pronom personnel', 1, 20000, 'Les pronoms personnels : je, tu, il, elle, nous, vous, ils, elles.',
 '{"type":"mcq","question":"Dans «Il mange une pomme», quel mot est un pronom personnel ?","options":["Il","mange","une","pomme"],"answer":"Il"}'),

('Identifier le sujet d''une phrase', 1, 20000, 'Le sujet répond à «Qui/Qu''est-ce qui + verbe ?». Dans «Le chat dort», c''est «Le chat».',
 '{"type":"mcq","question":"Quel est le sujet dans la phrase «La chatte noire ronronne doucement» ?","options":["noire","La chatte noire","ronronne","doucement"],"answer":"La chatte noire"}'),

('Identifier le verbe dans une phrase', 1, 20000, 'Le verbe est le noyau du groupe verbal. Dans «Les élèves lisent», c''est «lisent».',
 '{"type":"mcq","question":"Quel est le verbe dans la phrase «Mon frère joue au soccer» ?","options":["Mon","frère","joue","soccer"],"answer":"joue"}'),

('Identifier le complément direct', 1, 22000, 'Le CD complète le verbe sans préposition. «Qui/Quoi ? + verbe» → la réponse est le CD.',
 '{"type":"mcq","question":"Dans «Marie lit un roman», quel est le complément direct ?","options":["Marie","lit","un roman","directement"],"answer":"un roman"}'),

('Accord sujet-verbe simple', 1, 20000, 'Le verbe s''accorde avec son sujet. Sujet pluriel → verbe pluriel.',
 '{"type":"mcq","question":"Quelle forme est correcte : «Les enfants _____ dans le parc» ?","options":["joue","joues","jouent","jouons"],"answer":"jouent"}'),

('Accord de l''adjectif en genre', 1, 20000, 'Un adjectif s''accorde avec le nom qu''il qualifie. Nom féminin → adjectif féminin.',
 '{"type":"mcq","question":"Quelle forme est correcte : «une maison ___»  ?","options":["grand","grande","grands","grandes"],"answer":"grande"}'),

('Accord de l''adjectif en nombre', 1, 20000, 'Nom masculin pluriel → adjectif masculin pluriel.',
 '{"type":"mcq","question":"Quelle forme est correcte : «des livres ___»  ?","options":["intéressant","intéressante","intéressants","intéressantes"],"answer":"intéressants"}'),

('Déterminant défini ou indéfini', 1, 18000, '«le, la, les» = définis (référent connu). «un, une, des» = indéfinis (référent inconnu).',
 '{"type":"mcq","question":"Dans «J''ai vu un chien», le déterminant «un» est...","options":["Défini","Indéfini","Partitif","Démonstratif"],"answer":"Indéfini"}'),

('Déterminant possessif', 1, 18000, 'Les déterminants possessifs : mon, ma, mes, ton, ta, tes, son, sa, ses, notre, votre, leur...',
 '{"type":"mcq","question":"Lequel de ces déterminants est possessif ?","options":["le","cette","mon","quelques"],"answer":"mon"}'),

('Phrase déclarative', 1, 18000, 'Une phrase déclarative énonce un fait. Elle se termine par un point.',
 '{"type":"mcq","question":"Quelle phrase est une phrase déclarative ?","options":["Ferme la porte !","Est-ce qu''il pleut ?","Il fait beau aujourd''hui.","Comme c''est magnifique !"],"answer":"Il fait beau aujourd''hui."}'),

('Phrase interrogative', 1, 18000, 'Une phrase interrogative pose une question. Elle se termine par un point d''interrogation.',
 '{"type":"mcq","question":"Quelle phrase est une phrase interrogative ?","options":["Mange tes légumes.","Quel âge as-tu ?","Quelle belle journée !","Cours plus vite."],"answer":"Quel âge as-tu ?"}'),

('Phrase exclamative', 1, 18000, 'Une phrase exclamative exprime une émotion forte. Elle se termine par un point d''exclamation.',
 '{"type":"mcq","question":"Quelle phrase est une phrase exclamative ?","options":["Viens ici.","Pourquoi pleures-tu ?","Quelle merveilleuse surprise !","Je suis fatigué."],"answer":"Quelle merveilleuse surprise !"}'),

('Phrase impérative', 1, 18000, 'Une phrase impérative exprime un ordre ou une demande. Le verbe est à l''impératif.',
 '{"type":"mcq","question":"Quelle phrase est une phrase impérative ?","options":["Tu viens maintenant.","Viens maintenant !","Pourquoi tu ne viens pas ?","Il vient maintenant."],"answer":"Viens maintenant !"}'),

('Singulier et pluriel des noms', 1, 18000, 'En général, on ajoute -s au pluriel. Exceptions : -al → -aux, -eau → -eaux...',
 '{"type":"mcq","question":"Quel est le pluriel de «chapeau» ?","options":["chapeaus","chapeaux","chapeas","chapeaues"],"answer":"chapeaux"}'),

('Féminin des noms', 1, 18000, 'En général, on ajoute -e pour former le féminin. Exceptions : -eur → -euse, -teur → -trice...',
 '{"type":"mcq","question":"Quel est le féminin de «acteur» ?","options":["acteure","acteuresse","actrice","acteuse"],"answer":"actrice"}'),

('Groupe nominal', 1, 20000, 'Un groupe nominal (GN) est constitué d''un nom et de ses expansions. Noyau = nom.',
 '{"type":"mcq","question":"Dans «la grande maison bleue», quel est le noyau du groupe nominal ?","options":["la","grande","maison","bleue"],"answer":"maison"}'),

('Groupe verbal', 1, 20000, 'Le groupe verbal (GV) contient le verbe conjugué et ses compléments.',
 '{"type":"mcq","question":"Dans «Maria mange une salade», quel est le groupe verbal ?","options":["Maria","mange","une salade","mange une salade"],"answer":"mange une salade"}'),

('Complément indirect', 1, 22000, 'Le CI complète le verbe avec une préposition. «À/de + qui/quoi ?» → réponse = CI.',
 '{"type":"mcq","question":"Dans «Il téléphone à sa mère», quel est le complément indirect ?","options":["Il","téléphone","à sa mère","sa mère"],"answer":"à sa mère"}'),

('Attribut du sujet', 1, 22000, 'L''attribut du sujet est relié au sujet par un verbe attributif (être, paraître, sembler...).',
 '{"type":"mcq","question":"Dans «Elle est médecin», quel mot est l''attribut du sujet ?","options":["Elle","est","médecin","Elle est"],"answer":"médecin"}'),

-- DIFFICULTÉ 2 (26 questions)
('Subordonnée relative', 2, 30000, 'Une proposition subordonnée relative est introduite par un pronom relatif (qui, que, dont, où...).',
 '{"type":"mcq","question":"Quelle proposition est une subordonnée relative ?","options":["parce qu''il pleut","que je vois là-bas","bien qu''il soit tard","afin de réussir"],"answer":"que je vois là-bas"}'),

('Pronom relatif «qui»', 2, 30000, '«Qui» est sujet de la subordonnée relative. Il reprend un antécédent animé ou inanimé.',
 '{"type":"mcq","question":"Complète : «Le livre ___ traîne sur la table est à moi.»","options":["que","dont","qui","lequel"],"answer":"qui"}'),

('Pronom relatif «que»', 2, 30000, '«Que» est complément direct de la subordonnée relative. Il reprend un antécédent animé ou inanimé.',
 '{"type":"mcq","question":"Complète : «La fleur ___ il a cueillie est une rose.»","options":["qui","dont","où","que"],"answer":"que"}'),

('Pronom relatif «dont»', 2, 30000, '«Dont» = «de qui/duquel/de laquelle...». Il reprend un complément prépositionnel avec «de».',
 '{"type":"mcq","question":"Complète : «C''est l''élève ___ je t''ai parlé.»","options":["que","qui","dont","où"],"answer":"dont"}'),

('Pronom relatif «où»', 2, 30000, '«Où» exprime le lieu ou le temps. Il remplace une indication de lieu ou de temps.',
 '{"type":"mcq","question":"Complète : «Je me souviens du jour ___ nous nous sommes rencontrés.»","options":["que","qui","dont","où"],"answer":"où"}'),

('Subordonnée causale', 2, 30000, 'La subordonnée causale exprime la cause. Conjonctions : parce que, car, puisque, comme.',
 '{"type":"mcq","question":"Quelle conjonction introduit une subordonnée causale ?","options":["afin que","bien que","parce que","pour que"],"answer":"parce que"}'),

('Subordonnée consécutive', 2, 30000, 'La subordonnée consécutive exprime la conséquence. Conjonctions : si bien que, de sorte que, tellement... que.',
 '{"type":"mcq","question":"Quelle conjonction introduit une subordonnée de conséquence ?","options":["bien que","parce que","si bien que","afin que"],"answer":"si bien que"}'),

('Subordonnée de but', 2, 30000, 'La subordonnée de but exprime le but visé. Conjonctions : pour que, afin que, de crainte que.',
 '{"type":"mcq","question":"Quelle conjonction introduit une subordonnée de but ?","options":["parce que","si bien que","afin que","alors que"],"answer":"afin que"}'),

('Subordonnée concessive', 2, 30000, 'La subordonnée concessive exprime une opposition/concession. Conjonctions : bien que, quoique, même si.',
 '{"type":"mcq","question":"Quelle conjonction introduit une subordonnée concessive ?","options":["parce que","si","afin que","bien que"],"answer":"bien que"}'),

('Accord du participe passé avec être', 2, 32000, 'Avec l''auxiliaire être, le participe passé s''accorde avec le sujet.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Les filles sont ___»","options":["parti","partie","parties","partis"],"answer":"parties"}'),

('Accord du participe passé avec avoir', 2, 32000, 'Avec l''auxiliaire avoir, le participe passé s''accorde avec le COD si celui-ci est placé avant.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Les pommes que j''ai ___ sont bonnes.»","options":["mangé","mangée","mangées","mangés"],"answer":"mangées"}'),

('Accord sans COD antéposé', 2, 30000, 'Avec avoir, si le COD est après le verbe, le participe passé reste invariable.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Nous avons ___ les devoirs.»","options":["faite","faits","fait","faites"],"answer":"fait"}'),

('Voix active et voix passive', 2, 30000, 'Voix active : sujet fait l''action. Voix passive : sujet subit l''action.',
 '{"type":"mcq","question":"Quelle phrase est à la voix passive ?","options":["Le chat attrape la souris.","La souris attrape le chat.","La souris est attrapée par le chat.","La souris fuit le chat."],"answer":"La souris est attrapée par le chat."}'),

('Transformation active → passive', 2, 32000, 'Actif : «Le jardinier plante des fleurs.» Passif : «Des fleurs sont plantées par le jardinier.»',
 '{"type":"mcq","question":"Transforme en passif : «La directrice lit les rapports.»","options":["Les rapports lisent la directrice.","Les rapports sont lus par la directrice.","La directrice est lue par les rapports.","Les rapports ont été lire par la directrice."],"answer":"Les rapports sont lus par la directrice."}'),

('Complément du nom', 2, 28000, 'Le complément du nom précise le nom. Souvent introduit par une préposition.',
 '{"type":"mcq","question":"Dans «la maison de Pierre», quel est le complément du nom ?","options":["la maison","de Pierre","Pierre","maison"],"answer":"de Pierre"}'),

('Épithète et attribut : différence', 2, 30000, 'Épithète : adjectif directement à côté du nom. Attribut : lié au sujet par un verbe attributif.',
 '{"type":"mcq","question":"Dans «Elle porte une robe magnifique», l''adjectif «magnifique» est...","options":["Attribut du sujet","Épithète du nom «robe»","Attribut du complément direct","Complément de l''adverbe"],"answer":"Épithète du nom «robe»"}'),

('Modificateur d''adjectif', 2, 28000, 'Un adverbe peut modifier un adjectif pour l''intensifier.',
 '{"type":"mcq","question":"Dans «très grand», quel mot est le modificateur de l''adjectif ?","options":["très","grand","très grand","ni l''un ni l''autre"],"answer":"très"}'),

('Pronom démonstratif', 2, 28000, 'Les pronoms démonstratifs : celui, celle, ceux, celles, ce, c''.',
 '{"type":"mcq","question":"Lequel de ces mots est un pronom démonstratif ?","options":["ce livre","cette","celui","cet"],"answer":"celui"}'),

('Pronom indéfini', 2, 28000, 'Les pronoms indéfinis : on, tout, quelqu''un, rien, personne, chacun, quelque chose...',
 '{"type":"mcq","question":"Lequel de ces mots est un pronom indéfini ?","options":["il","me","lui","quelqu''un"],"answer":"quelqu''un"}'),

('Classe des mots invariables', 2, 28000, 'Les mots invariables ne changent ni en genre ni en nombre : adverbes, prépositions, conjonctions.',
 '{"type":"mcq","question":"Lequel de ces mots est invariable ?","options":["beau","grand","rapidement","courageux"],"answer":"rapidement"}'),

('Accord adjectif épithète f. pluriel', 2, 30000, 'Adjectif qualifiant un nom féminin pluriel → féminin pluriel.',
 '{"type":"mcq","question":"Quelle forme est correcte : «des notes ___»  ?","options":["excellent","excellente","excellentes","excellents"],"answer":"excellentes"}'),

('Accord avec plusieurs noms', 2, 32000, 'Si l''adjectif qualifie plusieurs noms de genres différents, il prend le masculin pluriel.',
 '{"type":"mcq","question":"Quelle forme est correcte : «un sac et une valise ___» ?","options":["lourd","lourde","lourdement","lourds"],"answer":"lourds"}'),

('Dédoublement par «est-ce que» (interrogation)', 2, 30000, 'On peut former une phrase interrogative avec inversion ou «est-ce que». Les deux sont valides.',
 '{"type":"mcq","question":"Quelle forme interrogative correspond à «Tu aimes le chocolat» ?","options":["Est-ce que tu aimes le chocolat ?","Aimes-tu le chocolat ?","Toutes les réponses","Ni l''une ni l''autre"],"answer":"Toutes les réponses"}'),

('Complément de phrase (CP)', 2, 30000, 'Le CP est mobile et effaçable. Il indique le contexte (temps, lieu, manière, cause).',
 '{"type":"mcq","question":"Dans «Hier soir, il a plu abondamment», quel est le complément de phrase ?","options":["il","a plu","abondamment","Hier soir"],"answer":"Hier soir"}'),

('Identifier le type de groupe', 2, 30000, 'Un groupe prépositionnel (GPrép) commence par une préposition.',
 '{"type":"mcq","question":"Dans «à toute vitesse», quel type de groupe est-ce ?","options":["Groupe nominal","Groupe verbal","Groupe prépositionnel","Groupe adjectival"],"answer":"Groupe prépositionnel"}'),

('Expansion du nom : type', 2, 30000, 'Un nom peut être expansé par un adjectif (épithète), un GPrep (complément du nom) ou une subordonnée relative.',
 '{"type":"mcq","question":"Dans «l''élève studieux qui réussit», quelles sont les expansions du nom «élève» ?","options":["studieux seulement","qui réussit seulement","studieux et qui réussit","aucune expansion"],"answer":"studieux et qui réussit"}'),

-- DIFFICULTÉ 3 (26 questions)
('Subordonnée temporelle', 3, 42000, 'La subordonnée temporelle situe l''action dans le temps. Conjonctions : quand, lorsque, dès que, avant que, après que.',
 '{"type":"mcq","question":"Quelle conjonction introduit une subordonnée temporelle ?","options":["parce que","bien que","lorsque","pour que"],"answer":"lorsque"}'),

('Concordance des temps : passé composé + imparfait', 3, 42000, 'Action principale (passé composé) + contexte (imparfait). «Il lisait quand elle est arrivée.»',
 '{"type":"mcq","question":"Quelle phrase illustre correctement la concordance passé composé / imparfait ?","options":["Il lisait et elle arrivait","Il lira quand elle arrivait","Il lisait quand elle est arrivée","Il lisait quand elle arrivera"],"answer":"Il lisait quand elle est arrivée"}'),

('Accord du participe passé des verbes pronominaux', 3, 45000, 'Verbes pronominaux : accord avec le sujet si le pronom est COD. «Elles se sont blessées.»',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Les joueuses se sont ___»","options":["blessé","blessés","blessée","blessées"],"answer":"blessées"}'),

('Participe passé invariable : verbes pronominaux', 3, 45000, 'Si le COD vient après le verbe pronominal, pas d''accord. «Elles se sont lavé les mains.»',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Elles se sont ___ les mains.»","options":["lavée","lavées","lavé","lavés"],"answer":"lavé"}'),

('Distinguer la cause et la conséquence', 3, 42000, 'Cause → conséquence. On peut reconnaître la cause avec «parce que» et la conséquence avec «donc».',
 '{"type":"mcq","question":"Dans «Il a raté l''autobus, donc il sera en retard», quelle proposition exprime la conséquence ?","options":["Il a raté l''autobus","il sera en retard","Il a raté l''autobus, donc","Ces deux propositions expriment la cause"],"answer":"il sera en retard"}'),

('Phrase complexe vs phrase simple', 3, 42000, 'Une phrase complexe contient au moins deux propositions avec un verbe conjugué chacune.',
 '{"type":"mcq","question":"Laquelle est une phrase complexe ?","options":["Le vent souffle.","Je mange et tu lis.","Le gros chien brun dort.","Vite, dépêche-toi !"],"answer":"Je mange et tu lis."}'),

('Paraphrase de subordonnée relative', 3, 42000, 'On peut remplacer une subordonnée relative par un adjectif ou un GPrep.',
 '{"type":"mcq","question":"Quelle expression peut remplacer «la maison qui appartient à ma tante» ?","options":["la maison belle","la maison de ma tante","la belle maison","la maison grande"],"answer":"la maison de ma tante"}'),

('Discours direct vs indirect', 3, 45000, 'Discours direct : «Il a dit : ''Je suis fatigué.''» Indirect : «Il a dit qu''il était fatigué.»',
 '{"type":"mcq","question":"Transforme en discours indirect : «Elle a crié : ''Je suis heureuse !''»","options":["Elle a crié qu''elle est heureuse.","Elle a crié qu''elle était heureuse.","Elle crie qu''elle est heureuse.","Elle dit qu''elle était heureuse."],"answer":"Elle a crié qu''elle était heureuse."}'),

('Changer personne au discours indirect', 3, 45000, 'Discours indirect : «je» devient «il/elle», «tu» devient «il/elle» ou «vous».',
 '{"type":"mcq","question":"Transforme en discours indirect : «Marc dit : ''Tu devrais venir.''»","options":["Marc dit que tu devrais venir.","Marc dit qu''il devrait venir.","Marc dit que je devrais venir.","Marc dit qu''elle devrait venir."],"answer":"Marc dit qu''il devrait venir."}'),

('Fonctions syntaxiques avancées : apposition', 3, 42000, 'L''apposition est un GN qui désigne la même réalité que le nom auquel il est rattaché.',
 '{"type":"mcq","question":"Dans «Montréal, la métropole du Québec, est une ville multiculturelle», qu''est-ce que «la métropole du Québec» ?","options":["Sujet","Complément direct","Apposition","Complément de phrase"],"answer":"Apposition"}'),

('Fonction de la subordonnée relative : complément du nom', 3, 42000, 'Une subordonnée relative a la même fonction que le complément du nom.',
 '{"type":"mcq","question":"Quelle est la fonction de «qui chante bien» dans «La fille qui chante bien est ma cousine» ?","options":["Sujet","Prédicat","Complément du nom «fille»","Complément direct"],"answer":"Complément du nom «fille»"}'),

('Accord après «avoir l''air»', 3, 45000, 'Quand «avoir l''air» signifie «paraître», l''adjectif s''accorde avec le sujet. «Elle a l''air fatiguée.»',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elle a l''air fatigué.","Elle a l''air fatiguée.","Les deux sont acceptables.","Aucune des deux."],"answer":"Les deux sont acceptables."}'),

('Accord du participe passé : sujet collectif', 3, 45000, 'Nom collectif + complément au pluriel : accord selon le sens. «La plupart des élèves sont venus.»',
 '{"type":"mcq","question":"Quelle forme est correcte ? «La plupart des élèves ___ leur examen.»","options":["a réussi","ont réussi","avaient réussi","a réussit"],"answer":"ont réussi"}'),

('Subordonnée substantive (complétive)', 3, 45000, 'La subordonnée complétive a la fonction de CD du verbe principal. «Je pense que tu as raison.»',
 '{"type":"mcq","question":"Quelle est la fonction de «qu''il viendra» dans «J''espère qu''il viendra» ?","options":["Sujet","Complément direct","Complément indirect","Complément de phrase"],"answer":"Complément direct"}'),

('Subordonnée interrogative indirecte', 3, 45000, '«Je me demande si elle viendra.» La subordonnée interrogative indirecte est un type de complétive.',
 '{"type":"mcq","question":"Quelle phrase contient une subordonnée interrogative indirecte ?","options":["Elle vient ?","Je pense qu''elle viendra.","Je me demande si elle viendra.","Vient-elle ou non ?"],"answer":"Je me demande si elle viendra."}'),

('Accord avec «ni... ni...»', 3, 45000, '«Ni... ni...» : accord au singulier si les sujets sont exclusifs, au pluriel sinon.',
 '{"type":"mcq","question":"Quelle phrase est grammaticalement correcte ?","options":["Ni Paul ni Marie n''est venu.","Ni Paul ni Marie ne sont venus.","Les deux formes sont acceptables.","Aucune des deux."],"answer":"Les deux formes sont acceptables."}'),

('Accord avec «ou»', 3, 45000, 'Sujets liés par «ou» : accord selon le contexte. Si les deux sont possibles en même temps → pluriel.',
 '{"type":"mcq","question":"Quelle phrase est correcte : «Le médecin ou l''infirmière ___ venu(e)(s) ?»","options":["est venu","est venue","est venus","est venues"],"answer":"est venue"}'),

('Reprise pronominale et antécédent', 3, 42000, 'Un pronom reprend un nom antécédent. Le pronom s''accorde en genre et nombre avec son antécédent.',
 '{"type":"mcq","question":"Dans «J''ai vu les chiens. Ils aboient.», quel est l''antécédent de «Ils» ?","options":["J''ai vu","les chiens","aboient","aucun antécédent"],"answer":"les chiens"}'),

('Infinitif ou participe passé ?', 3, 45000, 'Après un auxiliaire (avoir/être) → participe passé. Après un autre verbe → infinitif.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «J''ai ___ une lettre.»","options":["écrire","écrit","écris","écrira"],"answer":"écrit"}'),

('Ambiguïté syntaxique', 3, 45000, 'Une phrase est ambiguë quand elle peut avoir deux interprétations selon la structure syntaxique.',
 '{"type":"mcq","question":"La phrase «Il a vu l''homme avec les jumelles» est ambiguë. Pourquoi ?","options":["Parce que «jumelles» peut signifier plusieurs choses","On ne sait pas qui avait les jumelles, lui ou l''homme","Parce que «vu» peut être au passé ou présent","Aucune ambiguïté"],"answer":"On ne sait pas qui avait les jumelles, lui ou l''homme"}'),

('Néologisme et emprunt', 3, 40000, 'Un néologisme est un mot nouveau. Un emprunt vient d''une autre langue.',
 '{"type":"mcq","question":"Le mot «courriel» est un exemple de...","options":["Emprunt à l''anglais","Néologisme québécois remplaçant \"e-mail\"","Archaïsme","Régionalisme"],"answer":"Néologisme québécois remplaçant \"e-mail\""}'),

('Fonction du groupe infinitif', 3, 42000, 'Un groupe infinitif peut avoir la fonction de sujet, CD, CI ou complément de phrase.',
 '{"type":"mcq","question":"Dans «Apprendre est enrichissant», quel est le rôle de «Apprendre» ?","options":["Verbe conjugué","Sujet de «est»","Complément direct","Attribut"],"answer":"Sujet de «est»"}'),

('Pronom relatif composé', 3, 45000, 'Les pronoms relatifs composés : lequel, laquelle, lesquels, lesquelles, duquel...',
 '{"type":"mcq","question":"Lequel de ces mots est un pronom relatif composé ?","options":["qui","que","dont","lequel"],"answer":"lequel"}'),

('Phrase emphatique', 3, 42000, 'La phrase emphatique met en relief un élément. «C''est Marie qui chante.» ou «La leçon, elle l''a apprise.»',
 '{"type":"mcq","question":"Laquelle est une phrase emphatique (mise en relief) ?","options":["Marie chante.","C''est Marie qui chante.","Marie a chanté.","Marie ne chante pas."],"answer":"C''est Marie qui chante."}'),

('Attribut du complément direct', 3, 45000, 'L''attribut du CD qualifie le CD par un verbe comme «trouver, nommer, élire, appeler».',
 '{"type":"mcq","question":"Dans «Ils ont élu Marie présidente», quel est l''attribut du complément direct ?","options":["Marie","présidente","ont élu","Ils"],"answer":"présidente"}'),

('Analyse syntaxique complète d''une phrase', 3, 45000, 'Phrase : «Ce matin, la petite fille a mangé une pomme rouge.»  Sujet = «la petite fille», prédicat = «a mangé une pomme rouge», CP = «Ce matin».',
 '{"type":"mcq","question":"Dans «Ce matin, la petite fille a mangé une pomme rouge», quel est le complément de phrase ?","options":["la petite fille","a mangé","une pomme rouge","Ce matin"],"answer":"Ce matin"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
