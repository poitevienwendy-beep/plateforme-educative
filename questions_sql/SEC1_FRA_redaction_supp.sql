-- Supplément SEC1_FRA_redaction : +91 questions (59 → 150)
-- PFEQ-FRA-SEC1-RED

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-RED') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (31 questions)
('Structure d''un paragraphe', 1, 22000, 'Un paragraphe bien structuré contient une phrase-clé, des idées secondaires et une conclusion partielle.',
 '{"type":"mcq","question":"Quelle est la structure de base d''un bon paragraphe de développement ?","options":["Uniquement des exemples","Idée principale + explications/exemples + phrase de clôture","Seulement une longue liste de faits","Une seule phrase très longue"],"answer":"Idée principale + explications/exemples + phrase de clôture"}'),

('Identifier une phrase d''introduction', 1, 20000, 'L''introduction présente le sujet, capte l''intérêt du lecteur et annonce le plan.',
 '{"type":"mcq","question":"Quel élément NE fait PAS partie d''une introduction efficace ?","options":["Le sujet du texte","La conclusion du texte","L''annonce du plan","Le sujet amené"],"answer":"La conclusion du texte"}'),

('Identifier la phrase de clôture d''un paragraphe', 1, 20000, 'La phrase de clôture résume le paragraphe et assure la transition vers la suite.',
 '{"type":"mcq","question":"À quoi sert la phrase de clôture d''un paragraphe ?","options":["À introduire un nouveau sujet","À résumer l''idée principale et assurer la transition","À poser une question au lecteur","À citer une source"],"answer":"À résumer l''idée principale et assurer la transition"}'),

('Choisir le bon marqueur de relation', 1, 20000, 'Les marqueurs de relation organisent le texte. «De plus» ajoute, «cependant» oppose, «donc» conclut.',
 '{"type":"mcq","question":"Quelle phrase utilise correctement un marqueur d''addition ?","options":["Les abeilles sont utiles. Cependant, elles produisent du miel.","Les abeilles sont utiles. De plus, elles produisent du miel.","Les abeilles sont utiles. Donc, elles produisent du miel.","Les abeilles sont utiles. D''abord, elles produisent du miel."],"answer":"Les abeilles sont utiles. De plus, elles produisent du miel."}'),

('Identifier un marqueur d''opposition', 1, 20000, 'Marqueurs d''opposition : mais, cependant, pourtant, néanmoins, en revanche, or.',
 '{"type":"mcq","question":"Lequel de ces mots est un marqueur d''opposition ?","options":["De plus","Premièrement","Cependant","En effet"],"answer":"Cependant"}'),

('Identifier un marqueur de conséquence', 1, 20000, 'Marqueurs de conséquence : donc, ainsi, c''est pourquoi, par conséquent, en conséquence.',
 '{"type":"mcq","question":"Lequel de ces mots est un marqueur de conséquence ?","options":["Cependant","Or","C''est pourquoi","De plus"],"answer":"C''est pourquoi"}'),

('Identifier un marqueur de cause', 1, 20000, 'Marqueurs de cause : car, parce que, puisque, en raison de, étant donné que.',
 '{"type":"mcq","question":"Lequel de ces marqueurs exprime la cause ?","options":["Donc","En effet","Par conséquent","Cependant"],"answer":"En effet"}'),

('Choisir le bon registre de langue', 1, 22000, 'Le registre doit être adapté à la situation : familier entre amis, courant dans une lettre, soutenu en rédaction académique.',
 '{"type":"mcq","question":"Pour écrire une lettre à ton professeur, quel registre de langue convient ?","options":["Familier","Argotique","Courant ou soutenu","Vulgaire"],"answer":"Courant ou soutenu"}'),

('Adapter le texte au destinataire', 1, 22000, 'On n''écrit pas de la même façon à un ami et à un directeur. Le destinataire influence le ton et le vocabulaire.',
 '{"type":"mcq","question":"«Salut, j''te texte pour mon absence» conviendrait pour s''adresser à...","options":["Un directeur d''école","Un juge","Un ami","Un parent d''un autre élève"],"answer":"Un ami"}'),

('Identifier un plan de texte', 1, 20000, 'Un plan aide à organiser les idées avant d''écrire : introduction, développement (2-3 parties), conclusion.',
 '{"type":"mcq","question":"Dans quelle partie du plan place-t-on les arguments et exemples ?","options":["Introduction","Développement","Conclusion","Titre"],"answer":"Développement"}'),

('Écrire une phrase complète', 1, 20000, 'Une phrase complète a un sujet et un verbe conjugué et exprime une idée complète.',
 '{"type":"mcq","question":"Laquelle de ces phrases est complète ?","options":["Courir dans le parc.","Le chien.","Les enfants jouent dans le parc.","Très rapidement."],"answer":"Les enfants jouent dans le parc."}'),

('Éviter la répétition lexicale', 1, 22000, 'Répéter le même mot plusieurs fois alourdit le texte. On peut utiliser des synonymes ou des pronoms.',
 '{"type":"mcq","question":"Comment améliorer «Le chien est beau. Le chien a de beaux yeux. Le chien est fidèle» ?","options":["Répéter «chien» encore plus","Utiliser «il» pour remplacer certains «chien»","Supprimer toutes les phrases","Commencer chaque phrase par «Et»"],"answer":"Utiliser «il» pour remplacer certains «chien»"}'),

('Choisir le bon temps verbal', 1, 22000, 'Dans un récit au passé, on utilise l''imparfait (description/durée) et le passé composé (action accomplie).',
 '{"type":"mcq","question":"Dans un récit au passé, quel temps décrit l''arrière-plan et les habitudes ?","options":["Le futur simple","Le passé composé","L''imparfait","Le présent"],"answer":"L''imparfait"}'),

