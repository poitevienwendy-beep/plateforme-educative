-- ============================================================
-- COMPLÉMENT MATHÉMATIQUES — Partie 2
-- Géométrie (+25), Statistiques (+25), Probabilités (+20)
-- Exécuter dans Supabase → SQL Editor → Run
-- ============================================================

-- ─── GÉOMÉTRIE (+25) ──────────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-GEO') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Angles complémentaires', 1, 20000, 'Deux angles sont complémentaires si leur somme est 90°.',
 '{"type":"mcq","question":"Un angle mesure 35°. Quel est son complémentaire ?","options":["55°","65°","145°","125°"],"answer":"55°"}'),

('Angles supplémentaires', 1, 20000, 'Deux angles sont supplémentaires si leur somme est 180°.',
 '{"type":"mcq","question":"Un angle mesure 110°. Quel est son supplément ?","options":["70°","80°","90°","250°"],"answer":"70°"}'),

('Angles opposés par le sommet', 1, 15000, 'Les angles opposés par le sommet sont égaux.',
 '{"type":"mcq","question":"Deux droites se coupent et forment un angle de 65°. Quel est l angle opposé par le sommet ?","options":["25°","65°","115°","90°"],"answer":"65°"}'),

('Somme des angles d un triangle', 1, 15000, 'La somme des angles intérieurs d un triangle est 180°.',
 '{"type":"mcq","question":"Un triangle a des angles de 60° et 75°. Quel est le troisième ?","options":["35°","45°","55°","65°"],"answer":"45°"}'),

('Triangle isocèle — angles égaux', 1, 20000, 'Dans un triangle isocèle, les angles à la base sont égaux.',
 '{"type":"mcq","question":"Un triangle isocèle a un angle au sommet de 40°. Quels sont les angles à la base ?","options":["60° et 60°","70° et 70°","80° et 80°","40° et 100°"],"answer":"70° et 70°"}'),

('Quadrilatère — somme des angles', 1, 20000, 'La somme des angles d un quadrilatère est 360°.',
 '{"type":"mcq","question":"Un quadrilatère a trois angles de 80°, 95° et 110°. Quel est le quatrième ?","options":["75°","85°","95°","70°"],"answer":"75°"}'),

('Périmètre d un losange', 1, 15000, 'Tous les côtés d un losange sont égaux : P = 4c.',
 '{"type":"mcq","question":"Un losange a un côté de 7 cm. Quel est son périmètre ?","options":["14 cm","21 cm","28 cm","49 cm"],"answer":"28 cm"}'),

('Aire du parallélogramme', 1, 20000, 'A = base × hauteur',
 '{"type":"mcq","question":"Un parallélogramme a une base de 8 cm et une hauteur de 5 cm. Quelle est son aire ?","options":["13 cm²","26 cm²","40 cm²","80 cm²"],"answer":"40 cm²"}'),

('Aire du triangle', 1, 20000, 'A = (base × hauteur) ÷ 2',
 '{"type":"mcq","question":"Un triangle a une base de 10 cm et une hauteur de 6 cm. Quelle est son aire ?","options":["16 cm²","30 cm²","60 cm²","20 cm²"],"answer":"30 cm²"}'),

('Périmètre d un cercle (circonférence)', 1, 25000, 'C = 2πr ≈ 2 × 3,14 × r',
 '{"type":"mcq","question":"Un cercle a un rayon de 5 cm. Quelle est sa circonférence ? (π ≈ 3,14)","options":["15,7 cm","31,4 cm","78,5 cm","25 cm"],"answer":"31,4 cm"}'),

('Aire d un cercle', 1, 25000, 'A = πr²',
 '{"type":"mcq","question":"Un cercle a un rayon de 4 cm. Quelle est son aire ? (π ≈ 3,14)","options":["12,56 cm²","25,12 cm²","50,24 cm²","78,5 cm²"],"answer":"50,24 cm²"}'),

