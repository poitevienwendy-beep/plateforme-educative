-- ============================================================
-- BANQUE DE QUESTIONS — Compréhension de texte (Sec. 1, Français)
-- PFEQ-FRA-SEC1-COMP | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- Note : Les questions portent sur des extraits courts inclus dans l''énoncé.
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-COMP') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Repérage d''informations explicites (34 questions) ──────

('Idée principale d''un paragraphe', 1, 30000, 'L''idée principale est ce dont parle principalement le paragraphe. Les autres phrases donnent des détails.',
 '{"type":"mcq","question":"Lisez : « Le loup est un animal social. Il vit en meute et chasse en groupe. Les membres de la meute se partagent les tâches. » Quelle est l''idée principale ?","options":["Le loup mange de la viande","Le loup est un animal solitaire","Le loup est un animal social qui vit en groupe","Le loup est dangereux"],"answer":"Le loup est un animal social qui vit en groupe"}'),

('Repérage d''une information explicite', 1, 25000, 'Une information explicite est directement écrite dans le texte, sans interprétation nécessaire.',
 '{"type":"mcq","question":"Lisez : « La tour Eiffel, construite en 1889, mesure 330 mètres. » Quelle est la hauteur de la tour Eiffel ?","options":["189 mètres","300 mètres","330 mètres","1889 mètres"],"answer":"330 mètres"}'),

('Repérage de la date', 1, 25000, 'Repérer une information de temps directement dans le texte.',
 '{"type":"mcq","question":"Lisez : « En 1969, l''astronaute Neil Armstrong fut le premier homme à marcher sur la Lune. » En quelle année cet événement a-t-il eu lieu ?","options":["1966","1969","1979","1996"],"answer":"1969"}'),

('Repérage du lieu', 1, 25000, 'Le lieu est une information de contexte souvent mentionnée explicitement dans le texte.',
 '{"type":"mcq","question":"Lisez : « Emma habitait à Lyon, mais elle rêvait de s''installer à Paris un jour. » Où habite Emma actuellement ?","options":["Paris","Marseille","Lyon","Bordeaux"],"answer":"Lyon"}'),

('Repérage du personnage principal', 1, 25000, 'Le personnage principal est celui dont parle le plus souvent le texte.',
 '{"type":"mcq","question":"Lisez : « Chaque matin, Lucas se levait avant l''aube. Il préparait son sac, vérifiait sa montre et partait en courant. » De qui parle principalement ce texte ?","options":["D''une montre","D''une aube","De Lucas","D''un sac"],"answer":"De Lucas"}'),

('Ordre chronologique', 1, 30000, 'L''ordre chronologique correspond à l''ordre dans lequel les événements se produisent dans le temps.',
 '{"type":"mcq","question":"Lisez : « D''abord il mangea, puis il se lava les dents et enfin il alla dormir. » Quelle action a eu lieu en deuxième ?","options":["Manger","Se laver les dents","Aller dormir","Se réveiller"],"answer":"Se laver les dents"}'),

('Cause et effet explicite', 1, 30000, 'La cause explique pourquoi quelque chose se produit. L''effet est ce qui en résulte.',
 '{"type":"mcq","question":"Lisez : « Il pleuvait à verse, alors le match a été annulé. » Quelle est la cause de l''annulation du match ?","options":["Il faisait soleil","Le match n''était pas organisé","Il pleuvait à verse","Les joueurs étaient absents"],"answer":"Il pleuvait à verse"}'),

('Synonyme dans le texte', 1, 30000, 'Les auteurs utilisent des synonymes pour éviter les répétitions. Il faut identifier à quoi chaque terme réfère.',
 '{"type":"mcq","question":"Lisez : « Le félin s''approcha de sa proie. Ce grand chat sauvage l''observait. » À qui fait référence « ce grand chat sauvage » ?","options":["À la proie","À un chat domestique","Au félin","À un chasseur"],"answer":"Au félin"}'),

('Comprendre un enchaînement', 1, 30000, 'Comprendre l''enchaînement des événements dans un récit.',
 '{"type":"mcq","question":"Lisez : « Marie trouva une clé dans la rue. Elle la rapporta au commissariat. La police identifia son propriétaire. » Que fit Marie avec la clé ?","options":["Elle la garda","Elle la perdit","Elle la rapporta au commissariat","Elle la jeta"],"answer":"Elle la rapporta au commissariat"}'),