('Identifier une faute de cohérence', 1, 22000, 'Un texte cohérent reste dans le même sujet et le même temps tout au long du développement.',
 '{"type":"mcq","question":"Texte : «Nous parlons de la pollution. Ensuite, je vais au cinéma hier.» Quel est le problème ?","options":["Les verbes sont mal conjugués","Le texte change de sujet et mélange les temps","Il manque une conclusion","Le registre est trop soutenu"],"answer":"Le texte change de sujet et mélange les temps"}'),

('Identifier le sujet d''un texte à partir d''un plan', 1, 20000, 'Un plan doit montrer clairement le sujet et les grandes divisions du texte.',
 '{"type":"mcq","question":"Plan : I. Bienfaits du sport. II. Risques du sport. III. Comment pratiquer sainement. Quel est le sujet ?","options":["La nutrition","La pratique sportive et ses effets","Les risques de blessure uniquement","Le corps humain"],"answer":"La pratique sportive et ses effets"}'),

('Identifier les types de textes à rédiger', 1, 20000, 'On peut rédiger : une lettre, un texte narratif, un texte descriptif, un texte argumentatif, un article, etc.',
 '{"type":"mcq","question":"Un texte qui présente des arguments pour ou contre une proposition est un texte...","options":["Narratif","Descriptif","Argumentatif","Prescriptif"],"answer":"Argumentatif"}'),

('Identifier la structure d''une lettre formelle', 1, 20000, 'Lettre formelle : lieu et date, destinataire, objet, salutation, corps, formule de politesse, signature.',
 '{"type":"mcq","question":"Quelle est la formule de politesse correcte pour terminer une lettre formelle ?","options":["Bonne journée !","À plus !","Je vous prie d''agréer mes salutations distinguées.","Bisous."],"answer":"Je vous prie d''agréer mes salutations distinguées."}'),

('Identifier un exemple pertinent', 1, 22000, 'Un exemple doit illustrer directement l''idée qu''il soutient. Il doit être concret et précis.',
 '{"type":"mcq","question":"Argument : «L''exercice physique améliore la santé mentale.» Quel exemple est le plus pertinent ?","options":["Les chaussures de sport sont chères.","Une étude a montré que courir 30 min par jour réduit l''anxiété.","Les sportifs gagnent beaucoup d''argent.","Le sport est populaire dans les écoles."],"answer":"Une étude a montré que courir 30 min par jour réduit l''anxiété."}'),

('Identifier une conclusion efficace', 1, 22000, 'Une conclusion synthétise les idées principales et peut ouvrir sur une perspective plus large.',
 '{"type":"mcq","question":"Laquelle de ces conclusions est la plus efficace pour un texte sur la pollution ?","options":["Voilà, c''est tout.","Donc la pollution est un problème.","En somme, la réduction de la pollution passe par des choix individuels et collectifs. C''est un défi que toute société doit relever.","La pollution a été définie au début du texte."],"answer":"En somme, la réduction de la pollution passe par des choix individuels et collectifs. C''est un défi que toute société doit relever."}'),

('Choisir le bon titre', 1, 20000, 'Un titre doit être court, accrocheur et refléter le contenu du texte.',
 '{"type":"mcq","question":"Quel titre convient le mieux à un texte argumentatif sur les bienfaits de la lecture ?","options":["Texte","Les livres existent depuis longtemps","Lire : un voyage qui enrichit l''esprit","Un texte sur la lecture"],"answer":"Lire : un voyage qui enrichit l''esprit"}'),

('Identifier un texte narratif vs descriptif', 1, 20000, 'Narratif = raconte des événements. Descriptif = peint une image avec des détails.',
 '{"type":"mcq","question":"«La maison était vieille, avec ses murs de pierre couverts de mousse et ses volets peints en bleu.» Ce passage est...","options":["Narratif","Argumentatif","Descriptif","Prescriptif"],"answer":"Descriptif"}'),

('Identifier la voix active vs passive dans la rédaction', 1, 20000, 'La voix active est plus directe et dynamique. La voix passive met en avant le résultat de l''action.',
 '{"type":"mcq","question":"«Le gouvernement a adopté la loi» est à la voix active. Quelle est la version passive ?","options":["La loi a été adoptée par le gouvernement.","Le gouvernement adopte la loi.","La loi adoptait le gouvernement.","La loi sera adoptée."],"answer":"La loi a été adoptée par le gouvernement."}'),

('Identifier le bon ordre des paragraphes', 1, 22000, 'L''ordre des paragraphes doit être logique : du général au particulier, du moins au plus important, ou chronologique.',
 '{"type":"mcq","question":"Dans un texte argumentatif, quel est l''ordre logique des éléments ?","options":["Arguments → Introduction → Conclusion","Conclusion → Arguments → Introduction","Introduction → Arguments → Conclusion","Arguments → Conclusion → Introduction"],"answer":"Introduction → Arguments → Conclusion"}'),

('Corriger une faute de ponctuation', 1, 20000, 'Le point marque la fin d''une phrase. La virgule sépare les éléments. Les deux-points annoncent une explication ou une liste.',
 '{"type":"mcq","question":"Quelle ponctuation convient dans «Il manque plusieurs ingrédients ___ la farine, les œufs et le sucre» ?","options":["une virgule","un point","les deux-points (:)","un point d''interrogation"],"answer":"les deux-points (:)"}'),

('Identifier la progression logique', 1, 20000, 'Les idées doivent progresser logiquement : chaque nouveau paragraphe doit s''appuyer sur le précédent.',
 '{"type":"mcq","question":"Quel connecteur permet de passer logiquement d''une idée à la suivante dans un ordre chronologique ?","options":["Cependant","En revanche","Ensuite","Or"],"answer":"Ensuite"}'),

