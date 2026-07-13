-- Supplément SEC1_FRA_comprehension-texte : +87 questions (63 → 150)
-- PFEQ-FRA-SEC1-COMP

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-COMP') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (29 questions)
('Identifier l''idée principale d''un paragraphe', 1, 22000, 'L''idée principale est l''idée la plus importante d''un paragraphe, souvent dans la phrase clé.',
 '{"type":"mcq","question":"Comment repère-t-on généralement l''idée principale d''un paragraphe ?","options":["C''est toujours la dernière phrase","C''est la phrase qui contient le plus de mots","C''est la phrase qui exprime l''idée la plus importante","C''est toujours la première phrase"],"answer":"C''est la phrase qui exprime l''idée la plus importante"}'),

('Répérage d''information explicite', 1, 22000, 'L''information explicite est clairement énoncée dans le texte. On peut la trouver directement.',
 '{"type":"mcq","question":"Texte : «Emma a 14 ans et vit à Québec.» Quel âge a Emma ?","options":["12 ans","13 ans","14 ans","15 ans"],"answer":"14 ans"}'),

('Identifier les personnages d''un récit', 1, 20000, 'Un récit présente des personnages. Le personnage principal est celui qui occupe le plus de place.',
 '{"type":"mcq","question":"Dans un récit où «Louis» effectue la plupart des actions et «Julie» l''aide, qui est le personnage principal ?","options":["Julie","Les deux également","Louis","Aucun des deux"],"answer":"Louis"}'),

('Identifier le lieu d''un récit', 1, 20000, 'Le lieu est l''endroit où se déroule l''action. Il peut être décrit ou indiqué directement.',
 '{"type":"mcq","question":"Texte : «Ils marchèrent jusqu''à la plage, où les vagues déferlaient sur le sable.» Où se passe la scène ?","options":["Dans une forêt","À la montagne","À la plage","Dans un lac"],"answer":"À la plage"}'),

('Identifier le moment d''un récit', 1, 20000, 'Le moment peut être précisé par des indices de temps : «hier», «au matin», «en automne».',
 '{"type":"mcq","question":"Texte : «Ce matin de janvier, la neige recouvrait tout.» En quel moment se déroule la scène ?","options":["En été le soir","En hiver le matin","Au printemps","En automne à midi"],"answer":"En hiver le matin"}'),

('Identifier le type de texte', 1, 20000, 'On distingue texte narratif (récit), descriptif, explicatif, argumentatif, prescriptif.',
 '{"type":"mcq","question":"Un texte qui raconte une histoire avec des personnages et une intrigue est de type...","options":["Descriptif","Explicatif","Argumentatif","Narratif"],"answer":"Narratif"}'),

('Identifier un texte descriptif', 1, 20000, 'Un texte descriptif dépeint une personne, un lieu ou un objet avec des détails sensoriels.',
 '{"type":"mcq","question":"Texte : «La cuisine était petite, chaleureuse, avec une odeur de pain chaud.» Ce texte est de type...","options":["Narratif","Descriptif","Argumentatif","Explicatif"],"answer":"Descriptif"}'),

('Identifier un texte prescriptif', 1, 20000, 'Un texte prescriptif donne des instructions ou des directives. Ex : recettes, modes d''emploi.',
 '{"type":"mcq","question":"«Mélangez la farine et le sucre. Ajoutez les œufs.» Ce texte est de type...","options":["Narratif","Descriptif","Prescriptif","Argumentatif"],"answer":"Prescriptif"}'),

('Reformuler une information', 1, 22000, 'Reformuler = exprimer la même idée avec d''autres mots, en conservant le sens.',
 '{"type":"mcq","question":"Texte : «Les températures ont chuté drastiquement.» Quelle reformulation est correcte ?","options":["Les températures ont légèrement baissé","Il a fait très chaud","Il a fait beaucoup plus froid qu''avant","Les températures n''ont pas changé"],"answer":"Il a fait beaucoup plus froid qu''avant"}'),

('Vocabulaire en contexte', 1, 22000, 'Le sens d''un mot inconnu peut être déterminé grâce au contexte de la phrase.',
 '{"type":"mcq","question":"Texte : «Il grimpa la colline escarpée d''un pas incertain.» Que signifie «escarpée» ?","options":["Plate et facile","Très pentue et abrupte","Longue et douce","Humide et glissante"],"answer":"Très pentue et abrupte"}'),

('Distinguer fait et opinion', 1, 22000, 'Un fait est vérifiable objectivement. Une opinion exprime un point de vue subjectif.',
 '{"type":"mcq","question":"Laquelle de ces phrases est un fait (et non une opinion) ?","options":["Ce film est ennuyeux.","La Tour Eiffel est belle.","Paris est la capitale de la France.","Ce livre est meilleur que l''autre."],"answer":"Paris est la capitale de la France."}'),

('Identifier l''intention de l''auteur', 1, 22000, 'L''auteur peut vouloir informer, persuader, divertir, émouvoir ou instruire.',
 '{"type":"mcq","question":"Un texte qui présente les avantages et les inconvénients d''un sujet pour convaincre le lecteur a pour intention principale de...","options":["Informer","Divertir","Persuader","Décrire"],"answer":"Persuader"}'),

