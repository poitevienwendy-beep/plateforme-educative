-- Supplément SEC1_MAT_geometrie : +76 questions (74 → 150)
-- PFEQ-MAT-SEC1-GEO

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-GEO') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (26 questions)
('Identifier un triangle selon ses côtés', 1, 20000, 'Un triangle équilatéral a ses 3 côtés égaux.',
 '{"type":"mcq","question":"Quel type de triangle possède 3 côtés de longueur égale ?","options":["Isocèle","Scalène","Équilatéral","Rectangle"],"answer":"Équilatéral"}'),

('Identifier un triangle isocèle', 1, 20000, 'Un triangle isocèle a exactement 2 côtés égaux.',
 '{"type":"mcq","question":"Un triangle a deux côtés de 5 cm et un côté de 7 cm. Quel type de triangle est-ce ?","options":["Équilatéral","Isocèle","Scalène","Rectangle"],"answer":"Isocèle"}'),

('Somme des angles d''un triangle', 1, 22000, 'La somme des angles intérieurs d''un triangle est toujours 180°.',
 '{"type":"mcq","question":"Un triangle a des angles de 60° et 80°. Quel est le troisième angle ?","options":["20°","40°","60°","80°"],"answer":"40°"}'),

('Angle droit', 1, 18000, 'Un angle droit mesure exactement 90°.',
 '{"type":"mcq","question":"Comment s''appelle un angle qui mesure 90° ?","options":["Aigu","Obtus","Droit","Plat"],"answer":"Droit"}'),

('Angle aigu', 1, 18000, 'Un angle aigu mesure entre 0° et 90°.',
 '{"type":"mcq","question":"Lequel de ces angles est un angle aigu ?","options":["95°","90°","130°","45°"],"answer":"45°"}'),

('Angle obtus', 1, 18000, 'Un angle obtus mesure entre 90° et 180°.',
 '{"type":"mcq","question":"Lequel de ces angles est un angle obtus ?","options":["45°","90°","120°","180°"],"answer":"120°"}'),

('Angles complémentaires', 1, 22000, 'Deux angles complémentaires ont une somme de 90°. Si l''un est 35°, l''autre est 55°.',
 '{"type":"mcq","question":"Deux angles sont complémentaires. L''un mesure 35°. Quel est l''autre ?","options":["35°","45°","55°","145°"],"answer":"55°"}'),

('Angles supplémentaires', 1, 22000, 'Deux angles supplémentaires ont une somme de 180°. 180° − 110° = 70°.',
 '{"type":"mcq","question":"Deux angles sont supplémentaires. L''un mesure 110°. Quel est l''autre ?","options":["70°","80°","110°","90°"],"answer":"70°"}'),

('Périmètre d''un rectangle', 1, 22000, 'P = 2l + 2w = 2(6) + 2(4) = 12 + 8 = 20 cm.',
 '{"type":"mcq","question":"Calcule le périmètre d''un rectangle de longueur 6 cm et largeur 4 cm.","options":["10 cm","20 cm","24 cm","48 cm"],"answer":"20 cm"}'),

('Périmètre d''un carré', 1, 20000, 'P = 4 × côté = 4 × 5 = 20 cm.',
 '{"type":"mcq","question":"Calcule le périmètre d''un carré de côté 5 cm.","options":["10 cm","15 cm","20 cm","25 cm"],"answer":"20 cm"}'),

('Périmètre d''un triangle équilatéral', 1, 20000, 'P = 3 × côté = 3 × 7 = 21 cm.',
 '{"type":"mcq","question":"Un triangle équilatéral a un côté de 7 cm. Quel est son périmètre ?","options":["14 cm","18 cm","21 cm","49 cm"],"answer":"21 cm"}'),

('Aire d''un carré', 1, 20000, 'A = côté² = 6² = 36 cm².',
 '{"type":"mcq","question":"Calcule l''aire d''un carré de côté 6 cm.","options":["12 cm²","24 cm²","36 cm²","66 cm²"],"answer":"36 cm²"}'),

('Aire d''un rectangle', 1, 20000, 'A = l × w = 8 × 3 = 24 cm².',
 '{"type":"mcq","question":"Calcule l''aire d''un rectangle de longueur 8 cm et largeur 3 cm.","options":["11 cm²","22 cm²","24 cm²","48 cm²"],"answer":"24 cm²"}'),

