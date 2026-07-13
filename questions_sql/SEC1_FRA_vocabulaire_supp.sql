-- Supplément SEC1_FRA_vocabulaire : +79 questions (71 → 150)
-- PFEQ-FRA-SEC1-VOC

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-VOC') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (26 questions)
('Synonyme de «heureux»', 1, 18000, 'Un synonyme est un mot ayant le même sens ou un sens proche. Heureux = joyeux, comblé, radieux.',
 '{"type":"mcq","question":"Quel mot est un synonyme de «heureux» ?","options":["triste","grand","joyeux","lent"],"answer":"joyeux"}'),

('Synonyme de «rapide»', 1, 18000, 'Rapide = vite, prompt, véloce, agile.',
 '{"type":"mcq","question":"Quel mot est un synonyme de «rapide» ?","options":["lent","fort","vite","beau"],"answer":"vite"}'),

('Antonyme de «grand»', 1, 18000, 'Un antonyme est un mot de sens contraire. Grand ↔ petit.',
 '{"type":"mcq","question":"Quel mot est l''antonyme de «grand» ?","options":["fort","vieux","petit","long"],"answer":"petit"}'),

('Antonyme de «sombre»', 1, 18000, 'Sombre ↔ lumineux, clair, éclairé.',
 '{"type":"mcq","question":"Quel mot est l''antonyme de «sombre» ?","options":["foncé","obscur","lumineux","gris"],"answer":"lumineux"}'),

('Sens d''un mot de base', 1, 18000, '«Bienfaisant» = qui fait du bien.',
 '{"type":"mcq","question":"Que signifie le mot «bienfaisant» ?","options":["Qui fait du mal","Qui fait beaucoup","Qui fait du bien","Qui fait deux choses"],"answer":"Qui fait du bien"}'),

('Famille de mots : «chaleur»', 1, 20000, 'La famille de «chaleur» inclut chaud, chauffer, chaleureux, réchauffer.',
 '{"type":"mcq","question":"Quel mot appartient à la famille du mot «chaleur» ?","options":["calme","châtiment","chaleureux","chalet"],"answer":"chaleureux"}'),

('Préfixe «in-/im-» (négation)', 1, 18000, 'Le préfixe in-/im- signifie «ne pas». Inégal = pas égal. Impossible = pas possible.',
 '{"type":"mcq","question":"Que signifie le préfixe «im-» dans «impossible» ?","options":["très","à nouveau","ne pas","au-delà"],"answer":"ne pas"}'),

('Préfixe «re-» (répétition)', 1, 18000, 'Le préfixe «re-» indique une répétition ou un retour. Relire = lire de nouveau.',
 '{"type":"mcq","question":"Que signifie «relire» ?","options":["Lire vite","Lire de nouveau","Lire lentement","Lire à l''envers"],"answer":"Lire de nouveau"}'),

('Suffixe «-eur» (métier)', 1, 18000, 'Le suffixe «-eur» peut indiquer un métier. Vendeur = qui vend.',
 '{"type":"mcq","question":"Que fait un «coiffeur» ?","options":["Il coiffe","Il cuisine","Il soigne","Il enseigne"],"answer":"Il coiffe"}'),

('Suffixe «-tion» (nominalisation)', 1, 18000, 'Le suffixe «-tion» transforme un verbe en nom. Action = le fait d''agir.',
 '{"type":"mcq","question":"Quel mot correspond à «l''action de créer» ?","options":["créatif","crée","création","créé"],"answer":"création"}'),

('Mot générique vs spécifique', 1, 20000, '«Fruit» est le générique. «Pomme», «poire», «banane» sont des spécifiques.',
 '{"type":"mcq","question":"Quel mot est le terme générique pour «chien, chat, lapin» ?","options":["animal domestique","mammifère","animal","bête"],"answer":"animal"}'),

('Polysémie : plusieurs sens', 1, 20000, 'Un mot polysémique a plusieurs sens. «Feuille» = feuille d''arbre OU feuille de papier.',
 '{"type":"mcq","question":"Le mot «vol» peut désigner...","options":["Seulement le vol d''avion","Seulement le vol (crime)","Un avion et un crime","Uniquement un oiseau en vol"],"answer":"Un avion et un crime"}'),