('Repérage d''un chiffre précis', 1, 25000, 'Les chiffres et statistiques sont souvent des informations précises à repérer dans un texte.',
 '{"type":"mcq","question":"Lisez : « Le Saint-Laurent mesure environ 3 058 km de long. Il traverse le Québec. » Quelle est la longueur du Saint-Laurent ?","options":["3 000 km","3 058 km","3 580 km","5 000 km"],"answer":"3 058 km"}'),

('Sujet du texte', 1, 25000, 'Le sujet du texte est le thème général dont il traite.',
 '{"type":"mcq","question":"Lisez : « Les abeilles jouent un rôle crucial dans la pollinisation. Sans elles, de nombreuses plantes ne pourraient pas se reproduire. Leur disparition menacerait notre alimentation. » De quoi parle ce texte ?","options":["Des fleurs","De l''alimentation humaine","De l''importance des abeilles","Du miel"],"answer":"De l''importance des abeilles"}'),

('Identification du type de texte', 1, 25000, 'Reconnaître si un texte est narratif (récit), informatif (explications), argumentatif (opinions) ou descriptif.',
 '{"type":"mcq","question":"Lisez : « Le castor est un mammifère semi-aquatique. Il mesure environ 90 cm et pèse entre 11 et 32 kg. Il est reconnaissable à sa queue plate. » Quel type de texte est-ce ?","options":["Narratif","Informatif","Argumentatif","Poétique"],"answer":"Informatif"}'),

('Repérage du locuteur', 1, 25000, 'Identifier qui parle dans le texte (le narrateur ou un personnage) est essentiel.',
 '{"type":"mcq","question":"Lisez : « \" Je reviendrai demain \" , dit-elle en fermant la porte. » Qui dit cette phrase ?","options":["Le narrateur","Un personnage masculin","Un personnage féminin","On ne sait pas"],"answer":"Un personnage féminin"}'),

('Signification d''un mot en contexte', 1, 30000, 'Le contexte du texte aide à comprendre le sens d''un mot inconnu.',
 '{"type":"mcq","question":"Lisez : « Les arbres hirsutes, dont les branches s''enchevêtraient en tous sens, rendaient la forêt presque impénétrable. » Que signifie « hirsutes » dans ce contexte ?","options":["Grands","En désordre","Sains","Colorés"],"answer":"En désordre"}'),

('Repérage d''une liste', 1, 25000, 'Repérer des éléments d''une liste ou d''une énumération dans un texte.',
 '{"type":"mcq","question":"Lisez : « Pour faire une omelette, vous aurez besoin d''œufs, de lait, de sel et d''huile. » Combien d''ingrédients sont mentionnés ?","options":["2","3","4","5"],"answer":"4"}'),

('Repérage d''un comportement', 1, 30000, 'Repérer ce que fait ou dit un personnage dans un récit.',
 '{"type":"mcq","question":"Lisez : « Quand Zoé rentra chez elle, elle posa son sac, ôta ses chaussures et s''installa sur le canapé. » Que fit Zoé en dernier ?","options":["Poser son sac","Ôter ses chaussures","S''installer sur le canapé","Entrer chez elle"],"answer":"S''installer sur le canapé"}'),

('Repérage de la conclusion', 1, 30000, 'La conclusion d''un texte est généralement dans le dernier paragraphe ou la dernière phrase.',
 '{"type":"mcq","question":"Lisez : « Les jeunes doivent manger équilibré. Une bonne alimentation favorise la concentration. C''est pourquoi l''école devrait améliorer ses menus. » Quelle est la conclusion de l''auteur ?","options":["Les jeunes mangent mal","La concentration est importante","L''école devrait améliorer ses menus","Une bonne alimentation favorise la santé"],"answer":"L''école devrait améliorer ses menus"}'),

('Identifier le mode narratif', 1, 25000, 'On peut raconter à la 1re personne (je) ou à la 3e personne (il, elle).',
 '{"type":"mcq","question":"Lisez : « Je regardais par la fenêtre quand j''aperçus l''inconnu. » À quelle personne ce récit est-il écrit ?","options":["À la 2e personne (tu)","À la 1re personne (je)","À la 3e personne (il)","À la 4e personne"],"answer":"À la 1re personne (je)"}'),

('Repérer une comparaison dans le texte', 1, 30000, 'Une comparaison utilise comme, tel, pareil à.',
 '{"type":"mcq","question":"Lisez : « Elle courait comme le vent, effleurant à peine le sol. » Quel outil de comparaison est utilisé ?","options":["ainsi que","tel","comme","pareil à"],"answer":"comme"}'),