('Pythagore — hypoténuse', 2, 35000, 'Dans un triangle rectangle : c² = a² + b².',
 '{"type":"mcq","question":"Les deux côtés de l angle droit mesurent 3 cm et 4 cm. Quelle est l hypoténuse ?","options":["5 cm","6 cm","7 cm","25 cm"],"answer":"5 cm"}'),

('Pythagore — côté manquant', 2, 35000, 'a² = c² − b²',
 '{"type":"mcq","question":"L hypoténuse est 13 cm et un côté est 5 cm. Quel est l autre côté ?","options":["8 cm","9 cm","10 cm","12 cm"],"answer":"12 cm"}'),

('Droites parallèles et angles alternes', 2, 30000, 'Les angles alternes-internes sont égaux quand les droites sont parallèles.',
 '{"type":"mcq","question":"Une transversale coupe deux parallèles. Un angle est 70°. Quel est l angle alterne-interne ?","options":["20°","70°","110°","180°"],"answer":"70°"}'),

('Volume d un prisme rectangulaire', 2, 30000, 'V = longueur × largeur × hauteur',
 '{"type":"mcq","question":"Un prisme rectangulaire mesure 5 cm × 3 cm × 4 cm. Quel est son volume ?","options":["12 cm³","24 cm³","48 cm³","60 cm³"],"answer":"60 cm³"}'),

('Symétrie axiale', 2, 25000, 'L image par symétrie est à la même distance de l axe, de l autre côté.',
 '{"type":"mcq","question":"Le point A(3, 2) est reflété par rapport à l axe des y. Quelles sont ses nouvelles coordonnées ?","options":["(3, −2)","(−3, 2)","(−3, −2)","(2, 3)"],"answer":"(−3, 2)"}'),

('Translation d un point', 2, 30000, 'On additionne le vecteur de translation aux coordonnées du point.',
 '{"type":"mcq","question":"Le point B(1, 4) subit une translation de (+3, −2). Où se retrouve-t-il ?","options":["(4, 2)","(4, 6)","(−2, 6)","(3, 8)"],"answer":"(4, 2)"}'),

('Rotation 90° — coordonnées', 2, 35000, 'Une rotation de 90° antihoraire : (x, y) → (−y, x)',
 '{"type":"mcq","question":"Le point C(2, 3) subit une rotation de 90° (antihoraire) autour de l origine. Où se retrouve-t-il ?","options":["(−3, 2)","(3, −2)","(−2, −3)","(3, 2)"],"answer":"(−3, 2)"}'),

('Angles d un polygone régulier', 2, 35000, 'Angle intérieur = (n−2) × 180° ÷ n',
 '{"type":"mcq","question":"Quel est l angle intérieur d un hexagone régulier ?","options":["90°","108°","120°","135°"],"answer":"120°"}'),

('Aire d un trapèze', 2, 30000, 'A = (b₁ + b₂) × h ÷ 2',
 '{"type":"mcq","question":"Un trapèze a des bases de 6 cm et 10 cm, et une hauteur de 4 cm. Quelle est son aire ?","options":["32 cm²","24 cm²","40 cm²","48 cm²"],"answer":"32 cm²"}'),

('Volume d un cylindre', 3, 40000, 'V = πr²h',
 '{"type":"mcq","question":"Un cylindre a un rayon de 3 cm et une hauteur de 5 cm. Quel est son volume ? (π ≈ 3,14)","options":["47,1 cm³","94,2 cm³","141,3 cm³","28,3 cm³"],"answer":"141,3 cm³"}'),

('Agrandissement et réduction', 3, 40000, 'Les longueurs sont multipliées par le facteur d échelle k.',
 '{"type":"mcq","question":"Un triangle a un côté de 6 cm. On l agrandit avec un facteur 2,5. Quelle est la nouvelle longueur ?","options":["12 cm","15 cm","8,5 cm","10 cm"],"answer":"15 cm"}'),

('Théorème de Pythagore — vérification', 3, 35000, 'Un triangle est rectangle si c² = a² + b².',
 '{"type":"mcq","question":"Un triangle a des côtés de 7, 24 et 25 cm. Est-il rectangle ?","options":["Oui","Non","Impossible à dire","Seulement si l angle droit est connu"],"answer":"Oui"}'),

