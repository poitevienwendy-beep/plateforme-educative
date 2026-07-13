-- ============================================================
-- BANQUE DE QUESTIONS — Géométrie (Sec. 1, Mathématiques)
-- PFEQ-MAT-SEC1-GEO | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-GEO') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Figures et mesures de base (34 questions) ──────────────

('Périmètre carré', 1, 20000, 'Le périmètre d''un carré = 4 × côté = 4 × 5 = 20 cm.',
 '{"type":"mcq","question":"Quel est le périmètre d''un carré de côté 5 cm ?","options":["10 cm","15 cm","20 cm","25 cm"],"answer":"20 cm"}'),

('Périmètre rectangle', 1, 20000, 'Périmètre = 2 × (longueur + largeur) = 2 × (8 + 3) = 22 cm.',
 '{"type":"mcq","question":"Quel est le périmètre d''un rectangle de 8 cm × 3 cm ?","options":["11 cm","22 cm","24 cm","48 cm"],"answer":"22 cm"}'),

('Aire carré', 1, 20000, 'Aire d''un carré = côté² = 6² = 36 cm².',
 '{"type":"mcq","question":"Quelle est l''aire d''un carré de côté 6 cm ?","options":["12 cm²","24 cm²","36 cm²","48 cm²"],"answer":"36 cm²"}'),

('Aire rectangle', 1, 20000, 'Aire = longueur × largeur = 9 × 4 = 36 cm².',
 '{"type":"mcq","question":"Quelle est l''aire d''un rectangle de 9 cm × 4 cm ?","options":["13 cm²","26 cm²","32 cm²","36 cm²"],"answer":"36 cm²"}'),

('Aire triangle', 1, 25000, 'Aire d''un triangle = (base × hauteur) ÷ 2 = (10 × 6) ÷ 2 = 30 cm².',
 '{"type":"mcq","question":"Quelle est l''aire d''un triangle de base 10 cm et hauteur 6 cm ?","options":["16 cm²","30 cm²","60 cm²","120 cm²"],"answer":"30 cm²"}'),

('Angle droit', 1, 15000, 'Un angle droit mesure exactement 90°.',
 '{"type":"mcq","question":"Quelle est la mesure d''un angle droit ?","options":["45°","90°","180°","360°"],"answer":"90°"}'),

('Angle plat', 1, 15000, 'Un angle plat mesure 180° — il correspond à une ligne droite.',
 '{"type":"mcq","question":"Quelle est la mesure d''un angle plat ?","options":["90°","120°","180°","360°"],"answer":"180°"}'),

('Somme angles triangle', 1, 20000, 'La somme des angles d''un triangle est toujours 180°.',
 '{"type":"mcq","question":"Quelle est la somme des angles intérieurs d''un triangle ?","options":["90°","180°","270°","360°"],"answer":"180°"}'),

('Troisième angle triangle', 1, 25000, 'La somme des angles d''un triangle = 180°. Troisième angle = 180 - 60 - 50 = 70°.',
 '{"type":"mcq","question":"Un triangle a des angles de 60° et 50°. Quel est le troisième angle ?","options":["60°","70°","80°","90°"],"answer":"70°"}'),

('Types de triangles angles', 1, 20000, 'Un triangle rectangle a un angle de 90°. Un triangle acutangle a tous ses angles inférieurs à 90°.',
 '{"type":"mcq","question":"Comment appelle-t-on un triangle dont un angle est égal à 90° ?","options":["Acutangle","Isocèle","Rectangle","Obtusangle"],"answer":"Rectangle"}'),

('Somme angles quadrilatère', 1, 20000, 'La somme des angles d''un quadrilatère est toujours 360°.',
 '{"type":"mcq","question":"Quelle est la somme des angles intérieurs d''un quadrilatère ?","options":["180°","270°","360°","540°"],"answer":"360°"}'),

('Identifier parallèles', 1, 15000, 'Des droites parallèles ne se croisent jamais et gardent toujours la même distance entre elles.',
 '{"type":"mcq","question":"Comment appelle-t-on deux droites qui ne se croisent jamais ?","options":["Perpendiculaires","Sécantes","Parallèles","Concourantes"],"answer":"Parallèles"}'),