('Aire d''un triangle', 1, 22000, 'A = (base × hauteur) / 2 = (10 × 6) / 2 = 30 cm².',
 '{"type":"mcq","question":"Calcule l''aire d''un triangle de base 10 cm et hauteur 6 cm.","options":["30 cm²","60 cm²","16 cm²","32 cm²"],"answer":"30 cm²"}'),

('Identifier un quadrilatère', 1, 18000, 'Un quadrilatère est un polygone à 4 côtés.',
 '{"type":"mcq","question":"Combien de côtés possède un quadrilatère ?","options":["3","4","5","6"],"answer":"4"}'),

('Identifier un pentagone', 1, 18000, 'Un pentagone a 5 côtés.',
 '{"type":"mcq","question":"Combien de côtés possède un pentagone régulier ?","options":["4","5","6","8"],"answer":"5"}'),

('Propriété d''un parallélogramme', 1, 20000, 'Dans un parallélogramme, les côtés opposés sont parallèles et égaux.',
 '{"type":"mcq","question":"Quelle est la propriété caractéristique d''un parallélogramme ?","options":["Tous les angles sont droits","Les diagonales sont égales","Les côtés opposés sont parallèles et égaux","Tous les côtés sont égaux"],"answer":"Les côtés opposés sont parallèles et égaux"}'),

('Propriété d''un losange', 1, 20000, 'Un losange est un parallélogramme dont tous les côtés sont égaux.',
 '{"type":"mcq","question":"Qu''est-ce qui distingue un losange d''un simple parallélogramme ?","options":["Ses angles sont droits","Tous ses côtés sont égaux","Ses diagonales sont égales","Il a 5 côtés"],"answer":"Tous ses côtés sont égaux"}'),

('Droites parallèles', 1, 18000, 'Deux droites parallèles ne se croisent jamais et ont la même pente.',
 '{"type":"mcq","question":"Deux droites parallèles sont des droites qui...","options":["Se croisent à angle droit","Ne se croisent jamais","Se croisent en un point quelconque","Ont la même longueur"],"answer":"Ne se croisent jamais"}'),

('Droites perpendiculaires', 1, 18000, 'Deux droites perpendiculaires se croisent à 90°.',
 '{"type":"mcq","question":"Deux droites perpendiculaires forment un angle de...","options":["45°","60°","90°","180°"],"answer":"90°"}'),

('Rayon et diamètre d''un cercle', 1, 20000, 'Diamètre = 2 × rayon. Si rayon = 5, diamètre = 10.',
 '{"type":"mcq","question":"Un cercle a un rayon de 5 cm. Quel est son diamètre ?","options":["2,5 cm","5 cm","10 cm","25 cm"],"answer":"10 cm"}'),

('Circonférence d''un cercle (formule)', 1, 22000, 'C = πd = π × 8 ≈ 3,14 × 8 ≈ 25,12 cm.',
 '{"type":"mcq","question":"Calcule la circonférence d''un cercle de diamètre 8 cm (π ≈ 3,14).","options":["25,12 cm","50,24 cm","12,56 cm","200,96 cm"],"answer":"25,12 cm"}'),

('Aire d''un cercle', 1, 22000, 'A = πr² = π × 4² = π × 16 ≈ 50,24 cm².',
 '{"type":"mcq","question":"Calcule l''aire d''un cercle de rayon 4 cm (π ≈ 3,14).","options":["12,56 cm²","25,12 cm²","50,24 cm²","100,48 cm²"],"answer":"50,24 cm²"}'),

('Plan cartésien : identifier un point', 1, 20000, 'Le point (3, −2) est à 3 unités à droite et 2 unités en dessous de l''origine.',
 '{"type":"mcq","question":"Dans quel quadrant se trouve le point (3, −2) ?","options":["Quadrant I","Quadrant II","Quadrant III","Quadrant IV"],"answer":"Quadrant IV"}'),

('Plan cartésien : coordonnées', 1, 20000, 'L''axe des abscisses (x) est horizontal, l''axe des ordonnées (y) est vertical.',
 '{"type":"mcq","question":"Quelles sont les coordonnées de l''origine du plan cartésien ?","options":["(1, 1)","(0, 1)","(1, 0)","(0, 0)"],"answer":"(0, 0)"}'),