('Écrire au bon point de vue', 1, 20000, 'La 1ère personne (je/nous) = point de vue subjectif. La 3e personne (il/elle/on) = point de vue distancié.',
 '{"type":"mcq","question":"Un texte académique ou journalistique préfère généralement quel point de vue ?","options":["La 1ère personne du singulier (je)","La 2e personne (tu)","La 3e personne (il/elle/on)","Les deux à la fois"],"answer":"La 3e personne (il/elle/on)"}'),

('Identifier une transition entre paragraphes', 1, 20000, 'Une transition relie deux paragraphes et assure la fluidité du texte.',
 '{"type":"mcq","question":"Laquelle de ces phrases est une bonne transition entre deux paragraphes ?","options":["Le chien est un animal.","Après avoir examiné les avantages, voyons maintenant les inconvénients.","Il fait beau aujourd''hui.","La conclusion est importante."],"answer":"Après avoir examiné les avantages, voyons maintenant les inconvénients."}'),

('Identifier une faute de cohérence pronominale', 1, 20000, 'Les pronoms doivent être cohérents tout au long du texte (ne pas alterner «on» et «nous» sans raison).',
 '{"type":"mcq","question":"Texte : «Nous devons protéger la planète. On doit recycler davantage. Nous avons une responsabilité.» Quel est le problème ?","options":["Les verbes sont mal conjugués","L''alternance non justifiée entre «nous» et «on» manque de cohérence","Il manque des exemples","Le texte est trop court"],"answer":"L''alternance non justifiée entre «nous» et «on» manque de cohérence"}'),

('Identifier les éléments d''un texte descriptif réussi', 1, 22000, 'Un texte descriptif réussi utilise des adjectifs précis, des comparaisons et des détails sensoriels.',
 '{"type":"mcq","question":"Quel élément contribue le plus à un texte descriptif vivant ?","options":["Les marqueurs de conséquence","Les détails sensoriels (vue, ouïe, odorat, toucher, goût)","Les chiffres et statistiques","Les arguments logiques"],"answer":"Les détails sensoriels (vue, ouïe, odorat, toucher, goût)"}'),

('Identifier une redondance inutile', 1, 20000, 'Une redondance répète la même idée différemment sans apporter d''information nouvelle.',
 '{"type":"mcq","question":"Quelle phrase contient une redondance ?","options":["Il marcha lentement jusqu''à la porte.","La vieille dame âgée traversa la rue.","Elle chantait doucement dans l''obscurité.","Le vent soufflait fort ce soir-là."],"answer":"La vieille dame âgée traversa la rue."}'),

('Identifier un texte bien développé vs insuffisant', 1, 22000, 'Un texte bien développé contient des idées précises, des exemples et des explications. Pas seulement des généralités.',
 '{"type":"mcq","question":"Lequel de ces développements est le plus insuffisant ?","options":["Le sport améliore la santé car il renforce le cœur, les muscles et réduit le stress selon plusieurs études.","Le sport, c''est bien pour tout le monde.","Les sportifs pratiquent en moyenne 5h par semaine et montrent 30% moins d''anxiété (étude 2022).","La natation, le yoga et le jogging développent des aptitudes physiques et mentales distinctes."],"answer":"Le sport, c''est bien pour tout le monde."}'),

-- DIFFICULTÉ 2 (30 questions)
('Rédiger une phrase d''accroche', 2, 32000, 'L''accroche est la première phrase du texte. Elle doit capter l''intérêt : citation, question, anecdote, statistique.',
 '{"type":"mcq","question":"Laquelle de ces amorces est la plus efficace pour un texte sur le réchauffement climatique ?","options":["Dans ce texte, je vais parler du réchauffement climatique.","Le réchauffement climatique existe.","«Les glaciers de l''Arctique ont perdu 75% de leur épaisseur en 50 ans» : une réalité qui nous interpelle.","Voici mon texte sur le réchauffement."],"answer":"«Les glaciers de l''Arctique ont perdu 75% de leur épaisseur en 50 ans» : une réalité qui nous interpelle."}'),

('Construire un plan équilibré', 2, 30000, 'Un plan équilibré donne un poids similaire à chaque partie et couvre bien le sujet.',
 '{"type":"mcq","question":"Pour un texte «Pour ou contre les devoirs à la maison», un plan équilibré serait...","options":["I. Les devoirs sont utiles. II. Les devoirs sont utiles. III. Conclusion.","I. Arguments pour. II. Arguments contre. III. Nuances et position personnelle.","I. Les devoirs existent. II. Conclusion.","I. Introduction très longue. II. Un argument. III. Fin."],"answer":"I. Arguments pour. II. Arguments contre. III. Nuances et position personnelle."}'),

('Utiliser correctement les connecteurs de concession', 2, 32000, 'La concession reconnaît un point adverse avant de revenir à sa position. Marqueurs : certes, bien que, même si, quoique.',
 '{"type":"mcq","question":"Laquelle de ces phrases utilise correctement un connecteur de concession ?","options":["Certes, la technologie a des avantages, mais elle présente aussi des risques.","Donc, la technologie est mauvaise.","La technologie, c''est bien.","En effet, la technologie est parfaite."],"answer":"Certes, la technologie a des avantages, mais elle présente aussi des risques."}'),

('Varier la structure des phrases', 2, 32000, 'Un bon texte alterne phrases courtes et phrases longues pour créer du rythme et maintenir l''intérêt.',
 '{"type":"mcq","question":"Pourquoi est-il conseillé de varier la longueur des phrases dans un texte ?","options":["Pour atteindre un minimum de mots","Pour créer du rythme et éviter la monotonie","Pour utiliser plus de virgules","Pour impressionner le correcteur"],"answer":"Pour créer du rythme et éviter la monotonie"}'),

('Choisir un champ lexical adapté', 2, 32000, 'Le champ lexical (groupe de mots d''un même thème) donne de la cohérence et de la richesse au texte.',
 '{"type":"mcq","question":"Pour rédiger un texte sur la mer, quel champ lexical est le plus adapté ?","options":["Vague, marée, récif, phare, ancre, mousse","Forêt, arbre, branche, feuille","Montagne, sommet, glacier, avalanche","Désert, sable, dune, oasis"],"answer":"Vague, marée, récif, phare, ancre, mousse"}'),