('Identifier perpendiculaires', 1, 15000, 'Deux droites perpendiculaires se croisent à angle droit (90°).',
 '{"type":"mcq","question":"Deux droites perpendiculaires forment un angle de...","options":["45°","60°","90°","180°"],"answer":"90°"}'),

('Rayon et diamètre cercle', 1, 15000, 'Le diamètre = 2 × rayon. Rayon = 5 cm → diamètre = 10 cm.',
 '{"type":"mcq","question":"Un cercle a un rayon de 5 cm. Quel est son diamètre ?","options":["2,5 cm","5 cm","10 cm","25 cm"],"answer":"10 cm"}'),

('Circonférence cercle approximation', 1, 25000, 'Circonférence = π × d ≈ 3,14 × 10 = 31,4 cm.',
 '{"type":"mcq","question":"Quelle est la circonférence approximative d''un cercle de diamètre 10 cm ? (π ≈ 3,14)","options":["15,7 cm","31,4 cm","62,8 cm","78,5 cm"],"answer":"31,4 cm"}'),

('Aire cercle', 1, 25000, 'Aire = π × r² ≈ 3,14 × 4² = 3,14 × 16 ≈ 50,24 cm².',
 '{"type":"mcq","question":"Quelle est l''aire approximative d''un cercle de rayon 4 cm ? (π ≈ 3,14)","options":["25,12 cm²","50,24 cm²","100,48 cm²","12,56 cm²"],"answer":"50,24 cm²"}'),

('Côtés triangle isocèle', 1, 15000, 'Un triangle isocèle a exactement deux côtés égaux.',
 '{"type":"mcq","question":"Combien de côtés égaux a un triangle isocèle ?","options":["0","1","2","3"],"answer":"2"}'),

('Triangle équilatéral angles', 1, 20000, 'Triangle équilatéral : 3 côtés égaux et 3 angles égaux. Chaque angle = 180° ÷ 3 = 60°.',
 '{"type":"mcq","question":"Quelle est la mesure de chaque angle d''un triangle équilatéral ?","options":["45°","60°","90°","120°"],"answer":"60°"}'),

('Quadrilatères classement', 1, 15000, 'Un carré est un cas particulier de rectangle (tous les côtés égaux ET angles droits).',
 '{"type":"mcq","question":"Lequel de ces énoncés est vrai ?","options":["Tout carré est un rectangle","Tout rectangle est un carré","Un losange est un carré","Un carré n''est pas un polygone"],"answer":"Tout carré est un rectangle"}'),

('Axe de symétrie', 1, 20000, 'Un carré a 4 axes de symétrie (2 diagonales et 2 médianes).',
 '{"type":"mcq","question":"Combien d''axes de symétrie a un carré ?","options":["1","2","4","8"],"answer":"4"}'),

('Polygone nombre côtés', 1, 15000, 'Un hexagone a 6 côtés. Hex = 6 en grec.',
 '{"type":"mcq","question":"Combien de côtés a un hexagone ?","options":["4","5","6","8"],"answer":"6"}'),

('Angle aigu', 1, 15000, 'Un angle aigu est plus petit que 90°.',
 '{"type":"mcq","question":"Lequel est un angle aigu ?","options":["90°","95°","130°","45°"],"answer":"45°"}'),

('Angles complémentaires', 1, 20000, 'Deux angles complémentaires ont une somme de 90°. Si un angle = 35°, l''autre = 90 - 35 = 55°.',
 '{"type":"mcq","question":"Deux angles sont complémentaires. L''un mesure 35°. Quel est l''autre ?","options":["45°","55°","65°","145°"],"answer":"55°"}'),

('Angles supplémentaires', 1, 20000, 'Deux angles supplémentaires ont une somme de 180°. Si un angle = 110°, l''autre = 180 - 110 = 70°.',
 '{"type":"mcq","question":"Deux angles sont supplémentaires. L''un mesure 110°. Quel est l''autre ?","options":["50°","60°","70°","80°"],"answer":"70°"}'),

('Diagonales rectangle', 1, 20000, 'Un rectangle a 2 diagonales qui se coupent en leur milieu et sont de longueur égale.',
 '{"type":"mcq","question":"Combien de diagonales a un rectangle ?","options":["0","1","2","4"],"answer":"2"}'),