('Translation : image d''un point', 1, 22000, 'Translation de (2, 3) : point (4, 1) devient (4+2, 1+3) = (6, 4).',
 '{"type":"mcq","question":"On applique une translation de vecteur (2, 3) au point (4, 1). Quelles sont les coordonnées de l''image ?","options":["(6, 4)","(2, −2)","(8, 3)","(4, 4)"],"answer":"(6, 4)"}'),

-- DIFFICULTÉ 2 (25 questions)
('Théorème de Pythagore : trouver l''hypoténuse', 2, 35000, 'a² + b² = c². 3² + 4² = 9 + 16 = 25 = 5². Hypoténuse = 5.',
 '{"type":"mcq","question":"Un triangle rectangle a des cathètes de 3 cm et 4 cm. Quelle est la longueur de l''hypoténuse ?","options":["5 cm","6 cm","7 cm","12 cm"],"answer":"5 cm"}'),

('Théorème de Pythagore : trouver une cathète', 2, 35000, 'c² = a² + b² → a² = c² − b² = 13² − 5² = 169 − 25 = 144 → a = 12.',
 '{"type":"mcq","question":"Un triangle rectangle a une hypoténuse de 13 cm et une cathète de 5 cm. Quelle est la deuxième cathète ?","options":["8 cm","10 cm","12 cm","18 cm"],"answer":"12 cm"}'),

('Vérifier si un triangle est rectangle', 2, 35000, '6² + 8² = 36 + 64 = 100 = 10². Oui, triangle rectangle.',
 '{"type":"mcq","question":"Un triangle a des côtés de 6 cm, 8 cm et 10 cm. Est-il rectangle ?","options":["Oui","Non","Impossible à déterminer","Oui mais isocèle"],"answer":"Oui"}'),

('Angles alternes-internes', 2, 32000, 'Deux droites parallèles coupées par une transversale forment des angles alternes-internes égaux.',
 '{"type":"mcq","question":"Deux droites parallèles sont coupées par une transversale. Un angle alterne-interne mesure 65°. Quel est son correspondant alterne-interne ?","options":["25°","65°","115°","180°"],"answer":"65°"}'),

('Angles correspondants', 2, 32000, 'Deux droites parallèles coupées par une transversale : les angles correspondants sont égaux.',
 '{"type":"mcq","question":"Deux droites parallèles sont coupées par une transversale formant un angle de 75°. Quel est l''angle correspondant ?","options":["15°","75°","105°","180°"],"answer":"75°"}'),

('Angles co-internes', 2, 32000, 'Les angles co-internes (du même côté de la transversale) sont supplémentaires : somme = 180°.',
 '{"type":"mcq","question":"Un angle co-interne mesure 70° (entre deux droites parallèles). Quel est l''autre angle co-interne ?","options":["70°","80°","100°","110°"],"answer":"110°"}'),

('Aire d''un parallélogramme', 2, 30000, 'A = base × hauteur = 8 × 5 = 40 cm².',
 '{"type":"mcq","question":"Calcule l''aire d''un parallélogramme de base 8 cm et hauteur 5 cm.","options":["13 cm²","26 cm²","40 cm²","80 cm²"],"answer":"40 cm²"}'),

('Aire d''un trapèze', 2, 32000, 'A = (b₁ + b₂)/2 × h = (6 + 10)/2 × 4 = 8 × 4 = 32 cm².',
 '{"type":"mcq","question":"Calcule l''aire d''un trapèze de bases 6 cm et 10 cm, avec une hauteur de 4 cm.","options":["32 cm²","64 cm²","24 cm²","40 cm²"],"answer":"32 cm²"}'),

('Volume d''un prisme rectangulaire', 2, 32000, 'V = l × w × h = 5 × 3 × 4 = 60 cm³.',
 '{"type":"mcq","question":"Calcule le volume d''un prisme rectangulaire de longueur 5 cm, largeur 3 cm et hauteur 4 cm.","options":["12 cm³","48 cm³","60 cm³","120 cm³"],"answer":"60 cm³"}'),

('Volume d''un cube', 2, 30000, 'V = côté³ = 4³ = 64 cm³.',
 '{"type":"mcq","question":"Calcule le volume d''un cube de côté 4 cm.","options":["16 cm³","48 cm³","64 cm³","128 cm³"],"answer":"64 cm³"}'),