('Distinguer description statique et dynamique', 2, 30000, 'Description statique = snapshot d''un moment figé. Description dynamique = montre le mouvement et l''évolution.',
 '{"type":"mcq","question":"«Les feuilles tourbillonnaient dans le vent, rebondissaient sur les pavés et filaient sous les portes» est une description...","options":["Statique","Dynamique","Argumentative","Prescriptive"],"answer":"Dynamique"}'),

('Argumenter avec une concession et un retour', 2, 32000, 'Structure «certes... mais» : on accorde un point à l''adversaire, puis on revient à sa position.',
 '{"type":"mcq","question":"Complétez : «Certes, les réseaux sociaux permettent de rester en contact avec ses proches. Mais ___»","options":["ils sont également très utiles.","ils présentent des risques sérieux pour la santé mentale.","tout le monde les utilise.","ils sont gratuits."],"answer":"ils présentent des risques sérieux pour la santé mentale."}'),

('Identifier une phrase trop longue et complexe', 2, 30000, 'Une phrase trop longue (plus de 3-4 propositions) devient difficile à lire. On peut la couper en 2-3 phrases.',
 '{"type":"mcq","question":"Comment améliorer «Il faisait beau et les enfants jouaient et les parents regardaient et tout le monde était heureux» ?","options":["Ajouter encore des «et»","Diviser en plusieurs phrases courtes","Mettre tout en majuscules","Supprimer les verbes"],"answer":"Diviser en plusieurs phrases courtes"}'),

('Utiliser une comparaison dans une description', 2, 32000, 'Une comparaison enrichit la description en associant un élément connu à ce qu''on décrit.',
 '{"type":"mcq","question":"Quelle phrase utilise une comparaison pour enrichir la description ?","options":["La rivière coulait.","Il y avait une rivière.","La rivière coulait, claire et fraîche.","La rivière serpentait comme un ruban d''argent dans la vallée."],"answer":"La rivière serpentait comme un ruban d''argent dans la vallée."}'),

('Écrire un dialogue efficace dans un récit', 2, 32000, 'Un dialogue doit faire avancer l''action ou révéler la personnalité des personnages. Il n''est pas là pour remplir.',
 '{"type":"mcq","question":"Quel élément n''est PAS utile dans un dialogue de récit ?","options":["Révéler les émotions des personnages","Faire avancer l''intrigue","Distinguer les voix des personnages","Lister les événements de la journée sans lien avec l''intrigue"],"answer":"Lister les événements de la journée sans lien avec l''intrigue"}'),

('Rédiger un texte narratif : insérer une description', 2, 32000, 'Dans un récit, les passages descriptifs servent à situer le lecteur dans le temps et l''espace.',
 '{"type":"mcq","question":"À quel moment est-il le plus approprié d''insérer une description dans un récit ?","options":["Au milieu d''une scène d''action intense","Avant une scène importante pour créer une atmosphère","À la toute fin du récit","N''importe où, ça n''a pas d''importance"],"answer":"Avant une scène importante pour créer une atmosphère"}'),

('Identifier un plan de type dialectique', 2, 30000, 'Plan dialectique : thèse (pour) → antithèse (contre) → synthèse (dépassement nuancé).',
 '{"type":"mcq","question":"Un plan «thèse / antithèse / synthèse» est appelé...","options":["Plan linéaire","Plan narratif","Plan dialectique","Plan descriptif"],"answer":"Plan dialectique"}'),

('Écrire une thèse clairement', 2, 32000, 'La thèse est la position défendue dans le texte. Elle doit être affirmée clairement dès l''introduction.',
 '{"type":"mcq","question":"Laquelle de ces phrases énonce le plus clairement une thèse ?","options":["La question de l''école est intéressante.","Je vais parler des avantages et inconvénients.","Les téléphones en classe nuisent à la concentration des élèves.","Le téléphone est un appareil moderne."],"answer":"Les téléphones en classe nuisent à la concentration des élèves."}'),

('Identifier les procédés pour accroître la crédibilité', 2, 32000, 'Pour renforcer un argument : statistiques, citations d''experts, études scientifiques, exemples concrets.',
 '{"type":"mcq","question":"Quel procédé renforce le plus la crédibilité d''un argument ?","options":["Répéter l''argument plusieurs fois","Citer une étude scientifique","Utiliser des superlatifs","Écrire en majuscules"],"answer":"Citer une étude scientifique"}'),

('Reconnaître une faute d''organisation textuelle', 2, 32000, 'Un texte mal organisé saute d''une idée à l''autre sans transition logique.',
 '{"type":"mcq","question":"Texte : «P1 : Les avantages du sport. P2 : Ma recette de gâteau préférée. P3 : Les bienfaits de l''exercice.» Quel est le problème ?","options":["Le texte est trop court","P2 est hors-sujet et brise la cohérence","Les paragraphes sont trop longs","Il manque une introduction"],"answer":"P2 est hors-sujet et brise la cohérence"}'),

('Améliorer un texte en ajoutant des connecteurs', 2, 32000, 'Ajouter des connecteurs améliore la fluidité et la logique d''un texte.',
 '{"type":"mcq","question":"Texte sans connecteurs : «Le sport est bon. Il réduit le stress. Il améliore la santé.» Quelle version améliorée est la meilleure ?","options":["Le sport est bon. Il réduit le stress. Et la santé.","Le sport est bon. De plus, il réduit le stress. Par conséquent, il améliore la santé globale.","Sport bon, stress réduit, santé meilleure.","Bon sport, moins stress, bonne santé."],"answer":"Le sport est bon. De plus, il réduit le stress. Par conséquent, il améliore la santé globale."}'),