('Contexte pour définir le sens', 1, 20000, 'Le contexte aide à déterminer le sens d''un mot polysémique.',
 '{"type":"mcq","question":"Dans «Il a pris la fuite», que signifie «fuite» ?","options":["Une fuite d''eau","Le fait de s''enfuir","Un document","Un type de course"],"answer":"Le fait de s''enfuir"}'),

('Registre familier vs soutenu', 1, 20000, '«Bouquin» est familier. «Livre» est courant. «Ouvrage» est soutenu.',
 '{"type":"mcq","question":"Lequel de ces mots est un registre familier pour «ami» ?","options":["compagnon","camarade","copain","allié"],"answer":"copain"}'),

('Trouver le terme équivalent au registre courant', 1, 20000, 'Le terme courant est le plus utilisé dans la vie de tous les jours.',
 '{"type":"mcq","question":"Quel est le terme courant (neutre) pour «demeure» ?","options":["cabane","maison","palais","gîte"],"answer":"maison"}'),

('Sens propre vs figuré', 1, 20000, 'Sens propre : sens littéral. Sens figuré : sens imagé, métaphorique.',
 '{"type":"mcq","question":"Dans «Il a le cœur de pierre», «cœur de pierre» est utilisé au sens...","options":["Propre","Figuré","Technique","Littéral"],"answer":"Figuré"}'),

('Sens propre : exemple concret', 1, 18000, 'Le sens propre est le sens premier, littéral, concret.',
 '{"type":"mcq","question":"Dans «Le renard mange ses proies», «renard» est utilisé au sens...","options":["Figuré","Propre","Métaphorique","Symbolique"],"answer":"Propre"}'),

('Homonyme : «vert» et «ver»', 1, 20000, 'Les homonymes se prononcent pareil mais ont des sens différents. Vert (couleur), ver (animal).',
 '{"type":"mcq","question":"«Vert» et «ver» sont des homonymes. Que signifie «ver» ?","options":["Couleur du feuillage","Petit animal sans pattes","Direction","Vers un endroit"],"answer":"Petit animal sans pattes"}'),

('Paronyme : «collusion» vs «collision»', 1, 20000, 'Paronymes : mots dont l''orthographe et la prononciation sont proches mais le sens différent.',
 '{"type":"mcq","question":"«Collision» signifie...","options":["Une entente secrète illégale","Un accident où deux choses se heurtent","Une erreur de calcul","Un accord commercial"],"answer":"Un accident où deux choses se heurtent"}'),

('Néologisme technologique', 1, 20000, 'Un néologisme est un mot nouveau. «Clavardage» = chat en ligne.',
 '{"type":"mcq","question":"Que signifie le néologisme québécois «clavardage» ?","options":["Clavier d''ordinateur","Discussion en ligne par clavier","Logiciel de traitement de texte","Page web"],"answer":"Discussion en ligne par clavier"}'),

('Dériver un mot avec un suffixe', 1, 20000, 'Ajouter «-ment» à un adjectif féminin → adverbe. Douce → doucement.',
 '{"type":"mcq","question":"Quel adverbe se forme à partir de «lent» ?","options":["lenteur","lentement","lenture","lentif"],"answer":"lentement"}'),

('Série de synonymes', 1, 20000, 'Plusieurs mots peuvent avoir le même sens. Pour «parler» : dire, déclarer, affirmer, s''exprimer.',
 '{"type":"mcq","question":"Lequel de ces mots est synonyme de «parler» ?","options":["taire","entendre","écouter","s''exprimer"],"answer":"s''exprimer"}'),

('Antonyme d''adverbe', 1, 18000, 'L''antonyme de «lentement» est «rapidement» ou «vite».',
 '{"type":"mcq","question":"Quel est l''antonyme de «bruyamment» ?","options":["fort","doucement","silencieusement","rapidement"],"answer":"silencieusement"}'),

('Dérivation : préfixe «dé-»', 1, 18000, 'Le préfixe «dé-» peut indiquer la suppression ou l''inverse. Défaire = l''inverse de faire.',
 '{"type":"mcq","question":"Que signifie le mot «désorganiser» ?","options":["Organiser mieux","Mettre en désordre","Réorganiser","Trouver une organisation"],"answer":"Mettre en désordre"}'),