('Identifier la structure chronologique', 1, 20000, 'Un texte chronologique suit l''ordre du temps. Indices : d''abord, ensuite, puis, enfin.',
 '{"type":"mcq","question":"Quels mots indiquent que les événements sont racontés dans l''ordre chronologique ?","options":["cependant, mais, pourtant","d''abord, ensuite, puis, enfin","en résumé, bref, donc","à l''opposé, contrairement, en revanche"],"answer":"d''abord, ensuite, puis, enfin"}'),

('Identifier un connecteur de cause', 1, 20000, 'Les connecteurs de cause : parce que, car, puisque, étant donné que.',
 '{"type":"mcq","question":"Dans «Il est resté chez lui parce qu''il était malade», quel connecteur exprime la cause ?","options":["chez lui","parce que","malade","il était"],"answer":"parce que"}'),

('Identifier un connecteur de conséquence', 1, 20000, 'Les connecteurs de conséquence : donc, c''est pourquoi, ainsi, par conséquent, alors.',
 '{"type":"mcq","question":"Dans «Il pleuvait, donc le match a été annulé», quel connecteur exprime la conséquence ?","options":["pleuvait","le match","donc","annulé"],"answer":"donc"}'),

('Identifier un connecteur d''opposition', 1, 20000, 'Les connecteurs d''opposition : mais, cependant, pourtant, néanmoins, en revanche.',
 '{"type":"mcq","question":"Quel connecteur exprime une opposition dans «Il était fatigué, mais il a continué» ?","options":["Il était","mais","fatigué","a continué"],"answer":"mais"}'),

('Repérer un chiffre dans un texte', 1, 18000, 'Les données chiffrées sont des informations explicites facilement repérables.',
 '{"type":"mcq","question":"Texte : «L''école compte 450 élèves répartis dans 18 classes.» Combien de classes y a-t-il ?","options":["25","450","18","15"],"answer":"18"}'),

('Identifier le titre le plus approprié', 1, 22000, 'Un titre doit résumer l''idée principale du texte sans être trop spécifique.',
 '{"type":"mcq","question":"Texte sur la pollution des océans causée par le plastique. Quel titre convient le mieux ?","options":["Les océans","Le plastique est utile","La crise du plastique dans nos océans","Comment recycler"],"answer":"La crise du plastique dans nos océans"}'),

('Identifier les mots-clés d''un texte', 1, 20000, 'Les mots-clés sont les termes les plus importants, souvent répétés ou en lien avec le sujet.',
 '{"type":"mcq","question":"Dans un texte sur les abeilles et la pollinisation, quels mots sont probablement des mots-clés ?","options":["maison, rue, voiture","abeille, fleur, pollen, écosystème","bonheur, amour, amitié","rapidement, lentement, doucement"],"answer":"abeille, fleur, pollen, écosystème"}'),

('Inférence simple : déduire le contexte', 1, 22000, 'Une inférence est une déduction basée sur les indices du texte, non dite explicitement.',
 '{"type":"mcq","question":"Texte : «Lola sortit son parapluie en regardant les nuages s''assembler.» Que peut-on déduire ?","options":["Il fait soleil","Il va pleuvoir bientôt","Il neige","Lola est fatiguée"],"answer":"Il va pleuvoir bientôt"}'),

('Inférence sur l''émotion d''un personnage', 1, 22000, 'On peut déduire l''émotion d''un personnage à partir de ses actions et paroles.',
 '{"type":"mcq","question":"Texte : «Les mains tremblantes, Marc ouvrit l''enveloppe qui allait changer sa vie.» Quelle émotion ressent Marc ?","options":["Ennui","Colère","Anxiété ou excitation","Tristesse"],"answer":"Anxiété ou excitation"}'),

('Repérer une anaphore textuelle', 1, 20000, 'Une anaphore textuelle est une reprise pronominale ou nominale d''un antécédent.',
 '{"type":"mcq","question":"Texte : «Le renard cherchait sa nourriture. Il avait faim depuis trois jours.» À quoi réfère «Il» ?","options":["La nourriture","Trois jours","Le renard","Le chasseur"],"answer":"Le renard"}'),

('Comprendre une métaphore en texte', 1, 22000, 'Comprendre une métaphore = trouver ce qu''elle exprime dans le contexte.',
 '{"type":"mcq","question":"Texte : «Sa vie était un roman ouvert pour tout le monde.» Que signifie cette métaphore ?","options":["Elle lisait beaucoup","Sa vie était connue de tous","Elle écrivait des romans","Sa vie était fictive"],"answer":"Sa vie était connue de tous"}'),

('Repérer les indices textuels de lieu', 1, 20000, 'Indices de lieu : là, ici, à gauche, en haut, au fond, dehors...',
 '{"type":"mcq","question":"Dans «Au fond du couloir, une porte était entrouverte», où se trouve la porte ?","options":["À l''entrée","En haut","Au fond du couloir","À droite"],"answer":"Au fond du couloir"}'),