('Surface d''un prisme', 2, 35000, 'Aire latérale + 2 faces : 2(lb + lh + wh) = 2(15 + 20 + 12) = 2(47) = 94 cm².',
 '{"type":"mcq","question":"Calcule l''aire totale d''un prisme rectangulaire de 5 cm × 3 cm × 4 cm.","options":["60 cm²","74 cm²","94 cm²","120 cm²"],"answer":"94 cm²"}'),

('Symétrie axiale : image d''un point', 2, 32000, 'Symétrie par rapport à l''axe des y : (x, y) → (−x, y). Point (3, 2) → (−3, 2).',
 '{"type":"mcq","question":"Quel est l''image du point (3, 2) par une réflexion par rapport à l''axe des y ?","options":["(3, −2)","(−3, 2)","(−3, −2)","(2, 3)"],"answer":"(−3, 2)"}'),

('Symétrie axiale : axe des x', 2, 32000, 'Symétrie par rapport à l''axe des x : (x, y) → (x, −y). Point (4, −1) → (4, 1).',
 '{"type":"mcq","question":"Quel est l''image du point (4, −1) par une réflexion par rapport à l''axe des x ?","options":["(−4, −1)","(4, 1)","(−4, 1)","(1, −4)"],"answer":"(4, 1)"}'),

('Rotation de 90° dans le sens antihoraire', 2, 35000, 'Rotation de 90° antihoraire autour de l''origine : (x, y) → (−y, x). (3, 1) → (−1, 3).',
 '{"type":"mcq","question":"Quelle est l''image du point (3, 1) après une rotation de 90° antihoraire autour de l''origine ?","options":["(1, 3)","(−1, 3)","(−3, 1)","(3, −1)"],"answer":"(−1, 3)"}'),

('Agrandissement et réduction (homothétie)', 2, 32000, 'Facteur d''homothétie 2 : les côtés doublent, les aires quadruplent.',
 '{"type":"mcq","question":"Un carré de 3 cm de côté est agrandi par un facteur de 2. Quelle est la nouvelle aire ?","options":["18 cm²","24 cm²","36 cm²","6 cm²"],"answer":"36 cm²"}'),

('Distance entre deux points', 2, 35000, 'd = √[(x₂−x₁)² + (y₂−y₁)²] = √[(5−1)² + (7−4)²] = √[16+9] = √25 = 5.',
 '{"type":"mcq","question":"Calcule la distance entre les points (1, 4) et (5, 7).","options":["3","4","5","7"],"answer":"5"}'),

('Milieu d''un segment', 2, 32000, 'M = ((x₁+x₂)/2, (y₁+y₂)/2) = ((2+8)/2, (3+7)/2) = (5, 5).',
 '{"type":"mcq","question":"Quel est le milieu du segment joignant (2, 3) et (8, 7) ?","options":["(4, 5)","(5, 5)","(6, 4)","(3, 2)"],"answer":"(5, 5)"}'),

('Angle central dans un cercle', 2, 32000, 'L''angle inscrit est la moitié de l''angle central qui intercepte le même arc.',
 '{"type":"mcq","question":"Un angle central dans un cercle mesure 80°. Quel est l''angle inscrit qui intercepte le même arc ?","options":["40°","80°","160°","20°"],"answer":"40°"}'),

('Nombre de diagonales d''un polygone', 2, 30000, 'Nombre de diagonales = n(n−3)/2 pour un hexagone (n=6) : 6(3)/2 = 9.',
 '{"type":"mcq","question":"Combien de diagonales possède un hexagone ?","options":["6","8","9","12"],"answer":"9"}'),

('Somme des angles d''un quadrilatère', 2, 28000, 'Somme des angles intérieurs d''un quadrilatère = 360°.',
 '{"type":"mcq","question":"Quelle est la somme des angles intérieurs d''un quadrilatère ?","options":["180°","270°","360°","540°"],"answer":"360°"}'),

('Angles d''un polygone régulier', 2, 32000, 'Angle intérieur d''un polygone régulier à n côtés = 180(n−2)/n. Hexagone : 180(4)/6 = 120°.',
 '{"type":"mcq","question":"Quel est la mesure de chaque angle intérieur d''un hexagone régulier ?","options":["108°","120°","135°","144°"],"answer":"120°"}'),