('Rédiger selon les conventions du texte d''opinion', 2, 32000, 'Un texte d''opinion contient : position claire, arguments, exemples, contre-arguments reconnus, conclusion.',
 '{"type":"mcq","question":"Quelle caractéristique distingue un texte d''opinion d''un texte informatif ?","options":["Le texte d''opinion ne contient pas de faits","Le texte d''opinion défend une position subjective avec des arguments","Le texte d''opinion est toujours plus court","Le texte d''opinion n''a pas de structure"],"answer":"Le texte d''opinion défend une position subjective avec des arguments"}'),

('Identifier les problèmes de ponctuation dans un texte', 2, 30000, 'Une mauvaise ponctuation peut changer le sens d''une phrase ou la rendre difficile à lire.',
 '{"type":"mcq","question":"Quelle ponctuation est incorrecte dans «Mange, Marie !» par rapport à «Mange Marie !» ?","options":["Les deux sont identiques","La virgule dans «Mange, Marie !» s''adresse à Marie, sans elle on demande à manger Marie","Le point d''exclamation est inutile dans les deux","«Mange Marie» est la forme correcte"],"answer":"La virgule dans «Mange, Marie !» s''adresse à Marie, sans elle on demande à manger Marie"}'),

('Écrire une description en utilisant les 5 sens', 2, 32000, 'Une description sensorielle fait appel à la vue, l''ouïe, l''odorat, le toucher et le goût pour immerger le lecteur.',
 '{"type":"mcq","question":"Dans «L''air sentait le pain chaud et le café fraîchement moulu», quels sens sont sollicités ?","options":["Vue et toucher","Ouïe et goût","Odorat (et partiellement le goût)","Vue uniquement"],"answer":"Odorat (et partiellement le goût)"}'),

('Organiser les arguments du moins au plus fort', 2, 32000, 'L''ordre crescendo place l''argument le plus fort en dernier pour laisser une impression forte au lecteur.',
 '{"type":"mcq","question":"Pourquoi certains auteurs placent-ils leur argument le plus fort en dernière position ?","options":["Pour respecter l''ordre alphabétique","Pour que le lecteur retienne le point le plus percutant","Parce que l''introduction doit être courte","Pour éviter les répétitions"],"answer":"Pour que le lecteur retienne le point le plus percutant"}'),

('Distinguer introduction et développement', 2, 30000, 'L''introduction prépare le lecteur. Le développement développe les arguments avec preuves et exemples.',
 '{"type":"mcq","question":"Quelle différence essentielle y a-t-il entre l''introduction et le développement ?","options":["L''introduction est plus longue","L''introduction présente le sujet, le développement l''approfondit avec arguments et preuves","Ils contiennent les mêmes informations","Le développement est écrit en premier"],"answer":"L''introduction présente le sujet, le développement l''approfondit avec arguments et preuves"}'),

('Repérer un anachronisme dans un récit', 2, 30000, 'Un anachronisme est un élément qui n''appartient pas à l''époque du récit. Il brise la cohérence temporelle.',
 '{"type":"mcq","question":"Dans un récit se passant en 1800, l''auteur mentionne qu''un personnage envoie un courriel. C''est...","options":["Un procédé littéraire volontaire","Un anachronisme (incohérence temporelle)","Une métaphore","Un dialogue"],"answer":"Un anachronisme (incohérence temporelle)"}'),

('Utiliser le point de vue efficacement', 2, 32000, 'Choisir le bon point de vue change l''effet du texte : 1ère personne = intimité, 3e personne = distanciation.',
 '{"type":"mcq","question":"Un auteur veut que le lecteur ressente intimement les émotions du personnage principal. Quel point de vue choisira-t-il ?","options":["3e personne omniscient","2e personne","1ère personne du singulier (je)","Point de vue neutre externe"],"answer":"1ère personne du singulier (je)"}'),

('Réviser un texte : identifier les améliorations possibles', 2, 32000, 'Lors de la révision : vérifier l''organisation, les transitions, les répétitions, la ponctuation et le registre.',
 '{"type":"mcq","question":"Lors de la révision d''un texte, quelle vérification est la MOINS prioritaire ?","options":["La cohérence des idées","L''orthographe et la grammaire","Compter exactement le nombre de virgules","Les transitions entre paragraphes"],"answer":"Compter exactement le nombre de virgules"}'),

('Améliorer la précision du vocabulaire', 2, 30000, 'Un vocabulaire précis remplace les mots vagues («chose», «beaucoup», «bien») par des termes plus exacts.',
 '{"type":"mcq","question":"Comment améliorer «Il y a beaucoup de choses intéressantes dans ce livre» ?","options":["Il y a des choses dans ce livre","Ce roman regorge d''intrigues captivantes et de personnages mémorables.","Il y a beaucoup de trucs cools","Ce livre est bien"],"answer":"Ce roman regorge d''intrigues captivantes et de personnages mémorables."}'),

('Rédiger un texte en respectant la contrainte de longueur', 2, 30000, 'Respecter une contrainte de longueur oblige à choisir les idées essentielles et à être concis.',
 '{"type":"mcq","question":"Pour écrire un texte de 200 mots sur un sujet complexe, quelle stratégie est la plus efficace ?","options":["Tout écrire sans se limiter puis couper au hasard","Choisir 2-3 idées clés et les développer brièvement avec exemples","Écrire uniquement des exemples sans argumentation","Copier des citations pour remplir l''espace"],"answer":"Choisir 2-3 idées clés et les développer brièvement avec exemples"}'),

('Distinguer objectif et subjectif dans la rédaction', 2, 32000, 'Un texte objectif présente des faits sans jugement. Un texte subjectif inclut les opinions et émotions de l''auteur.',
 '{"type":"mcq","question":"«Le gouvernement a augmenté les taxes de 3%.» Cette phrase est...","options":["Subjective car elle critique le gouvernement","Objective car elle présente un fait vérifiable","Biaisée car elle défend une position","Incomplète car sans opinion"],"answer":"Objective car elle présente un fait vérifiable"}'),