('Identification de la structure en 3 parties', 1, 20000, 'Un texte bien structuré a une introduction, un développement et une conclusion.',
 '{"type":"mcq","question":"Quelle partie d''un texte présente généralement la thèse ou le sujet à traiter ?","options":["La conclusion","Le développement","L''introduction","Le titre"],"answer":"L''introduction"}'),

('Comprendre l''emploi de la ponctuation', 1, 20000, 'La virgule sépare des éléments de même nature ou signale une pause.',
 '{"type":"mcq","question":"Dans «Les enfants jouèrent, rirent et chantèrent toute la soirée», pourquoi y a-t-il une virgule ?","options":["Pour remplacer un point","Pour séparer des verbes coordonnés","Pour marquer une opposition","Pour indiquer une condition"],"answer":"Pour séparer des verbes coordonnés"}'),

('Identifier le registre de langue d''un texte', 1, 20000, 'Le registre familier vs soutenu se reconnaît au choix des mots et à la complexité des phrases.',
 '{"type":"mcq","question":"«C''est trop cool, je kiffe vraiment ce bouquin !» est de registre...","options":["Soutenu","Courant","Familier","Argotique"],"answer":"Familier"}'),

('Comprendre une image dans un texte', 1, 22000, 'Les illustrations, schémas et photos d''un texte ajoutent de l''information au contenu écrit.',
 '{"type":"mcq","question":"Dans un article sur la migration des oiseaux, un tableau montrant les distances parcourues aide à...","options":["Rendre le texte plus long","Illustrer concrètement les données chiffrées","Décorer la page","Remplacer complètement le texte"],"answer":"Illustrer concrètement les données chiffrées"}'),

('Identifier un élément de conclusion', 1, 20000, 'La conclusion résume et clôt le texte. Marqueurs : en conclusion, en somme, finalement, bref.',
 '{"type":"mcq","question":"Lequel de ces marqueurs introduit souvent une conclusion ?","options":["d''abord","par exemple","en somme","cependant"],"answer":"en somme"}'),

-- DIFFICULTÉ 2 (29 questions)
('Inférence sur l''intention implicite', 2, 32000, 'Parfois, l''auteur ne dit pas tout explicitement. On doit inférer son intention ou sa position.',
 '{"type":"mcq","question":"Texte : «Malgré tous les avertissements, les déchets continuent d''envahir nos forêts.» Quelle position l''auteur semble défendre ?","options":["Les forêts ne sont pas importantes","Il faut protéger l''environnement","Les déchets sont utiles","Les avertissements sont inutiles"],"answer":"Il faut protéger l''environnement"}'),

('Distinguer les faits des opinions dans un texte', 2, 32000, 'Un texte peut mélanger faits vérifiables et opinions personnelles.',
 '{"type":"mcq","question":"Texte : «Le Canada compte 38 millions d''habitants. C''est sans aucun doute le plus beau pays du monde.» Quelle phrase est une opinion ?","options":["Le Canada compte 38 millions d''habitants","C''est sans aucun doute le plus beau pays du monde","Les deux sont des faits","Les deux sont des opinions"],"answer":"C''est sans aucun doute le plus beau pays du monde"}'),

('Comprendre une comparaison dans un texte', 2, 30000, 'Une comparaison aide le lecteur à mieux visualiser ou comprendre une réalité.',
 '{"type":"mcq","question":"Texte : «Sa voix était douce comme le murmure d''un ruisseau.» Quel effet crée cette comparaison ?","options":["Elle indique que la voix est forte","Elle crée une image apaisante de la voix","Elle suggère que la voix est ennuyeuse","Elle compare deux personnes"],"answer":"Elle crée une image apaisante de la voix"}'),

('Repérer le schéma argumentatif', 2, 35000, 'Un texte argumentatif présente une thèse, des arguments et une conclusion.',
 '{"type":"mcq","question":"Texte : «Les réseaux sociaux nuisent aux adolescents car ils favorisent l''anxiété et réduisent les contacts humains réels.» Quelle est la thèse ?","options":["Les réseaux sociaux sont bénéfiques","Les adolescents sont anxieux","Les réseaux sociaux nuisent aux adolescents","Les contacts humains réels sont nécessaires"],"answer":"Les réseaux sociaux nuisent aux adolescents"}'),

('Repérer un argument dans un texte', 2, 32000, 'Un argument soutient la thèse. Dans l''exemple ci-dessus, «ils favorisent l''anxiété» est un argument.',
 '{"type":"mcq","question":"Dans «Les téléphones au volant sont dangereux car ils distraient le conducteur», quel est l''argument ?","options":["Les téléphones au volant sont dangereux","Ils distraient le conducteur","Les conducteurs","Les téléphones"],"answer":"Ils distraient le conducteur"}'),