('Registre soutenu : verbe', 1, 20000, '«Demeurer» est plus soutenu que «rester».',
 '{"type":"mcq","question":"Quel verbe est de registre plus soutenu ?","options":["manger","dévorer","se nourrir","ingurgiter"],"answer":"ingurgiter"}'),

('Étymologie latine : «port-»', 1, 20000, 'La racine latine «port-» signifie «porter». Porteur, portable, reporter.',
 '{"type":"mcq","question":"La racine «port-» dans «portable» vient du latin «portare» qui signifie...","options":["Porte","Petit","Porter","Passage"],"answer":"Porter"}'),

-- DIFFICULTÉ 2 (27 questions)
('Champ lexical de la mer', 2, 28000, 'Le champ lexical regroupe des mots d''un même thème. Mer : vague, marée, plage, corail, marin...',
 '{"type":"mcq","question":"Lequel de ces mots appartient au champ lexical de la mer ?","options":["feuillage","cailloux","marée","nuage"],"answer":"marée"}'),

('Champ lexical de la médecine', 2, 28000, 'Médecine : symptôme, diagnostic, traitement, patient, chirurgie, médicament...',
 '{"type":"mcq","question":"Lequel de ces mots n''appartient PAS au champ lexical de la médecine ?","options":["symptôme","diagnostic","menuisier","chirurgie"],"answer":"menuisier"}'),

('Distinguer sens propre et figuré', 2, 30000, '«Brûler de curiosité» = sens figuré (grande curiosité). «Brûler sa main» = sens propre.',
 '{"type":"mcq","question":"Dans «Ce roman m''a dévoré», le verbe «dévorer» est utilisé au sens...","options":["Propre, comme un animal qui mange","Figuré, exprimant une lecture passionnée","Propre, car on peut manger des pages","Neutre, sans sens particulier"],"answer":"Figuré, exprimant une lecture passionnée"}'),

('Métaphore vs comparaison', 2, 30000, 'Comparaison : «comme», «tel». Métaphore : comparaison sans mot de comparaison.',
 '{"type":"mcq","question":"«Sa voix est douce comme du miel» est une...","options":["Métaphore","Comparaison","Personnification","Hyperbole"],"answer":"Comparaison"}'),

('Identifier une métaphore', 2, 30000, '«Sa voix est du miel» = métaphore (sans «comme»).',
 '{"type":"mcq","question":"«La vie est un voyage» est une...","options":["Comparaison","Métaphore","Antithèse","Allégorie"],"answer":"Métaphore"}'),

('Personnification', 2, 28000, 'La personnification attribue des caractéristiques humaines à un objet ou une idée.',
 '{"type":"mcq","question":"«Le soleil sourit à travers les nuages» est une...","options":["Métaphore","Comparaison","Personnification","Hyperbole"],"answer":"Personnification"}'),

('Hyperbole', 2, 28000, 'L''hyperbole est une exagération volontaire pour produire un effet. «Je meurs de faim.»',
 '{"type":"mcq","question":"«J''ai attendu une éternité» est un exemple de...","options":["Litote","Hyperbole","Euphémisme","Métaphore"],"answer":"Hyperbole"}'),

('Euphémisme', 2, 30000, 'L''euphémisme adoucit une réalité désagréable. «Il nous a quittés» pour «il est mort».',
 '{"type":"mcq","question":"«Il a rendu l''âme» est un euphémisme pour...","options":["Il a voyagé","Il est mort","Il s''est endormi","Il est parti en voyage"],"answer":"Il est mort"}'),

('Antithèse', 2, 30000, 'L''antithèse oppose deux idées contraires dans la même phrase.',
 '{"type":"mcq","question":"«Sans victoire, il n''y a pas de défaite» illustre quelle figure de style ?","options":["Métaphore","Hyperbole","Antithèse","Euphémisme"],"answer":"Antithèse"}'),

('Allitération', 2, 30000, 'L''allitération est la répétition d''un même son (consonne) au début de mots proches.',
 '{"type":"mcq","question":"«Pour qui sont ces serpents qui sifflent sur vos têtes» illustre quelle figure de style ?","options":["Assonance","Allitération","Anaphore","Chiasme"],"answer":"Allitération"}'),