('Volume cube', 1, 25000, 'Volume d''un cube = côté³ = 3³ = 27 cm³.',
 '{"type":"mcq","question":"Quel est le volume d''un cube de côté 3 cm ?","options":["9 cm³","18 cm³","27 cm³","81 cm³"],"answer":"27 cm³"}'),

('Volume prisme rectangulaire', 1, 25000, 'Volume = longueur × largeur × hauteur = 5 × 4 × 3 = 60 cm³.',
 '{"type":"mcq","question":"Quel est le volume d''un prisme rectangulaire de 5 cm × 4 cm × 3 cm ?","options":["48 cm³","60 cm³","72 cm³","120 cm³"],"answer":"60 cm³"}'),

('Angle obtus', 1, 15000, 'Un angle obtus est compris entre 90° et 180°.',
 '{"type":"mcq","question":"Lequel est un angle obtus ?","options":["45°","88°","90°","120°"],"answer":"120°"}'),

('Périmètre triangle', 1, 20000, 'Périmètre = somme de tous les côtés = 5 + 7 + 9 = 21 cm.',
 '{"type":"mcq","question":"Quel est le périmètre d''un triangle dont les côtés mesurent 5 cm, 7 cm et 9 cm ?","options":["19 cm","21 cm","23 cm","25 cm"],"answer":"21 cm"}'),

('Aire parallélogramme', 1, 25000, 'Aire parallélogramme = base × hauteur = 8 × 5 = 40 cm².',
 '{"type":"mcq","question":"Quelle est l''aire d''un parallélogramme de base 8 cm et hauteur 5 cm ?","options":["26 cm²","32 cm²","40 cm²","80 cm²"],"answer":"40 cm²"}'),

('Aire trapèze', 1, 30000, 'Aire trapèze = (grande base + petite base) × hauteur ÷ 2 = (10 + 6) × 4 ÷ 2 = 32 cm².',
 '{"type":"mcq","question":"Quelle est l''aire d''un trapèze de bases 10 cm et 6 cm, et hauteur 4 cm ?","options":["24 cm²","32 cm²","40 cm²","64 cm²"],"answer":"32 cm²"}'),

('Angles alternes internes', 1, 25000, 'Quand deux droites parallèles sont coupées par une sécante, les angles alternes-internes sont égaux.',
 '{"type":"mcq","question":"Si deux droites parallèles sont coupées par une transversale, les angles alternes-internes sont...","options":["complémentaires","supplémentaires","égaux","différents"],"answer":"égaux"}'),

('Rotation centre', 1, 20000, 'Une rotation de 360° ramène la figure à sa position initiale.',
 '{"type":"mcq","question":"Une rotation de 360° autour d''un point résulte en...","options":["une translation","un retour à la position initiale","une réflexion","un agrandissement"],"answer":"un retour à la position initiale"}'),

('Identifier losange', 1, 15000, 'Un losange est un quadrilatère dont les 4 côtés sont égaux.',
 '{"type":"mcq","question":"Lequel a tous ses côtés égaux mais pas nécessairement des angles droits ?","options":["Rectangle","Trapèze","Losange","Pentagone"],"answer":"Losange"}'),

-- ── DIFFICULTÉ 2 — Applications et combinaisons (34 questions) ────────────

('Théorème Pythagore', 2, 40000, 'Dans un triangle rectangle, c² = a² + b². c² = 3² + 4² = 9 + 16 = 25. c = 5 cm.',
 '{"type":"mcq","question":"Dans un triangle rectangle, les deux cathètes mesurent 3 cm et 4 cm. Quelle est la longueur de l''hypoténuse ?","options":["5 cm","6 cm","7 cm","12 cm"],"answer":"5 cm"}'),

('Pythagore inverse', 2, 40000, 'Si c = 13 et a = 5 : b² = 13² - 5² = 169 - 25 = 144. b = 12 cm.',
 '{"type":"mcq","question":"Dans un triangle rectangle, l''hypoténuse est 13 cm et une cathète est 5 cm. Quelle est l''autre cathète ?","options":["8 cm","10 cm","12 cm","14 cm"],"answer":"12 cm"}'),