('Angle inscrit et angle central', 3, 40000, 'L angle inscrit est la moitié de l angle central qui intercepte le même arc.',
 '{"type":"mcq","question":"Un angle central mesure 100°. Quel est l angle inscrit correspondant ?","options":["100°","50°","200°","150°"],"answer":"50°"}'),

('Surface totale d un prisme', 3, 40000, 'Calculer la somme des aires de toutes les faces.',
 '{"type":"mcq","question":"Un cube a un côté de 4 cm. Quelle est sa surface totale ?","options":["64 cm²","80 cm²","96 cm²","48 cm²"],"answer":"96 cm²"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── STATISTIQUES (+25) ───────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-STAT') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Population et échantillon', 1, 15000, 'La population est l ensemble étudié ; l échantillon en est une partie.',
 '{"type":"mcq","question":"On interroge 50 élèves sur 800 pour connaître leur sport préféré. Les 50 forment un…","options":["paramètre","population","échantillon","recensement"],"answer":"échantillon"}'),

('Données qualitatives vs quantitatives', 1, 15000, 'Les données qualitatives décrivent une catégorie ; les quantitatives se mesurent.',
 '{"type":"mcq","question":"Lequel est une donnée quantitative ?","options":["couleur des yeux","sport préféré","taille en cm","langue parlée"],"answer":"taille en cm"}'),

('Tableau de fréquences — lecture', 1, 20000, 'La fréquence absolue est le nombre d occurrences.',
 '{"type":"mcq","question":"Dans un tableau, 12 élèves sur 30 ont répondu « oui ». Quelle est la fréquence relative ?","options":["12 %","30 %","40 %","50 %"],"answer":"40 %"}'),

('Diagramme à bandes — lecture', 1, 20000, 'On lit la hauteur de chaque barre.',
 '{"type":"mcq","question":"Un diagramme montre : pomme 8, banane 5, orange 7. Quel fruit est le plus populaire ?","options":["banane","orange","pomme","Tous également"],"answer":"pomme"}'),

('Diagramme circulaire — secteur', 1, 20000, 'L angle d un secteur = (fréquence/total) × 360°.',
 '{"type":"mcq","question":"20 % des élèves préfèrent les mathématiques. Quel angle représente ce secteur ?","options":["20°","36°","72°","90°"],"answer":"72°"}'),

('Calcul de la moyenne', 1, 20000, 'Moyenne = somme ÷ nombre de valeurs.',
 '{"type":"mcq","question":"Notes : 70, 80, 90, 60, 75. Quelle est la moyenne ?","options":["70","73","75","80"],"answer":"75"}'),

('Médiane — nombre impair de valeurs', 1, 20000, 'La médiane est la valeur centrale une fois triées.',
 '{"type":"mcq","question":"Données triées : 3, 5, 7, 9, 11. Quelle est la médiane ?","options":["5","7","9","6"],"answer":"7"}'),

('Médiane — nombre pair de valeurs', 1, 25000, 'Si le nombre de valeurs est pair, la médiane est la moyenne des deux valeurs centrales.',
 '{"type":"mcq","question":"Données triées : 4, 6, 8, 10. Quelle est la médiane ?","options":["6","7","8","9"],"answer":"7"}'),

('Mode d une distribution', 1, 15000, 'Le mode est la valeur qui apparaît le plus souvent.',
 '{"type":"mcq","question":"Données : 3, 5, 5, 7, 8, 5, 9. Quel est le mode ?","options":["3","5","7","9"],"answer":"5"}'),

('Étendue', 1, 15000, 'Étendue = valeur maximale − valeur minimale.',
 '{"type":"mcq","question":"Données : 12, 5, 18, 9, 22. Quelle est l étendue ?","options":["10","13","17","22"],"answer":"17"}'),