('Anaphore', 2, 30000, 'L''anaphore est la répétition d''un mot ou groupe au début de plusieurs phrases.',
 '{"type":"mcq","question":"«Je rêve... Je rêve d''un monde... Je rêve de paix» illustre quelle figure de style ?","options":["Métaphore","Hyperbole","Anaphore","Chiasme"],"answer":"Anaphore"}'),

('Étymologie grecque : «bio-»', 2, 30000, 'La racine grecque «bio-» signifie «vie». Biologie = étude de la vie.',
 '{"type":"mcq","question":"Que signifie la racine grecque «bio-» dans «biologie» ?","options":["Deux","Vie","Nature","Science"],"answer":"Vie"}'),

('Étymologie grecque : «graph-»', 2, 30000, 'La racine «graph-» signifie «écrire». Graphique, graphologie, autographe.',
 '{"type":"mcq","question":"Que signifie la racine «graph-» dans «autobiographie» ?","options":["Dessin","Écriture","Lecture","Image"],"answer":"Écriture"}'),

('Étymologie latine : «temp-»', 2, 30000, 'La racine latine «temp-» signifie «temps». Temps, temporaire, contemporain.',
 '{"type":"mcq","question":"Un événement «contemporain» se produit...","options":["Dans le passé lointain","À la même époque que nous","Dans le futur","Au hasard"],"answer":"À la même époque que nous"}'),

('Choisir le bon synonyme selon le contexte', 2, 32000, 'Les synonymes ne sont pas toujours interchangeables. Le contexte détermine le bon choix.',
 '{"type":"mcq","question":"Dans «Il a répondu à sa demande», quel synonyme de «demande» convient le mieux ?","options":["commande","requête","ordre","exigence"],"answer":"requête"}'),

('Nuances de sens entre synonymes', 2, 32000, '«Maison», «demeure», «logis», «foyer» sont synonymes mais avec des nuances.',
 '{"type":"mcq","question":"Quel synonyme de «maison» évoque le mieux un sentiment de chaleur familiale ?","options":["demeure","logement","foyer","résidence"],"answer":"foyer"}'),

('Niveau de langue : registre technique', 2, 30000, 'Le registre technique utilise un vocabulaire spécialisé propre à un domaine.',
 '{"type":"mcq","question":"Le mot «épithélium» appartient à quel registre de langue ?","options":["Familier","Courant","Technique/scientifique","Argotique"],"answer":"Technique/scientifique"}'),

('Sigles et acronymes', 2, 28000, 'Un sigle est formé des initiales d''un groupe de mots. Ex : ONU = Organisation des Nations Unies.',
 '{"type":"mcq","question":"Que signifie le sigle «CBC» au Canada ?","options":["Centre de la bibliothèque canadienne","Canadian Broadcasting Corporation","Commission du bien commun","Conseil de bibliothèque communautaire"],"answer":"Canadian Broadcasting Corporation"}'),

('Mot valise', 2, 30000, 'Un mot valise est formé de deux mots fusionnés. Ex : «baladeur» = ballade + lecteur.',
 '{"type":"mcq","question":"Le mot «courriel» est-il un mot valise ?","options":["Oui, de «courrier» + «électronique»","Non, c''est un emprunt à l''anglais","Oui, de «courir» + «iel»","Non, c''est un archaïsme"],"answer":"Oui, de «courrier» + «électronique»"}'),

('Sens dénotatif et connotatif', 2, 32000, 'Sens dénotatif = sens premier, neutre. Connotatif = sens additionnel émotionnel ou culturel.',
 '{"type":"mcq","question":"Le mot «serpent» a un sens dénotatif (reptile) et une connotation...","options":["Positive (sagesse)","Négative (traîtrise, danger)","Neutre (aucune connotation)","Variable selon la culture"],"answer":"Négative (traîtrise, danger)"}'),

('Dérivation : -ité (abstraction)', 2, 28000, 'Le suffixe «-ité» transforme un adjectif en nom abstrait. Généreux → générosité.',
 '{"type":"mcq","question":"Quel nom abstrait se forme à partir de «sincère» ?","options":["sincèrement","sincérité","insincère","sincériser"],"answer":"sincérité"}'),