('Intention de l''auteur', 1, 30000, 'L''intention de l''auteur est le but qu''il poursuit : informer, convaincre, divertir, émouvoir.',
 '{"type":"mcq","question":"Lisez : « Le recyclage est essentiel. Chaque geste compte. Commencez aujourd''hui à trier vos déchets. » Quelle est l''intention de l''auteur ?","options":["Raconter une histoire","Décrire un paysage","Convaincre le lecteur d''agir","Informer sur l''histoire du recyclage"],"answer":"Convaincre le lecteur d''agir"}'),

('Repérer un dialogue', 1, 25000, 'Dans un texte narratif, le dialogue est indiqué par des guillemets, des tirets ou des deux-points.',
 '{"type":"mcq","question":"Lisez : « — Viens avec moi, dit Paul. — Je ne peux pas, répondit Anne. » Combien de personnages parlent dans cet extrait ?","options":["1","2","3","On ne sait pas"],"answer":"2"}'),

('Repérage de l''adjectif décrivant un personnage', 1, 25000, 'Les adjectifs servent à décrire les personnages physiquement ou moralement.',
 '{"type":"mcq","question":"Lisez : « Le vieux professeur, fatigué mais souriant, distribuait les examens. » Quels adjectifs décrivent le professeur ?","options":["examens, distribuait","vieux, fatigué, souriant","vieux, professeur","fatigué, distribuait"],"answer":"vieux, fatigué, souriant"}'),

('Repérer une opinion vs un fait', 1, 30000, 'Un fait est vérifiable. Une opinion exprime un point de vue personnel.',
 '{"type":"mcq","question":"Laquelle de ces phrases est un FAIT et non une opinion ?","options":["La pizza est le meilleur plat du monde.","Les frites sont délicieuses.","Le Canada a 10 provinces.","L''été est la meilleure saison."],"answer":"Le Canada a 10 provinces."}'),

('Repérage du temps du récit', 1, 25000, 'Les marqueurs de temps indiquent quand se déroule l''action (hier, demain, à cette époque…)',
 '{"type":"mcq","question":"Lisez : « Au Moyen Âge, les chevaliers portaient des armures de métal et montaient à cheval. » À quelle époque se passe cette description ?","options":["De nos jours","À l''époque préhistorique","Au Moyen Âge","Au 19e siècle"],"answer":"Au Moyen Âge"}'),

('Repérage du problème dans un récit', 1, 30000, 'Dans un récit, l''élément déclencheur ou le problème est ce qui change la situation initiale.',
 '{"type":"mcq","question":"Lisez : « Tout allait bien pour Léa jusqu''au jour où elle perdit ses clés. Elle ne pouvait plus entrer chez elle. » Quel est le problème de Léa ?","options":["Elle est en retard","Elle a perdu ses clés","Elle est fatiguée","Elle n''aime pas sa maison"],"answer":"Elle a perdu ses clés"}'),

('Repérage de la solution dans un récit', 1, 30000, 'La solution ou le dénouement est la façon dont le problème est résolu dans le récit.',
 '{"type":"mcq","question":"Lisez : « Léa avait perdu ses clés. Elle appela un serrurier qui vint ouvrir la porte en 10 minutes. » Comment Léa a-t-elle résolu son problème ?","options":["Elle a trouvé ses clés","Elle a appelé ses parents","Elle a attendu dehors","Elle a appelé un serrurier"],"answer":"Elle a appelé un serrurier"}'),

('Repérage du thème principal', 1, 25000, 'Le thème principal est le sujet principal abordé tout au long du texte.',
 '{"type":"mcq","question":"Lisez un résumé : « Un jeune garçon quitte sa famille pour vivre une grande aventure. Il affronte des dangers et rencontre des alliés avant de rentrer chez lui transformé. » Quel est le thème principal ?","options":["La famille","Le voyage et la transformation personnelle","La nature","La violence"],"answer":"Le voyage et la transformation personnelle"}'),

('Repérer un marqueur de relation', 1, 25000, 'Les marqueurs de relation relient les idées entre elles dans un texte.',
 '{"type":"mcq","question":"Lisez : « Il travaille dur. Cependant, ses résultats restent faibles. » Quel est le rapport logique entre les deux phrases ?","options":["Cause","Conséquence","Opposition","Addition"],"answer":"Opposition"}'),

