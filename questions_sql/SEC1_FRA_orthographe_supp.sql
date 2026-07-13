-- Supplément SEC1_FRA_orthographe : +87 questions (63 → 150)
-- PFEQ-FRA-SEC1-ORTH

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-ORTH') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (29 questions)
('Homophone : «a» vs «à»', 1, 20000, '«A» = verbe avoir (il a). «À» = préposition (il va à l''école).',
 '{"type":"mcq","question":"Complète : «Elle ___ mal à la tête.»","options":["à","a","â","ah"],"answer":"a"}'),

('Homophone : «à» préposition', 1, 20000, '«À» = préposition. On peut le remplacer par «vers» ou «au».',
 '{"type":"mcq","question":"Complète : «Je vais ___ l''école chaque matin.»","options":["a","à","â","as"],"answer":"à"}'),

('Homophone : «est» vs «et»', 1, 20000, '«Est» = verbe être. «Et» = conjonction (on peut ajouter «aussi»).',
 '{"type":"mcq","question":"Complète : «Il ___ grand ___ fort.»","options":["est / est","et / est","est / et","et / et"],"answer":"est / et"}'),

('Homophone : «ou» vs «où»', 1, 20000, '«Ou» = choix (on peut dire «ou bien»). «Où» = lieu/moment (où est-il ?).',
 '{"type":"mcq","question":"Complète : «Je ne sais pas ___ il est allé ___ s''il viendra.»","options":["où / ou","ou / où","où / où","ou / ou"],"answer":"où / ou"}'),

('Homophone : «ce» vs «se»', 1, 20000, '«Ce» = déterminant ou pronom démonstratif. «Se» = pronom réfléchi.',
 '{"type":"mcq","question":"Complète : «___ livre ___ trouve sur la table.»","options":["se / ce","ce / ce","ce / se","se / se"],"answer":"ce / se"}'),

('Homophone : «son» vs «sont»', 1, 20000, '«Son» = déterminant possessif. «Sont» = verbe être (ils sont).',
 '{"type":"mcq","question":"Complète : «Ses chaussures ___ dans ___ sac.»","options":["sont / son","son / sont","sont / sont","son / son"],"answer":"sont / son"}'),

('Homophone : «on» vs «ont»', 1, 20000, '«On» = pronom (on mange). «Ont» = auxiliaire avoir, 3e pers. pl. (ils ont).',
 '{"type":"mcq","question":"Complète : «___ dirait qu''ils ___ faim.»","options":["Ont / on","On / ont","On / on","Ont / ont"],"answer":"On / ont"}'),

('Homophone : «mes» vs «mais»', 1, 20000, '«Mes» = déterminant possessif pluriel. «Mais» = conjonction d''opposition.',
 '{"type":"mcq","question":"Complète : «J''ai perdu ___ clés, ___ je les ai retrouvées.»","options":["mais / mes","mes / mais","mes / mes","mais / mais"],"answer":"mes / mais"}'),

('Homophone : «peu» vs «peut»', 1, 20000, '«Peu» = adverbe de quantité. «Peut» = verbe pouvoir (il peut).',
 '{"type":"mcq","question":"Complète : «Il ___ rester encore un ___.»","options":["peut / peu","peu / peut","peut / peut","peu / peu"],"answer":"peut / peu"}'),

('Homophone : «sans» vs «s''en»', 1, 20000, '«Sans» = préposition (absence). «S''en» = pronom réfléchi + en.',
 '{"type":"mcq","question":"Complète : «Elle ___ va ___ le moindre regret.»","options":["s''en / sans","sans / s''en","s''en / s''en","sans / sans"],"answer":"s''en / sans"}'),

('Homophone : «dans» vs «d''en»', 1, 20000, '«Dans» = préposition de lieu. «D''en» = préposition «de» + pronom «en» (peu fréquent).',
 '{"type":"mcq","question":"Complète : «Il marche ___ la rue.»","options":["dans","d''en","dent","dan"],"answer":"dans"}'),

('Accord du nom en genre : règle de base', 1, 18000, 'En général, on ajoute «-e» pour former le féminin. Étudiant → étudiante.',
 '{"type":"mcq","question":"Quel est le féminin de «étudiant» ?","options":["étudiante","étudiant","étudiant-e","étudients"],"answer":"étudiante"}'),

