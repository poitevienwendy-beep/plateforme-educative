-- ============================================================
-- BANQUE DE QUESTIONS — Rédaction (Sec. 1, Français)
-- PFEQ-FRA-SEC1-RED | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- Note : Questions sur le processus d''écriture et la structure des textes.
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-RED') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Structure de base et processus d''écriture (34 questions) ─

('Structure d''un paragraphe', 1, 25000, 'Un bon paragraphe contient une idée principale (phrase-clé) et des phrases de développement qui l''appuient.',
 '{"type":"mcq","question":"Quelle est la structure de base d''un bon paragraphe ?","options":["Titre + liste + conclusion","Phrase-clé + développement + conclusion du paragraphe","Introduction + développement + conclusion du texte","Anecdote + argument + opinion"],"answer":"Phrase-clé + développement + conclusion du paragraphe"}'),

('Introduction d''un texte', 1, 25000, 'Une bonne introduction présente le sujet, accroche le lecteur et annonce le plan ou la thèse.',
 '{"type":"mcq","question":"Quel est le rôle principal d''une introduction dans un texte ?","options":["Résumer le texte entier","Présenter le sujet et capter l''attention du lecteur","Défendre la thèse principale","Citer des exemples"],"answer":"Présenter le sujet et capter l''attention du lecteur"}'),

('Conclusion d''un texte', 1, 25000, 'La conclusion reprend les idées principales, réaffirme la thèse et peut ouvrir sur une réflexion plus large.',
 '{"type":"mcq","question":"Que doit-on éviter dans une conclusion ?","options":["Rappeler les idées principales","Ouvrir sur une réflexion plus large","Introduire un nouvel argument non développé","Réaffirmer la thèse"],"answer":"Introduire un nouvel argument non développé"}'),

('Cohérence et cohésion', 1, 25000, 'La cohérence assure la logique du texte (les idées s''enchaînent logiquement). La cohésion assure les liens linguistiques entre les phrases.',
 '{"type":"mcq","question":"Lequel de ces éléments assure la COHÉSION d''un texte ?","options":["L''originalité du sujet","L''utilisation de marqueurs de relation comme ''d''abord'', ''ensuite''","La longueur des paragraphes","Le nombre d''exemples"],"answer":"L''utilisation de marqueurs de relation comme ''d''abord'', ''ensuite''"}'),

('Marqueurs de temps', 1, 20000, 'Les marqueurs de temps organisent la chronologie dans un texte narratif.',
 '{"type":"mcq","question":"Lequel de ces marqueurs est un marqueur de TEMPS ?","options":["Cependant","Donc","Tout d''abord","Le lendemain"],"answer":"Le lendemain"}'),

('Marqueurs de cause', 1, 20000, 'Les marqueurs de cause indiquent la raison d''un événement ou d''une idée.',
 '{"type":"mcq","question":"Lequel de ces marqueurs exprime la CAUSE ?","options":["De plus","C''est pourquoi","Parce que","Par conséquent"],"answer":"Parce que"}'),

('Marqueurs de conséquence', 1, 20000, 'Les marqueurs de conséquence annoncent le résultat d''une cause.',
 '{"type":"mcq","question":"Lequel de ces marqueurs exprime la CONSÉQUENCE ?","options":["Parce que","Puisque","Donc","Bien que"],"answer":"Donc"}'),

('Marqueurs d''opposition', 1, 20000, 'Les marqueurs d''opposition introduisent une idée contraire ou nuancée.',
 '{"type":"mcq","question":"Lequel de ces marqueurs exprime une OPPOSITION ?","options":["En effet","De plus","Cependant","Ainsi"],"answer":"Cependant"}'),

('Choisir le bon marqueur', 1, 25000, 'Il faut choisir le marqueur qui correspond au rapport logique entre les deux idées.',
 '{"type":"mcq","question":"Complète avec le bon marqueur : « Il travaillait beaucoup. ___ , ses notes ne s''amélioraient pas. »","options":["De plus","Donc","En effet","Cependant"],"answer":"Cependant"}'),

('Éviter la répétition', 1, 25000, 'Dans un texte, on évite les répétitions en utilisant des synonymes ou des pronoms de substitution.',
 '{"type":"mcq","question":"Quelle technique permet d''éviter de répéter le mot « chat » dans un texte ?","options":["L''utiliser davantage","Le mettre en italique","Utiliser un synonyme ou un pronom","Le mettre entre guillemets"],"answer":"Utiliser un synonyme ou un pronom"}'),