('Rapport de similitude', 2, 32000, 'Si deux triangles similaires ont des côtés dans le rapport 2:3, leurs aires sont dans le rapport 4:9.',
 '{"type":"mcq","question":"Deux triangles similaires ont des côtés dans le rapport 2:3. Quel est le rapport de leurs aires ?","options":["2:3","4:6","4:9","8:27"],"answer":"4:9"}'),

('Volume d''un cylindre', 2, 35000, 'V = πr²h = π(3²)(10) = 90π ≈ 282,6 cm³.',
 '{"type":"mcq","question":"Calcule le volume d''un cylindre de rayon 3 cm et hauteur 10 cm (π ≈ 3,14).","options":["94,2 cm³","188,4 cm³","282,6 cm³","377 cm³"],"answer":"282,6 cm³"}'),

('Triangles semblables : trouver un côté', 2, 35000, 'Triangles semblables ABC et DEF. AB/DE = AC/DF → 4/6 = 6/x → x = 9.',
 '{"type":"mcq","question":"Deux triangles semblables ont des côtés correspondants : 4 cm et 6 cm. Si un autre côté du premier triangle mesure 6 cm, quel est le côté correspondant du second ?","options":["8 cm","9 cm","10 cm","12 cm"],"answer":"9 cm"}'),

('Plan cartésien : pente d''une droite', 2, 32000, 'Pente = (y₂−y₁)/(x₂−x₁) = (7−3)/(5−1) = 4/4 = 1.',
 '{"type":"mcq","question":"Quelle est la pente de la droite passant par (1, 3) et (5, 7) ?","options":["0,5","1","2","4"],"answer":"1"}'),

-- DIFFICULTÉ 3 (25 questions)
('Théorème de Pythagore : problème en contexte', 3, 45000, 'Un échelle de 10 m appuyée contre un mur, pied à 6 m du mur. Hauteur = √(100−36) = √64 = 8 m.',
 '{"type":"mcq","question":"Une échelle de 10 m est appuyée contre un mur. Le pied de l''échelle est à 6 m du mur. À quelle hauteur touche-t-elle le mur ?","options":["4 m","6 m","8 m","16 m"],"answer":"8 m"}'),

('Lieu géométrique', 3, 45000, 'L''ensemble des points équidistants d''un centre est un cercle.',
 '{"type":"mcq","question":"Quel est le lieu géométrique de tous les points à 5 cm d''un point fixe O ?","options":["Une droite","Un segment","Un cercle de rayon 5 cm","Un carré"],"answer":"Un cercle de rayon 5 cm"}'),

('Angle inscrit dans un demi-cercle', 3, 42000, 'Tout angle inscrit dans un demi-cercle est un angle droit (90°). Théorème de Thalès.',
 '{"type":"mcq","question":"Un angle est inscrit dans un demi-cercle (il s''appuie sur le diamètre). Quelle est sa mesure ?","options":["45°","60°","90°","180°"],"answer":"90°"}'),

('Volume d''une pyramide', 3, 45000, 'V = (1/3) × Base × hauteur = (1/3) × 36 × 12 = 144 cm³.',
 '{"type":"mcq","question":"Calcule le volume d''une pyramide à base carrée de côté 6 cm et hauteur 12 cm.","options":["72 cm³","144 cm³","216 cm³","432 cm³"],"answer":"144 cm³"}'),

('Volume d''un cône', 3, 45000, 'V = (1/3)πr²h = (1/3) × 3,14 × 4² × 9 = (1/3) × 3,14 × 144 = 150,72 cm³.',
 '{"type":"mcq","question":"Calcule le volume d''un cône de rayon 4 cm et hauteur 9 cm (π ≈ 3,14).","options":["150,72 cm³","452,16 cm³","75,36 cm³","301,44 cm³"],"answer":"150,72 cm³"}'),

('Déplacement composé de transformations', 3, 45000, 'Translation (3,1) puis réflexion sur l''axe des y : A(2,4) → A1(5,5) → A2(-5,5).',
 '{"type":"mcq","question":"Le point A(2, 4) subit d''abord une translation de vecteur (3, 1), puis une réflexion par rapport à l''axe des y. Quelles sont les coordonnées finales ?","options":["(5, 5)","(−5, 5)","(−5, −5)","(5, −5)"],"answer":"(−5, 5)"}'),