('Accord du nom en nombre : règle de base', 1, 18000, 'En général, on ajoute «-s» pour former le pluriel. Maison → maisons.',
 '{"type":"mcq","question":"Quel est le pluriel de «voiture» ?","options":["voiturs","voitures","voiturex","voiturez"],"answer":"voitures"}'),

('Pluriel des noms en -al', 1, 20000, 'Les noms en «-al» font «-aux» au pluriel. Animal → animaux.',
 '{"type":"mcq","question":"Quel est le pluriel de «animal» ?","options":["animals","animaux","animaaux","animales"],"answer":"animaux"}'),

('Pluriel des noms en -eau', 1, 20000, 'Les noms en «-eau» font «-eaux» au pluriel. Bateau → bateaux.',
 '{"type":"mcq","question":"Quel est le pluriel de «gâteau» ?","options":["gâteaux","gâteaus","gâteaues","gâteausx"],"answer":"gâteaux"}'),

('Accord de l''adjectif (féminin)', 1, 20000, 'L''adjectif s''accorde avec le nom qu''il qualifie. «Robe» (fém.) → «bleue».',
 '{"type":"mcq","question":"Quelle forme est correcte : «une jupe ___» ?","options":["brun","bruns","brune","brunes"],"answer":"brune"}'),

('Accord de l''adjectif (masculin pluriel)', 1, 20000, 'Masculin pluriel → adjectif avec -s (ou -aux).',
 '{"type":"mcq","question":"Quelle forme est correcte : «des manteaux ___» ?","options":["chaud","chaude","chauds","chaudes"],"answer":"chauds"}'),

('Majuscule en début de phrase', 1, 18000, 'Tout début de phrase prend une majuscule.',
 '{"type":"mcq","question":"Quelle phrase a une majuscule au bon endroit ?","options":["le soleil brille.","Le soleil brille.","le Soleil brille.","LE soleil brille."],"answer":"Le soleil brille."}'),

('Majuscule pour un nom propre', 1, 18000, 'Les noms propres (personnes, villes, pays...) prennent une majuscule.',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["la ville de montréal","la ville de Montréal","La ville de montréal","La Ville de Montréal"],"answer":"la ville de Montréal"}'),

('Double consonne : «nn»', 1, 20000, 'Certains mots ont une double consonne. «Connexion», «innocent», «ennemi».',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["inocent","inoncer","innocent","innocant"],"answer":"innocent"}'),

('Accent grave : «è»', 1, 18000, 'L''accent grave se met sur «è» (ouvert), «à», «ù».',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["eleve","élève","elevé","eleve"],"answer":"élève"}'),

('Accent aigu : «é»', 1, 18000, 'L''accent aigu se met sur «é» (fermé).',
 '{"type":"mcq","question":"Quelle orthographe est correcte pour le participe passé de «finir» ?","options":["fini","finit","finié","finì"],"answer":"fini"}'),

('Cédille : «ç»', 1, 18000, 'La cédille se met sous le «c» devant «a», «o», «u» pour faire le son [s].',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["ca","ça","cà","ça"],"answer":"ça"}'),

('Tréma : «ë»', 1, 18000, 'Le tréma indique que deux voyelles se prononcent séparément. Noël, Haïti.',
 '{"type":"mcq","question":"Quelle orthographe est correcte pour la fête de décembre ?","options":["Noel","Noël","Noêl","Noèl"],"answer":"Noël"}'),

('Tiret dans les mots composés', 1, 18000, 'Certains mots composés prennent un tiret. Arc-en-ciel, porte-monnaie.',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["arc en ciel","arcenciel","arc-en-ciel","arc_en_ciel"],"answer":"arc-en-ciel"}'),

('Accent circonflexe : «â»', 1, 18000, 'L''accent circonflexe sur «â» est souvent une marque historique d''un «s» disparu. Fête = «feste».',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["fete","fête","fèté","feté"],"answer":"fête"}'),

('Lettres muettes : «-ent» des verbes', 1, 18000, 'La terminaison «-ent» des verbes (3e pers. pl.) est muette. «Ils chantent» → son [∅nt].',
 '{"type":"mcq","question":"Dans «Elles dansent», quelle lettre est muette ?","options":["E","A","S","T"],"answer":"T"}'),