('Repérer un contre-argument', 2, 32000, 'Un contre-argument s''oppose à la thèse principale. Souvent introduit par «cependant», «mais».',
 '{"type":"mcq","question":"Texte : «Les voitures électriques sont écologiques. Cependant, leur production génère beaucoup de pollution.» Le contre-argument est...","options":["Les voitures électriques sont écologiques","Leur production génère beaucoup de pollution","Les voitures ne sont pas nécessaires","Aucun contre-argument"],"answer":"Leur production génère beaucoup de pollution"}'),

('Comprendre le niveau de vraisemblance', 2, 30000, 'Vraisemblable = qui semble vrai selon la logique et le contexte. La crédibilité dépend des preuves.',
 '{"type":"mcq","question":"Texte : «D''après des études menées sur 10 000 personnes, dormir 8h améliore la mémoire.» Pourquoi cette affirmation semble-t-elle fiable ?","options":["Parce que tout le monde le dit","Parce qu''elle est basée sur une grande étude","Parce qu''elle semble logique","Parce qu''elle est dans un livre"],"answer":"Parce qu''elle est basée sur une grande étude"}'),

('Cohérence du texte : progressions thématique', 2, 32000, 'Un texte cohérent progresse logiquement : chaque phrase s''appuie sur la précédente.',
 '{"type":"mcq","question":"Texte : «Le soleil brillait. Les oiseaux chantaient. ___» Quelle phrase s''intégrerait le mieux ?","options":["Il neigeait abondamment.","C''était une belle journée de printemps.","La tempête approchait.","Les gens portaient leurs manteaux."],"answer":"C''était une belle journée de printemps."}'),

('Comprendre un texte poétique', 2, 32000, 'Un poème utilise des images, des sonorités et des rythmes pour créer des effets.',
 '{"type":"mcq","question":"Poème : «Les sanglots longs / Des violons / De l''automne» (Verlaine). Quel sentiment domine ?","options":["La joie","La mélancolie","La colère","L''indifférence"],"answer":"La mélancolie"}'),

('Identifier la tonalité d''un texte', 2, 32000, 'La tonalité (ou registre) d''un texte peut être lyrique, épique, comique, ironique, tragique...',
 '{"type":"mcq","question":"Texte : «Il était une fois un chat si obèse qu''il ne pouvait même plus attraper sa propre queue.» Quelle est la tonalité ?","options":["Tragique","Épique","Comique/humoristique","Lyrique"],"answer":"Comique/humoristique"}'),

('Analyser la structure d''un texte argumentatif', 2, 35000, 'Structure type : introduction (thèse) → arguments + exemples → conclusion.',
 '{"type":"mcq","question":"Dans quelle partie d''un texte argumentatif trouve-t-on généralement les exemples concrets ?","options":["Dans l''introduction","Dans le développement","Dans la conclusion","Dans le titre"],"answer":"Dans le développement"}'),

('Comprendre les différentes voix dans un texte', 2, 32000, 'Un texte peut inclure la voix du narrateur, des personnages (dialogue) et de l''auteur implicite.',
 '{"type":"mcq","question":"Texte : «''Je suis fatigué'', dit Paul.» Qui parle dans la phrase entre guillemets ?","options":["Le narrateur","L''auteur","Paul (personnage)","Le lecteur"],"answer":"Paul (personnage)"}'),

('Inférence sur le contexte historique', 2, 35000, 'Certains textes contiennent des indices permettant de situer l''époque de l''histoire.',
 '{"type":"mcq","question":"Texte : «Ils envoyèrent un télégramme pour annoncer la nouvelle, car le téléphone n''existait pas encore dans leur village.» À quelle époque se situe probablement ce texte ?","options":["Futur (science-fiction)","Époque actuelle (21e siècle)","Époque ancienne (avant les téléphones répandus)","Dans une ville moderne"],"answer":"Époque ancienne (avant les téléphones répandus)"}'),

('Différence entre résumé et paraphrase', 2, 30000, 'Résumé = version condensée de l''essentiel. Paraphrase = reformulation en gardant la longueur.',
 '{"type":"mcq","question":"Un résumé d''un texte de 2 pages devrait être...","options":["Aussi long que l''original","Plus court, ne contenant que l''essentiel","Identique mais avec d''autres mots","Plus long, avec plus de détails"],"answer":"Plus court, ne contenant que l''essentiel"}'),

('Comprendre l''utilisation des guillemets', 2, 30000, 'Les guillemets servent à citer des paroles, mettre en relief un mot ou indiquer l''ironie.',
 '{"type":"mcq","question":"Dans «Notre ''ami'' a encore oublié notre réunion», pourquoi «ami» est-il entre guillemets ?","options":["Pour souligner l''importance de l''amitié","Pour indiquer que c''est un vrai ami","Pour indiquer une ironie (il n''est pas vraiment un ami)","Pour introduire une citation"],"answer":"Pour indiquer une ironie (il n''est pas vraiment un ami)"}'),