('Moyenne pondérée', 2, 30000, 'Chaque valeur est multipliée par son poids avant de diviser.',
 '{"type":"mcq","question":"Notes : 80 (coeff 2) et 70 (coeff 3). Quelle est la moyenne pondérée ?","options":["74","75","76","78"],"answer":"74"}'),

('Effet d un ajout sur la moyenne', 2, 30000, 'On recalcule avec la nouvelle valeur ajoutée.',
 '{"type":"mcq","question":"La moyenne de 4 notes est 75. On ajoute une note de 95. Quelle est la nouvelle moyenne ?","options":["79","80","81","85"],"answer":"79"}'),

('Diagramme de quartiles — Q1 Q2 Q3', 2, 35000, 'Q1 = 25e centile, Q2 = médiane, Q3 = 75e centile.',
 '{"type":"mcq","question":"Données triées (8 valeurs) : 2, 4, 5, 7, 8, 10, 12, 15. Quelle est la médiane (Q2) ?","options":["6","7","7,5","8"],"answer":"7,5"}'),

('Interprétation de l étendue', 2, 25000, 'Une grande étendue indique une grande dispersion.',
 '{"type":"mcq","question":"Groupe A : étendue 5. Groupe B : étendue 20. Quel groupe est plus dispersé ?","options":["Groupe A","Groupe B","Égaux","Impossible à dire"],"answer":"Groupe B"}'),

('Cumul des fréquences', 2, 30000, 'La fréquence cumulée s obtient en additionnant progressivement.',
 '{"type":"mcq","question":"Fréquences : 10, 15, 25. Quelle est la fréquence cumulée après le 2e groupe ?","options":["15","25","50","10"],"answer":"25"}'),

('Choix du graphique approprié', 2, 25000, 'Le diagramme circulaire convient pour les parts d un tout.',
 '{"type":"mcq","question":"On veut montrer la répartition des sports pratiqués dans une école. Quel graphique convient le mieux ?","options":["nuage de points","diagramme à ligne","diagramme circulaire","boîte à moustaches"],"answer":"diagramme circulaire"}'),

('Tableau de distribution — compléter', 2, 30000, 'La somme de toutes les fréquences = 100 %.',
 '{"type":"mcq","question":"Fréquences relatives : 25 %, 40 %, 20 %, ? %. Quelle est la valeur manquante ?","options":["5 %","10 %","15 %","20 %"],"answer":"15 %"}'),

('Biais dans un sondage', 2, 25000, 'Un biais survient quand l échantillon ne représente pas bien la population.',
 '{"type":"mcq","question":"On demande aux membres d un club de basketball leur sport préféré. Quel biais y a-t-il ?","options":["Biais de sélection","Biais de réponse","Pas de biais","Biais de mesure"],"answer":"Biais de sélection"}'),

('Histogramme vs diagramme à bandes', 2, 25000, 'L histogramme est pour des données continues ; les bandes pour des catégories.',
 '{"type":"mcq","question":"On veut représenter la distribution des tailles des élèves. Quel graphique utiliser ?","options":["diagramme circulaire","diagramme à bandes","histogramme","nuage de points"],"answer":"histogramme"}'),

('Corrélation — interprétation', 2, 30000, 'Une corrélation positive : quand x augmente, y augmente aussi.',
 '{"type":"mcq","question":"Plus on étudie, meilleures sont les notes. Quel type de corrélation ?","options":["Négative","Nulle","Positive","Impossible à dire"],"answer":"Positive"}'),

('Valeur aberrante et impact', 3, 40000, 'Une valeur aberrante affecte surtout la moyenne.',
 '{"type":"mcq","question":"Notes : 70, 75, 80, 72, 0. Quelle mesure est la plus affectée par la note de 0 ?","options":["mode","médiane","moyenne","étendue"],"answer":"moyenne"}'),

('Comparaison deux ensembles', 3, 40000, 'Comparer les mesures de tendance centrale et de dispersion.',
 '{"type":"mcq","question":"Classe A : moyenne 75, étendue 10. Classe B : moyenne 75, étendue 30. Que peut-on dire ?","options":["A est plus dispersée","B est plus dispersée","Elles sont identiques","B a de meilleures notes"],"answer":"B est plus dispersée"}'),