('Équation d''un cercle', 3, 45000, 'Équation : (x−h)² + (y−k)² = r². Centre (2, 3), rayon 5 : (x−2)² + (y−3)² = 25.',
 '{"type":"mcq","question":"Quelle est l''équation d''un cercle de centre (2, 3) et de rayon 5 ?","options":["x² + y² = 25","(x+2)² + (y+3)² = 25","(x−2)² + (y−3)² = 25","(x−2)² + (y−3)² = 5"],"answer":"(x−2)² + (y−3)² = 25"}'),

('Angle extérieur d''un triangle', 3, 42000, 'L''angle extérieur = somme des deux angles non-adjacents. 60° + 70° = 130°.',
 '{"type":"mcq","question":"Un triangle a des angles intérieurs de 60° et 70°. Quel est l''angle extérieur adjacent au troisième angle intérieur ?","options":["50°","130°","110°","120°"],"answer":"130°"}'),

('Démonstration par Pythagore inversé', 3, 45000, 'Si a² + b² = c², le triangle est rectangle. 5² + 12² = 25 + 144 = 169 = 13². Oui.',
 '{"type":"mcq","question":"Lesquels de ces côtés forment un triangle rectangle ? 5, 12, 13","options":["Oui, car 5² + 12² = 13²","Non, car ce ne sont pas des entiers consécutifs","Non, le plus grand côté n''est pas la somme des deux autres","Impossible à dire"],"answer":"Oui, car 5² + 12² = 13²"}'),

('Trigonométrie : rapport sinus', 3, 45000, 'sin(angle) = côté opposé / hypoténuse. sin(30°) = 1/2.',
 '{"type":"mcq","question":"Dans un triangle rectangle, l''angle A mesure 30°. Quel est le rapport sin(A) ?","options":["√3/2","1/2","√2/2","1/√3"],"answer":"1/2"}'),

('Trigonométrie : trouver un côté', 3, 45000, 'cos(60°) = adjacent/hypoténuse = x/10 → x = 10 × 0,5 = 5.',
 '{"type":"mcq","question":"Dans un triangle rectangle, l''angle est de 60° et l''hypoténuse est de 10 cm. Quel est le côté adjacent ? (cos 60° = 0,5)","options":["5 cm","7,07 cm","8,66 cm","10 cm"],"answer":"5 cm"}'),

('Homothétie : trouver le centre', 3, 45000, 'Pour une homothétie de rapport 2 avec centre C, l''image A'' de A est telle que CA'' = 2×CA.',
 '{"type":"mcq","question":"Par une homothétie de rapport 2 centrée en C(0,0), quelle est l''image du point A(3, 4) ?","options":["(6, 8)","(3, 4)","(1,5, 2)","(−6, −8)"],"answer":"(6, 8)"}'),

('Angle formé par deux droites sécantes', 3, 42000, 'Deux droites se croisent en formant 4 angles. Les angles opposés sont égaux. Si un angle est 65°, l''opposé est 65° et les deux autres sont 115°.',
 '{"type":"mcq","question":"Deux droites se croisent en formant un angle de 65°. Quelle est la mesure de l''angle adjacent à cet angle ?","options":["25°","65°","115°","90°"],"answer":"115°"}'),

('Périmètre d''un secteur circulaire', 3, 45000, 'Arc + 2 rayons. Arc = (90/360) × 2πr = (1/4) × 2π × 6 = 3π ≈ 9,42. Périmètre = 9,42 + 12 = 21,42 cm.',
 '{"type":"mcq","question":"Calcule le périmètre d''un secteur circulaire de rayon 6 cm et d''angle 90° (π ≈ 3,14).","options":["21,42 cm","18,84 cm","24,28 cm","12 cm"],"answer":"21,42 cm"}'),

('Aire d''un secteur circulaire', 3, 45000, 'A = (θ/360°) × πr² = (90/360) × π × 5² = (1/4) × 78,5 = 19,625 cm².',
 '{"type":"mcq","question":"Calcule l''aire d''un secteur de rayon 5 cm et angle 90° (π ≈ 3,14).","options":["19,63 cm²","39,25 cm²","78,5 cm²","15,7 cm²"],"answer":"19,63 cm²"}'),

('Triangles semblables : problème de mesure indirecte', 3, 45000, 'Ombre poteau / ombre bâton = hauteur poteau / hauteur bâton. 12/2 = h/1,5 → h = 9 m.',
 '{"type":"mcq","question":"Un bâton de 1,5 m projette une ombre de 2 m. Un poteau projette une ombre de 12 m. Quelle est la hauteur du poteau ?","options":["6 m","9 m","12 m","18 m"],"answer":"9 m"}'),