('Homophone : «ces» vs «ses» vs «c''est» vs «s''est»', 1, 22000, '«Ces» = déterminant démonstratif pl. «Ses» = déterminant possessif pl.',
 '{"type":"mcq","question":"Complète : «___ livres appartiennent à Marie.»","options":["c''est","s''est","ses","ces"],"answer":"ces"}'),

('Déterminant possessif : «ses» vs «ces»', 1, 20000, '«Ses» = déterminant possessif. «Ces» = déterminant démonstratif.',
 '{"type":"mcq","question":"Complète : «Marie range ___ affaires.»","options":["ces","ses","c''est","s''est"],"answer":"ses"}'),

-- DIFFICULTÉ 2 (29 questions)
('Accord du participe passé employé avec avoir', 2, 32000, 'Avec «avoir», le p.p. s''accorde avec le COD si celui-ci est avant le verbe.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Les fleurs que j''ai cueillis sont belles.","Les fleurs que j''ai cueillies sont belles.","Les fleurs que j''ai cueilli sont belles.","Les fleurs que j''ai cueillies était belles."],"answer":"Les fleurs que j''ai cueillies sont belles."}'),

('Accord du participe passé avec être', 2, 32000, 'Avec «être», le p.p. s''accorde avec le sujet.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Les garçons sont partis.","Les garçons sont parties.","Les garçons sont partis.","Les garçons sont partir."],"answer":"Les garçons sont partis."}'),

('Participe passé invariable avec avoir (COD après)', 2, 32000, 'Avec avoir, si le COD est après le p.p., il reste invariable.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elle a mangée une pomme.","Elle a mangé une pomme.","Elle a mangés des pommes.","Elle a mangées des pommes."],"answer":"Elle a mangé une pomme."}'),

('Homophone : «quand» vs «quant» vs «qu''en»', 2, 30000, '«Quand» = conjonction de temps. «Quant» = pour ce qui est de (quant à lui). «Qu''en» = «que» + «en».',
 '{"type":"mcq","question":"Complète : «___ à moi, je préfère le chocolat.»","options":["Quand","Quant","Qu''en","Cant"],"answer":"Quant"}'),

('Homophone : «davantage» vs «d''avantage»', 2, 30000, '«Davantage» = plus. «D''avantage» n''existe pas comme locution standard.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Il faut d''avantage étudier.","Il faut davantage étudier.","Les deux sont correctes.","Aucune n''est correcte."],"answer":"Il faut davantage étudier."}'),

('Homophone : «par» vs «part»', 2, 30000, '«Par» = préposition. «Part» = une portion, ou dans «à part», «de ma part».',
 '{"type":"mcq","question":"Complète : «De ma ___, merci pour ce cadeau.»","options":["par","part","pars","parts"],"answer":"part"}'),

('Accord adjectif de couleur : règle générale', 2, 30000, 'Les adjectifs de couleur s''accordent en genre et nombre sauf s''ils sont composés ou issus de noms.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Des robes bleus","Des robes bleus","Des robes bleues","Des robes bleu"],"answer":"Des robes bleues"}'),

('Adjectifs de couleur invariables (noms)', 2, 30000, 'Les adjectifs de couleur provenant de noms sont invariables : marron, crème, ivoire, saumon.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Des vestes marrons","Des vestes marrons","Des vestes marron","Des vestes maronnes"],"answer":"Des vestes marron"}'),

('Adjectifs de couleur composés (invariables)', 2, 30000, 'Un adjectif de couleur composé est invariable : des robes bleu ciel, des chaussures gris foncé.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Des chemises bleu claires","Des chemises bleus clairs","Des chemises bleu clair","Des chemises bleues claires"],"answer":"Des chemises bleu clair"}'),

('Accord des noms en -ou', 2, 30000, 'Sept noms en -ou font leur pluriel en -oux : bijou, caillou, chou, genou, hibou, joujou, pou.',
 '{"type":"mcq","question":"Quel est le pluriel correct de «genou» ?","options":["genous","genoux","genoues","genouys"],"answer":"genoux"}'),

('Accord de «tout» adverbe (invariable)', 2, 32000, '«Tout» adverbe est normalement invariable, mais fait «toute, toutes» devant un adjectif féminin commençant par une consonne.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elles sont toute fatiguées.","Elles sont tout fatiguées.","Elles sont tous fatiguées.","Elles sont toutes fatiguées."],"answer":"Elles sont toutes fatiguées."}'),