('Reprise nominale', 1, 25000, 'La reprise nominale remplace un groupe nominal par un autre GN équivalent ou plus général.',
 '{"type":"mcq","question":"Dans « Marie est arrivée hier. Cette jeune femme nous a beaucoup surpris. », comment « Marie » est-elle reprise ?","options":["Par un pronom","Par une reprise nominale (ce jeune femme)","Par un synonyme","Par une ellipse"],"answer":"Par une reprise nominale (ce jeune femme)"}'),

('Paragraphe de développement', 1, 25000, 'Le développement d''un texte comprend les arguments, exemples et explications qui soutiennent la thèse.',
 '{"type":"mcq","question":"À quoi sert le développement dans un texte argumentatif ?","options":["À présenter le sujet","À conclure le texte","À défendre la thèse avec des arguments","À mettre le texte en forme"],"answer":"À défendre la thèse avec des arguments"}'),

('Unité du paragraphe', 1, 25000, 'Chaque paragraphe ne doit traiter qu''une seule idée principale.',
 '{"type":"mcq","question":"Lequel de ces problèmes affecte l''unité d''un paragraphe ?","options":["Un paragraphe court","Deux idées différentes dans le même paragraphe","Trop d''exemples","Une phrase-clé bien formulée"],"answer":"Deux idées différentes dans le même paragraphe"}'),

('Plan d''un texte narratif', 1, 25000, 'Le texte narratif suit généralement : situation initiale → élément déclencheur → péripéties → dénouement → situation finale.',
 '{"type":"mcq","question":"Dans la structure narrative, qu''est-ce qui suit l''élément déclencheur ?","options":["La situation initiale","Les péripéties","La situation finale","L''introduction"],"answer":"Les péripéties"}'),

('Description physique', 1, 25000, 'La description physique d''un personnage utilise des adjectifs, des comparaisons et un ordre logique.',
 '{"type":"mcq","question":"Pour décrire un personnage physiquement, quel type de mot est le plus utile ?","options":["Verbes d''action","Adverbes de temps","Adjectifs qualificatifs","Conjonctions"],"answer":"Adjectifs qualificatifs"}'),

('Description du cadre', 1, 25000, 'La description du cadre (lieu, temps, atmosphère) crée l''ambiance d''un récit.',
 '{"type":"mcq","question":"Pour créer une ambiance mélancolique dans un récit, laquelle de ces descriptions est la plus efficace ?","options":["Le soleil brillait joyeusement.","Le ciel était gris et un vent froid soufflait sur la ville.","Les oiseaux chantaient.","La ville était animée et pleine de monde."],"answer":"Le ciel était gris et un vent froid soufflait sur la ville."}'),

('Adapter le registre de langue', 1, 25000, 'On adapte son niveau de langue selon le destinataire et la situation de communication.',
 '{"type":"mcq","question":"Pour rédiger une lettre formelle à une directrice d''école, quel niveau de langue doit-on utiliser ?","options":["Familier","Standard ou soutenu","Très informel","Argotique"],"answer":"Standard ou soutenu"}'),

('Intention d''écriture', 1, 20000, 'Avant d''écrire, on doit identifier son intention : informer, raconter, convaincre, décrire ou exprimer.',
 '{"type":"mcq","question":"Un élève écrit un texte pour convaincre ses parents de lui acheter un chien. Quelle est son intention d''écriture ?","options":["Informer","Raconter","Convaincre","Décrire"],"answer":"Convaincre"}'),

('Phrase d''accroche', 1, 25000, 'La phrase d''accroche est la première phrase de l''introduction. Elle doit capter l''attention du lecteur.',
 '{"type":"mcq","question":"Laquelle de ces phrases d''accroche est la plus efficace pour un texte sur la pollution ?","options":["Je vais parler de la pollution.","La pollution est un sujet important.","Saviez-vous que l''air que vous respirez contient 10 fois plus de polluants qu''il y a 50 ans ?","La pollution c''est pas bon."],"answer":"Saviez-vous que l''air que vous respirez contient 10 fois plus de polluants qu''il y a 50 ans ?"}'),