('Périmètre figure composée', 2, 40000, 'Figure en L : périmètre = 6 + 2 + 2 + 4 + 4 + 6 = 24 cm (en comptant tous les côtés extérieurs).',
 '{"type":"mcq","question":"Un terrain en L a des côtés de 6m, 2m, 2m, 4m, 4m, 6m (dans l''ordre). Quel est son périmètre ?","options":["20 m","22 m","24 m","26 m"],"answer":"24 m"}'),

('Aire figure composée', 2, 40000, 'Rectangle total : 10 × 6 = 60 cm². Moins le coin coupé (3 × 2 = 6 cm²). Aire = 60 - 6 = 54 cm².',
 '{"type":"mcq","question":"Une pièce rectangulaire de 10 cm × 6 cm a un coin coupé formant un rectangle de 3 cm × 2 cm. Quelle est son aire ?","options":["48 cm²","54 cm²","56 cm²","60 cm²"],"answer":"54 cm²"}'),

('Angle manquant quadrilatère', 2, 35000, 'Somme des angles d''un quadrilatère = 360°. Angle manquant = 360 - 80 - 110 - 95 = 75°.',
 '{"type":"mcq","question":"Un quadrilatère a des angles de 80°, 110° et 95°. Quel est le 4e angle ?","options":["70°","75°","85°","95°"],"answer":"75°"}'),

('Surface totale cube', 2, 35000, 'Surface totale d''un cube = 6 × côté² = 6 × 4² = 6 × 16 = 96 cm².',
 '{"type":"mcq","question":"Quelle est la surface totale d''un cube de côté 4 cm ?","options":["48 cm²","64 cm²","96 cm²","192 cm²"],"answer":"96 cm²"}'),

('Surface totale prisme', 2, 40000, 'Prisme rectangulaire 5×3×2 : Surface = 2(5×3 + 5×2 + 3×2) = 2(15+10+6) = 2×31 = 62 cm².',
 '{"type":"mcq","question":"Quelle est la surface totale d''un prisme rectangulaire de 5 cm × 3 cm × 2 cm ?","options":["30 cm²","52 cm²","62 cm²","86 cm²"],"answer":"62 cm²"}'),

('Rapport de similitude', 2, 40000, 'Si le rapport est 2:1, toutes les longueurs sont doublées. Côté original : 4 cm → côté agrandi : 8 cm.',
 '{"type":"mcq","question":"Deux figures sont semblables avec un rapport 2:1. Si un côté de la petite figure mesure 4 cm, quelle est la mesure du côté correspondant dans la grande ?","options":["2 cm","4 cm","6 cm","8 cm"],"answer":"8 cm"}'),

('Angle inscrit cercle', 2, 40000, 'Un angle inscrit vaut la moitié de l''arc qu''il intercepte. Si l''arc = 80°, l''angle inscrit = 40°.',
 '{"type":"mcq","question":"Un angle inscrit dans un cercle intercepte un arc de 80°. Quelle est la mesure de l''angle ?","options":["20°","40°","80°","160°"],"answer":"40°"}'),

('Réflexion axe', 2, 35000, 'Lors d''une réflexion, le point (3, 2) devient (-3, 2) par rapport à l''axe des y.',
 '{"type":"mcq","question":"Quel est l''image du point (3, 2) après une réflexion par rapport à l''axe des y ?","options":["(3, -2)","(-3, 2)","(-3, -2)","(2, 3)"],"answer":"(-3, 2)"}'),

('Translation vecteur', 2, 35000, 'Le point (2, 3) translaté par (4, -1) devient (2+4, 3-1) = (6, 2).',
 '{"type":"mcq","question":"Le point (2, 3) est translaté par le vecteur (4, -1). Quelles sont les coordonnées du point image ?","options":["(6, 4)","(6, 2)","(-2, 4)","(8, -3)"],"answer":"(6, 2)"}'),