('Dérivation : -able (possibilité)', 2, 28000, '«-able» indique une possibilité. Lavable = qu''on peut laver.',
 '{"type":"mcq","question":"Que signifie l''adjectif «pardonnable» ?","options":["Qui a été pardonné","Qui ne peut pas être pardonné","Qui peut être pardonné","Qui pardonne"],"answer":"Qui peut être pardonné"}'),

('Mot emprunté à l''anglais (anglicisme)', 2, 30000, 'Un anglicisme est un mot emprunté à l''anglais. «Parking» → «stationnement».',
 '{"type":"mcq","question":"Quel mot est l''équivalent français recommandé pour «un email» ?","options":["Un mèle","Un courriel","Une émail","Un couriel"],"answer":"Un courriel"}'),

('Registre argotique', 2, 28000, 'L''argot est un langage propre à un groupe social. «Baraqué» = costaud en argot.',
 '{"type":"mcq","question":"Le registre argotique est caractéristique de...","options":["La littérature classique","Les textes de loi","Un groupe social ou une génération","Les dictionnaires officiels"],"answer":"Un groupe social ou une génération"}'),

('Synonymes de «beaucoup»', 2, 28000, '«Beaucoup» a des synonymes de différents niveaux. Abondamment (soutenu), énormément, tas de (familier).',
 '{"type":"mcq","question":"Quel synonyme soutenu de «beaucoup» peut-on utiliser dans un texte formel ?","options":["plein de","un tas de","abondamment","genre de"],"answer":"abondamment"}'),

('Dénotation neutre vs connotation positive', 2, 30000, 'Même réalité, mots différents selon la connotation. «Élancé» (positif) vs «maigre» (négatif).',
 '{"type":"mcq","question":"Quel mot a une connotation plus positive pour décrire quelqu''un de mince ?","options":["maigre","sec","élancé","décharné"],"answer":"élancé"}'),

('Figure : litote', 2, 30000, 'La litote dit moins pour faire entendre plus. «Ce n''est pas mal» = c''est très bien.',
 '{"type":"mcq","question":"«Je ne te hais point» (Chimène à Rodrigue) est une litote qui signifie...","options":["Je te déteste","Je t''aime","Je suis indifférente","Je te plains"],"answer":"Je t''aime"}'),

-- DIFFICULTÉ 3 (26 questions)
('Oxymore', 3, 40000, 'L''oxymore associe deux termes de sens opposés. «Un silence assourdissant», «une clarté obscure».',
 '{"type":"mcq","question":"«Un doux supplice» est un exemple de...","options":["Antithèse","Métaphore","Oxymore","Hyperbole"],"answer":"Oxymore"}'),

('Périphrase', 3, 40000, 'La périphrase remplace un mot par une expression plus longue. «L''astre du jour» = le soleil.',
 '{"type":"mcq","question":"«Le pays des cèdres» est une périphrase pour...","options":["Le Canada","Le Liban","La Finlande","L''Australie"],"answer":"Le Liban"}'),

('Synecdoque', 3, 45000, 'La synecdoque est une figure où la partie désigne le tout ou vice-versa. «Voiles à l''horizon» = bateaux.',
 '{"type":"mcq","question":"Dans «J''ai besoin d''un toit», «toit» est une synecdoque désignant...","options":["Un toit spécifique","Une maison entière","La pluie","L''abri"],"answer":"Une maison entière"}'),

('Antonomase', 3, 45000, 'L''antonomase utilise un nom propre pour désigner une catégorie. «Un Don Juan» = un séducteur.',
 '{"type":"mcq","question":"«Un Einstein» utilisé pour désigner un génie est une...","options":["Métaphore","Antonomase","Périphrase","Hyperbole"],"answer":"Antonomase"}'),

('Chiasme', 3, 45000, 'Le chiasme est une figure de construction : «A B / B A». «Il faut manger pour vivre et non vivre pour manger.»',
 '{"type":"mcq","question":"«Il faut manger pour vivre, non vivre pour manger.» Cette figure s''appelle...","options":["Anaphore","Chiasme","Parallélisme","Zeugme"],"answer":"Chiasme"}'),

('Zeugme', 3, 45000, 'Le zeugme est une construction où un mot s''applique à des termes sémantiquement incompatibles.',
 '{"type":"mcq","question":"«Elle portait une robe rouge et tous les regards» est un exemple de...","options":["Métaphore","Hyperbole","Zeugme","Synecdoque"],"answer":"Zeugme"}'),