('Dégager l''ambiance d''un texte', 1, 30000, 'L''ambiance est l''atmosphère générale créée par le vocabulaire et les images du texte.',
 '{"type":"mcq","question":"Lisez : « Un vent glacial hurlait. Les branches craquaient. L''obscurité était totale. » Quelle ambiance se dégage de ce texte ?","options":["Joyeuse et lumineuse","Angoissante et sombre","Calme et sereine","Comique et légère"],"answer":"Angoissante et sombre"}'),

('Repérer un exemple dans un texte argumentatif', 1, 30000, 'Dans un texte argumentatif, les exemples viennent appuyer les arguments.',
 '{"type":"mcq","question":"Lisez : « Le sport est bénéfique pour la santé. Par exemple, la natation développe les poumons et les muscles. » Quel est le rôle de la deuxième phrase ?","options":["C''est l''argument principal","C''est un contre-argument","C''est un exemple qui appuie l''argument","C''est la conclusion"],"answer":"C''est un exemple qui appuie l''argument"}'),

('Repérer un mot de liaison — addition', 1, 25000, 'Les mots de liaison d''addition : de plus, en outre, également, par ailleurs, aussi, et.',
 '{"type":"mcq","question":"Lisez : « Ce médicament soulage la douleur. De plus, il réduit l''inflammation. » Que signifie « de plus » dans ce texte ?","options":["Il s''oppose à la première idée","Il donne une cause","Il ajoute une information supplémentaire","Il explique comment"],"answer":"Il ajoute une information supplémentaire"}'),

('Repérage d''un titre approprié', 1, 25000, 'Le titre d''un texte résume son contenu principal.',
 '{"type":"mcq","question":"Lisez : « Les baleines sont les plus grands animaux qui aient jamais existé. Certaines espèces peuvent mesurer jusqu''à 30 mètres. Elles vivent dans tous les océans. » Quel titre conviendrait le mieux ?","options":["La vie marine","L''océan Pacifique","Les baleines, géantes des mers","Les animaux en danger"],"answer":"Les baleines, géantes des mers"}'),

('Repérer l''émotion d''un personnage', 1, 30000, 'Les émotions d''un personnage peuvent être exprimées directement ou indirectement par ses actions.',
 '{"type":"mcq","question":"Lisez : « Sophie lisait la lettre, les mains tremblantes et les larmes aux yeux. » Quelle émotion ressent Sophie ?","options":["La joie","L''ennui","L''émotion ou la peine","La colère"],"answer":"L''émotion ou la peine"}'),

-- ── DIFFICULTÉ 2 — Inférence et interprétation (33 questions) ─────────────

('Inférence — sens implicite', 2, 40000, 'Une information implicite n''est pas écrite directement mais peut être déduite du texte.',
 '{"type":"mcq","question":"Lisez : « Pierre alla se coucher à 22h. À 6h, son réveil sonna. » Combien d''heures a-t-il dormi ?","options":["6 heures","7 heures","8 heures","9 heures"],"answer":"8 heures"}'),

('Inférence — situation', 2, 40000, 'Il faut parfois déduire le contexte à partir d''indices dans le texte.',
 '{"type":"mcq","question":"Lisez : « Elle prit son plateau et s''assit. Un serveur vint lui tendre le menu. » Où se trouve-t-elle ?","options":["Chez elle","À l''école","Au restaurant","À l''hôpital"],"answer":"Au restaurant"}'),

('Identifier le ton de l''auteur', 2, 40000, 'Le ton peut être ironique, neutre, enthousiaste, critique, mélancolique, etc.',
 '{"type":"mcq","question":"Lisez : « Quelle magnifique idée de construire une autoroute à travers le seul parc naturel de la région. Bravo aux élus ! » Quel est le ton de ce texte ?","options":["Enthousiaste","Ironique","Informatif","Romantique"],"answer":"Ironique"}'),

('Déduire le sens d''un mot inconnu', 2, 40000, 'Le contexte permet souvent de déduire le sens d''un mot inconnu.',
 '{"type":"mcq","question":"Lisez : « La sérénade du violon emplissait la nuit. Les voisins, réveillés, restaient immobiles, subjugués par cette musique envoûtante. » Que signifie « subjugués » ?","options":["En colère","Indifférents","Ensorcelés, fascinés","Endormis"],"answer":"Ensorcelés, fascinés"}'),