('Rotation 90 degrés', 2, 40000, 'Une rotation de 90° dans le sens antihoraire transforme (x, y) en (-y, x). (3, 1) → (-1, 3).',
 '{"type":"mcq","question":"Le point (3, 1) subit une rotation de 90° dans le sens antihoraire autour de l''origine. Quel est le point image ?","options":["(-1, 3)","(1, -3)","(-3, -1)","(3, -1)"],"answer":"(-1, 3)"}'),

('Aire anneau circulaire', 2, 40000, 'Aire anneau = π×R² - π×r² = π(5² - 3²) = π×16 ≈ 50,3 cm².',
 '{"type":"mcq","question":"Quelle est l''aire de la région entre deux cercles concentriques de rayons 5 cm et 3 cm ? (π ≈ 3,14)","options":["25,1 cm²","50,3 cm²","62,8 cm²","78,5 cm²"],"answer":"50,3 cm²"}'),

('Angles vertically opposite', 2, 30000, 'Les angles opposés par le sommet sont égaux. Si un angle = 65°, l''angle opposé = 65° aussi.',
 '{"type":"mcq","question":"Deux droites se croisent. Un des angles formés mesure 65°. Quel est l''angle opposé par le sommet ?","options":["25°","65°","115°","180°"],"answer":"65°"}'),

('Diagonale rectangle longueur', 2, 40000, 'd² = 6² + 8² = 36 + 64 = 100. d = 10 cm.',
 '{"type":"mcq","question":"Un rectangle mesure 6 cm × 8 cm. Quelle est la longueur de sa diagonale ?","options":["7 cm","9 cm","10 cm","14 cm"],"answer":"10 cm"}'),

('Agrandissement aire', 2, 40000, 'Si le rapport de similitude est k, les aires sont multipliées par k². k=3 → aire × 9.',
 '{"type":"mcq","question":"On agrandit une figure par un rapport 3. Par combien est multipliée son aire ?","options":["3","6","9","12"],"answer":"9"}'),

('Somme angles polygone', 2, 35000, 'Somme des angles d''un polygone à n côtés = (n-2) × 180°. Pentagone : (5-2)×180 = 540°.',
 '{"type":"mcq","question":"Quelle est la somme des angles intérieurs d''un pentagone ?","options":["360°","450°","540°","720°"],"answer":"540°"}'),

('Angle intérieur polygone régulier', 2, 35000, 'Hexagone régulier : somme = (6-2)×180 = 720°. Chaque angle = 720÷6 = 120°.',
 '{"type":"mcq","question":"Quelle est la mesure de chaque angle intérieur d''un hexagone régulier ?","options":["90°","108°","120°","135°"],"answer":"120°"}'),

('Volume pyramide', 2, 40000, 'Volume pyramide = (1/3) × Aire base × hauteur = (1/3) × (6×6) × 4 = (1/3) × 36 × 4 = 48 cm³.',
 '{"type":"mcq","question":"Quel est le volume d''une pyramide à base carrée de côté 6 cm et hauteur 4 cm ?","options":["36 cm³","48 cm³","72 cm³","144 cm³"],"answer":"48 cm³"}'),

('Volume cylindre', 2, 40000, 'Volume cylindre = π × r² × h ≈ 3,14 × 3² × 10 = 3,14 × 9 × 10 ≈ 282,6 cm³.',
 '{"type":"mcq","question":"Quel est le volume d''un cylindre de rayon 3 cm et hauteur 10 cm ? (π ≈ 3,14)","options":["94,2 cm³","188,4 cm³","282,6 cm³","565,2 cm³"],"answer":"282,6 cm³"}'),

('Repère cartésien quadrant', 2, 25000, 'Le point (-3, 5) est dans le 2e quadrant (x négatif, y positif).',
 '{"type":"mcq","question":"Dans quel quadrant se trouve le point (-3, 5) ?","options":["1er","2e","3e","4e"],"answer":"2e"}'),

('Distance entre deux points', 2, 40000, 'd = √((5-1)² + (7-4)²) = √(16+9) = √25 = 5 unités.',
 '{"type":"mcq","question":"Quelle est la distance entre les points (1, 4) et (5, 7) ?","options":["3","4","5","7"],"answer":"5"}'),