('Formulation de la thèse', 1, 25000, 'La thèse est une affirmation claire et défendable qui exprime le point de vue de l''auteur.',
 '{"type":"mcq","question":"Laquelle de ces phrases est la meilleure thèse pour un texte argumentatif ?","options":["Le sport est un sujet intéressant.","Est-ce que le sport est bon ?","La pratique régulière d''un sport améliore la santé mentale et physique des adolescents.","Je vais vous parler du sport."],"answer":"La pratique régulière d''un sport améliore la santé mentale et physique des adolescents."}'),

('Emploi des temps dans un récit', 1, 25000, 'Dans un récit au passé, l''imparfait décrit l''arrière-plan et le passé composé (ou passé simple) exprime les actions.',
 '{"type":"mcq","question":"Dans un récit au passé, quel temps utilise-t-on pour décrire ce qui était en cours lorsqu''un événement s''est produit ?","options":["Futur simple","Passé composé","Imparfait","Conditionnel"],"answer":"Imparfait"}'),

('Transitions entre paragraphes', 1, 25000, 'Les transitions assurent la fluidité du texte en reliant logiquement les paragraphes entre eux.',
 '{"type":"mcq","question":"Lequel de ces éléments assure le mieux la transition entre deux paragraphes ?","options":["Commencer chaque paragraphe par « Je »","Utiliser un marqueur de relation ou rappeler l''idée précédente","Utiliser toujours des tirets","Répéter la même phrase-clé"],"answer":"Utiliser un marqueur de relation ou rappeler l''idée précédente"}'),

('Longueur des phrases', 1, 25000, 'Varier la longueur des phrases rend un texte plus dynamique et agréable à lire.',
 '{"type":"mcq","question":"Quel effet produit une suite de courtes phrases dans un texte narratif ?","options":["Crée de la lenteur","Crée du rythme et de l''urgence","Allonge inutilement le texte","Améliore la cohérence"],"answer":"Crée du rythme et de l''urgence"}'),

('Titre d''un texte', 1, 20000, 'Un bon titre annonce le sujet du texte, suscite la curiosité et est concis.',
 '{"type":"mcq","question":"Lequel de ces titres est le plus efficace pour un texte sur les dangers d''internet ?","options":["Internet","Mon texte sur internet","Internet : un outil précieux aux dangers bien réels","Texte numéro 3"],"answer":"Internet : un outil précieux aux dangers bien réels"}'),

('Paragraphe narratif vs descriptif', 1, 25000, 'Le paragraphe narratif raconte des événements (verbes d''action). Le descriptif brosse un tableau (adjectifs, verbes d''état).',
 '{"type":"mcq","question":"Lequel de ces paragraphes est principalement DESCRIPTIF ?","options":["Il courut, sauta et attrapa la balle.","La vieille maison, aux murs fissurés et aux volets vermous, se dressait au bord du lac.","Elle décida de partir le lendemain.","Il appela son ami et lui raconta tout."],"answer":"La vieille maison, aux murs fissurés et aux volets vermous, se dressait au bord du lac."}'),

('Plan d''un texte argumentatif', 1, 25000, 'Le plan dialectique (thèse / antithèse / synthèse) est souvent utilisé pour les textes argumentatifs.',
 '{"type":"mcq","question":"Dans un plan en 3 parties pour défendre une thèse, dans quelle partie présente-t-on les arguments principaux ?","options":["Dans l''introduction","Dans la 1re partie du développement","Dans la conclusion","Dans les notes de bas de page"],"answer":"Dans la 1re partie du développement"}'),

('Choix du type de texte', 1, 20000, 'On choisit le type de texte selon l''intention : narration, description, explication, argumentation, dialogue.',
 '{"type":"mcq","question":"Pour expliquer comment fonctionne la photosynthèse, quel type de texte faut-il rédiger ?","options":["Narratif","Explicatif","Argumentatif","Poétique"],"answer":"Explicatif"}'),

('Destinataire et adaptation', 1, 25000, 'Adapter son texte au destinataire (âge, connaissances, relation) est essentiel pour bien communiquer.',
 '{"type":"mcq","question":"Si vous écrivez un texte pour expliquer internet à un enfant de 8 ans, quel ton devez-vous adopter ?","options":["Très technique et précis","Simple, clair et accessible","Formel et distant","Ironique et subtil"],"answer":"Simple, clair et accessible"}'),