('Analyser un personnage à partir de ses actions', 2, 40000, 'On peut déduire les traits de caractère d''un personnage à partir de ce qu''il fait ou dit.',
 '{"type":"mcq","question":"Lisez : « Chaque semaine, il apportait des fleurs à sa voisine âgée et l''aidait à faire ses courses. » Quel trait de caractère cela révèle-t-il ?","options":["Son égoïsme","Sa générosité et son empathie","Sa timidité","Son ambition"],"answer":"Sa générosité et son empathie"}'),

('Distinguer l''opinion du fait', 2, 40000, 'Il faut distinguer ce qui est une opinion (subjective) de ce qui est un fait (vérifiable).',
 '{"type":"mcq","question":"Lisez : « La température a atteint 35°C hier. C''était une journée insupportable. » Laquelle de ces affirmations est un FAIT ?","options":["C''était une journée insupportable","La chaleur est toujours terrible","Il a fait 35°C","Tout le monde souffrait de la chaleur"],"answer":"Il a fait 35°C"}'),

('Identifier la structure d''un texte argumentatif', 2, 40000, 'Un texte argumentatif a une thèse (position), des arguments et une conclusion.',
 '{"type":"mcq","question":"Dans un texte argumentatif bien structuré, dans quel ordre apparaissent généralement ces éléments ?","options":["Arguments, thèse, conclusion","Conclusion, arguments, thèse","Thèse, arguments, conclusion","Conclusion, thèse, arguments"],"answer":"Thèse, arguments, conclusion"}'),

('Analyser l''effet d''une figure de style', 2, 40000, 'Les figures de style créent des effets précis : dramatisation, humour, beauté, etc.',
 '{"type":"mcq","question":"Lisez : « Il avait attendu une éternité pour cette rencontre. » Quel est l''effet produit par l''hyperbole « une éternité » ?","options":["Indique le temps exact","Minimise l''attente","Insiste sur la longueur de l''attente","Montre que c''est impossible"],"answer":"Insiste sur la longueur de l''attente"}'),

('Identifier le point de vue', 2, 40000, 'Le point de vue narratif influence notre perception de l''histoire. Narrateur omniscient vs témoin.',
 '{"type":"mcq","question":"Lisez : « Elle pensa qu''il l''avait oubliée. Lui, pendant ce temps, cherchait désespérément son numéro. » Quel type de narrateur est-ce ?","options":["Narrateur à la 1re personne","Narrateur témoin","Narrateur omniscient","Narrateur absent"],"answer":"Narrateur omniscient"}'),

('Comprendre une métaphore dans un texte', 2, 40000, 'Il faut interpréter les métaphores pour comprendre le sens profond d''un texte.',
 '{"type":"mcq","question":"Lisez : « L''adolescence est un pont étroit entre l''enfance et l''âge adulte. » Que veut dire l''auteur ?","options":["Les adolescents aiment les ponts","L''adolescence est une période de transition","Les adolescents sont étroits d''esprit","L''enfance est plus longue que l''adolescence"],"answer":"L''adolescence est une période de transition"}'),

('Repérage d''une conséquence implicite', 2, 40000, 'Certaines conséquences ne sont pas explicitement nommées mais peuvent être déduites.',
 '{"type":"mcq","question":"Lisez : « Il neigea abondamment toute la nuit. Le lendemain matin, les écoliers sautaient de joie. » Pourquoi les écoliers sautaient-ils de joie ?","options":["Parce qu''ils avaient fini leurs examens","Parce que l''école était probablement fermée","Parce qu''ils aimaient l''hiver","Parce que c''était leur anniversaire"],"answer":"Parce que l''école était probablement fermée"}'),

('Comprendre un texte poétique', 2, 40000, 'Un texte poétique utilise des images et des figures de style pour créer des effets sonores et de sens.',
 '{"type":"mcq","question":"Lisez : « Le vent siffle sa complainte dans les arbres dénudés. » À quelle saison fait-on allusion ?","options":["Le printemps","L''été","L''automne ou l''hiver","Toutes les saisons"],"answer":"L''automne ou l''hiver"}'),

('Analyser la structure narrative', 2, 40000, 'Un récit typique suit une structure : situation initiale → élément déclencheur → péripéties → dénouement → situation finale.',
 '{"type":"mcq","question":"Dans la structure narrative, à quel moment le problème principal est-il introduit ?","options":["Dans la situation initiale","Dans l''élément déclencheur","Dans le dénouement","Dans la situation finale"],"answer":"Dans l''élément déclencheur"}'),