('Médiatrice segment', 2, 35000, 'La médiatrice est perpendiculaire au segment et passe par son milieu. Milieu de AB = ((1+5)/2, (2+6)/2) = (3, 4).',
 '{"type":"mcq","question":"Quel est le milieu du segment AB avec A(1,2) et B(5,6) ?","options":["(3, 4)","(4, 8)","(2, 4)","(6, 8)"],"answer":"(3, 4)"}'),

('Aire losange', 2, 35000, 'Aire losange = (diagonale 1 × diagonale 2) ÷ 2 = (8 × 6) ÷ 2 = 24 cm².',
 '{"type":"mcq","question":"Quelle est l''aire d''un losange dont les diagonales mesurent 8 cm et 6 cm ?","options":["12 cm²","24 cm²","48 cm²","14 cm²"],"answer":"24 cm²"}'),

('Angle co-internes', 2, 35000, 'Les angles co-internes (du même côté de la transversale) sont supplémentaires : 60° + 120° = 180°.',
 '{"type":"mcq","question":"Deux droites parallèles sont coupées par une transversale. Un angle co-interne mesure 60°. Quel est l''autre angle co-interne ?","options":["60°","90°","120°","180°"],"answer":"120°"}'),

('Symétrie centrale', 2, 35000, 'La symétrie centrale par rapport à l''origine transforme (x, y) en (-x, -y). (4, -3) → (-4, 3).',
 '{"type":"mcq","question":"Quelle est l''image du point (4, -3) par une symétrie centrale par rapport à l''origine ?","options":["(-4, 3)","(4, 3)","(-4, -3)","(3, -4)"],"answer":"(-4, 3)"}'),

('Apothème polygone régulier', 2, 40000, 'L''apothème est la distance du centre au milieu d''un côté. Aire hexagone régulier = (périmètre × apothème) / 2.',
 '{"type":"mcq","question":"Un hexagone régulier a un côté de 6 cm et un apothème de 5,2 cm. Quelle est son aire approximative ?","options":["78 cm²","93,6 cm²","104 cm²","140 cm²"],"answer":"93,6 cm²"}'),

-- ── DIFFICULTÉ 3 — Problèmes complexes (32 questions) ─────────────────────

('Pythagore problème complexe', 3, 55000, 'Hauteur² = 10² - 6² = 100 - 36 = 64. Hauteur = 8 m. Aire = (12 × 8) ÷ 2 = 48 m².',
 '{"type":"mcq","question":"Un triangle isocèle a une base de 12 m et des côtés égaux de 10 m. Quelle est son aire ?","options":["40 m²","48 m²","60 m²","72 m²"],"answer":"48 m²"}'),

('Problème surface peindre', 3, 55000, 'Murs : 2×(10×3) + 2×(8×3) = 60+48 = 108 m². Plafond : 10×8 = 80 m². Total : 188 m². 2 couches : 376 m². Bidons : 376÷15 ≈ 25,1 → 26 bidons.',
 '{"type":"mcq","question":"Une pièce de 10 m × 8 m × 3 m doit être peinte (murs et plafond, 2 couches). Un bidon couvre 15 m². Combien de bidons faut-il ?","options":["24","25","26","27"],"answer":"26"}'),

('Rapport similitude aire', 3, 50000, 'Rapport de similitude k = 5/3. Les aires sont multipliées par k² = 25/9. Aire grande = 36 × 25/9 = 100 cm².',
 '{"type":"mcq","question":"Deux triangles semblables ont leurs côtés dans un rapport 5:3. Le petit triangle a une aire de 36 cm². Quelle est l''aire du grand ?","options":["60 cm²","80 cm²","100 cm²","120 cm²"],"answer":"100 cm²"}'),

('Volume cône', 3, 50000, 'Volume cône = (1/3) × π × r² × h = (1/3) × 3,14 × 4² × 9 = (1/3) × 3,14 × 16 × 9 ≈ 150,7 cm³.',
 '{"type":"mcq","question":"Quel est le volume d''un cône de rayon 4 cm et hauteur 9 cm ? (π ≈ 3,14)","options":["113 cm³","150,7 cm³","301 cm³","452 cm³"],"answer":"150,7 cm³"}'),