('Accord de «quel» dans l''exclamation', 2, 30000, '«Quel» s''accorde avec le nom qui suit. Quel homme ! Quelle femme !',
 '{"type":"mcq","question":"Quelle forme est correcte ? «___ belle journée !»","options":["Quel","Quelle","Quels","Quelles"],"answer":"Quelle"}'),

('Majuscule dans les titres', 2, 30000, 'Les règles varient selon le type de titre. En général, premier mot et noms propres prennent la majuscule.',
 '{"type":"mcq","question":"Quelle orthographe est correcte pour le titre d''un roman ?","options":["le Seigneur Des Anneaux","Le Seigneur des Anneaux","le seigneur des anneaux","LE SEIGNEUR DES ANNEAUX"],"answer":"Le Seigneur des Anneaux"}'),

('Usage du trait d''union dans les nombres', 2, 30000, 'On met un trait d''union entre les composantes des nombres de 17 à 99 quand elles sont juxtaposées.',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["vingt et un","vingt-et-un","vingt-et un","vingtetun"],"answer":"vingt et un"}'),

('Trait d''union : 82 et 92', 2, 30000, 'Quatre-vingt-deux, quatre-vingt-douze. Le trait d''union lie les composantes.',
 '{"type":"mcq","question":"Quelle orthographe est correcte pour 82 ?","options":["quatre vingt deux","quatre-vingt deux","quatre-vingt-deux","quatre vingts deux"],"answer":"quatre-vingt-deux"}'),

('Accords dans un groupe nominal complexe', 2, 32000, 'Tous les éléments du GN (déterminant, nom, adjectif) s''accordent ensemble.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Ces grandes maisons blancs","Ces grandes maisons blanches","Ces grand maisons blanches","Ces grandes maison blanches"],"answer":"Ces grandes maisons blanches"}'),

('Accord après «avoir l''air» (sujet animé)', 2, 32000, 'Si le sujet est animé (être vivant), «avoir l''air» = «sembler» → accord avec le sujet.',
 '{"type":"mcq","question":"Quelle phrase est correcte pour un sujet animé ?","options":["Elles ont l''air contents.","Elles ont l''air contentes.","Elles ont l''air content.","Elles ont l''air contentes."],"answer":"Elles ont l''air contentes."}'),

('Homophones : «vingt» et «vin»', 2, 28000, '«Vingt» = nombre 20. «Vin» = boisson alcoolisée. «Vint» = passé simple de «venir».',
 '{"type":"mcq","question":"Complète : «Il y avait ___ élèves dans la classe.»","options":["vin","vins","vingt","vient"],"answer":"vingt"}'),

('«Rien» + négation : «ne... rien»', 2, 30000, 'La négation «ne... rien» nécessite le «ne» devant le verbe et «rien» après.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Il ne sait pas rien.","Il ne sait rien.","Il sait ne rien.","Il ne rien sait."],"answer":"Il ne sait rien."}'),

('Accord du participe passé des verbes d''état', 2, 32000, 'P.p. de «paraître», «sembler», «devenir» avec être : accord avec le sujet.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elles sont devenues médecines.","Elles sont devenues médecins.","Elles sont devenu médecins.","Elles sont devenus médecins."],"answer":"Elles sont devenues médecins."}'),

('Élision : l''apostrophe', 2, 28000, 'On élide (apostrophe) les voyelles finales devant une voyelle ou h muet.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["le élève","l''élève","l-élève","le élève (bis)"],"answer":"l''élève"}'),

('Élision de «que»', 2, 28000, '«Que» devient «qu''» devant une voyelle ou h muet.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Je crois que il viendra.","Je crois qu''il viendra.","Je crois quil viendra.","Je crois qu il viendra."],"answer":"Je crois qu''il viendra."}'),

('Accord après «c''est» (attribut)', 2, 30000, '«C''est» est suivi d''un attribut. «Ce sont» avec un nom pluriel.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["C''est mes amis.","Ce sont mes amis.","Ce suis mes amis.","C''est mes ami."],"answer":"Ce sont mes amis."}'),

('Orthographe des adverbes en «-ment»', 2, 30000, 'La plupart des adverbes en «-ment» se forment sur le féminin de l''adjectif.',
 '{"type":"mcq","question":"Quel adverbe se forme à partir de l''adjectif «naturel» ?","options":["naturèlement","naturelment","naturellement","naturellament"],"answer":"naturellement"}'),