('Choisir la figure de style appropriée', 3, 42000, 'Reconnaître et nommer correctement les figures dans un texte littéraire.',
 '{"type":"mcq","question":"Dans «La lune, sentinelle de la nuit, veillait sur la ville», quelle figure est utilisée ?","options":["Comparaison","Métaphore + personnification","Hyperbole","Antithèse"],"answer":"Métaphore + personnification"}'),

('Isotopie sémantique', 3, 45000, 'Une isotopie est la répétition d''un même thème ou sens à travers un texte par des mots différents.',
 '{"type":"mcq","question":"Dans un texte où l''on retrouve «lac», «fleuve», «pluie», «inondation», «humidité», quelle isotopie est présente ?","options":["L''isotopie de la vie","L''isotopie de l''eau","L''isotopie de la nature","L''isotopie du danger"],"answer":"L''isotopie de l''eau"}'),

('Connotations culturelles', 3, 42000, 'Les connotations varient selon la culture. «Rouge» = danger en Occident, bonheur en Chine.',
 '{"type":"mcq","question":"Quel mot a généralement une connotation positive dans la culture occidentale ?","options":["serpent","loup","colombe","corbeau"],"answer":"colombe"}'),

('Etymologie : «phil-» / «philo-»', 3, 42000, 'La racine grecque «philo-» signifie «ami de, qui aime». Philosophie = amour de la sagesse.',
 '{"type":"mcq","question":"Que signifie la racine «phil-» dans «philanthrope» ?","options":["Science","Amour","Haine","Peur"],"answer":"Amour"}'),

('Étymologie : «anthrop-»', 3, 42000, 'La racine grecque «anthrop-» signifie «homme». Anthropologie = étude de l''être humain.',
 '{"type":"mcq","question":"La racine «anthrop-» dans «philanthrope» signifie...","options":["Bienfaiteur","Science","Être humain","Richesse"],"answer":"Être humain"}'),

('Mot savant et mot populaire', 3, 42000, 'Un mot savant vient directement du latin/grec. Le mot populaire a évolué phonétiquement.',
 '{"type":"mcq","question":"«Fragile» (savant) et «frêle» (populaire) viennent tous deux du latin «fragilis». Laquelle de ces propriétés les distingue ?","options":["Leur sens","Leur prononciation","Leur évolution phonétique historique","Leur registre de langue actuel"],"answer":"Leur évolution phonétique historique"}'),

('Distinguer homonymes complexes', 3, 42000, '«Censé» (supposé) ≠ «sensé» (raisonnable). Ce sont des paronymes difficiles.',
 '{"type":"mcq","question":"Quelle phrase emploie correctement «censé» ?","options":["Ce plan n''est pas sensé.","Tu es censé être ici à 8h.","Il a fait une remarque censée.","Ce film est très censé."],"answer":"Tu es censé être ici à 8h."}'),

('Parasynonymie et nuances lexicales', 3, 45000, 'Les parasynonyres ont des sens très proches mais pas identiques. Choix du mot selon la nuance.',
 '{"type":"mcq","question":"Quelle différence y a-t-il entre «maison» et «foyer» dans leur connotation ?","options":["Aucune différence","«Foyer» évoque la chaleur familiale et l''affection","«Maison» est plus affectueux que «foyer»","Ce sont des antonymes"],"answer":"«Foyer» évoque la chaleur familiale et l''affection"}'),

('Registres de langue dans un texte', 3, 42000, 'Un texte peut mélanger les registres pour créer un effet. Ex : comique, expressif.',
 '{"type":"mcq","question":"Dans un roman, pourquoi un auteur mélangerait-il registre familier et registre soutenu ?","options":["Par erreur","Pour caractériser les personnages selon leur milieu social","Pour respecter les règles grammaticales","Pour simplifier la lecture"],"answer":"Pour caractériser les personnages selon leur milieu social"}'),

('Néologisme par dérivation', 3, 40000, 'On peut former des néologismes par dérivation. «Courriel» de «courrier électronique».',
 '{"type":"mcq","question":"Par quel procédé le mot «informatique» a-t-il été créé ?","options":["Emprunt à l''anglais","Dérivation de «information» + «automatique»","Composition de deux mots","Truncation d''un mot plus long"],"answer":"Dérivation de «information» + «automatique»"}'),