('Surface totale d''un cylindre', 3, 45000, 'S = 2πr² + 2πrh = 2π(3²) + 2π(3)(10) = 18π + 60π = 78π ≈ 244,92 cm².',
 '{"type":"mcq","question":"Calcule la surface totale d''un cylindre de rayon 3 cm et hauteur 10 cm (π ≈ 3,14).","options":["188,4 cm²","244,92 cm²","282,6 cm²","376,8 cm²"],"answer":"244,92 cm²"}'),

('Coordonnées après rotation de 180°', 3, 42000, 'Rotation de 180° autour de l''origine : (x, y) → (−x, −y). (4, −3) → (−4, 3).',
 '{"type":"mcq","question":"Quel est l''image du point (4, −3) après une rotation de 180° autour de l''origine ?","options":["(3, −4)","(−4, 3)","(−4, −3)","(4, 3)"],"answer":"(−4, 3)"}'),

('Perpendiculaire à mi-chemin', 3, 45000, 'La médiatrice d''un segment passe par son milieu et lui est perpendiculaire.',
 '{"type":"mcq","question":"Que caractérise la médiatrice d''un segment ?","options":["Elle passe par les extrémités","Elle coupe le segment en son milieu et lui est perpendiculaire","Elle est parallèle au segment","Elle coupe le segment en 3 parties égales"],"answer":"Elle coupe le segment en son milieu et lui est perpendiculaire"}'),

('Angle entre une tangente et un rayon', 3, 42000, 'La tangente à un cercle est perpendiculaire au rayon au point de contact : angle = 90°.',
 '{"type":"mcq","question":"Quel est l''angle entre une tangente à un cercle et le rayon au point de tangence ?","options":["45°","60°","90°","180°"],"answer":"90°"}'),

('Problème de toit (Pythagore appliqué)', 3, 45000, 'Demi-largeur = 4 m, hauteur = 3 m. Côté du toit = √(4² + 3²) = √25 = 5 m. Total = 10 m.',
 '{"type":"mcq","question":"Un toit a la forme d''un triangle isocèle de 8 m de base et 3 m de hauteur. Quelle est la longueur totale des deux versants du toit ?","options":["8 m","10 m","11 m","14 m"],"answer":"10 m"}'),

('Périmètre d''une figure composite', 3, 45000, 'Figure = rectangle + demi-cercle. P = 2l + w + πr (la longueur avec arc). l=10, w=6, r=3. P = 20+6+3π ≈ 35,42.',
 '{"type":"mcq","question":"Une figure est formée d''un rectangle de 10 cm × 6 cm avec un demi-cercle de rayon 3 cm sur un côté de 6 cm. Quel est son périmètre (π ≈ 3,14) ?","options":["35,42 cm","38,42 cm","41,42 cm","32 cm"],"answer":"35,42 cm"}'),

('Construire un triangle à partir de données', 3, 42000, 'Pour deux côtés et l''angle inclus (SAS), un unique triangle est déterminé.',
 '{"type":"mcq","question":"Deux côtés et l''angle qu''ils forment (SAS) permettent de construire...","options":["Aucun triangle","Un seul triangle","Deux triangles différents","Une infinité de triangles"],"answer":"Un seul triangle"}'),

('Théorème de Thalès : proportion', 3, 45000, 'AB // DE, avec A,D sur un côté et B,E sur l''autre d''un triangle. CA/CD = CB/CE. CA=4, CD=6, CB=6, CE=x → x = 9.',
 '{"type":"mcq","question":"Dans un triangle, une parallèle à la base coupe les deux côtés. Les segments créés sont CA=4, CD=6, CB=6. Quelle est la valeur de CE ?","options":["8","9","10","12"],"answer":"9"}'),

('Formule de l''aire d''un polygone régulier', 3, 45000, 'A = (périmètre × apothème) / 2. Hexagone de côté 4 : P=24, apothème ≈ 3,46. A = 24×3,46/2 ≈ 41,57.',
 '{"type":"mcq","question":"L''apothème d''un hexagone régulier de côté 4 cm mesure environ 3,46 cm. Quelle est son aire approximative ?","options":["41,52 cm²","48 cm²","24 cm²","83,04 cm²"],"answer":"41,52 cm²"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