('Volume sphère', 3, 50000, 'Volume sphère = (4/3) × π × r³ = (4/3) × 3,14 × 3³ = (4/3) × 3,14 × 27 ≈ 113 cm³.',
 '{"type":"mcq","question":"Quel est le volume approximatif d''une sphère de rayon 3 cm ? (π ≈ 3,14)","options":["37,7 cm³","113 cm³","339 cm³","904 cm³"],"answer":"113 cm³"}'),

('Transformation composée', 3, 55000, 'Réflexion de (3,-2) sur l''axe x → (3,2). Puis translation (−4, 5) → (3-4, 2+5) = (-1, 7).',
 '{"type":"mcq","question":"Le point (3, -2) subit une réflexion par rapport à l''axe des x, puis une translation de vecteur (-4, 5). Quel est le point final ?","options":["(-1, 7)","(-1, -7)","(7, -1)","(-7, 1)"],"answer":"(-1, 7)"}'),

('Problème diagonales', 3, 50000, 'Diagonal d''un prisme rectangulaire = √(l²+w²+h²) = √(4²+3²+12²) = √(16+9+144) = √169 = 13 cm.',
 '{"type":"mcq","question":"Quelle est la longueur de la diagonale principale d''un prisme rectangulaire de 4 cm × 3 cm × 12 cm ?","options":["11 cm","12 cm","13 cm","14 cm"],"answer":"13 cm"}'),

('Angle polygone extérieur', 3, 45000, 'La somme des angles extérieurs d''un polygone convexe est toujours 360°. Pour un octogone régulier : 360÷8 = 45°.',
 '{"type":"mcq","question":"Quelle est la mesure d''un angle extérieur d''un octogone régulier ?","options":["40°","45°","50°","55°"],"answer":"45°"}'),

('Problème coordonnées et géométrie', 3, 55000, 'A(0,0), B(4,0), C(4,3). AB=4, BC=3, AC=5 (Pythagore). Périmètre = 4+3+5 = 12 unités.',
 '{"type":"mcq","question":"Un triangle a ses sommets en A(0,0), B(4,0) et C(4,3). Quel est son périmètre ?","options":["10","12","14","15"],"answer":"12"}'),

('Surface totale cylindre', 3, 50000, 'Surface = 2πr² + 2πrh = 2π×5² + 2π×5×12 = 50π + 120π = 170π ≈ 534 cm².',
 '{"type":"mcq","question":"Quelle est la surface totale d''un cylindre de rayon 5 cm et hauteur 12 cm ? (π ≈ 3,14)","options":["408 cm²","471 cm²","534 cm²","628 cm²"],"answer":"534 cm²"}'),

('Problème ombre et angle', 3, 55000, 'Ombre/hauteur = 3/2. Si l''ombre de l''arbre = 9 m : hauteur arbre = 9 × (2/3) × (hauteur poteau/ombre poteau). Hauteur poteau = 2, ombre = 3, arbre = x, ombre = 9. x/9 = 2/3. x = 6 m.',
 '{"type":"mcq","question":"Un poteau de 2 m projette une ombre de 3 m. À la même heure, un arbre projette une ombre de 9 m. Quelle est la hauteur de l''arbre ?","options":["4 m","6 m","8 m","12 m"],"answer":"6 m"}'),

('Lieu géométrique', 3, 50000, 'L''ensemble des points à égale distance de deux points A et B est la médiatrice du segment AB.',
 '{"type":"mcq","question":"Quel est l''ensemble des points équidistants de deux points A et B ?","options":["Le segment AB","La médiatrice de AB","Le cercle de centre A","La bissectrice de l''angle A"],"answer":"La médiatrice de AB"}'),

('Problème peinture cylindre', 3, 55000, 'Surface latérale = 2πrh = 2 × 3,14 × 0,5 × 2 = 6,28 m². 5 réservoirs : 5 × 6,28 = 31,4 m². Bidons : 31,4 ÷ 10 = 3,14 → 4 bidons.',
 '{"type":"mcq","question":"On peint la surface latérale de 5 réservoirs cylindriques de rayon 0,5 m et hauteur 2 m. Chaque bidon couvre 10 m². Combien de bidons faut-il ? (π ≈ 3,14)","options":["3","4","5","6"],"answer":"4"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