('Correction et révision', 1, 20000, 'Après la rédaction, il faut réviser son texte pour corriger les erreurs, améliorer le style et vérifier la cohérence.',
 '{"type":"mcq","question":"Quelle est la bonne ordre des étapes de rédaction ?","options":["Rédiger → Planifier → Réviser","Planifier → Rédiger → Réviser","Réviser → Planifier → Rédiger","Réviser → Rédiger → Planifier"],"answer":"Planifier → Rédiger → Réviser"}'),

('Exemples dans l''argumentation', 1, 25000, 'Les exemples viennent illustrer et concrétiser les arguments. Ils doivent être pertinents et reliés à l''argument.',
 '{"type":"mcq","question":"Un élève argumente que le sport améliore le moral. Quel exemple serait le plus pertinent ?","options":["Des chercheurs ont prouvé qu''une marche de 30 min libère des endorphines qui améliorent l''humeur.","Mon ami fait du sport.","Le sport peut causer des blessures.","Certains sports sont ennuyeux."],"answer":"Des chercheurs ont prouvé qu''une marche de 30 min libère des endorphines qui améliorent l''humeur."}'),

('Ponctuation dans un dialogue', 1, 25000, 'Dans un dialogue, on utilise les guillemets ou un tiret pour chaque prise de parole.',
 '{"type":"mcq","question":"Laquelle de ces mises en page est correcte pour un dialogue ?","options":["Il dit bonjour.","— Bonjour, dit-il.","Il dit : bonjour.","Bonjour! Dit-il."],"answer":"— Bonjour, dit-il."}'),

('Exemple d''argument efficace', 1, 25000, 'Un argument est efficace s''il est clair, appuyé par des preuves et relié à la thèse.',
 '{"type":"mcq","question":"Lequel de ces arguments est le plus solide pour défendre la thèse « Les livres sont importants » ?","options":["J''aime lire.","Les livres coûtent cher.","Des études montrent que lire améliore le vocabulaire et la concentration.","Les livres, c''est vieux."],"answer":"Des études montrent que lire améliore le vocabulaire et la concentration."}'),

-- ── DIFFICULTÉ 2 — Style et argumentation élaborés (33 questions) ─────────

('Rédiger une bonne phrase-clé', 2, 40000, 'La phrase-clé (aussi appelée idée directrice) doit être affirmative, claire et limité à un seul aspect du sujet.',
 '{"type":"mcq","question":"Laquelle de ces phrases-clés est la plus efficace pour introduire un argument sur les bienfaits de la lecture ?","options":["La lecture, c''est bien.","Je vais parler de la lecture.","La lecture stimule l''imagination et enrichit le vocabulaire.","Il y a plusieurs types de lecture."],"answer":"La lecture stimule l''imagination et enrichit le vocabulaire."}'),

('Enrichir la description', 2, 40000, 'On enrichit une description avec des détails sensoriels (vue, ouïe, odorat, goût, toucher).',
 '{"type":"mcq","question":"Laquelle de ces descriptions fait appel au plus grand nombre de sens ?","options":["Il y avait un gâteau.","Le gâteau était beau.","Le gâteau au chocolat exhalait un arôme chaud, sa croûte craquait sous le couteau et sa saveur fondante envahissait la bouche.","Il mangea le gâteau."],"answer":"Le gâteau au chocolat exhalait un arôme chaud, sa croûte craquait sous le couteau et sa saveur fondante envahissait la bouche."}'),

('Nuancer un argument', 2, 40000, 'Nuancer un argument consiste à reconnaître ses limites tout en maintenant sa position.',
 '{"type":"mcq","question":"Lequel de ces énoncés est une nuance d''un argument ?","options":["Mon argument est parfait.","Certes, certains jeux vidéo peuvent être chronophages, mais ils développent aussi des compétences cognitives importantes.","Les jeux vidéo sont toujours néfastes.","Je n''ai pas d''opinion sur les jeux vidéo."],"answer":"Certes, certains jeux vidéo peuvent être chronophages, mais ils développent aussi des compétences cognitives importantes."}'),

('Rédiger une transition', 2, 40000, 'Une bonne transition rappelle l''idée précédente et annonce la suivante.',
 '{"type":"mcq","question":"Laquelle de ces transitions est la plus efficace entre deux paragraphes sur les avantages du sport ?","options":["Maintenant je vais parler d''autre chose.","Voilà.","Après avoir montré les bienfaits physiques du sport, examinons ses avantages sur le plan mental.","Paragraphe 2."],"answer":"Après avoir montré les bienfaits physiques du sport, examinons ses avantages sur le plan mental."}'),