('Repérer une reformulation dans le texte', 2, 30000, 'Une reformulation répète la même idée avec d''autres mots pour clarifier ou insister.',
 '{"type":"mcq","question":"Texte : «Les requins sont essentiels aux écosystèmes marins. En d''autres mots, sans eux, l''équilibre des océans serait compromis.» «En d''autres mots» introduit...","options":["Un nouveau sujet","Une reformulation de la première phrase","Un contre-argument","Une exception"],"answer":"Une reformulation de la première phrase"}'),

('Comprendre l''ordre de présentation des informations', 2, 30000, 'L''ordre des informations peut être chronologique, de général à particulier, de l''important au secondaire...',
 '{"type":"mcq","question":"Un texte qui commence par l''idée la plus importante et finit par les détails secondaires utilise une structure...","options":["Chronologique","En entonnoir (du général au particulier)","En pyramide inversée","Cyclique"],"answer":"En pyramide inversée"}'),

('Comprendre l''utilisation des exemples', 2, 30000, 'Les exemples illustrent ou prouvent un argument. Marqueurs : «par exemple», «comme», «tel que».',
 '{"type":"mcq","question":"Dans «Plusieurs pays ont réduit leurs émissions, par exemple l''Allemagne et la Norvège», à quoi servent les exemples ?","options":["À contredire l''idée principale","À illustrer et prouver l''argument","À introduire un nouveau sujet","À conclure le texte"],"answer":"À illustrer et prouver l''argument"}'),

('Inférence : trouver la cause non-dite', 2, 35000, 'Parfois, la cause d''un événement n''est pas dite explicitement mais peut être déduite.',
 '{"type":"mcq","question":"Texte : «Les fleurs du jardin se flétrissaient. Personne n''avait pensé à les arroser depuis une semaine.» Pourquoi les fleurs se flétrissent-elles ?","options":["Il fait trop froid","Un insecte les a attaquées","Par manque d''eau","Le jardinier les a coupées"],"answer":"Par manque d''eau"}'),

('Comprendre un texte avec double sens', 2, 35000, 'Certains textes comportent un sens littéral et un sens caché (allégorique, ironique).',
 '{"type":"mcq","question":"Fable de La Fontaine : un renard parle à une cigogne pour décrire un comportement humain. Ce texte est à comprendre...","options":["Au sens littéral uniquement","Au sens figuré : les animaux représentent des types humains","Au niveau scientifique sur les animaux","Comme un texte prescriptif"],"answer":"Au sens figuré : les animaux représentent des types humains"}'),

('Repérer l''implicite culturel', 2, 32000, 'Un texte peut faire référence à des réalités culturelles que le lecteur doit connaître.',
 '{"type":"mcq","question":"Texte québécois : «Il était aussi fier qu''un coq» fait allusion à...","options":["Un plat cuisiné","La fierté ou la vanité excessive","Un animal de ferme connu","La culture française"],"answer":"La fierté ou la vanité excessive"}'),

('Comprendre la structure d''une fiche informative', 2, 30000, 'Une fiche informative utilise des titres, sous-titres, listes et tableaux pour organiser l''information.',
 '{"type":"mcq","question":"Quelle structure permet le plus rapidement de trouver une information spécifique dans un long texte ?","options":["Un texte sans ponctuation","Un texte avec titres, sous-titres et table des matières","Un texte en prose continue","Un texte avec beaucoup d''images"],"answer":"Un texte avec titres, sous-titres et table des matières"}'),

('Identifier les éléments d''une biographie', 2, 30000, 'Une biographie raconte la vie d''une personne réelle. Elle inclut dates, lieux, accomplissements.',
 '{"type":"mcq","question":"Quelle information retrouve-t-on typiquement dans une biographie ?","options":["Des personnages fictifs","La date de naissance et les réalisations de la personne","Des instructions à suivre","Des arguments pour convaincre"],"answer":"La date de naissance et les réalisations de la personne"}'),

('Analyser la crédibilité d''une source', 2, 32000, 'La crédibilité dépend de l''auteur, de la date, de la source et des preuves fournies.',
 '{"type":"mcq","question":"Lequel de ces textes est généralement le plus crédible sur un sujet médical ?","options":["Un article de blogue anonyme","Un commentaire sur les réseaux sociaux","Un article publié dans une revue scientifique avec des références","Un avis de célébrité"],"answer":"Un article publié dans une revue scientifique avec des références"}'),

('Comprendre une note de bas de page', 2, 30000, 'Les notes de bas de page fournissent des informations supplémentaires ou les sources des affirmations.',
 '{"type":"mcq","question":"À quoi sert généralement une note de bas de page dans un texte académique ?","options":["À donner la définition du titre","À résumer le texte","À citer les sources ou ajouter des informations complémentaires","À indiquer l''auteur"],"answer":"À citer les sources ou ajouter des informations complémentaires"}'),

('Identifier la structure cause-effet', 2, 30000, 'Structure cause-effet : un événement (cause) entraîne un résultat (effet).',
 '{"type":"mcq","question":"Texte : «En raison de la sécheresse, les récoltes ont été très faibles cette année.» Quelle est la cause ?","options":["Les récoltes faibles","La sécheresse","Cette année","Les fermiers"],"answer":"La sécheresse"}'),