('Identifier les erreurs dans un plan de texte', 2, 30000, 'Un bon plan évite les répétitions entre les parties et couvre bien le sujet.',
 '{"type":"mcq","question":"Plan : I. Avantages des transports en commun. II. Avantages des transports en commun. III. Conclusion. Quel problème contient ce plan ?","options":["La conclusion est trop longue","Les parties I et II se répètent — manque d''organisation","Il manque une introduction","Le sujet n''est pas clair"],"answer":"Les parties I et II se répètent — manque d''organisation"}'),

('Écrire une anecdote dans un texte argumentatif', 2, 32000, 'Une anecdote est un exemple vécu concret qui illustre un argument. Elle rend le texte plus vivant.',
 '{"type":"mcq","question":"À quel endroit place-t-on généralement une anecdote dans un paragraphe argumentatif ?","options":["Avant l''argument, pour introduire l''idée","Après l''argument, pour l''illustrer concrètement","À la fin du texte, en conclusion","Dans l''introduction uniquement"],"answer":"Après l''argument, pour l''illustrer concrètement"}'),

-- DIFFICULTÉ 3 (30 questions)
('Analyser la progression thématique d''un texte', 3, 45000, 'La progression thématique assure que chaque phrase apporte de l''information nouvelle tout en restant cohérente.',
 '{"type":"mcq","question":"Texte : «Les forêts tropicales abritent 50% des espèces animales. Ces espèces sont menacées par la déforestation. La déforestation progresse à un rythme alarmant.» Quelle progression est utilisée ?","options":["Thème constant","Progression linéaire (propos de A → thème de B)","Structure dialectique","Structure chronologique"],"answer":"Progression linéaire (propos de A → thème de B)"}'),

('Construire un texte argumentatif nuancé', 3, 45000, 'Un texte nuancé reconnaît la complexité du sujet, présente plusieurs points de vue et évite les généralisations.',
 '{"type":"mcq","question":"Qu''est-ce qui distingue un texte argumentatif nuancé d''un texte simpliste ?","options":["Le texte nuancé évite les arguments","Le texte nuancé reconnaît les limites de sa thèse et présente des contre-arguments","Le texte nuancé est plus court","Le texte nuancé n''a pas de conclusion"],"answer":"Le texte nuancé reconnaît les limites de sa thèse et présente des contre-arguments"}'),

('Analyser l''effet stylistique des répétitions volontaires', 3, 42000, 'La répétition volontaire (anaphore) crée un rythme et un effet d''insistance dans un texte.',
 '{"type":"mcq","question":"Dans un discours : «Nous nous battrons, nous résisterons, nous vaincrons», la répétition de «nous» crée...","options":["Une faute de style","Un effet de rythme et de solidarité collective (anaphore)","Une incohérence","Un effet comique"],"answer":"Un effet de rythme et de solidarité collective (anaphore)"}'),

('Rédiger une synthèse de documents multiples', 3, 45000, 'Une synthèse rassemble les informations de plusieurs documents en un texte cohérent, sans copier-coller.',
 '{"type":"mcq","question":"Quelle est la principale erreur à éviter lors d''une synthèse de documents ?","options":["Organiser les idées par thèmes","Juxtaposer les résumés de chaque document sans les lier","Utiliser ses propres mots","Identifier les points communs et divergents"],"answer":"Juxtaposer les résumés de chaque document sans les lier"}'),

('Analyser la cohésion textuelle par les substituts', 3, 45000, 'Les substituts lexicaux remplacent un nom par un synonyme, une périphrase ou un pronom pour éviter les répétitions.',
 '{"type":"mcq","question":"Texte : «Marie Curie fut une scientifique exceptionnelle. La chercheuse polonaise fut la première femme à recevoir un Nobel.» «La chercheuse polonaise» est...","options":["Un pronom","Un substitut lexical (périphrase) de «Marie Curie»","Un adjectif","Une apposition"],"answer":"Un substitut lexical (périphrase) de «Marie Curie»"}'),

('Rédiger un texte avec une chute narrative efficace', 3, 45000, 'La chute d''une nouvelle courte doit être surprenante mais logique : les indices doivent être présents dans le texte.',
 '{"type":"mcq","question":"Pour qu''une chute narrative soit efficace, elle doit...","options":["Être complètement imprévisible et sans lien avec le récit","Être annoncée clairement dès le début","Découler logiquement des indices semés dans le récit, mais rester surprenante","Être écrite dans un autre registre que le reste"],"answer":"Découler logiquement des indices semés dans le récit, mais rester surprenante"}'),

('Analyser l''implicite dans un texte argumentatif', 3, 45000, 'Tout texte argumentatif contient des présupposés implicites que l''auteur ne formule pas directement.',
 '{"type":"mcq","question":"Argument : «Il faut plus de cours de sport à l''école pour lutter contre l''obésité.» Quel présupposé est implicite ?","options":["Le sport est inutile","Les élèves ne font pas assez de sport actuellement","L''obésité n''est pas un problème","Les cours de sport existent déjà en grande quantité"],"answer":"Les élèves ne font pas assez de sport actuellement"}'),

('Maîtriser le style indirect dans la rédaction', 3, 42000, 'Le style indirect intègre les paroles dans la narration. Il modifie les pronoms et les temps verbaux.',
 '{"type":"mcq","question":"«Il a dit : ''Je viendrai demain.''» En style indirect, cela devient :","options":["Il a dit qu''il viendrait le lendemain.","Il a dit qu''il vient demain.","Il a dit : il viendra demain.","Il a dit qu''il venait hier."],"answer":"Il a dit qu''il viendrait le lendemain."}'),