('Varier les formulations', 2, 35000, 'Éviter les formulations monotones en variant les structures de phrases et le vocabulaire.',
 '{"type":"mcq","question":"Comment éviter la répétition dans le texte suivant : « Les voitures polluent. Les voitures consomment beaucoup d''essence. Les voitures sont bruyantes. » ?","options":["Supprimer deux phrases","Remplacer les répétitions par des pronoms ou des synonymes","Ajouter plus de détails","Mettre en italique"],"answer":"Remplacer les répétitions par des pronoms ou des synonymes"}'),

('Rédiger une ouverture en conclusion', 2, 40000, 'L''ouverture en conclusion propose une réflexion plus large ou une piste de réflexion future.',
 '{"type":"mcq","question":"Laquelle de ces phrases est une bonne ouverture pour clôturer un texte sur la lecture ?","options":["Voilà, j''ai tout dit.","En conclusion, la lecture est importante.","Si lire façonne notre monde intérieur, qu''en est-il des autres formes d''art qui nous permettent également de grandir ?","Il faut relire mon texte."],"answer":"Si lire façonne notre monde intérieur, qu''en est-il des autres formes d''art qui nous permettent également de grandir ?"}'),

('Employer les figures de style à l''écrit', 2, 40000, 'Les figures de style enrichissent le style et renforcent l''effet produit sur le lecteur.',
 '{"type":"mcq","question":"Pour rendre une description plus expressive, laquelle de ces versions est meilleure ?","options":["Il faisait froid.","La neige tombait.","Un froid de loup mordait les joues des passants.","Il y avait de la neige."],"answer":"Un froid de loup mordait les joues des passants."}'),

('Pertinence des exemples', 2, 40000, 'Un exemple est pertinent s''il illustre clairement et directement l''argument qu''il appuie.',
 '{"type":"mcq","question":"Pour défendre l''argument « Le cinéma est un art majeur », lequel de ces exemples est le plus pertinent ?","options":["J''aime regarder des films le vendredi soir.","Des réalisateurs comme Spielberg ou Kubrick ont créé des œuvres culturelles majeures reconnues mondialement.","Les cinémas sont nombreux au Québec.","Les billets de cinéma sont chers."],"answer":"Des réalisateurs comme Spielberg ou Kubrick ont créé des œuvres culturelles majeures reconnues mondialement."}'),

('Registre épistolaire', 2, 40000, 'La lettre formelle a une structure précise : formule d''appel, corps (introduction, développement, conclusion), formule de politesse.',
 '{"type":"mcq","question":"Dans une lettre formelle, par quoi doit-on terminer avant la signature ?","options":["À bientôt !","Salut","Veuillez agréer, Madame, l''expression de mes salutations distinguées.","See you !"],"answer":"Veuillez agréer, Madame, l''expression de mes salutations distinguées."}'),

('Reformuler pour clarifier', 2, 40000, 'Reformuler une phrase aide à la rendre plus claire et plus précise.',
 '{"type":"mcq","question":"Reformulez la phrase confuse : « Le truc avec les gens c''est qu''ils font pas attention au temps qu''ils passent sur leur téléphone. » Laquelle de ces formulations est meilleure ?","options":["Les gens ne font pas attention.","Les individus négligent souvent de surveiller le temps qu''ils consacrent à leur téléphone.","Les téléphones c''est beaucoup utilisé.","Les gens aiment leurs téléphones."],"answer":"Les individus négligent souvent de surveiller le temps qu''ils consacrent à leur téléphone."}'),

('Texte explicatif — organisation', 2, 40000, 'Un texte explicatif bien structuré présente le phénomène, en décrit les causes et les effets, et peut proposer une conclusion.',
 '{"type":"mcq","question":"Dans un texte explicatif sur le réchauffement climatique, quel ordre d''idées est le plus logique ?","options":["Effets → Causes → Phénomène","Phénomène → Causes → Effets → Solutions","Solutions → Effets → Causes","Conclusion → Introduction → Développement"],"answer":"Phénomène → Causes → Effets → Solutions"}'),