('Comprendre un tableau de données dans un texte', 2, 32000, 'Un tableau complète le texte en organisant clairement des données chiffrées.',
 '{"type":"mcq","question":"Un tableau dans un article montre : 2020 : 100 cas, 2021 : 150 cas, 2022 : 200 cas. Quelle tendance observe-t-on ?","options":["Le nombre de cas diminue","Le nombre de cas reste stable","Le nombre de cas augmente","Impossible à dire"],"answer":"Le nombre de cas augmente"}'),

('Comprendre l''ordre de présentation des arguments', 2, 32000, 'Un auteur efficace présente souvent ses arguments du moins fort au plus fort (crescendo).',
 '{"type":"mcq","question":"Un auteur présente 3 arguments de moins en moins importants. Quelle technique utilise-t-il ?","options":["Crescendo (du moins au plus fort)","Decrescendo (du plus au moins fort)","Structure chronologique","Structure causale"],"answer":"Decrescendo (du plus au moins fort)"}'),

-- DIFFICULTÉ 3 (29 questions)
('Analyser le point de vue du narrateur', 3, 45000, 'Narrateur omniscient = sait tout. Narrateur interne (je) = personnage qui raconte. Narrateur externe = observateur neutre.',
 '{"type":"mcq","question":"Texte : «Je me demandais ce que Julie pensait de moi en ce moment.» Quel type de narrateur est-ce ?","options":["Omniscient","Narrateur externe neutre","Narrateur interne (personnage)","Absent"],"answer":"Narrateur interne (personnage)"}'),

('Identifier le narrateur omniscient', 3, 45000, 'Le narrateur omniscient connaît les pensées de tous les personnages.',
 '{"type":"mcq","question":"Texte : «Marc ne savait pas qu''en ce moment même, Sophie pensait à lui avec nostalgie.» Ce narrateur est...","options":["Interne (Marc)","Interne (Sophie)","Externe limité","Omniscient"],"answer":"Omniscient"}'),

('Analyser l''ironie dans un texte', 3, 45000, 'L''ironie dit le contraire de ce qu''on pense. Le ton, le contexte ou les indices permettent de la reconnaître.',
 '{"type":"mcq","question":"Texte : «Quelle brillante idée que d''oublier ses clés à l''intérieur !» Quelle est la signification réelle de cette phrase ?","options":["Oublier ses clés est une bonne idée","Oublier ses clés est une erreur stupide","Les clés sont importantes","L''auteur est sincère"],"answer":"Oublier ses clés est une erreur stupide"}'),

('Analyser la visée d''un texte polémique', 3, 45000, 'Un texte polémique cherche à provoquer, à défendre une position controversée, à interpeller.',
 '{"type":"mcq","question":"Un éditorial de journal qui critique sévèrement une décision gouvernementale a pour visée principale de...","options":["Informer de façon neutre","Divertir les lecteurs","Provoquer la réflexion et critiquer","Expliquer scientifiquement"],"answer":"Provoquer la réflexion et critiquer"}'),

('Repérer les présupposés d''un texte', 3, 45000, 'Un présupposé est une information implicitement tenue pour vraie sans être affirmée directement.',
 '{"type":"mcq","question":"La question «Avez-vous arrêté de mentir ?» présuppose que...","options":["Vous ne mentez pas","Vous mentiez","Vous allez mentir","Aucun présupposé"],"answer":"Vous mentiez"}'),

('Analyser le rapport entre forme et fond', 3, 45000, 'La forme (style, structure) doit être adaptée au fond (contenu). Le fond peut changer selon la forme.',
 '{"type":"mcq","question":"Pourquoi un auteur choisirait-il un style fragmenté (phrases courtes, incomplètes) pour décrire une crise d''angoisse ?","options":["Pour faciliter la lecture","Pour imiter le rythme haché de la pensée angoissée","Pour respecter les règles grammaticales","Par manque de vocabulaire"],"answer":"Pour imiter le rythme haché de la pensée angoissée"}'),

('Comprendre l''intertextualité', 3, 45000, 'L''intertextualité est la relation entre un texte et d''autres textes (références, allusions, citations).',
 '{"type":"mcq","question":"Dans «Tel un Prométhée moderne, il voulut défier les dieux de la technologie», la référence à Prométhée crée...","options":["Une comparaison avec un héros mythologique qui souffre pour ses idéaux","Une allusion à la Grèce antique","Une métaphore sur la technologie","Un jeu de mots"],"answer":"Une comparaison avec un héros mythologique qui souffre pour ses idéaux"}'),

('Analyser la chute d''un texte narratif', 3, 45000, 'La chute est la fin surprenante d''une nouvelle ou d''un texte bref. Elle renverse les attentes.',
 '{"type":"mcq","question":"Une nouvelle se termine par une révélation inattendue qui change le sens de tout le récit. On appelle cela...","options":["Une amorce","Une péripétie","Une chute (twist)","Une description"],"answer":"Une chute (twist)"}'),