('Prédire à partir d un graphique', 3, 40000, 'On prolonge la tendance observée.',
 '{"type":"mcq","question":"Selon un graphique linéaire, la valeur double chaque année. Si elle est à 4 en année 1, quelle est-elle en année 3 ?","options":["8","12","16","6"],"answer":"16"}'),

('Collecte de données — méthode', 3, 35000, 'Choisir la méthode adaptée à l objectif.',
 '{"type":"mcq","question":"Pour connaître les préférences musicales de 1 000 élèves d une école, quelle méthode est la plus efficace ?","options":["Interroger tout le monde","Interroger un échantillon aléatoire","Interroger uniquement les amis","Chercher sur internet"],"answer":"Interroger un échantillon aléatoire"}'),

('Interprétation nuage de points', 3, 40000, 'Chaque point représente une observation avec deux variables.',
 '{"type":"mcq","question":"Dans un nuage de points montrant taille vs poids, les points suivent une tendance montante. Que peut-on conclure ?","options":["Corrélation négative","Pas de corrélation","Corrélation positive","Causalité directe"],"answer":"Corrélation positive"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── PROBABILITÉS (+20) ───────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-PROB') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Événement certain vs impossible', 1, 15000, 'P(certain) = 1, P(impossible) = 0.',
 '{"type":"mcq","question":"Quelle est la probabilité d obtenir un 7 en lançant un dé à 6 faces ?","options":["0","1/6","1/7","1"],"answer":"0"}'),

('Espace échantillonnal — pièce', 1, 15000, 'Pile ou face : l espace est {P, F}.',
 '{"type":"mcq","question":"On lance une pièce deux fois. Combien d issues y a-t-il ?","options":["2","3","4","6"],"answer":"4"}'),

('Probabilité d un résultat pair', 1, 15000, 'Les résultats pairs sur un dé : 2, 4, 6.',
 '{"type":"mcq","question":"Quelle est la probabilité d obtenir un nombre pair en lançant un dé ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/2"}'),

('Complémentaire d un événement', 1, 20000, 'P(Ā) = 1 − P(A).',
 '{"type":"mcq","question":"La probabilité qu il pleuve est 0,3. Quelle est la probabilité qu il ne pleuve pas ?","options":["0,3","0,5","0,7","1"],"answer":"0,7"}'),

('Probabilité sur urne simple', 1, 20000, 'P = nombre de résultats favorables ÷ nombre total de résultats.',
 '{"type":"mcq","question":"Une urne contient 3 boules rouges, 2 bleues et 5 vertes. Quelle est la probabilité de tirer une rouge ?","options":["1/3","3/10","2/5","1/10"],"answer":"3/10"}'),

('Événements mutuellement exclusifs', 1, 20000, 'Deux événements s excluent s ils ne peuvent pas arriver ensemble.',
 '{"type":"mcq","question":"Peut-on obtenir à la fois un 3 et un nombre pair sur un dé standard ?","options":["Oui, si on lance deux fois","Non, ils s excluent","Oui, avec probabilité 1/6","Oui, toujours"],"answer":"Non, ils s excluent"}'),

('Simulation — interprétation', 1, 20000, 'La fréquence relative converge vers la probabilité théorique.',
 '{"type":"mcq","question":"On lance un dé 60 fois. En théorie, combien de fois obtient-on un 4 ?","options":["4","6","10","12"],"answer":"10"}'),

('Addition — événements exclusifs', 2, 25000, 'P(A ou B) = P(A) + P(B) si A et B s excluent.',
 '{"type":"mcq","question":"P(rouge) = 0,2 et P(bleu) = 0,3. Si les couleurs s excluent, P(rouge ou bleu) = ?","options":["0,06","0,5","0,6","1"],"answer":"0,5"}'),