('Décrire un personnage moralement', 2, 40000, 'La description morale d''un personnage révèle sa personnalité à travers ses actions, ses paroles et ses pensées.',
 '{"type":"mcq","question":"Laquelle de ces phrases décrit un personnage moralement (et non physiquement) ?","options":["Elle avait les yeux bleus et les cheveux noirs.","Elle mesurait 1m70.","Elle hésitait toujours à parler en premier, craignant de blesser les autres.","Elle portait une robe rouge."],"answer":"Elle hésitait toujours à parler en premier, craignant de blesser les autres."}'),

('Paragraphe d''opinion', 2, 40000, 'Un paragraphe d''opinion bien structuré : affirmation → justification → exemple → phrase de clôture.',
 '{"type":"mcq","question":"Dans un paragraphe d''opinion, dans quel ordre ces éléments apparaissent-ils généralement ?","options":["Exemple → Affirmation → Justification","Justification → Exemple → Affirmation","Affirmation → Justification → Exemple","Exemple → Justification → Affirmation"],"answer":"Affirmation → Justification → Exemple"}'),

('Emploi de la voix passive dans l''écriture', 2, 40000, 'La voix passive met l''accent sur l''objet de l''action plutôt que sur son auteur.',
 '{"type":"mcq","question":"Dans quel cas l''utilisation de la voix passive est-elle la plus pertinente ?","options":["Quand on veut mettre l''accent sur le sujet agissant","Quand l''auteur de l''action est inconnu ou sans importance","Pour rendre le texte plus actif","Dans les textes familiers seulement"],"answer":"Quand l''auteur de l''action est inconnu ou sans importance"}'),

-- ── DIFFICULTÉ 3 — Style littéraire et argumentation avancée (33 questions) ──

('Cohérence thématique', 3, 55000, 'La cohérence thématique garantit que tous les éléments du texte sont rattachés au même sujet et contribuent à la thèse.',
 '{"type":"mcq","question":"Dans un texte sur les avantages des transports en commun, laquelle de ces phrases nuit à la cohérence thématique ?","options":["Les transports en commun réduisent la pollution.","Prendre le métro est moins coûteux que d''avoir une voiture.","Mon quartier a une belle épicerie.","Les transports en commun réduisent le trafic routier."],"answer":"Mon quartier a une belle épicerie."}'),

('Ethos, pathos, logos', 3, 55000, 'Les trois moyens de persuasion : logos (raison, arguments logiques), pathos (émotions), ethos (crédibilité).',
 '{"type":"mcq","question":"Dans « Des études menées par l''OMS démontrent que le tabac cause 8 millions de morts par an », quel moyen de persuasion est utilisé ?","options":["Pathos (émotion)","Ethos (crédibilité personnelle)","Logos (argument logique avec données)","Aucun de ces moyens"],"answer":"Logos (argument logique avec données)"}'),

('Pathos dans l''argumentation', 3, 55000, 'Le pathos fait appel aux émotions du lecteur pour le convaincre.',
 '{"type":"mcq","question":"Dans « Imaginez un enfant qui n''a pas mangé depuis trois jours. Votre don peut changer sa vie. », quel moyen de persuasion est utilisé ?","options":["Logos","Ethos","Pathos","Aucun"],"answer":"Pathos"}'),

('Progression thématique', 3, 55000, 'La progression thématique est la manière dont les informations s''enchaînent (thème repris → rhème nouveau).',
 '{"type":"mcq","question":"Dans « Le soleil [thème] se levait [rhème]. Cette lumière dorée [thème] illuminait les toits [rhème]. Ces toits [thème] brillaient comme de l''or [rhème]. » Quel type de progression est utilisé ?","options":["Progression à thème constant","Progression linéaire","Progression éclatée","Aucune progression"],"answer":"Progression linéaire"}'),

('Écriture du point de vue d''un personnage', 3, 55000, 'Écrire à la 1re personne crée une proximité avec le lecteur mais limite le point de vue à ce que le personnage peut connaître.',
 '{"type":"mcq","question":"Quel est un avantage du récit à la 1re personne ?","options":["Le narrateur peut tout savoir","Le lecteur se sent proche du personnage","On peut décrire tous les personnages","Le narrateur est plus objectif"],"answer":"Le lecteur se sent proche du personnage"}'),

('Intertextualité', 3, 60000, 'L''intertextualité est la relation qu''un texte entretient avec d''autres textes (citation, allusion, parodie).',
 '{"type":"mcq","question":"Dans « Comme Roméo et Juliette, leur amour était condamné dès le départ », quel procédé littéraire est utilisé ?","options":["Métaphore","Hyperbole","Référence intertextuelle","Litote"],"answer":"Référence intertextuelle"}'),