('Évaluer la cohérence d''un texte argumentatif', 3, 45000, 'Un texte argumentatif cohérent a une thèse claire, des arguments pertinents et une conclusion logique.',
 '{"type":"mcq","question":"Un texte argumente que «les écoles devraient interdire les téléphones» et conclut «les téléphones sont très utiles». Cette conclusion est...","options":["Cohérente avec la thèse","Incohérente, elle contredit la thèse","Acceptable car les deux idées sont vraies","Neutre"],"answer":"Incohérente, elle contredit la thèse"}'),

('Comprendre le sous-texte d''un dialogue', 3, 45000, 'Le sous-texte est ce que les personnages ne disent pas explicitement mais que le lecteur comprend.',
 '{"type":"mcq","question":"Dialogue : «−Comment vas-tu ? −Je fais avec.» Que comprend-on implicitement ?","options":["La personne va très bien","La personne est en difficulté mais ne veut pas en parler","La personne est indifférente","La personne est euphorique"],"answer":"La personne est en difficulté mais ne veut pas en parler"}'),

('Analyser un texte hybride (mixte)', 3, 45000, 'Un texte hybride combine plusieurs types. Ex : un roman historique mêle narration et faits historiques.',
 '{"type":"mcq","question":"Un roman qui intègre des documents historiques réels (lettres, photos) dans une fiction est de type...","options":["Purement fictif","Purement documentaire","Hybride (mixte fictif et documentaire)","Biographique"],"answer":"Hybride (mixte fictif et documentaire)"}'),

('Évaluer la pertinence des arguments', 3, 45000, 'Un argument pertinent soutient directement la thèse. Un argument hors-sujet affaiblit le texte.',
 '{"type":"mcq","question":"Thèse : «Il faut plus d''espaces verts en ville.» Quel argument est le MOINS pertinent ?","options":["Les espaces verts réduisent la pollution","Ils améliorent la santé mentale","Ils sont coûteux à entretenir","Les chiens de compagnie sont populaires"],"answer":"Les chiens de compagnie sont populaires"}'),

('Comprendre la focalisation dans un récit', 3, 45000, 'Focalisation zéro = omniscient. Focalisation interne = un personnage. Focalisation externe = observateur.',
 '{"type":"mcq","question":"Si un récit ne nous montre que ce qu''un personnage voit et pense, sans accès aux pensées des autres, c''est une focalisation...","options":["Zéro","Interne","Externe","Auctoriale"],"answer":"Interne"}'),

('Identifier les sophismes dans un texte', 3, 45000, 'Un sophisme est un argument qui semble logique mais qui est fallacieux.',
 '{"type":"mcq","question":"«Tout le monde utilise les réseaux sociaux, donc c''est forcément une bonne chose.» Ce raisonnement est un sophisme car...","options":["Il est bien fondé logiquement","La popularité ne prouve pas la valeur","Il manque d''exemples","Il est trop court"],"answer":"La popularité ne prouve pas la valeur"}'),

('Analyser la progression de l''information', 3, 45000, 'Progression à thème constant = même sujet repris. Progression linéaire = le propos de A devient thème de B.',
 '{"type":"mcq","question":"Texte : «Les abeilles pollinisent les fleurs. Cette pollinisation permet aux fruits de se former.» Quelle progression est utilisée ?","options":["Thème constant","Progression linéaire (propos de A = thème de B)","Structure chronologique","Structure argumentative"],"answer":"Progression linéaire (propos de A = thème de B)"}'),

('Lire entre les lignes : valeurs d''un auteur', 3, 45000, 'Un auteur transmet implicitement ses valeurs à travers ses choix narratifs et stylistiques.',
 '{"type":"mcq","question":"Un roman où les personnages riches sont toujours présentés comme corrompus et les pauvres comme vertueux transmet implicitement quelle valeur ?","options":["L''éloge des riches","Une critique des inégalités sociales","La neutralité sociale","L''indifférence aux classes sociales"],"answer":"Une critique des inégalités sociales"}'),

('Analyser la temporalité dans un récit', 3, 45000, 'Flashback = retour en arrière. Prospection = anticipation du futur. L''ordre peut différer de la chronologie.',
 '{"type":"mcq","question":"Un récit commence à la fin de l''histoire et revient au début pour expliquer comment on en est arrivé là. On appelle cela un...","options":["Flashback","Récit en flash-forward","Récit in medias res suivi d''un retour en arrière","Récit linéaire"],"answer":"Récit in medias res suivi d''un retour en arrière"}'),

('Comprendre un texte avec ellipses narratives', 3, 45000, 'Une ellipse narrative saute une période de temps sans la raconter.',
 '{"type":"mcq","question":"Texte : «Il quitta la ville à 18 ans. Vingt ans plus tard, il y revenait en vainqueur.» Qu''est-ce qu''une ellipse ici ?","options":["Le retour en ville","Les 20 années non racontées entre les deux moments","Le départ à 18 ans","Le fait d''être en vainqueur"],"answer":"Les 20 années non racontées entre les deux moments"}'),