('Vocabulaire de l''argumentation', 2, 35000, 'Les textes argumentatifs utilisent des marqueurs spécifiques : en effet, d''abord, de plus, cependant, c''est pourquoi.',
 '{"type":"mcq","question":"Dans la phrase « Les activités physiques sont bénéfiques ; c''est pourquoi l''école devrait offrir plus de cours d''éducation physique », quel est le rapport logique exprimé par « c''est pourquoi » ?","options":["Opposition","Addition","Cause","Conséquence"],"answer":"Conséquence"}'),

('Identifier la thèse d''un texte', 2, 40000, 'La thèse est la position ou l''opinion principale que défend l''auteur d''un texte argumentatif.',
 '{"type":"mcq","question":"Lisez : « Les jeunes passent trop de temps sur les écrans. Cela nuit à leur sommeil, leur concentration et leurs relations sociales. Il est urgent de limiter ce temps d''écran. » Quelle est la thèse de l''auteur ?","options":["Les écrans sont utiles","Les jeunes dorment trop","Il faut limiter le temps d''écran des jeunes","Les écrans sont modernes"],"answer":"Il faut limiter le temps d''écran des jeunes"}'),

('Analyser un texte descriptif', 2, 40000, 'Un texte descriptif utilise des adjectifs, des comparaisons et des figures de style pour brosser un portrait ou un tableau.',
 '{"type":"mcq","question":"Lisez : « La vieille maison se dressait au bout du chemin, ses volets verts délavés par les années, sa façade lézardée par le temps. » Quel procédé stylistique trouve-t-on dans cet extrait ?","options":["La personnification","L''énumération","L''hyperbole","La comparaison"],"answer":"L''énumération"}'),

('Déduire l''époque d''un texte', 2, 40000, 'Les indices lexicaux (mots, technologie, mode) permettent de situer l''époque d''un texte.',
 '{"type":"mcq","question":"Lisez : « Il envoya un télégramme urgent à sa famille pour leur annoncer son retour. » À quelle époque se passe probablement ce récit ?","options":["De nos jours","Au 19e ou début 20e siècle","À la préhistoire","Dans le futur"],"answer":"Au 19e ou début 20e siècle"}'),

-- ── DIFFICULTÉ 3 — Analyse critique et synthèse (33 questions) ────────────

('Analyser le schéma actanciel', 3, 55000, 'Le schéma actanciel identifie le sujet, l''objet, le destinataire, les adjuvants et les opposants.',
 '{"type":"mcq","question":"Dans un récit où un chevalier part chercher un trésor pour sauver son royaume, quel est l''objet de la quête ?","options":["Le chevalier","Le royaume","Le trésor","Les ennemis"],"answer":"Le trésor"}'),

('Analyser l''évolution d''un personnage', 3, 55000, 'Un personnage qui évolue est dynamique. Un personnage qui ne change pas est statique.',
 '{"type":"mcq","question":"Dans un roman où un personnage égoïste finit par se sacrifier pour les autres, quel mot décrit ce personnage ?","options":["Statique","Antagoniste","Dynamique","Secondaire"],"answer":"Dynamique"}'),

('Distinguer récit et discours', 3, 55000, 'Le récit rapporte des événements passés (imparfait, passé simple). Le discours implique une situation d''énonciation présente (présent, futur).',
 '{"type":"mcq","question":"Laquelle de ces phrases appartient clairement au récit (et non au discours) ?","options":["Je te parlerai demain.","Il neige en ce moment.","Le roi mourut à l''aurore, terrassé par la fièvre.","Viens ici tout de suite !"],"answer":"Le roi mourut à l''aurore, terrassé par la fièvre."}'),

('Analyser la visée d''un texte', 3, 55000, 'La visée d''un texte est l''objectif recherché par l''auteur (informer, convaincre, divertir, émouvoir, instruire).',
 '{"type":"mcq","question":"Un texte qui décrit les dangers du tabac et demande de ne pas fumer a principalement quelle visée ?","options":["Divertir","Décrire","Convaincre/inciter","Raconter une histoire"],"answer":"Convaincre/inciter"}'),