('Analyser et corriger un texte', 3, 55000, 'Réviser un texte implique de vérifier la cohérence, les erreurs linguistiques, le style et l''organisation.',
 '{"type":"mcq","question":"En révisant un texte, dans quel ordre faut-il procéder ?","options":["Ponctuation → Organisation → Contenu","Contenu et organisation → Cohérence linguistique → Ponctuation et orthographe","Orthographe → Cohérence → Organisation","Il n''y a pas d''ordre précis"],"answer":"Contenu et organisation → Cohérence linguistique → Ponctuation et orthographe"}'),

('Paraphrase et plagiat', 3, 55000, 'La paraphrase reformule une idée avec ses propres mots. Le plagiat copie sans citer la source. Les deux sont différents.',
 '{"type":"mcq","question":"Quelle est la différence entre la paraphrase et le plagiat ?","options":["Il n''y a pas de différence","La paraphrase reformule avec ses propres mots, le plagiat copie mot pour mot sans citer","La paraphrase est interdite, le plagiat est permis","Le plagiat est plus court que la paraphrase"],"answer":"La paraphrase reformule avec ses propres mots, le plagiat copie mot pour mot sans citer"}'),

('Registre de l''écrit littéraire', 3, 55000, 'L''écrit littéraire se distingue par la recherche esthétique du style, l''originalité et la densité du sens.',
 '{"type":"mcq","question":"Lequel de ces éléments caractérise le mieux un texte littéraire de qualité ?","options":["L''absence totale de figures de style","La longueur maximale","La recherche du style, la richesse du vocabulaire et la profondeur du sens","L''utilisation du langage familier"],"answer":"La recherche du style, la richesse du vocabulaire et la profondeur du sens"}'),

('Rédiger un incipit efficace', 3, 60000, 'L''incipit est l''ouverture d''un roman ou d''un texte. Il doit capter l''attention, présenter le cadre et les personnages, et créer une tension.',
 '{"type":"mcq","question":"Lequel de ces débuts de récit (incipit) est le plus efficace ?","options":["Bonjour, je vais vous raconter une histoire.","C''est un texte de fiction.","Personne dans le village n''avait vu un hiver aussi brutal. Pourtant, ce soir-là, quelqu''un frappait à la porte de la vieille maison abandonnée.","Il était une fois."],"answer":"Personne dans le village n''avait vu un hiver aussi brutal. Pourtant, ce soir-là, quelqu''un frappait à la porte de la vieille maison abandonnée."}'),

('Organiser un plan complet', 3, 60000, 'Un plan bien construit prévoit l''introduction (avec accroche, thèse et annonce du plan), le développement (2-3 parties avec arguments et exemples) et la conclusion (rappel de la thèse, ouverture).',
 '{"type":"mcq","question":"Dans un plan en 3 parties, à quoi correspond la 3e partie d''un plan dialectique ?","options":["Les avantages","Les inconvénients","La synthèse ou dépassement des deux premières parties","L''introduction"],"answer":"La synthèse ou dépassement des deux premières parties"}'),

('Effet de la ponctuation sur le rythme', 3, 55000, 'La ponctuation crée un rythme dans le texte : les points d''exclamation donnent de l''intensité, les virgules créent un tempo rapide, les points-virgules marquent une pause plus longue.',
 '{"type":"mcq","question":"Quel effet crée l''utilisation fréquente de points d''exclamation dans un texte ?","options":["Une atmosphère calme et posée","Une impression d''intensité et d''émotion forte","Un ton objectif et neutre","Une logique argumentative rigoureuse"],"answer":"Une impression d''intensité et d''émotion forte"}'),

('Discours indirect libre', 3, 60000, 'Le discours indirect libre reproduit les pensées ou paroles d''un personnage sans les marquer par des guillemets ni de verbe introducteur. Il se fond dans la narration.',
 '{"type":"mcq","question":"Dans « Elle regarda la lettre. Non, ce n''était pas possible. Comment avait-il pu faire ça ? », quel procédé est utilisé pour la 2e et 3e phrases ?","options":["Discours direct","Discours indirect","Discours indirect libre","Monologue théâtral"],"answer":"Discours indirect libre"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