('Pas de -s à l''impératif 2e pers. sg. (1er groupe)', 2, 30000, 'À la 2e personne du singulier de l''impératif des verbes en -er, pas de -s. «Mange ! Parle !»',
 '{"type":"mcq","question":"Quelle forme est correcte à l''impératif (2e pers. sing.) ?","options":["Manges !","Mange !","Mangez !","Mangeons !"],"answer":"Mange !"}'),

('Exception : -s à l''impératif devant y et en', 2, 32000, 'On ajoute -s devant «y» ou «en». «Vas-y !», «Parles-en !»',
 '{"type":"mcq","question":"Quelle forme est correcte ?","options":["Va-y !","Va y !","Vas-y !","Vay !"],"answer":"Vas-y !"}'),

('Accord des adjectifs numéraux ordinaux', 2, 30000, '«Vingt» et «cent» prennent -s seulement s''ils terminent le nombre. «Quatre-vingts» mais «quatre-vingt-deux».',
 '{"type":"mcq","question":"Quelle orthographe est correcte pour 80 ?","options":["quatre-vingts","quatre-vingt","quatrevingts","quatre vingts"],"answer":"quatre-vingts"}'),

('«Cent» et son accord', 2, 30000, '«Cent» prend -s s''il est seul et non suivi d''un autre nombre. «Deux cents» mais «deux cent deux».',
 '{"type":"mcq","question":"Quelle orthographe est correcte pour 200 ?","options":["deux cent","deux cents","deux-cent","deux-cents"],"answer":"deux cents"}'),

('Homophone : «leur» vs «leurs»', 2, 30000, '«Leur» = pronom (leur dire) ou adj. possessif singulier (leur maison). «Leurs» = adj. possessif pluriel.',
 '{"type":"mcq","question":"Complète : «Elles ont mis ___ livres dans ___ sac.»","options":["leurs / leur","leur / leur","leurs / leurs","leur / leurs"],"answer":"leurs / leur"}'),

-- DIFFICULTÉ 3 (29 questions)
('Accord du participe passé des verbes pronominaux (sens passif)', 3, 45000, 'Sens passif : «Ces livres se sont vendus rapidement.» Le p.p. s''accorde avec le sujet.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Ces maisons se sont vendu rapidement.","Ces maisons se sont vendues rapidement.","Ces maisons se sont vendus rapidement.","Ces maisons se sont vendues rapidement."],"answer":"Ces maisons se sont vendues rapidement."}'),

('Accord du participe passé : COD pronom antéposé', 3, 45000, 'COD pronom devant avoir (la, le, les, me, te, se, nous, vous, qu'') → accord.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Je les ai vu hier.","Je les ai vus hier.","Je les ai vue hier.","Je les ai vues hier."],"answer":"Je les ai vus hier. (masculin pluriel)"}'),