('Analyser un texte littéraire — symbole', 3, 60000, 'Un symbole est un élément du texte qui représente quelque chose de plus grand ou d''abstrait.',
 '{"type":"mcq","question":"Dans un roman où la lumière du soleil symbolise l''espoir, que signifie une scène où le protagoniste sort de la cave et voit le soleil pour la première fois ?","options":["Il fait beau","Il va se brûler","Il retrouve l''espoir","Il fait jour"],"answer":"Il retrouve l''espoir"}'),

('Comparer deux textes sur le même sujet', 3, 60000, 'Comparer deux textes sur le même sujet permet de dégager leurs ressemblances et différences dans leur approche.',
 '{"type":"mcq","question":"Texte A : «Le sport est essentiel pour la santé.» Texte B : «Le sport peut causer des blessures graves.» Quelle relation y a-t-il entre ces deux textes ?","options":["Ils sont identiques","Ils se contredisent","Ils parlent de sujets différents","L''un est plus long que l''autre"],"answer":"Ils se contredisent"}'),

('Analyser un contre-argument', 3, 55000, 'Un bon texte argumentatif présente et réfute les contre-arguments pour renforcer sa position.',
 '{"type":"mcq","question":"Lisez : « Certains diront que les téléphones nuisent aux jeunes. Cependant, bien utilisés, ils peuvent être de précieux outils d''apprentissage. » Quelle est la structure de cet extrait ?","options":["Thèse + argument","Contre-argument + réfutation","Argument + exemple","Problème + solution"],"answer":"Contre-argument + réfutation"}'),

('Identifier la modalisation', 3, 55000, 'La modalisation est l''ensemble des mots qui indiquent le degré de certitude du locuteur (peut-être, sans doute, certainement).',
 '{"type":"mcq","question":"Dans « Il semble que cette théorie soit inexacte », quel mot exprime la modalisation (le degré d''incertitude) ?","options":["cette","théorie","Il semble","inexacte"],"answer":"Il semble"}'),

('Analyser la narratologie', 3, 55000, 'La focalisation détermine qui voit dans un récit. Focalisation zéro = omniscient; interne = à travers un personnage; externe = témoin.',
 '{"type":"mcq","question":"Lisez : « Elle ouvrit la porte sans savoir ce qui l''attendait derrière. » Quel type de focalisation est utilisé ?","options":["Focalisation zéro (omnisciente)","Focalisation interne (à travers le personnage)","Focalisation externe (observateur neutre)","Pas de focalisation"],"answer":"Focalisation interne (à travers le personnage)"}'),

('Analyser un texte poétique en profondeur', 3, 60000, 'Un poème peut utiliser plusieurs figures de style simultanément pour créer une image riche.',
 '{"type":"mcq","question":"Dans « Mes sœurs, les étoiles, clignotent pour me consoler » (extrait fictif), quelles figures de style sont utilisées ?","options":["Comparaison et hyperbole","Personnification et métaphore","Litote et antithèse","Gradation et synecdoque"],"answer":"Personnification et métaphore"}'),

('Inférence culturelle', 3, 60000, 'Certains textes font référence à des éléments culturels (mythologie, littérature) qu''il faut connaître pour bien les comprendre.',
 '{"type":"mcq","question":"Lisez : « Comme Sisyphe, il recommençait chaque jour le même travail inutile. » Que signifie cette référence à Sisyphe ?","options":["Il est très fort","Il doit pousser un rocher","Il fait un travail répétitif et sans fin","Il est heureux"],"answer":"Il fait un travail répétitif et sans fin"}'),

('Synthèse de plusieurs paragraphes', 3, 60000, 'Synthétiser un texte consiste à dégager les idées principales de chaque partie et à les relier.',
 '{"type":"mcq","question":"Un texte parle d''abord des avantages des énergies renouvelables (§1), puis des défis techniques (§2), puis propose des solutions (§3). Quel est le schéma général du texte ?","options":["Problème → causes → effets","Avantages → obstacles → recommandations","Thèse → antithèse → synthèse","Début → milieu → fin"],"answer":"Avantages → obstacles → recommandations"}'),

('Analyser un texte courant vs littéraire', 3, 55000, 'Un texte courant vise l''efficacité de communication. Un texte littéraire vise l''expression artistique.',
 '{"type":"mcq","question":"Lequel de ces textes est de type LITTÉRAIRE ?","options":["Mode d''emploi d''un aspirateur","Article de journal sur les élections","Poème de Nelligan sur la solitude","Recette de cuisine"],"answer":"Poème de Nelligan sur la solitude"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