('Identifier la valeur des temps dans un récit complexe', 3, 45000, 'Le passé simple = actions ponctuelles. L''imparfait = descriptions et habitudes. Le plus-que-parfait = antériorité.',
 '{"type":"mcq","question":"Texte : «Quand il arriva, la tempête avait déjà commencé.» Quel temps exprime l''événement antérieur ?","options":["Le passé simple (arriva)","Le plus-que-parfait (avait commencé)","Les deux expriment la même chose","L''imparfait"],"answer":"Le plus-que-parfait (avait commencé)"}'),

('Analyser un texte pour identifier ses failles argumentatives', 3, 45000, 'Les failles d''un texte argumentatif : manque de preuves, sophismes, généralisation abusive, hors-sujet.',
 '{"type":"mcq","question":"Texte : «Tous les adolescents passent leur temps sur leur téléphone. Les téléphones sont donc mauvais.» Quelle faille contient cet argument ?","options":["Il est trop bien argumenté","Généralisation abusive («tous») + lien de causalité non prouvé","Il manque une conclusion","L''argument est trop court"],"answer":"Généralisation abusive («tous») + lien de causalité non prouvé"}'),

('Rédiger une ouverture en conclusion', 3, 45000, 'L''ouverture en conclusion propose une perspective plus large : question philosophique, problème connexe, avenir.',
 '{"type":"mcq","question":"Quel type d''ouverture est le plus approprié à la fin d''un texte sur la protection de l''environnement ?","options":["Répéter mot pour mot l''introduction","Poser une question sur un problème connexe : «Quel monde voulons-nous laisser aux générations futures?»","Annoncer que le texte est terminé","Introduire un sujet totalement différent"],"answer":"Poser une question sur un problème connexe : «Quel monde voulons-nous laisser aux générations futures?»"}'),

('Analyser la modalisation dans la rédaction', 3, 45000, 'Modaliser = exprimer son degré de certitude. «Il semble que», «il est probable que», «il est certain que».',
 '{"type":"mcq","question":"Pourquoi un auteur utiliserait-il «il semble que» plutôt qu''«il est certain que» dans son texte ?","options":["Pour paraître moins instruit","Pour montrer qu''il doute de l''information ou qu''elle n''est pas confirmée","Pour allonger la phrase","Pour adopter un registre familier"],"answer":"Pour montrer qu''il doute de l''information ou qu''elle n''est pas confirmée"}'),

('Rédiger une comparaison structurée', 3, 42000, 'Une comparaison structurée examine deux sujets selon les mêmes critères pour en tirer une conclusion.',
 '{"type":"mcq","question":"Dans un texte comparant deux approches pédagogiques, quelle organisation est la plus claire ?","options":["Écrire tout sur l''approche A, puis tout sur B sans critères communs","Alterner les critères : critère 1 (A puis B), critère 2 (A puis B)","Écrire seulement les avantages de l''une","Écrire uniquement les inconvénients des deux"],"answer":"Alterner les critères : critère 1 (A puis B), critère 2 (A puis B)"}'),

('Créer de la tension narrative dans un récit', 3, 45000, 'La tension narrative est créée par le suspense, les obstacles, le rythme et les révélations progressives.',
 '{"type":"mcq","question":"Quel procédé crée le plus de tension narrative dans un récit ?","options":["Raconter la fin dès le début","Retarder la résolution d''un conflit par des obstacles successifs","Utiliser uniquement des phrases longues et calmes","Éviter tout dialogue"],"answer":"Retarder la résolution d''un conflit par des obstacles successifs"}'),

('Utiliser les figures de style à l''écrit', 3, 45000, 'Les figures de style enrichissent l''écriture. Chaque figure a son effet propre sur le lecteur.',
 '{"type":"mcq","question":"Quel effet produit une hyperbole dans un texte narratif ou persuasif ?","options":["Elle minimise l''importance d''une idée","Elle exagère pour créer un effet d''intensité ou d''humour","Elle compare deux choses similaires avec «comme»","Elle crée une antithèse"],"answer":"Elle exagère pour créer un effet d''intensité ou d''humour"}'),

('Adapter son écriture au genre littéraire', 3, 45000, 'Chaque genre (poésie, nouvelle, essai, conte) a des conventions propres à respecter.',
 '{"type":"mcq","question":"Un conte traditionnel se distingue d''un texte informatif notamment par...","options":["L''absence de personnages","L''utilisation de formules («Il était une fois») et d''une morale implicite","La présence de statistiques","L''emploi du subjonctif"],"answer":"L''utilisation de formules («Il était une fois») et d''une morale implicite"}'),

('Analyser la cohérence énonciative', 3, 45000, 'La cohérence énonciative = le même énonciateur (voix) est maintenu tout au long du texte.',
 '{"type":"mcq","question":"Un texte commence à la 3e personne et passe soudainement à «tu dois faire ceci». Quel problème y a-t-il ?","options":["Le texte est trop long","Il y a une rupture énonciative : changement de destinataire non justifié","Le texte manque d''exemples","La conclusion est absente"],"answer":"Il y a une rupture énonciative : changement de destinataire non justifié"}'),

('Rédiger un texte avec une structure en chiasme', 3, 45000, 'Un chiasme structure les idées en ABBA : la 2e partie inverse l''ordre de la 1ère.',
 '{"type":"mcq","question":"«Il faut manger pour vivre et non vivre pour manger» (Molière) illustre quelle figure de construction ?","options":["Anaphore","Chiasme","Métaphore","Gradation"],"answer":"Chiasme"}'),

('Analyser l''ethos, le pathos et le logos', 3, 45000, 'Aristote : ethos = crédibilité de l''orateur, pathos = appel aux émotions, logos = logique et preuves.',
 '{"type":"mcq","question":"Un auteur cite ses diplômes et son expérience de 20 ans pour renforcer son argument. Il utilise...","options":["Le pathos","Le logos","L''ethos","L''ironie"],"answer":"L''ethos"}'),