('«En» ne déclenche pas l''accord', 3, 45000, 'Le pronom «en» ne déclenche pas l''accord du p.p. «Des pommes, j''en ai mangé.»',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Des pommes, j''en ai mangées.","Des pommes, j''en ai mangé.","Des pommes, j''en ai mangés.","Des pommes, je les ai mangé."],"answer":"Des pommes, j''en ai mangé."}'),

('Accord du p.p. avec un COD collectif', 3, 45000, 'Le p.p. s''accorde avec le COD. «La foule que j''ai vue» (COD = «que» = foule, féminin singulier).',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["La foule que j''ai vue était immense.","La foule que j''ai vu était immense.","La foule que j''ai vus était immense.","La foule que j''ai vues était immense."],"answer":"La foule que j''ai vue était immense."}'),

('Accord complexe : «se faire + infinitif»', 3, 45000, 'P.p. de «se faire» suivi d''un infinitif : toujours invariable.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elle s''est faite couper les cheveux.","Elle s''est fait couper les cheveux.","Elle se fait coupé les cheveux.","Elle s''est faites couper les cheveux."],"answer":"Elle s''est fait couper les cheveux."}'),

('Accord du p.p. : «laisser + infinitif»', 3, 45000, 'P.p. de «laisser» suivi d''un infinitif : accord facultatif selon si le COD fait l''action ou la subit.',
 '{"type":"mcq","question":"Quelle phrase illustre la règle d''accord avec «laisser + infinitif» ?","options":["Je les ai laissés partir (ils partent = accord optionnel)","Je les ai laissé partir (forme toujours correcte)","Les deux formes sont acceptées","Aucune des deux"],"answer":"Les deux formes sont acceptées"}'),

('Orthographe rectifiée de 1990', 3, 45000, 'La réforme de 1990 permet de simplifier certains mots. Ex : «nénuphar» peut s''écrire «nénufar».',
 '{"type":"mcq","question":"Selon l''orthographe rectifiée de 1990, quelle forme est désormais acceptable pour «événement» ?","options":["évenement","évenèment","évènement","événement"],"answer":"évènement"}'),

('Noms en «-té» (sans -e final)', 3, 42000, 'Les noms féminins abstraits en «-té» ne prennent pas de «e» final. Beauté, bonté, liberté.',
 '{"type":"mcq","question":"Quelle orthographe est correcte pour «l''amitié» ?","options":["amitié","amitiée","amitée","amitier"],"answer":"amitié"}'),

('Noms en «-tié» vs «-tée»', 3, 42000, 'Des noms concrets en «-ée» : dictée, montée, pâtée. Des abstraits en «-té» : amitié, moitié.',
 '{"type":"mcq","question":"Laquelle de ces formes est correcte pour le nom abstrait de «demi» ?","options":["moitiée","moitiéé","moitié","moitie"],"answer":"moitié"}'),

('Accord de «quelque» vs «quel que»', 3, 45000, '«Quelque» = déterminant indéfini (quelques livres). «Quel que» = quel + que devant être.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Quelque soient les obstacles, il réussira.","Quels que soient les obstacles, il réussira.","Quel que soit les obstacles, il réussira.","Quelles que soient les obstacles, il réussira."],"answer":"Quels que soient les obstacles, il réussira."}'),

('Accord de «tel quel»', 3, 45000, '«Tel quel» s''accorde avec le nom. «Telle quelle», «tels quels», «telles quelles».',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elle a rendu la voiture tel quel.","Elle a rendu la voiture telle quelle.","Elle a rendu la voiture tels quels.","Elle a rendu la voiture telle quel."],"answer":"Elle a rendu la voiture telle quelle."}'),

('Accord de «même»', 3, 45000, '«Même» = adjectif (s''accorde) ou adverbe (invariable). «Les élèves mêmes» vs «Elles sont même venues».',
 '{"type":"mcq","question":"«Même» dans «elles sont même venues» est...","options":["Un adjectif qui s''accorde","Un adverbe invariable","Un pronom","Un déterminant"],"answer":"Un adverbe invariable"}'),

('Accord de «nu» dans «nu-pieds»', 3, 45000, '«Nu» placé avant un nom reste invariable et ne prend pas de trait d''union. «Nu-pieds» mais «les pieds nus».',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["marcher nu-pieds","marcher les pieds nu","marcher les pieds nus","Les deux dernières sont correctes"],"answer":"Les deux dernières sont correctes"}'),

('Accord de «demi»', 3, 45000, '«Demi» avant le nom est invariable avec trait d''union. Après, il s''accorde avec le nom.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["une demi-heure","une demie-heure","une heure et demi","une heure et demi"],"answer":"une demi-heure"}'),

('Accord de «ci-joint»', 3, 45000, '«Ci-joint» est invariable en tête de phrase ou avant le nom. Variable après le nom.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Ci-joints les documents","Ci-joint les documents","Vous trouverez les documents ci-jointes","Vous trouverez les documents ci-joints"],"answer":"Vous trouverez les documents ci-joints"}'),

('Orthographe de «cueillerons» (verbe cueillir)', 3, 42000, '«Cueillir» au futur : je cueillerai, tu cueilleras, il cueillera, nous cueillerons.',
 '{"type":"mcq","question":"Quelle forme est correcte au futur de «cueillir» à la 1re personne du pluriel ?","options":["cueillerons","cueillirons","cueillerons","cueillrons"],"answer":"cueillerons"}'),

('Verbe «appeler» au présent', 3, 42000, '«Appeler» double le «l» devant une terminaison muette. J''appelle, tu appelles, il appelle...',
 '{"type":"mcq","question":"Quelle forme est correcte à la 3e personne du singulier de «appeler» au présent ?","options":["apelle","appele","appelle","appellé"],"answer":"appelle"}'),

('Verbe «jeter» au présent', 3, 42000, '«Jeter» double le «t» devant une terminaison muette. Je jette, tu jettes, il jette...',
 '{"type":"mcq","question":"Quelle forme est correcte à la 1re personne du singulier de «jeter» au présent ?","options":["jète","jètte","jette","jet"],"answer":"jette"}'),

('Verbe «acheter» au présent (exception)', 3, 42000, '«Acheter» prend un accent grave plutôt que de doubler le «t». J''achète, tu achètes, il achète.',
 '{"type":"mcq","question":"Quelle forme est correcte à la 2e personne du singulier de «acheter» au présent ?","options":["achettes","achette","achètes","achete"],"answer":"achètes"}'),

('Accord du p.p. : «Ils se sont vu»', 3, 45000, 'Verbe pronominal réciproque + infinitif sous-entendu : accord si le p.p. a un COD. «Ils se sont vus.» (ils ont vu eux-mêmes).',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elles se sont vu dans le miroir.","Elles se sont vues dans le miroir.","Elles se sont vus dans le miroir.","Elles se sont vues dans le miroir."],"answer":"Elles se sont vues dans le miroir."}'),

('Accord des participes passés : «se rendre compte»', 3, 45000, '«Se rendre compte» est locution figée. P.p. s''accorde avec «compte» (COD = «compte»). Invariable car «compte» est après.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Elles se sont rendues compte de l''erreur.","Elles se sont rendu compte de l''erreur.","Elles s''est rendu compte de l''erreur.","Elles se sont rendus compte de l''erreur."],"answer":"Elles se sont rendu compte de l''erreur."}'),

('Homophone savant : «près» vs «prêt»', 3, 42000, '«Près» = préposition de lieu (proche). «Prêt» = adjectif (préparé).',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Il est prêt du départ.","Il est près du départ.","Il est prêt à partir.","Il est près à partir."],"answer":"Il est prêt à partir."}'),

('Orthographe : «en train de» (locution)', 3, 42000, '«En train de» = locution exprimant une action en cours. S''écrit en trois mots séparés.',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["Il est entrain de travailler.","Il est en train de travailler.","Il est en-train de travailler.","Il est en train-de travailler."],"answer":"Il est en train de travailler."}'),

('Orthographe rectifiée : tiret et mots composés', 3, 45000, 'Depuis 1990, certains mots composés perdent leur trait d''union. «Weekend» peut s''écrire sans tiret.',
 '{"type":"mcq","question":"Selon la réforme de 1990, quelle simplification a été autorisée pour certains mots composés ?","options":["Supprimer la majuscule dans les noms propres","Supprimer les accents","Supprimer certains traits d''union ou en ajouter","Changer les pluriels irréguliers"],"answer":"Supprimer certains traits d''union ou en ajouter"}'),

('Accord de «nu» et «mi» en composition', 3, 42000, '«Nu-» et «mi-» restent invariables en composition. Nu-tête, mi-temps.',
 '{"type":"mcq","question":"Quelle orthographe est correcte ?","options":["à nu-tête","à nue-tête","à nu têtes","nu-têtes"],"answer":"à nu-tête"}'),

('Accord de «feu» (adjectif de deuil)', 3, 45000, 'L''adjectif «feu» (décédé) est variable. «Feus mes amis» mais «feu la reine» (avant le déterminant = invariable).',
 '{"type":"mcq","question":"Quelle phrase est correcte (feu = décédé) ?","options":["La feue reine","Feu la reine","Feux les rois","La feue reine est correcte"],"answer":"Feu la reine"}'),

('Accord de «nu-tête», «tête nue»', 3, 42000, '«Nu» avant le nom : invariable, trait d''union. Après le nom : variable, sans trait d''union.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["marcher tête nue","marcher tête nues","marcher nu-tête","Les première et troisième sont correctes"],"answer":"Les première et troisième sont correctes"}'),

('Accord du verbe avec un sujet collectif + complément pluriel', 3, 45000, 'Nom collectif + complément pluriel : accord selon le sens. «Un groupe d''élèves travaille/travaillent.»',
 '{"type":"mcq","question":"Quelle phrase respecte les règles d''accord avec un nom collectif ?","options":["Un groupe d''élèves travaillons.","Un groupe d''élèves travaillent. (sens pluriel accepté)","Un groupe d''élèves travaille. (singulier accepté)","Les formes 2 et 3 sont toutes deux acceptées."],"answer":"Les formes 2 et 3 sont toutes deux acceptées."}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