('Probabilité — carte à jouer', 2, 25000, 'Un jeu standard a 52 cartes : 4 couleurs de 13 cartes chacune.',
 '{"type":"mcq","question":"Quelle est la probabilité de tirer un roi dans un jeu de 52 cartes ?","options":["1/13","4/52","1/52","1/4"],"answer":"1/13"}'),

('Diagramme en arbre — deux lancers', 2, 35000, 'Un arbre liste toutes les issues possibles.',
 '{"type":"mcq","question":"On lance un dé deux fois. Combien d issues donnent un total de 7 ?","options":["4","5","6","7"],"answer":"6"}'),

('Probabilité conditionnelle simple', 2, 35000, 'P(B|A) : probabilité de B sachant que A s est réalisé.',
 '{"type":"mcq","question":"Un sac contient 4 rouges et 6 bleues. On tire une boule rouge et on ne la remet pas. Quelle est la probabilité d en tirer une autre rouge ?","options":["4/10","3/9","3/10","4/9"],"answer":"3/9"}'),

('Événements indépendants', 2, 30000, 'P(A et B) = P(A) × P(B) si A et B sont indépendants.',
 '{"type":"mcq","question":"On lance une pièce et un dé. P(pile et 6) = ?","options":["1/6","1/2","1/12","1/3"],"answer":"1/12"}'),

('Probabilité — expérience aléatoire', 2, 25000, 'Une expérience est aléatoire si le résultat n est pas prévisible.',
 '{"type":"mcq","question":"Laquelle est une expérience aléatoire ?","options":["Calculer 3 + 4","Lancer un dé","Mesurer une table","Lire un texte"],"answer":"Lancer un dé"}'),

('Fréquence relative et probabilité', 2, 30000, 'Après beaucoup d essais, la fréquence relative se rapproche de la probabilité.',
 '{"type":"mcq","question":"On tire une bille 200 fois et on obtient rouge 80 fois. Quelle est la probabilité expérimentale du rouge ?","options":["0,20","0,30","0,40","0,80"],"answer":"0,40"}'),

('Probabilité — jeu de hasard', 2, 30000, 'La probabilité de gagner = issues favorables ÷ issues totales.',
 '{"type":"mcq","question":"Une roue a 8 cases égales numérotées 1 à 8. Quelle est la probabilité d obtenir un multiple de 4 ?","options":["1/8","2/8","3/8","4/8"],"answer":"2/8"}'),

('Espérance — concept', 3, 40000, 'L espérance = somme de (valeur × probabilité) pour chaque résultat.',
 '{"type":"mcq","question":"Un jeu : on gagne 10 $ avec P = 0,2 et on perd 2 $ avec P = 0,8. Quel est le gain espéré ?","options":["−2 $","0,40 $","1,60 $","8 $"],"answer":"0,40 $"}'),

('Probabilité — trois lancers pièce', 3, 40000, 'On multiplie les probabilités pour des épreuves indépendantes.',
 '{"type":"mcq","question":"On lance une pièce 3 fois. Quelle est la probabilité d obtenir trois piles ?","options":["1/2","1/4","1/6","1/8"],"answer":"1/8"}'),

('Combinaisons — dénombrement', 3, 45000, 'Le nombre de façons de choisir k éléments parmi n.',
 '{"type":"mcq","question":"On choisit 2 élèves parmi 5 pour représenter la classe. Combien de paires différentes ?","options":["5","10","15","20"],"answer":"10"}'),

('Simulation — grand nombre essais', 3, 40000, 'La loi des grands nombres : plus d essais → plus proche de la théorie.',
 '{"type":"mcq","question":"On lance un dé honnête 600 fois. Quel résultat est le plus probable pour le nombre de 6 ?","options":["50","100","150","200"],"answer":"100"}'),

('Problème — probabilité classique', 3, 40000, 'Identifier l espace échantillonnal et les cas favorables.',
 '{"type":"mcq","question":"On tire au hasard un nombre entier entre 1 et 20. Quelle est la probabilité qu il soit premier ?","options":["1/4","2/5","2/4","3/10"],"answer":"2/5"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