('Rédiger en adoptant l''ironie', 3, 45000, 'L''ironie écrite nécessite des indices contextuels clairs pour que le lecteur comprenne le décalage intentionnel.',
 '{"type":"mcq","question":"Pour qu''une phrase ironique soit comprise à l''écrit, l''auteur doit...","options":["Écrire en gras","Inclure des guillemets et/ou des indices contextuels clairs","Utiliser des points d''exclamation","Écrire en italique uniquement"],"answer":"Inclure des guillemets et/ou des indices contextuels clairs"}'),

('Analyser la visée d''un texte épidictique', 3, 45000, 'Un texte épidictique loue ou blâme quelqu''un ou quelque chose. Genre : éloge, panégyrique, discours d''inauguration.',
 '{"type":"mcq","question":"Un discours de remise de prix qui loue les accomplissements d''un lauréat est de type...","options":["Délibératif (pour décider d''une action)","Judiciaire (pour juger)","Épidictique (éloge)","Informatif"],"answer":"Épidictique (éloge)"}'),

('Analyser les niveaux de langue dans un texte hybride', 3, 45000, 'Un texte peut délibérément mêler plusieurs registres pour créer un effet (contraste humoristique, social, ironique).',
 '{"type":"mcq","question":"Un roman qui mêle discours académique soutenu et dialogues très familiers de personnages populaires cherche à...","options":["Corriger les erreurs de langage","Créer un effet de contraste social et/ou humoristique","Respecter un seul registre","Simplifier la lecture"],"answer":"Créer un effet de contraste social et/ou humoristique"}'),

('Maîtriser la cohérence aspectuelle des verbes', 3, 45000, 'L''aspect verbal indique si l''action est vue comme complète (perfectif) ou en cours (imperfectif).',
 '{"type":"mcq","question":"Dans «Il travaillait pendant des heures» vs «Il travailla deux heures», quelle différence d''aspect y a-t-il ?","options":["Aucune différence","L''imparfait présente l''action comme une durée en cours; le passé simple comme un bloc achevé","Le passé simple est plus formel","L''imparfait est utilisé pour des actions brèves"],"answer":"L''imparfait présente l''action comme une durée en cours; le passé simple comme un bloc achevé"}'),

('Structurer un paragraphe avec la méthode PEEL', 3, 42000, 'PEEL : Point (idée), Evidence (preuve), Explanation (explication), Link (lien avec la thèse).',
 '{"type":"mcq","question":"Dans la méthode PEEL, que représente le «L» (Link) ?","options":["La longueur du paragraphe","Le lien entre l''idée et la thèse globale du texte","La liste des exemples","La limite du sujet"],"answer":"Le lien entre l''idée et la thèse globale du texte"}'),

('Analyser l''utilisation de l''euphémisme dans la rédaction', 3, 42000, 'Un euphémisme atténue une réalité difficile ou choquante. Il peut refléter des tabous culturels ou une politesse.',
 '{"type":"mcq","question":"Pourquoi un auteur utiliserait-il «il nous a quittés» plutôt que «il est mort» ?","options":["Pour être plus précis","Par euphémisme : atténuer la brutalité de la mort par respect ou pudeur","Pour éviter le passé composé","Par erreur grammaticale"],"answer":"Par euphémisme : atténuer la brutalité de la mort par respect ou pudeur"}'),

('Rédiger un texte engagé (littérature engagée)', 3, 45000, 'La littérature engagée (Sartre, Hugo, Zola) utilise l''écriture pour défendre des causes sociales ou politiques.',
 '{"type":"mcq","question":"Un auteur écrit un roman pour dénoncer les injustices sociales. Son texte relève de la...","options":["Littérature de divertissement pur","Littérature engagée","Littérature descriptive uniquement","Littérature épistolaire"],"answer":"Littérature engagée"}'),

('Analyser l''incipit d''un texte', 3, 45000, 'L''incipit est le début d''un texte narratif. Il définit les codes du récit et crée un pacte de lecture.',
 '{"type":"mcq","question":"«Longtemps, je me suis couché de bonne heure» (Proust). Quel effet produit cet incipit ?","options":["Il résume toute l''histoire","Il place le récit dans la mémoire et l''habitude, créant un ton introspectif","Il commence par l''action principale","Il présente tous les personnages"],"answer":"Il place le récit dans la mémoire et l''habitude, créant un ton introspectif"}'),

('Analyser la dimension argumentative d''un texte littéraire', 3, 45000, 'Tout texte littéraire contient une dimension argumentative implicite : une vision du monde, des valeurs défendues.',
 '{"type":"mcq","question":"Un roman qui montre des personnages généreux récompensés et des personnages avares punis défend implicitement...","options":["Que la vie est injuste","Que la générosité est une valeur morale positive","Que l''argent est inutile","Qu''il faut être puni"],"answer":"Que la générosité est une valeur morale positive"}'),

('Identifier les registres dans la rédaction créative', 3, 45000, 'Le choix du registre (comique, tragique, lyrique, épique, fantastique) oriente toute la rédaction.',
 '{"type":"mcq","question":"Pour écrire un texte de rédaction créative sur la perte d''un ami, quel registre est le plus approprié ?","options":["Comique","Épique","Lyrique ou élégiaque","Satirique"],"answer":"Lyrique ou élégiaque"}'),

('Maîtriser la ponctuation expressive à l''écrit', 3, 42000, 'Les points de suspension créent l''attente ou l''inachevé. Le point d''exclamation exprime l''intensité.',
 '{"type":"mcq","question":"Dans «Elle ouvrit la porte et vit...», les points de suspension créent...","options":["Une faute de ponctuation","Un effet de suspense et d''attente","La fin de la phrase","Un dialogue"],"answer":"Un effet de suspense et d''attente"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