('Analyser la description d''un espace symbolique', 3, 45000, 'Un espace peut avoir une valeur symbolique dans un texte (ex : la mer = liberté, la prison = contrainte).',
 '{"type":"mcq","question":"Dans un roman, un personnage enfermé dans une pièce sans fenêtres sent qu''il «étouffait». Que symbolise cet espace ?","options":["Le confort","L''emprisonnement et la privation de liberté","La richesse","La nature"],"answer":"L''emprisonnement et la privation de liberté"}'),

('Comprendre la polyphonie textuelle', 3, 45000, 'Un texte peut faire entendre plusieurs voix (auteur, narrateur, personnages, autres textes). C''est la polyphonie.',
 '{"type":"mcq","question":"Un roman qui cite des articles de journaux réels, intègre des discours politiques et la narration d''un personnage fictif illustre...","options":["Une structure linéaire","La polyphonie textuelle (plusieurs voix)","Un texte purement fictif","Un texte descriptif"],"answer":"La polyphonie textuelle (plusieurs voix)"}'),

('Analyser le dénouement d''un récit', 3, 45000, 'Le dénouement est la résolution de l''intrigue. Il peut être fermé (résolution complète) ou ouvert (ambigu).',
 '{"type":"mcq","question":"Un roman se termine sans résoudre le conflit principal, laissant le lecteur dans l''incertitude. On dit que le dénouement est...","options":["Fermé","Heureux","Ouvert (ou ambiguë)","Tragique"],"answer":"Ouvert (ou ambiguë)"}'),

('Comprendre la modalisation dans un texte', 3, 45000, 'La modalisation montre l''attitude du locuteur face à ce qu''il dit : certitude, doute, probabilité.',
 '{"type":"mcq","question":"Dans «Il semblerait que la situation s''améliore», le verbe «semblerait» indique...","options":["Une certitude absolue","Un doute ou une réserve de l''auteur","Un fait vérifiable","Une conviction personnelle forte"],"answer":"Un doute ou une réserve de l''auteur"}'),

('Identifier un biais dans un texte', 3, 45000, 'Un biais est une distorsion involontaire ou volontaire dans la présentation de l''information.',
 '{"type":"mcq","question":"Un article sur les véhicules électriques ne présente que des avantages sans mentionner aucun inconvénient. Cela constitue...","options":["Un texte équilibré","Un biais de confirmation ou de présentation partiale","Un texte descriptif","Un texte neutre"],"answer":"Un biais de confirmation ou de présentation partiale"}'),

('Comprendre un texte épistolaire', 3, 45000, 'Un texte épistolaire est sous forme de lettres. Il a un destinataire, une salutation, un corps et une conclusion.',
 '{"type":"mcq","question":"Quelle particularité définit un roman épistolaire ?","options":["Il est écrit en vers","Il est composé de lettres échangées entre des personnages","Il n''a pas de narrateur","Il est illustré"],"answer":"Il est composé de lettres échangées entre des personnages"}'),

('Analyser le registre lyrique', 3, 45000, 'Le registre lyrique exprime les sentiments intimes et profonds de l''auteur ou du narrateur.',
 '{"type":"mcq","question":"Un poème où l''auteur exprime sa tristesse face à la perte d''un être cher utilise le registre...","options":["Épique","Comique","Lyrique","Satirique"],"answer":"Lyrique"}'),

('Analyser le registre épique', 3, 42000, 'Le registre épique met en valeur des exploits héroïques, des actions grandioses, souvent hyperboliques.',
 '{"type":"mcq","question":"Un récit où un héros affronte seul une armée entière et sort vainqueur utilise le registre...","options":["Comique","Lyrique","Épique","Didactique"],"answer":"Épique"}'),

('Évaluer l''efficacité d''une conclusion', 3, 45000, 'Une bonne conclusion résume les points essentiels, répond à la problématique et ouvre une perspective.',
 '{"type":"mcq","question":"Une conclusion qui répète mot pour mot l''introduction est...","options":["Efficace car elle renforce les idées","Inefficace car elle n''apporte rien de nouveau","Appropriée dans les textes littéraires","Obligatoire dans les textes scientifiques"],"answer":"Inefficace car elle n''apporte rien de nouveau"}'),

('Analyser le rapport titre-texte', 3, 42000, 'Le titre peut annoncer le sujet, créer une attente, être symbolique ou créer un effet de surprise.',
 '{"type":"mcq","question":"Un roman s''intitule «Le Silence» mais raconte l''histoire d''un musicien bruyant. Ce rapport entre titre et contenu crée...","options":["Une incohérence","Un effet ironique ou paradoxal","Une erreur de l''auteur","Un simple résumé du livre"],"answer":"Un effet ironique ou paradoxal"}'),

('Comprendre la satire', 3, 45000, 'La satire critique la société ou des individus en les tournant en ridicule, avec humour ou ironie.',
 '{"type":"mcq","question":"Un texte qui exagère les défauts d''un homme politique pour les rendre ridicules et critiquer ses décisions est un texte...","options":["Biographique","Satirique","Épistolaire","Lyrique"],"answer":"Satirique"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