('Allusion littéraire', 3, 45000, 'Une allusion est une référence implicite à un personnage ou événement connu.',
 '{"type":"mcq","question":"«Ce projet est son talon d''Achille» fait allusion à...","options":["Un sportif grec","La mythologie grecque (point faible)","Un monument historique","Un dicton populaire"],"answer":"La mythologie grecque (point faible)"}'),

('Ironie littéraire', 3, 42000, 'L''ironie dit l''opposé de ce qu''on pense. Le ton ou le contexte révèle le vrai sens.',
 '{"type":"mcq","question":"Dans «Quelle belle idée de sortir par un temps pareil !» (dits lors d''une tempête de neige), quel procédé est utilisé ?","options":["Euphémisme","Hyperbole","Ironie","Litote"],"answer":"Ironie"}'),

('Mot savant latin «homo»', 3, 40000, 'La racine latine «homo» signifie «homme» (être humain). Homogène, homicide, homosexualité...',
 '{"type":"mcq","question":"Que signifie la racine «homo» dans «homophones» ?","options":["Même","Homme","Seul","Double"],"answer":"Même"}'),

('Dérivation : préfixe «hyper-»', 3, 40000, 'Le préfixe «hyper-» signifie «excessif, au-delà». Hyperactif = trop actif.',
 '{"type":"mcq","question":"Que signifie le préfixe «hypo-» (opposé de «hyper-»), comme dans «hypoglycémie» ?","options":["Excessif","Insuffisant, sous la normale","Au-delà","À travers"],"answer":"Insuffisant, sous la normale"}'),

('Registre et intention de communication', 3, 42000, 'Le registre de langue dépend du destinataire, du contexte et de l''intention.',
 '{"type":"mcq","question":"Pour rédiger une lettre de demande d''emploi, quel registre de langue doit-on utiliser ?","options":["Familier","Courant","Soutenu","Argotique"],"answer":"Soutenu"}'),

('Isotopie thématique dans un poème', 3, 45000, 'Analyser les champs lexicaux d''un poème permet d''identifier ses thèmes.',
 '{"type":"mcq","question":"Dans un poème avec : «automne», «feuilles tombantes», «brouillard», «crépuscule», «déclin», quelle isotopie domine ?","options":["La naissance","La nostalgie et la mort","La célébration","Le renouveau"],"answer":"La nostalgie et la mort"}'),

('Néologisme et évolution de la langue', 3, 42000, 'La langue évolue avec la société. De nouveaux mots s''ajoutent, d''autres disparaissent.',
 '{"type":"mcq","question":"Pourquoi la langue française crée-t-elle constamment de nouveaux mots ?","options":["Pour remplacer des mots inutiles","Pour répondre aux réalités nouvelles de la société","Pour compliquer l''apprentissage","Par simple caprice"],"answer":"Pour répondre aux réalités nouvelles de la société"}'),

('Sens d''un terme philosophique commun', 3, 40000, '«Altruiste» = qui se préoccupe du bien d''autrui, désintéressé. Antonyme : égoïste.',
 '{"type":"mcq","question":"Une personne «altruiste» est quelqu''un qui...","options":["Pense d''abord à lui-même","Se préoccupe du bien des autres","N''a aucun intérêt","A des idéaux politiques"],"answer":"Se préoccupe du bien des autres"}'),

('Figures de sonorités : assonance', 3, 40000, 'L''assonance est la répétition d''un même son vocalique dans plusieurs mots proches.',
 '{"type":"mcq","question":"«Il pleure dans mon cœur comme il pleut sur la ville» (Verlaine) est un exemple d''...","options":["Allitération (consonnes)","Assonance (voyelles)","Anaphore","Chiasme"],"answer":"Assonance (voyelles)"}'),

('Valeur péjorative vs méliorative', 3, 42000, 'Péjoratif = connotation négative. Mélioratif = connotation positive.',
 '{"type":"mcq","question":"Lequel de ces mots a une connotation péjorative pour désigner quelqu''un de grand ?","options":["élancé","longiligne","filiforme","dégingandé"],"answer":"dégingandé"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
