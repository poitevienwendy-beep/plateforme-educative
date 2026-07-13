-- Supplément SEC1_MAT_nombres-entiers : +48 questions (102 → 150)
-- PFEQ-MAT-SEC1-NE

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-NE') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (16 questions)
('Valeur absolue d''un entier', 1, 18000, 'La valeur absolue est la distance à zéro, toujours positive. |−7| = 7.',
 '{"type":"mcq","question":"Quelle est la valeur absolue de −7 ?","options":["−7","7","−1/7","0"],"answer":"7"}'),

('Opposé d''un entier', 1, 18000, 'L''opposé de n est −n. L''opposé de 5 est −5.',
 '{"type":"mcq","question":"Quel est l''opposé de 5 ?","options":["1/5","−5","5","0"],"answer":"−5"}'),

('Comparer deux entiers négatifs', 1, 20000, 'Sur la droite numérique, −2 est à droite de −8, donc −2 > −8.',
 '{"type":"mcq","question":"Lequel de ces entiers est le plus grand ?","options":["−8","−15","−2","−20"],"answer":"−2"}'),

('Additionner un positif et un négatif', 1, 20000, '3 + (−8) = 3 − 8 = −5. On soustrait et on garde le signe du plus grand.',
 '{"type":"mcq","question":"Calcule : 3 + (−8)","options":["11","−11","−5","5"],"answer":"−5"}'),

('Soustraction d''entiers négatifs', 1, 20000, '5 − (−3) = 5 + 3 = 8. Soustraire un négatif revient à additionner son opposé.',
 '{"type":"mcq","question":"Calcule : 5 − (−3)","options":["2","−2","8","−8"],"answer":"8"}'),

('Double négatif', 1, 18000, '−(−6) = 6. Le contraire d''un négatif est positif.',
 '{"type":"mcq","question":"Simplifie : −(−6)","options":["−6","6","0","36"],"answer":"6"}'),

('Multiplication de signes différents', 1, 20000, 'Positif × négatif = négatif. 4 × (−3) = −12.',
 '{"type":"mcq","question":"Calcule : 4 × (−3)","options":["−12","12","−7","7"],"answer":"−12"}'),

('Multiplication de deux négatifs', 1, 20000, 'Négatif × négatif = positif. (−5) × (−2) = 10.',
 '{"type":"mcq","question":"Calcule : (−5) × (−2)","options":["−10","10","−7","7"],"answer":"10"}'),

('Division d''entiers de signes différents', 1, 20000, 'Positif ÷ négatif = négatif. 12 ÷ (−4) = −3.',
 '{"type":"mcq","question":"Calcule : 12 ÷ (−4)","options":["3","−3","−48","48"],"answer":"−3"}'),

('Identifier l''entier sur la droite numérique', 1, 18000, 'Un entier entre −4 et −2 est −3.',
 '{"type":"mcq","question":"Quel entier se trouve entre −4 et −2 sur la droite numérique ?","options":["−5","−1","−3","0"],"answer":"−3"}'),

('Ordre croissant d''entiers', 1, 22000, 'En ordre croissant : −6 < −1 < 0 < 4.',
 '{"type":"mcq","question":"Range ces entiers en ordre croissant : 4, −1, −6, 0","options":["4 < 0 < −1 < −6","−6 < −1 < 0 < 4","−1 < −6 < 0 < 4","0 < −1 < −6 < 4"],"answer":"−6 < −1 < 0 < 4"}'),

('Température et entiers négatifs', 1, 22000, 'Différence = 3 − (−9) = 3 + 9 = 12 degrés.',
 '{"type":"mcq","question":"La température passe de −9 °C à 3 °C. Quelle est la variation de température ?","options":["−12 °C","6 °C","12 °C","−6 °C"],"answer":"12 °C"}'),

('Solde bancaire', 1, 22000, '−50 + 75 = 25 $. Le solde devient positif.',
 '{"type":"mcq","question":"Un compte bancaire est à −50 $. On y dépose 75 $. Quel est le nouveau solde ?","options":["−125 $","125 $","−25 $","25 $"],"answer":"25 $"}'),

('Somme de trois entiers', 1, 22000, '(−4) + 7 + (−3) = 0. Les positifs et négatifs s''annulent.',
 '{"type":"mcq","question":"Calcule : (−4) + 7 + (−3)","options":["14","−14","0","4"],"answer":"0"}'),

('Trouver l''entier manquant', 1, 22000, '□ + (−3) = 5 → □ = 5 − (−3) = 5 + 3 = 8.',
 '{"type":"mcq","question":"Quel entier complète l''équation ? □ + (−3) = 5","options":["2","8","−8","−2"],"answer":"8"}'),

('Profondeur et altitude', 1, 22000, '−200 + 350 = 150 m au-dessus du niveau de la mer.',
 '{"type":"mcq","question":"Un sous-marin est à −200 m. Il monte de 350 m. À quelle altitude se trouve-t-il ?","options":["−550 m","550 m","−150 m","150 m"],"answer":"150 m"}'),

-- DIFFICULTÉ 2 (16 questions)
('Ordre des opérations : addition et multiplication', 2, 30000, 'On multiplie avant d''additionner : 2 + 3 × 4 = 2 + 12 = 14.',
 '{"type":"mcq","question":"Calcule : 2 + 3 × 4","options":["20","14","24","11"],"answer":"14"}'),

('Ordre des opérations avec parenthèses', 2, 30000, 'Les parenthèses d''abord : (2 + 3) × 4 = 5 × 4 = 20.',
 '{"type":"mcq","question":"Calcule : (2 + 3) × 4","options":["14","20","10","24"],"answer":"20"}'),

('Expression avec exposant', 2, 30000, '3² = 9, donc 3² + 5 = 9 + 5 = 14.',
 '{"type":"mcq","question":"Calcule : 3² + 5","options":["64","14","11","16"],"answer":"14"}'),

('Puissance d''un entier négatif', 2, 30000, '(−2)³ = (−2) × (−2) × (−2) = 4 × (−2) = −8.',
 '{"type":"mcq","question":"Calcule : (−2)³","options":["8","−8","6","−6"],"answer":"−8"}'),

('Puissance paire d''un négatif', 2, 30000, '(−3)² = (−3) × (−3) = 9. Une puissance paire d''un négatif est positive.',
 '{"type":"mcq","question":"Calcule : (−3)²","options":["−9","9","−6","6"],"answer":"9"}'),

('Distributivité : expansion', 2, 28000, '3 × (4 + 5) = 3 × 4 + 3 × 5 = 12 + 15 = 27.',
 '{"type":"mcq","question":"Développe et calcule : 3 × (4 + 5)","options":["17","27","32","22"],"answer":"27"}'),

('Distributivité avec négatif', 2, 30000, '−2 × (5 − 3) = −2 × 2 = −4.',
 '{"type":"mcq","question":"Calcule : −2 × (5 − 3)","options":["4","−4","−16","16"],"answer":"−4"}'),

('Multiples d''un entier', 2, 25000, 'Les multiples de 6 sont 6, 12, 18, 24, 30... 30 est le 5e multiple.',
 '{"type":"mcq","question":"Quel est le 5e multiple positif de 6 ?","options":["24","36","30","11"],"answer":"30"}'),

('Facteurs d''un entier', 2, 28000, 'Les facteurs de 24 : 1, 2, 3, 4, 6, 8, 12, 24. Il y en a 8.',
 '{"type":"mcq","question":"Combien de facteurs positifs le nombre 24 possède-t-il ?","options":["6","8","4","10"],"answer":"8"}'),

('PGCD de deux entiers', 2, 32000, 'Facteurs de 12 : 1,2,3,4,6,12. Facteurs de 18 : 1,2,3,6,9,18. PGCD = 6.',
 '{"type":"mcq","question":"Quel est le plus grand commun diviseur (PGCD) de 12 et 18 ?","options":["3","6","9","12"],"answer":"6"}'),

('PPCM de deux entiers', 2, 32000, 'Multiples de 4 : 4,8,12,16... Multiples de 6 : 6,12... PPCM = 12.',
 '{"type":"mcq","question":"Quel est le plus petit commun multiple (PPCM) de 4 et 6 ?","options":["24","12","6","2"],"answer":"12"}'),

('Suite arithmétique : terme manquant', 2, 30000, 'La suite progresse de +5 : 3, 8, 13, ___, 23. Le terme manquant est 18.',
 '{"type":"mcq","question":"Quel est le terme manquant dans la suite ? 3, 8, 13, ___, 23","options":["17","18","19","20"],"answer":"18"}'),

('Problème de profit et perte', 2, 32000, 'Lun: −40, Mar: +90, Mer: −25. Total = −40 + 90 − 25 = 25$.',
 '{"type":"mcq","question":"Un vendeur perd 40 $ lundi, gagne 90 $ mardi et perd 25 $ mercredi. Quel est son bilan total ?","options":["25 $","−25 $","155 $","−155 $"],"answer":"25 $"}'),

('Nombre premier ou composé', 2, 25000, '37 est premier car ses seuls diviseurs sont 1 et 37.',
 '{"type":"mcq","question":"Lequel de ces nombres est un nombre premier ?","options":["27","33","37","49"],"answer":"37"}'),

('Décomposition en facteurs premiers', 2, 32000, '36 = 2 × 18 = 2 × 2 × 9 = 2 × 2 × 3 × 3 = 2² × 3².',
 '{"type":"mcq","question":"Quelle est la décomposition en facteurs premiers de 36 ?","options":["2 × 3 × 6","2² × 3²","4 × 9","2³ × 3"],"answer":"2² × 3²"}'),

('Règle des signes dans une expression', 2, 30000, '(−4) × (−3) ÷ (−2) = 12 ÷ (−2) = −6.',
 '{"type":"mcq","question":"Calcule : (−4) × (−3) ÷ (−2)","options":["6","−6","24","−24"],"answer":"−6"}'),

-- DIFFICULTÉ 3 (16 questions)
('Ordre des opérations complexe', 3, 45000, '3 + 4² ÷ 2 − 1 = 3 + 16 ÷ 2 − 1 = 3 + 8 − 1 = 10.',
 '{"type":"mcq","question":"Calcule : 3 + 4² ÷ 2 − 1","options":["9","10","11","15"],"answer":"10"}'),

('Expression avec plusieurs niveaux', 3, 45000, '2 × (3 + 4²) = 2 × (3 + 16) = 2 × 19 = 38.',
 '{"type":"mcq","question":"Calcule : 2 × (3 + 4²)","options":["38","50","30","34"],"answer":"38"}'),

('Exposant d''exposant', 3, 45000, '(2²)³ = 2^(2×3) = 2⁶ = 64.',
 '{"type":"mcq","question":"Calcule : (2²)³","options":["12","32","64","128"],"answer":"64"}'),

('Propriété commutative appliquée', 3, 40000, 'L''addition est commutative : a + b = b + a. On peut réordonner pour simplifier : (−13 + 7) + 13 = 7.',
 '{"type":"mcq","question":"Calcule efficacement : −13 + 7 + 13","options":["−7","7","33","−33"],"answer":"7"}'),

('Propriété distributive avancée', 3, 45000, '5 × 98 = 5 × (100 − 2) = 500 − 10 = 490.',
 '{"type":"mcq","question":"En utilisant la distributivité, calcule 5 × 98","options":["480","490","500","495"],"answer":"490"}'),

('Suite arithmétique : terme général', 3, 45000, 'Suite : 5, 8, 11, 14... Raison = 3. Terme général : aₙ = 5 + (n−1)×3 = 3n + 2. Pour n=10 : 32.',
 '{"type":"mcq","question":"Dans la suite 5, 8, 11, 14..., quel est le 10e terme ?","options":["30","32","34","29"],"answer":"32"}'),

('PGCD par factorisation', 3, 45000, '60 = 2²×3×5 et 84 = 2²×3×7. PGCD = 2²×3 = 12.',
 '{"type":"mcq","question":"Trouve le PGCD de 60 et 84 en utilisant la factorisation.","options":["6","12","24","4"],"answer":"12"}'),

('Problème de divisibilité', 3, 45000, 'Divisible par 3 si la somme des chiffres est divisible par 3. 327 : 3+2+7=12, divisible par 3.',
 '{"type":"mcq","question":"Lequel de ces nombres est divisible par 3 ?","options":["328","325","327","329"],"answer":"327"}'),

('Équation avec entiers', 3, 40000, '3x − 7 = −1 → 3x = 6 → x = 2.',
 '{"type":"mcq","question":"Résous : 3x − 7 = −1","options":["x = −2","x = 2","x = −8","x = 8"],"answer":"x = 2"}'),

('Inégalité avec entiers', 3, 40000, '2x + 3 > −1 → 2x > −4 → x > −2. Parmi les choix, seul −1 satisfait x > −2.',
 '{"type":"mcq","question":"Quelle valeur satisfait l''inégalité 2x + 3 > −1 ?","options":["−3","−5","−1","−4"],"answer":"−1"}'),

('Problème de vitesse et entiers', 3, 45000, 'Distance = vitesse × temps. 80 × 2,5 = 200 km.',
 '{"type":"mcq","question":"Un train roule à 80 km/h pendant 2,5 heures. Quelle distance parcourt-il ?","options":["160 km","200 km","82,5 km","82 km"],"answer":"200 km"}'),

('Alternance de signes dans une suite', 3, 45000, 'Termes impairs positifs (+3, +5, +7...) et pairs négatifs (−1, −3...). La somme des 6 premiers termes : 3 − 1 + 5 − 3 + 7 − 5 = 6.',
 '{"type":"mcq","question":"La suite est : 3, −1, 5, −3, 7, −5... Quelle est la somme des 6 premiers termes ?","options":["4","6","8","10"],"answer":"6"}'),

('Problème multi-étapes avec argent', 3, 45000, 'Budget: 250$. Dépenses: 85 + 40 + 62 = 187$. Reste: 250 − 187 = 63$.',
 '{"type":"mcq","question":"Marie a un budget de 250 $. Elle dépense 85 $ en vêtements, 40 $ en transport et 62 $ en nourriture. Combien lui reste-t-il ?","options":["53 $","63 $","73 $","187 $"],"answer":"63 $"}'),

('Divisibilité par plusieurs nombres', 3, 45000, 'Divisible par 2 ET 3 ↔ divisible par 6. 6×25=150, 6×26=156. 156 est divisible par 2 et 3.',
 '{"type":"mcq","question":"Quel nombre est divisible à la fois par 2 et par 3 ?","options":["151","153","155","156"],"answer":"156"}'),

('Calcul avec grandes valeurs', 3, 45000, '1000 ÷ (−25) × (−4) = (−40) × (−4) = 160.',
 '{"type":"mcq","question":"Calcule : 1000 ÷ (−25) × (−4)","options":["−160","160","−10000","10000"],"answer":"160"}'),

('Problème logique avec entiers', 3, 45000, 'Soit n le nombre. n + 2n + 3n = 6n = 48 → n = 8. Le plus grand est 3n = 24.',
 '{"type":"mcq","question":"Trois entiers consécutifs multiples se suivent dans le rapport 1:2:3. Leur somme est 48. Quel est le plus grand ?","options":["16","20","24","28"],"answer":"24"}'),

('Carré d''un entier négatif', 2, 25000, '(−5)² = (−5) × (−5) = 25. Le carré d''un nombre négatif est toujours positif.',
 '{"type":"mcq","question":"Calcule (−5)²","options":["−25","25","−10","10"],"answer":"25"}'),

('Cube d''un entier', 2, 28000, '2³ = 2 × 2 × 2 = 8.',
 '{"type":"mcq","question":"Calcule 2³","options":["6","8","12","16"],"answer":"8"}'),

('Priorité des opérations — parenthèses', 2, 30000, 'On calcule d''abord la parenthèse : (3 + 5) = 8, puis 8 × 2 = 16.',
 '{"type":"mcq","question":"Calcule (3 + 5) × 2","options":["11","13","16","18"],"answer":"16"}'),

('Division euclidienne — reste', 2, 25000, '29 ÷ 6 = 4 reste 5 (car 6 × 4 = 24 et 29 − 24 = 5).',
 '{"type":"mcq","question":"Quel est le reste de la division de 29 par 6 ?","options":["3","4","5","6"],"answer":"5"}'),

('Signe du produit de trois entiers', 3, 30000, 'Produit de trois négatifs : (−)(−)(−) = (−). Donc (−2)(−3)(−4) = −24.',
 '{"type":"mcq","question":"Calcule (−2) × (−3) × (−4)","options":["24","−24","12","−12"],"answer":"−24"}'),

('Multiple commun le plus petit', 3, 35000, 'Les multiples de 4 : 4,8,12,16,20. Les multiples de 6 : 6,12,18. Le plus petit commun est 12.',
 '{"type":"mcq","question":"Quel est le plus petit multiple commun de 4 et de 6 ?","options":["8","12","18","24"],"answer":"12"}'),

('Entier entre deux valeurs', 1, 18000, 'On cherche un entier entre −3 et 1 (exclu). Les entiers valides sont −2, −1, 0.',
 '{"type":"mcq","question":"Quel entier se trouve entre −3 et 1 (exclus) ?","options":["−4","−2","1","3"],"answer":"−2"}'),

('Arrondi à la dizaine', 1, 18000, 'Pour arrondir 47 à la dizaine : le chiffre des unités est 7 ≥ 5, donc on arrondit à 50.',
 '{"type":"mcq","question":"Arrondi à la dizaine, 47 donne :","options":["40","45","50","55"],"answer":"50"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);

-- Supplément SEC1_MAT_fractions-decimaux : +58 questions (92 → 150)
-- PFEQ-MAT-SEC1-FD

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-FD') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (20 questions)
('Fraction d''une collection', 1, 20000, '3 pommes sur 8 = 3/8 de la collection.',
 '{"type":"mcq","question":"Dans un panier de 8 fruits, il y a 3 pommes. Quelle fraction représente les pommes ?","options":["3/5","5/8","3/8","8/3"],"answer":"3/8"}'),

('Fraction équivalente simple', 1, 20000, '2/4 = 1/2 en divisant numérateur et dénominateur par 2.',
 '{"type":"mcq","question":"Quelle fraction est équivalente à 2/4 ?","options":["1/4","1/2","2/8","4/2"],"answer":"1/2"}'),

('Simplifier une fraction', 1, 20000, '6/9 : le PGCD de 6 et 9 est 3. 6÷3 = 2, 9÷3 = 3. Donc 6/9 = 2/3.',
 '{"type":"mcq","question":"Simplifie la fraction 6/9","options":["3/4","2/3","1/3","3/6"],"answer":"2/3"}'),

('Comparer deux fractions de même dénominateur', 1, 18000, 'Même dénominateur : comparer les numérateurs. 3/7 < 5/7.',
 '{"type":"mcq","question":"Laquelle de ces fractions est la plus grande : 3/7 ou 5/7 ?","options":["3/7","5/7","Elles sont égales","Impossible à dire"],"answer":"5/7"}'),

('Addition de fractions de même dénominateur', 1, 22000, '2/5 + 1/5 = 3/5. On additionne les numérateurs et on garde le dénominateur.',
 '{"type":"mcq","question":"Calcule : 2/5 + 1/5","options":["3/10","3/5","2/5","1/5"],"answer":"3/5"}'),

('Soustraction de fractions de même dénominateur', 1, 22000, '5/8 − 2/8 = 3/8. On soustrait les numérateurs.',
 '{"type":"mcq","question":"Calcule : 5/8 − 2/8","options":["3/0","7/8","3/8","3/16"],"answer":"3/8"}'),

('Fraction et partie entière', 1, 20000, '7/3 = 2 reste 1, donc 7/3 = 2 et 1/3 = 2⅓.',
 '{"type":"mcq","question":"Convertis 7/3 en nombre mixte","options":["3½","1⅓","2⅓","2¼"],"answer":"2⅓"}'),

('Convertir un nombre mixte en fraction', 1, 22000, '3¼ = (3×4+1)/4 = 13/4.',
 '{"type":"mcq","question":"Convertis 3¼ en fraction impropre","options":["7/4","13/4","9/4","12/4"],"answer":"13/4"}'),

('Décimal à la dixième', 1, 18000, 'Le chiffre des dixièmes est la 1re décimale : dans 3,7, c''est 7.',
 '{"type":"mcq","question":"Dans le nombre 3,7, quel chiffre occupe la position des dixièmes ?","options":["3","7","37","0"],"answer":"7"}'),

('Comparer des décimaux simples', 1, 18000, '0,8 > 0,3 car 8 dixièmes > 3 dixièmes.',
 '{"type":"mcq","question":"Quel nombre est le plus grand : 0,8 ou 0,3 ?","options":["0,3","0,8","Ils sont égaux","Impossible à dire"],"answer":"0,8"}'),

('Additionner des décimaux', 1, 22000, 'Aligner les virgules : 2,5 + 1,3 = 3,8.',
 '{"type":"mcq","question":"Calcule : 2,5 + 1,3","options":["3,8","3,35","4,8","2,53"],"answer":"3,8"}'),

('Soustraire des décimaux', 1, 22000, '5,9 − 2,4 = 3,5.',
 '{"type":"mcq","question":"Calcule : 5,9 − 2,4","options":["3,5","3,4","3,6","8,3"],"answer":"3,5"}'),

('Fraction décimale', 1, 20000, '3/10 = 0,3. Le dénominateur 10 indique la position des dixièmes.',
 '{"type":"mcq","question":"Convertis 3/10 en nombre décimal","options":["3","0,03","0,3","30"],"answer":"0,3"}'),

('Pourcentage d''une quantité simple', 1, 20000, '50% = 1/2. 50% de 80 = 80 ÷ 2 = 40.',
 '{"type":"mcq","question":"Calcule 50% de 80","options":["40","50","30","80"],"answer":"40"}'),

('Fraction à pourcentage (cas simple)', 1, 20000, '1/4 = 25/100 = 25%.',
 '{"type":"mcq","question":"Convertis 1/4 en pourcentage","options":["40%","14%","25%","50%"],"answer":"25%"}'),

('Décimal à fraction centésimale', 1, 18000, '0,45 = 45/100 = 9/20 (simplifiée).',
 '{"type":"mcq","question":"Convertis 0,45 en fraction","options":["4/5","9/20","45/10","4/50"],"answer":"9/20"}'),

('Trouver la fraction d''un nombre', 1, 22000, '3/4 de 20 = 20 × 3/4 = 15.',
 '{"type":"mcq","question":"Calcule 3/4 de 20","options":["12","15","16","18"],"answer":"15"}'),

('Fractions et partage', 1, 22000, 'Parts mangées : 2/8 + 3/8 = 5/8. Il reste 3/8.',
 '{"type":"mcq","question":"Un gâteau est coupé en 8 parts. Thomas mange 2 parts et Sophie en mange 3. Quelle fraction reste-t-il ?","options":["5/8","3/8","2/8","4/8"],"answer":"3/8"}'),

('Arrondir un décimal à la dixième', 1, 18000, '3,47 arrondi à la dixième : regarder le centième (7 ≥ 5), donc arrondir à 3,5.',
 '{"type":"mcq","question":"Arrondis 3,47 à la dixième près","options":["3","3,4","3,5","3,47"],"answer":"3,5"}'),

('Ordonner des fractions simples', 1, 22000, '1/4 = 0,25, 1/2 = 0,5, 3/4 = 0,75. Ordre croissant : 1/4 < 1/2 < 3/4.',
 '{"type":"mcq","question":"Range en ordre croissant : 3/4, 1/4, 1/2","options":["3/4 < 1/2 < 1/4","1/4 < 1/2 < 3/4","1/2 < 1/4 < 3/4","1/4 < 3/4 < 1/2"],"answer":"1/4 < 1/2 < 3/4"}'),

-- DIFFICULTÉ 2 (19 questions)
('Addition de fractions de dénominateurs différents', 2, 30000, 'LCD de 3 et 4 = 12. 1/3 = 4/12, 1/4 = 3/12. Somme = 7/12.',
 '{"type":"mcq","question":"Calcule : 1/3 + 1/4","options":["2/7","7/12","4/12","1/12"],"answer":"7/12"}'),

('Soustraction de fractions dénominateurs différents', 2, 30000, 'LCD de 2 et 3 = 6. 1/2 = 3/6, 1/3 = 2/6. 3/6 − 2/6 = 1/6.',
 '{"type":"mcq","question":"Calcule : 1/2 − 1/3","options":["1/6","0","2/6","1/5"],"answer":"1/6"}'),

('Multiplication de fractions', 2, 28000, '2/3 × 3/4 = (2×3)/(3×4) = 6/12 = 1/2.',
 '{"type":"mcq","question":"Calcule : 2/3 × 3/4","options":["6/7","5/7","1/2","6/12"],"answer":"1/2"}'),

('Division de fractions', 2, 32000, 'Diviser par une fraction = multiplier par son inverse. (3/4) ÷ (1/2) = 3/4 × 2/1 = 6/4 = 3/2.',
 '{"type":"mcq","question":"Calcule : (3/4) ÷ (1/2)","options":["3/8","6/4","3/2","1/2"],"answer":"3/2"}'),

('Multiplication d''un décimal par 10', 2, 25000, 'Multiplier par 10 décale la virgule d''une position vers la droite : 2,4 × 10 = 24.',
 '{"type":"mcq","question":"Calcule : 2,4 × 10","options":["2,40","240","0,24","24"],"answer":"24"}'),

('Division d''un décimal par 10', 2, 25000, 'Diviser par 10 décale la virgule vers la gauche : 35,6 ÷ 10 = 3,56.',
 '{"type":"mcq","question":"Calcule : 35,6 ÷ 10","options":["356","3,56","0,356","35,6"],"answer":"3,56"}'),

('Multiplication de décimaux', 2, 30000, '0,3 × 0,4 : 3 × 4 = 12, deux décimales → 0,12.',
 '{"type":"mcq","question":"Calcule : 0,3 × 0,4","options":["1,2","0,012","0,12","1,20"],"answer":"0,12"}'),

('Division d''un décimal par un entier', 2, 30000, '4,8 ÷ 4 = 1,2.',
 '{"type":"mcq","question":"Calcule : 4,8 ÷ 4","options":["1,02","1,2","12","0,12"],"answer":"1,2"}'),

('Pourcentage d''une quantité', 2, 28000, '15% de 60 = 60 × 0,15 = 9.',
 '{"type":"mcq","question":"Calcule 15% de 60","options":["6","8","9","15"],"answer":"9"}'),

('Trouver le pourcentage', 2, 30000, '12 sur 40 = 12/40 = 0,3 = 30%.',
 '{"type":"mcq","question":"12 est quel pourcentage de 40 ?","options":["25%","30%","40%","48%"],"answer":"30%"}'),

('Augmentation en pourcentage', 2, 32000, 'Prix augmenté de 20% : 50 × 1,20 = 60 $.',
 '{"type":"mcq","question":"Un article coûte 50 $. Son prix augmente de 20%. Quel est le nouveau prix ?","options":["55 $","60 $","70 $","52 $"],"answer":"60 $"}'),

('Rabais en pourcentage', 2, 32000, 'Rabais de 25% : 80 × 0,25 = 20 $. Prix final = 80 − 20 = 60 $.',
 '{"type":"mcq","question":"Un manteau coûte 80 $. Il y a un rabais de 25%. Quel est le prix final ?","options":["55 $","60 $","65 $","20 $"],"answer":"60 $"}'),

('Comparer fractions de dénominateurs différents', 2, 28000, '5/6 vs 7/8 : 5/6 = 20/24, 7/8 = 21/24. Donc 7/8 > 5/6.',
 '{"type":"mcq","question":"Quelle fraction est la plus grande : 5/6 ou 7/8 ?","options":["5/6","7/8","Elles sont égales","Impossible à dire"],"answer":"7/8"}'),

('Conversion fraction → décimal', 2, 25000, '5/8 : effectuer 5 ÷ 8 = 0,625.',
 '{"type":"mcq","question":"Convertis 5/8 en nombre décimal","options":["0,58","0,625","0,5","1,6"],"answer":"0,625"}'),

('Addition de nombres mixtes', 2, 32000, '2⅓ + 1½ = 2 2/6 + 1 3/6 = 3 5/6.',
 '{"type":"mcq","question":"Calcule : 2⅓ + 1½","options":["3 1/2","3 5/6","3 2/6","4 1/6"],"answer":"3 5/6"}'),

('Soustraction de nombres mixtes', 2, 32000, '4¾ − 2¼ = 2½. Même dénominateur, soustraire parties entières et fractions.',
 '{"type":"mcq","question":"Calcule : 4¾ − 2¼","options":["2½","2¼","3","2¾"],"answer":"2½"}'),

('Fraction d''une fraction', 2, 30000, 'La moitié de 3/4 = 1/2 × 3/4 = 3/8.',
 '{"type":"mcq","question":"Quelle est la moitié de 3/4 ?","options":["1/4","3/8","6/8","3/2"],"answer":"3/8"}'),

('Problème de partage de ressource', 2, 32000, 'Total mangé = 2/5 + 1/3 = 6/15 + 5/15 = 11/15. Reste = 4/15.',
 '{"type":"mcq","question":"Un groupe mange 2/5 d''une pizza, puis 1/3 de plus. Quelle fraction reste-t-il ?","options":["1/15","4/15","5/15","11/15"],"answer":"4/15"}'),

('Rapport et proportion simple', 2, 30000, 'Si 3 crayons coûtent 1,50 $, 1 crayon coûte 0,50 $. 5 crayons = 2,50 $.',
 '{"type":"mcq","question":"3 crayons coûtent 1,50 $. Combien coûtent 5 crayons ?","options":["2,00 $","2,50 $","3,00 $","3,50 $"],"answer":"2,50 $"}'),

-- DIFFICULTÉ 3 (19 questions)
('Opérations mixtes avec fractions', 3, 45000, '3/4 × 8/9 − 1/6 = 24/36 − 6/36 = 18/36 = 1/2.',
 '{"type":"mcq","question":"Calcule : 3/4 × 8/9 − 1/6","options":["1/3","1/2","2/3","5/12"],"answer":"1/2"}'),

('Ordre des opérations avec fractions', 3, 45000, '(1/2 + 1/3) × 6 = (5/6) × 6 = 5.',
 '{"type":"mcq","question":"Calcule : (1/2 + 1/3) × 6","options":["4","5","6","7"],"answer":"5"}'),

('Pourcentage d''un pourcentage', 3, 45000, '20% de 30% de 500 = 30% de 500 × 20% = 150 × 20% = 30.',
 '{"type":"mcq","question":"Calcule 20% de 30% de 500","options":["25","30","300","3000"],"answer":"30"}'),

('Augmentation puis rabais', 3, 45000, '+20% puis −20% : 100 × 1,2 × 0,8 = 96. Le résultat n''est pas 100.',
 '{"type":"mcq","question":"Un prix de 100 $ augmente de 20%, puis diminue de 20%. Quel est le prix final ?","options":["100 $","96 $","84 $","104 $"],"answer":"96 $"}'),

('Problème de taux d''intérêt simple', 3, 45000, 'Intérêt = P × r × t = 500 × 0,04 × 2 = 40 $.',
 '{"type":"mcq","question":"Sofie place 500 $ à un taux d''intérêt simple de 4% par an pendant 2 ans. Quel est l''intérêt gagné ?","options":["20 $","40 $","80 $","4 $"],"answer":"40 $"}'),

('Fractions et proportions en contexte', 3, 45000, 'Rapport huile/vinaigre = 2/3. Pour 450 mL de vinaigre : huile = 2/3 × 450 = 300 mL.',
 '{"type":"mcq","question":"Une vinaigrette utilise 2 parts d''huile pour 3 parts de vinaigre. Si on utilise 450 mL de vinaigre, combien faut-il d''huile ?","options":["225 mL","300 mL","450 mL","675 mL"],"answer":"300 mL"}'),

('Trouver le tout à partir d''une fraction', 3, 42000, '3/5 du groupe = 12 élèves. Tout = 12 ÷ (3/5) = 12 × 5/3 = 20.',
 '{"type":"mcq","question":"3/5 du groupe de Carlos représente 12 élèves. Combien y a-t-il d''élèves dans le groupe ?","options":["15","20","25","30"],"answer":"20"}'),

('Valeur initiale avant un changement de pourcentage', 3, 45000, '120% du prix initial = 60 $. Prix initial = 60 ÷ 1,2 = 50 $.',
 '{"type":"mcq","question":"Après une augmentation de 20%, un article coûte 60 $. Quel était son prix initial ?","options":["48 $","50 $","52 $","72 $"],"answer":"50 $"}'),

('Division d''un décimal par un décimal', 3, 42000, '1,8 ÷ 0,06 = 180 ÷ 6 = 30.',
 '{"type":"mcq","question":"Calcule : 1,8 ÷ 0,06","options":["3","30","0,3","300"],"answer":"30"}'),

('Multiplication de trois fractions', 3, 40000, '2/3 × 3/4 × 4/5 = (2×3×4)/(3×4×5) = 24/60 = 2/5.',
 '{"type":"mcq","question":"Calcule : 2/3 × 3/4 × 4/5","options":["9/10","2/5","24/60","1/2"],"answer":"2/5"}'),

('Fraction et décimal dans la même expression', 3, 45000, '0,5 + 3/4 = 1/2 + 3/4 = 2/4 + 3/4 = 5/4 = 1,25.',
 '{"type":"mcq","question":"Calcule : 0,5 + 3/4","options":["0,75","1,25","1,5","0,25"],"answer":"1,25"}'),

('Problème de taux de change', 3, 45000, '1 $ CA = 0,75 $ US. 200 $ CA = 200 × 0,75 = 150 $ US.',
 '{"type":"mcq","question":"Le taux de change est de 0,75 $ US pour 1 $ CA. Combien de dollars US obtient-on pour 200 $ CA ?","options":["133 $ US","150 $ US","266 $ US","200 $ US"],"answer":"150 $ US"}'),

('Fraction complexe (fraction de fraction)', 3, 45000, '(2/3) ÷ (4/9) = 2/3 × 9/4 = 18/12 = 3/2 = 1,5.',
 '{"type":"mcq","question":"Calcule : (2/3) ÷ (4/9)","options":["8/27","3/2","2/3","1/2"],"answer":"3/2"}'),

('Comparaison de proportions', 3, 43000, 'Réduction A : 30/120 = 25%. Réduction B : 20/70 ≈ 28,6%. B offre la meilleure réduction.',
 '{"type":"mcq","question":"Article A : réduit de 30 $ (prix original 120 $). Article B : réduit de 20 $ (prix original 70 $). Quel article offre le plus grand rabais en pourcentage ?","options":["Article A","Article B","Ils sont pareils","Impossible à dire"],"answer":"Article B"}'),

('Problème de mélanges et concentrations', 3, 45000, 'Sel total : 0,1 × 200 + 0,2 × 300 = 20 + 60 = 80 g. Total eau : 500 mL. Concentration : 80/500 = 0,16 = 16%.',
 '{"type":"mcq","question":"On mélange 200 mL d''une solution à 10% de sel et 300 mL d''une solution à 20% de sel. Quelle est la concentration du mélange ?","options":["15%","16%","17%","18%"],"answer":"16%"}'),

('Suite géométrique avec fractions', 3, 45000, 'Suite : 1, 1/2, 1/4, 1/8... Raison = 1/2. 5e terme = 1 × (1/2)⁴ = 1/16.',
 '{"type":"mcq","question":"Dans la suite 1, 1/2, 1/4, 1/8..., quel est le 5e terme ?","options":["1/16","1/32","1/10","1/12"],"answer":"1/16"}'),

('Arrondir à des décimales significatives', 3, 40000, '0,14285... ≈ 0,143 (arrondi au millième).',
 '{"type":"mcq","question":"Arrondis 1/7 au millième près","options":["0,142","0,143","0,14","0,1428"],"answer":"0,143"}'),

('Problème de densité de population', 3, 45000, 'Densité = population ÷ superficie = 5400 ÷ 4,5 = 1200 hab/km².',
 '{"type":"mcq","question":"Un quartier de 4,5 km² compte 5400 habitants. Quelle est sa densité de population ?","options":["1000 hab/km²","1200 hab/km²","1500 hab/km²","2400 hab/km²"],"answer":"1200 hab/km²"}'),

('Raisonnement avec des fractions et des entiers', 3, 45000, 'La moitié de 1/3 = 1/6. Et le tiers de 1/2 = 1/6 aussi. Égalité vérifiée.',
 '{"type":"mcq","question":"Alex dit que la moitié de 1/3 est égale au tiers de 1/2. A-t-il raison ?","options":["Oui, les deux valent 1/6","Non, la moitié de 1/3 est plus grande","Non, le tiers de 1/2 est plus grand","Impossible à comparer"],"answer":"Oui, les deux valent 1/6"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);

-- Supplément SEC1_MAT_algebre : +68 questions (82 → 150)
-- PFEQ-MAT-SEC1-ALG

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-ALG') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (23 questions)
('Évaluer une expression à une variable', 1, 22000, 'Substituer x = 3 dans 2x + 1 : 2(3) + 1 = 6 + 1 = 7.',
 '{"type":"mcq","question":"Si x = 3, quelle est la valeur de 2x + 1 ?","options":["5","6","7","8"],"answer":"7"}'),

('Identifier une variable', 1, 18000, 'Une variable est une lettre qui représente une valeur inconnue.',
 '{"type":"mcq","question":"Dans l''expression 5n + 3, quelle est la variable ?","options":["5","n","3","5n"],"answer":"n"}'),

('Identifier le coefficient', 1, 18000, 'Dans 4x, le coefficient est 4. Il multiplie la variable.',
 '{"type":"mcq","question":"Dans l''expression 4x, quel est le coefficient de x ?","options":["x","4","4x","1"],"answer":"4"}'),

('Termes semblables', 1, 20000, '3x et 5x sont des termes semblables car ils ont la même partie variable.',
 '{"type":"mcq","question":"Parmi ces termes, lesquels sont semblables à 3x ?","options":["3y","x²","5x","3"],"answer":"5x"}'),

('Additionner des termes semblables', 1, 20000, '3x + 5x = (3+5)x = 8x. On additionne les coefficients.',
 '{"type":"mcq","question":"Simplifie : 3x + 5x","options":["8","8x","15x","3x + 5x"],"answer":"8x"}'),

('Soustraire des termes semblables', 1, 20000, '7y − 4y = (7−4)y = 3y.',
 '{"type":"mcq","question":"Simplifie : 7y − 4y","options":["3","3y","11y","−3y"],"answer":"3y"}'),

('Combiner plusieurs termes semblables', 1, 22000, '4a + 2b − 3a + b = (4−3)a + (2+1)b = a + 3b.',
 '{"type":"mcq","question":"Simplifie : 4a + 2b − 3a + b","options":["a + b","a + 3b","7a + 3b","a − 3b"],"answer":"a + 3b"}'),

('Résoudre une équation à une étape (addition)', 1, 22000, 'x + 5 = 12 → x = 12 − 5 = 7.',
 '{"type":"mcq","question":"Résous : x + 5 = 12","options":["x = 7","x = 17","x = 60","x = 5"],"answer":"x = 7"}'),

('Résoudre une équation à une étape (soustraction)', 1, 22000, 'n − 4 = 9 → n = 9 + 4 = 13.',
 '{"type":"mcq","question":"Résous : n − 4 = 9","options":["n = 5","n = 13","n = 36","n = −5"],"answer":"n = 13"}'),

('Résoudre une équation à une étape (multiplication)', 1, 22000, '3x = 15 → x = 15 ÷ 3 = 5.',
 '{"type":"mcq","question":"Résous : 3x = 15","options":["x = 5","x = 12","x = 45","x = 18"],"answer":"x = 5"}'),

('Résoudre une équation à une étape (division)', 1, 22000, 'x/4 = 6 → x = 6 × 4 = 24.',
 '{"type":"mcq","question":"Résous : x/4 = 6","options":["x = 2/3","x = 10","x = 24","x = 1,5"],"answer":"x = 24"}'),

('Écrire une équation à partir d''un énoncé', 1, 22000, '«Un nombre augmenté de 8 égale 15» → n + 8 = 15.',
 '{"type":"mcq","question":"«Un nombre augmenté de 8 est égal à 15». Quelle équation représente cette situation ?","options":["n + 8 = 15","n − 8 = 15","8n = 15","n/8 = 15"],"answer":"n + 8 = 15"}'),

('Vérifier une solution d''équation', 1, 20000, 'Substituer x = 4 dans 2x + 3 = 11 : 2(4) + 3 = 8 + 3 = 11 ✓.',
 '{"type":"mcq","question":"Est-ce que x = 4 est la solution de 2x + 3 = 11 ?","options":["Oui","Non, x = 3 est la solution","Non, x = 5 est la solution","Non, x = 4,5 est la solution"],"answer":"Oui"}'),

('Exprimer une situation par une expression', 1, 22000, 'x billets à 5 $ chacun : coût total = 5x.',
 '{"type":"mcq","question":"Luc achète x billets de cinéma à 5 $ chacun. Quelle expression représente le coût total ?","options":["5 + x","5 − x","5x","x/5"],"answer":"5x"}'),

('Terme constant dans une expression', 1, 18000, 'Dans 3x + 7, le terme constant est 7 (aucune variable).',
 '{"type":"mcq","question":"Dans l''expression 3x + 7, quel est le terme constant ?","options":["3","x","3x","7"],"answer":"7"}'),

('Évaluer une expression à deux variables', 1, 25000, 'a = 2, b = 3 : a + 2b = 2 + 2(3) = 2 + 6 = 8.',
 '{"type":"mcq","question":"Si a = 2 et b = 3, quelle est la valeur de a + 2b ?","options":["7","8","10","12"],"answer":"8"}'),

('Propriété commutative de l''addition algébrique', 1, 18000, '3x + 5 = 5 + 3x par commutativité.',
 '{"type":"mcq","question":"Quelle expression est équivalente à 3x + 5 ?","options":["5x + 3","5 + 3x","3 + 5x","15x"],"answer":"5 + 3x"}'),

('Polynôme : degré', 1, 20000, 'Dans 2x³ + x − 4, le terme de plus haut degré est 2x³. Degré = 3.',
 '{"type":"mcq","question":"Quel est le degré du polynôme 2x³ + x − 4 ?","options":["1","2","3","4"],"answer":"3"}'),

('Évaluer 0 dans une expression', 1, 18000, 'Si x = 0 : 5x + 3 = 5(0) + 3 = 3.',
 '{"type":"mcq","question":"Si x = 0, quelle est la valeur de 5x + 3 ?","options":["0","3","5","8"],"answer":"3"}'),

('Multiplication par 0 dans une expression', 1, 18000, '0 × n = 0, donc 0n + 6 = 6.',
 '{"type":"mcq","question":"Simplifie l''expression 0n + 6","options":["0","6n","6","0 + 6"],"answer":"6"}'),

('Additionner des expressions simples', 1, 22000, '(2x + 3) + (x + 4) = 3x + 7.',
 '{"type":"mcq","question":"Additionne : (2x + 3) + (x + 4)","options":["3x + 7","2x + 7","3x + 12","x + 7"],"answer":"3x + 7"}'),

('Soustraire des expressions simples', 1, 22000, '(5x + 6) − (2x + 1) = 3x + 5.',
 '{"type":"mcq","question":"Soustrais : (5x + 6) − (2x + 1)","options":["3x + 5","7x + 7","3x + 7","7x + 5"],"answer":"3x + 5"}'),

('Facteur commun évident', 1, 22000, '6x + 9 = 3(2x + 3). Le facteur commun est 3.',
 '{"type":"mcq","question":"Quel est le facteur commun dans 6x + 9 ?","options":["2","3","6","9"],"answer":"3"}'),

-- DIFFICULTÉ 2 (23 questions)
('Équation à deux étapes', 2, 32000, '2x + 3 = 11 → 2x = 8 → x = 4.',
 '{"type":"mcq","question":"Résous : 2x + 3 = 11","options":["x = 4","x = 7","x = 14","x = 8"],"answer":"x = 4"}'),

('Équation avec variable des deux côtés', 2, 35000, '3x = x + 8 → 2x = 8 → x = 4.',
 '{"type":"mcq","question":"Résous : 3x = x + 8","options":["x = 2","x = 4","x = 8","x = 6"],"answer":"x = 4"}'),

('Équation avec fraction', 2, 35000, 'x/3 + 2 = 5 → x/3 = 3 → x = 9.',
 '{"type":"mcq","question":"Résous : x/3 + 2 = 5","options":["x = 1","x = 3","x = 7","x = 9"],"answer":"x = 9"}'),

('Équation avec parenthèses', 2, 35000, '2(x + 3) = 14 → x + 3 = 7 → x = 4.',
 '{"type":"mcq","question":"Résous : 2(x + 3) = 14","options":["x = 4","x = 5","x = 8","x = 2"],"answer":"x = 4"}'),

('Distributivité algébrique', 2, 30000, '3(2x − 4) = 6x − 12.',
 '{"type":"mcq","question":"Développe : 3(2x − 4)","options":["6x − 4","6x − 12","2x − 12","6x + 12"],"answer":"6x − 12"}'),

('Distributivité avec terme négatif', 2, 30000, '−2(x + 5) = −2x − 10.',
 '{"type":"mcq","question":"Développe : −2(x + 5)","options":["−2x + 5","2x − 10","−2x − 10","−2x + 10"],"answer":"−2x − 10"}'),

('Factorisation par le facteur commun', 2, 32000, '4x + 8 = 4(x + 2). Facteur commun : 4.',
 '{"type":"mcq","question":"Factorise : 4x + 8","options":["4(x + 8)","4(x + 2)","8(x + 1)","2(2x + 4)"],"answer":"4(x + 2)"}'),

('Factorisation avec variable', 2, 32000, '6x² + 9x = 3x(2x + 3).',
 '{"type":"mcq","question":"Factorise : 6x² + 9x","options":["3(2x² + 9)","6x(x + 9)","3x(2x + 3)","9x(x + 1)"],"answer":"3x(2x + 3)"}'),

('Trouver la valeur d''une expression donnée une relation', 2, 32000, 'Si y = 2x − 3 et x = 5, alors y = 2(5) − 3 = 7.',
 '{"type":"mcq","question":"Si y = 2x − 3, quelle est la valeur de y quand x = 5 ?","options":["7","3","13","−7"],"answer":"7"}'),

('Substitution dans une formule', 2, 32000, 'P = 2l + 2w, l = 8, w = 5 : P = 2(8) + 2(5) = 16 + 10 = 26.',
 '{"type":"mcq","question":"Le périmètre d''un rectangle est P = 2l + 2w. Si l = 8 et w = 5, quel est P ?","options":["13","23","26","40"],"answer":"26"}'),

('Inégalité simple : résolution', 2, 30000, '2x > 10 → x > 5.',
 '{"type":"mcq","question":"Résous l''inégalité : 2x > 10","options":["x > 5","x > 20","x < 5","x > 8"],"answer":"x > 5"}'),

('Inégalité avec soustraction', 2, 30000, 'x − 3 < 7 → x < 10.',
 '{"type":"mcq","question":"Résous l''inégalité : x − 3 < 7","options":["x < 4","x < 10","x > 10","x < 21"],"answer":"x < 10"}'),

('Problème algébrique : âge', 2, 35000, 'Âge actuel = x, dans 5 ans : x + 5 = 17 → x = 12.',
 '{"type":"mcq","question":"Dans 5 ans, Marc aura 17 ans. Quel est son âge actuel ?","options":["10","11","12","13"],"answer":"12"}'),

('Problème algébrique : argent', 2, 35000, 'Budget − dépenses = reste. 50 − 3x = 20 → 3x = 30 → x = 10.',
 '{"type":"mcq","question":"Sarah a 50 $. Elle achète x stylos à 3 $ chacun et il lui reste 20 $. Combien de stylos a-t-elle achetés ?","options":["8","10","12","14"],"answer":"10"}'),

('Équation avec décimaux', 2, 35000, '0,5x + 1,5 = 4 → 0,5x = 2,5 → x = 5.',
 '{"type":"mcq","question":"Résous : 0,5x + 1,5 = 4","options":["x = 5","x = 2,5","x = 11","x = 3"],"answer":"x = 5"}'),

('Multiplication de monômes', 2, 30000, '3x² × 2x = 6x³. On multiplie coefficients et additionne les exposants.',
 '{"type":"mcq","question":"Multiplie : 3x² × 2x","options":["5x²","6x²","6x³","5x³"],"answer":"6x³"}'),

('Division de monômes', 2, 30000, '8x⁴ ÷ 2x² = 4x². On divise coefficients et soustrait les exposants.',
 '{"type":"mcq","question":"Simplifie : 8x⁴ ÷ 2x²","options":["4x","4x²","6x²","8x⁴"],"answer":"4x²"}'),

('Additionner des polynômes', 2, 32000, '(3x² + 2x + 1) + (x² − 3x + 4) = 4x² − x + 5.',
 '{"type":"mcq","question":"Additionne : (3x² + 2x + 1) + (x² − 3x + 4)","options":["4x² + x + 5","4x² − x + 5","4x² − x + 6","2x² + x + 3"],"answer":"4x² − x + 5"}'),

('Soustraire des polynômes', 2, 32000, '(5x² + 3x − 2) − (2x² + x + 1) = 3x² + 2x − 3.',
 '{"type":"mcq","question":"Soustrais : (5x² + 3x − 2) − (2x² + x + 1)","options":["3x² + 2x − 3","3x² + 2x − 1","3x² + 4x − 3","7x² + 4x − 1"],"answer":"3x² + 2x − 3"}'),

('Problème : largeur en fonction de la longueur', 2, 35000, 'Longueur = 2l, largeur = l. P = 2(2l) + 2l = 6l = 24 → l = 4 m. Longueur = 8 m.',
 '{"type":"mcq","question":"La longueur d''un rectangle est le double de sa largeur. Le périmètre est 24 m. Quelle est la longueur ?","options":["4 m","6 m","8 m","12 m"],"answer":"8 m"}'),

('Système : substitution simple', 2, 38000, 'y = x + 2 et x = 3 → y = 5.',
 '{"type":"mcq","question":"Si y = x + 2 et x = 3, quelle est la valeur de y ?","options":["1","3","5","6"],"answer":"5"}'),

('Trouver deux valeurs dans un système simple', 2, 38000, 'x + y = 10 et y = 3x. Remplacer : x + 3x = 10 → 4x = 10 → x = 2,5, y = 7,5.',
 '{"type":"mcq","question":"Si x + y = 10 et y = 3x, quelle est la valeur de x ?","options":["2","2,5","3","4"],"answer":"2,5"}'),

('Modéliser une situation linéaire', 2, 35000, 'Coût = 15 + 5h. Pour h = 6 : 15 + 30 = 45 $.',
 '{"type":"mcq","question":"Un service coûte 15 $ de base + 5 $ par heure. Quelle expression représente le coût total pour h heures ? Si h = 6, combien coûte le service ?","options":["15h + 5 = 95 $","5h + 15 = 45 $","5h − 15 = 15 $","15 + h = 21 $"],"answer":"5h + 15 = 45 $"}'),

-- DIFFICULTÉ 3 (22 questions)
('Résoudre un système par substitution', 3, 45000, 'y = 2x et x + y = 9. Substituer : x + 2x = 9 → x = 3, y = 6.',
 '{"type":"mcq","question":"Résous le système : y = 2x et x + y = 9","options":["x = 2, y = 4","x = 3, y = 6","x = 4, y = 5","x = 1, y = 8"],"answer":"x = 3, y = 6"}'),

('Résoudre un système par élimination', 3, 45000, 'x + y = 8 et x − y = 2. Additionner : 2x = 10 → x = 5, y = 3.',
 '{"type":"mcq","question":"Résous : x + y = 8 et x − y = 2","options":["x = 3, y = 5","x = 4, y = 4","x = 5, y = 3","x = 6, y = 2"],"answer":"x = 5, y = 3"}'),

('Inégalité à deux étapes', 3, 42000, '3x − 4 ≥ 11 → 3x ≥ 15 → x ≥ 5.',
 '{"type":"mcq","question":"Résous : 3x − 4 ≥ 11","options":["x ≥ 5","x ≥ 7","x ≥ 8","x ≤ 5"],"answer":"x ≥ 5"}'),

('Développer un produit de binômes', 3, 45000, '(x + 3)(x + 2) = x² + 2x + 3x + 6 = x² + 5x + 6.',
 '{"type":"mcq","question":"Développe : (x + 3)(x + 2)","options":["x² + 5x + 6","x² + 6x + 5","x² + 5x + 5","x² + 6"],"answer":"x² + 5x + 6"}'),

('Développer avec terme négatif', 3, 45000, '(x − 4)(x + 2) = x² + 2x − 4x − 8 = x² − 2x − 8.',
 '{"type":"mcq","question":"Développe : (x − 4)(x + 2)","options":["x² − 2x − 8","x² + 2x − 8","x² − 6x + 8","x² − 8"],"answer":"x² − 2x − 8"}'),

('Factoriser un trinôme simple', 3, 45000, 'x² + 5x + 6 = (x + 2)(x + 3) car 2 × 3 = 6 et 2 + 3 = 5.',
 '{"type":"mcq","question":"Factorise : x² + 5x + 6","options":["(x + 1)(x + 6)","(x + 2)(x + 3)","(x + 3)(x + 2)","(x + 6)(x + 1)"],"answer":"(x + 2)(x + 3)"}'),

('Factoriser différence de carrés', 3, 45000, 'x² − 9 = (x + 3)(x − 3). Différence de deux carrés.',
 '{"type":"mcq","question":"Factorise : x² − 9","options":["(x + 9)(x − 1)","(x − 3)²","(x + 3)(x − 3)","(x + 3)²"],"answer":"(x + 3)(x − 3)"}'),

('Résoudre une équation quadratique par factorisation', 3, 45000, 'x² + 5x + 6 = 0 → (x+2)(x+3) = 0 → x = −2 ou x = −3.',
 '{"type":"mcq","question":"Résous par factorisation : x² + 5x + 6 = 0","options":["x = 2 ou x = 3","x = −2 ou x = −3","x = 1 ou x = 6","x = −1 ou x = −6"],"answer":"x = −2 ou x = −3"}'),

('Problème : deux inconnues', 3, 45000, 'a + b = 20, a = 3b. → 3b + b = 20 → b = 5, a = 15.',
 '{"type":"mcq","question":"La somme de deux nombres est 20. L''un est trois fois l''autre. Quels sont ces nombres ?","options":["5 et 15","4 et 16","6 et 14","8 et 12"],"answer":"5 et 15"}'),

('Interpréter une solution d''inégalité', 3, 42000, 'x ≤ 3 : les valeurs 1, 2, 3 satisfont l''inégalité mais pas 4.',
 '{"type":"mcq","question":"La solution x ≤ 3 est représentée par quel énoncé ?","options":["x est plus grand que 3","x est au plus 3","x est plus petit que 3","x est au moins 3"],"answer":"x est au plus 3"}'),

('Équation avec exposants', 3, 45000, '2^x = 16 → 2^x = 2⁴ → x = 4.',
 '{"type":"mcq","question":"Résous : 2^x = 16","options":["x = 2","x = 3","x = 4","x = 8"],"answer":"x = 4"}'),

('Problème de vitesse-distance-temps', 3, 45000, 'd = vt. Julia : 60t. Carlos : 80(t−0,5). Égaler : 60t = 80t − 40 → 20t = 40 → t = 2 h.',
 '{"type":"mcq","question":"Julia part à 60 km/h. Carlos part 30 minutes plus tard à 80 km/h. Dans combien de temps Carlos rattrape-t-il Julia (depuis le départ de Julia) ?","options":["1,5 h","2 h","2,5 h","3 h"],"answer":"2 h"}'),

('Résoudre une équation à coefficients fractionnaires', 3, 45000, 'x/2 + x/3 = 5. LCD = 6 : 3x/6 + 2x/6 = 5 → 5x/6 = 5 → x = 6.',
 '{"type":"mcq","question":"Résous : x/2 + x/3 = 5","options":["x = 5","x = 6","x = 10","x = 15"],"answer":"x = 6"}'),

('Propriété de l''inégalité avec négatif', 3, 42000, 'Si on multiplie par −1, le sens change : −x > 3 → x < −3.',
 '{"type":"mcq","question":"Résous : −x > 3","options":["x > 3","x > −3","x < 3","x < −3"],"answer":"x < −3"}'),

('Système linéaire : problème de mélanges', 3, 45000, 'x + y = 100, 0,3x + 0,7y = 50. Résoudre : y = (50 − 30)/(0,4) = 50, x = 50.',
 '{"type":"mcq","question":"On mélange deux solutions pour obtenir 100 mL à 50% de concentration. Solution A est à 30% et solution B est à 70%. Combien de mL de chaque solution faut-il ?","options":["25 mL A et 75 mL B","50 mL A et 50 mL B","75 mL A et 25 mL B","40 mL A et 60 mL B"],"answer":"50 mL A et 50 mL B"}'),

('Maximiser sous contrainte', 3, 45000, 'x + y ≤ 10, profit = 3x + 2y. Pour maximiser, priorité à x. Si x = 10, y = 0 : profit = 30.',
 '{"type":"mcq","question":"Maximise 3x + 2y avec la contrainte x + y ≤ 10, x ≥ 0, y ≥ 0","options":["20","25","30","28"],"answer":"30"}'),

('Carré d''un binôme', 3, 45000, '(x + 4)² = x² + 8x + 16.',
 '{"type":"mcq","question":"Développe : (x + 4)²","options":["x² + 16","x² + 4x + 16","x² + 8x + 16","x² + 8x + 8"],"answer":"x² + 8x + 16"}'),

('Équation du 2e degré avec constante déplacée', 3, 45000, 'x² = 25 → x = ±5.',
 '{"type":"mcq","question":"Résous : x² = 25","options":["x = 5","x = −5","x = 5 ou x = −5","x = ±25"],"answer":"x = 5 ou x = −5"}'),

('Modèle d''une suite arithmétique algébrique', 3, 42000, 'Suite : 2, 5, 8, 11... Premier terme = 2, raison = 3. Terme général : aₙ = 3n − 1.',
 '{"type":"mcq","question":"Quelle formule représente le terme général de la suite 2, 5, 8, 11... ?","options":["aₙ = 3n","aₙ = 3n − 1","aₙ = 2n + 1","aₙ = n + 3"],"answer":"aₙ = 3n − 1"}'),

('Interpréter le graphique d''une droite', 3, 42000, 'y = 2x + 1. Pente = 2 (pour chaque +1 en x, +2 en y). Ordonnée à l''origine = 1.',
 '{"type":"mcq","question":"Dans y = 2x + 1, que représente le 2 ?","options":["L''ordonnée à l''origine","La pente (taux de variation)","La valeur de x","La valeur de y"],"answer":"La pente (taux de variation)"}'),

('Équation d''une droite à partir de deux points', 3, 45000, 'Points (1, 3) et (3, 7). Pente = (7−3)/(3−1) = 2. y = 2x + b → 3 = 2(1) + b → b = 1. y = 2x + 1.',
 '{"type":"mcq","question":"Quelle est l''équation de la droite passant par (1, 3) et (3, 7) ?","options":["y = x + 2","y = 2x + 1","y = 3x","y = 2x − 1"],"answer":"y = 2x + 1"}'),

('Problème de rentabilité', 3, 45000, 'Revenus = 8x, Coûts = 3x + 50. Profit = 5x − 50. Break-even : 5x = 50 → x = 10.',
 '{"type":"mcq","question":"Un vendeur vend des articles 8 $ chacun. Ses coûts fixes sont de 50 $ et chaque article coûte 3 $ à produire. Combien d''articles doit-il vendre pour rentabiliser ?","options":["8","10","12","15"],"answer":"10"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);

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

-- Supplément SEC1_MAT_statistiques : +76 questions (74 → 150)
-- PFEQ-MAT-SEC1-STAT

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-STAT') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (26 questions)
('Calculer la moyenne de 3 valeurs', 1, 22000, 'Moyenne = somme ÷ nombre de données. (10 + 12 + 14) ÷ 3 = 36 ÷ 3 = 12.',
 '{"type":"mcq","question":"Calcule la moyenne de ces notes : 10, 12, 14","options":["11","12","13","14"],"answer":"12"}'),

('Calculer la médiane (5 données)', 1, 22000, 'On ordonne : 3, 5, 7, 9, 11. La médiane est la valeur centrale = 7.',
 '{"type":"mcq","question":"Quelle est la médiane de l''ensemble de données : 9, 3, 7, 5, 11 ?","options":["5","7","9","6"],"answer":"7"}'),

('Calculer le mode', 1, 20000, 'Le mode est la valeur qui apparaît le plus souvent. 4 apparaît 3 fois.',
 '{"type":"mcq","question":"Quel est le mode de l''ensemble : 2, 4, 4, 4, 5, 6, 6 ?","options":["4","5","6","2"],"answer":"4"}'),

('Calculer l''étendue', 1, 20000, 'Étendue = valeur max − valeur min = 18 − 5 = 13.',
 '{"type":"mcq","question":"Dans l''ensemble 5, 8, 12, 15, 18, quelle est l''étendue ?","options":["10","12","13","23"],"answer":"13"}'),

('Lire un tableau de données', 1, 20000, 'Lire directement dans la cellule du tableau.',
 '{"type":"mcq","question":"Dans un tableau, les températures lundi à vendredi sont : 12, 15, 10, 18, 14. Quelle était la température mardi ?","options":["10°","12°","14°","15°"],"answer":"15°"}'),

('Diagramme à barres : lire une valeur', 1, 18000, 'Lire la hauteur de la barre correspondant à la catégorie.',
 '{"type":"mcq","question":"Un diagramme à barres montre les sports préférés. La barre «Soccer» atteint 25. Que signifie ce chiffre ?","options":["Il y a 25 sports","25 élèves préfèrent le soccer","Le soccer mérite 25 points","25% des élèves jouent au soccer"],"answer":"25 élèves préfèrent le soccer"}'),

('Diagramme circulaire : interpréter un secteur', 1, 20000, '25% d''un total de 200 = 50.',
 '{"type":"mcq","question":"Un diagramme circulaire montre que 25% des élèves préfèrent les maths. Si l''école a 200 élèves, combien préfèrent les maths ?","options":["25","40","50","75"],"answer":"50"}'),

('Fréquence dans un tableau', 1, 18000, 'La fréquence d''une valeur est son nombre d''occurrences.',
 '{"type":"mcq","question":"Dans la liste 1, 2, 2, 3, 2, 4, quelle est la fréquence du nombre 2 ?","options":["1","2","3","6"],"answer":"3"}'),

('Calculer la moyenne pondérée simple', 1, 25000, 'Moyenne = (80×2 + 70×1) ÷ (2+1) = (160 + 70) ÷ 3 = 230 ÷ 3 ≈ 76,7.',
 '{"type":"mcq","question":"Un examen compte double. Marie a obtenu 80 à l''examen et 70 au devoir. Quelle est sa note finale ?","options":["75","76,7","77","80"],"answer":"76,7"}'),

('Ordonner pour trouver médiane', 1, 22000, 'Ordonné : 2, 5, 8, 11, 15. Médiane = 8.',
 '{"type":"mcq","question":"Quelle est la médiane de : 11, 5, 15, 2, 8 ?","options":["2","8","11","9"],"answer":"8"}'),

('Données sans mode', 1, 20000, 'Si chaque valeur n''apparaît qu''une fois, il n''y a pas de mode.',
 '{"type":"mcq","question":"L''ensemble {3, 7, 12, 18, 25} a-t-il un mode ?","options":["Oui, c''est 3","Oui, c''est 12","Non, il n''y a pas de mode","Oui, c''est 25"],"answer":"Non, il n''y a pas de mode"}'),

('Plusieurs modes', 1, 20000, 'Un ensemble peut avoir deux modes (bimodal) : 3 et 7 apparaissent deux fois chacun.',
 '{"type":"mcq","question":"Quels sont les modes de l''ensemble : 3, 7, 3, 9, 7, 12 ?","options":["3 seulement","7 seulement","3 et 7","9 et 12"],"answer":"3 et 7"}'),

('Tableau de fréquences : fréquence relative', 1, 22000, 'Fréquence relative = fréquence / total. 6/30 = 0,2 = 20%.',
 '{"type":"mcq","question":"Sur 30 élèves, 6 ont obtenu A. Quelle est la fréquence relative du grade A ?","options":["6%","15%","20%","25%"],"answer":"20%"}'),

('Lire un histogramme', 1, 22000, 'Un histogramme montre la distribution d''une variable continue par intervalles.',
 '{"type":"mcq","question":"Un histogramme montre les âges 10−12 ans : 15 élèves, 13−15 ans : 20 élèves. Combien d''élèves ont entre 10 et 15 ans ?","options":["15","20","35","25"],"answer":"35"}'),

('Diagramme à tiges et feuilles', 1, 22000, 'Tige 2 | Feuilles 3 5 7 → représente 23, 25, 27.',
 '{"type":"mcq","question":"Dans un diagramme à tiges et feuilles, la tige 4 avec les feuilles 0, 3, 6 représente quels nombres ?","options":["4, 3, 6","40, 43, 46","4, 04, 036","14, 34, 64"],"answer":"40, 43, 46"}'),

('Identifier la valeur aberrante', 1, 22000, 'Une valeur aberrante s''écarte fortement des autres. Dans {10, 12, 11, 13, 80}, 80 est aberrante.',
 '{"type":"mcq","question":"Dans l''ensemble {10, 12, 11, 13, 80}, quelle valeur est aberrante ?","options":["10","12","13","80"],"answer":"80"}'),

('Effet d''une valeur aberrante sur la moyenne', 1, 22000, 'Une valeur aberrante élevée tire la moyenne vers le haut mais n''affecte pas la médiane autant.',
 '{"type":"mcq","question":"Une valeur très élevée dans un ensemble de données affecte davantage quelle mesure de tendance centrale ?","options":["La médiane","La mode","La moyenne","L''étendue"],"answer":"La moyenne"}'),

('Population vs échantillon', 1, 20000, 'Un sondage sur 100 élèves d''une école de 500 est un échantillon de la population.',
 '{"type":"mcq","question":"On interroge 100 élèves sur 500 pour connaître leur sport préféré. Les 100 élèves forment...","options":["La population","L''échantillon","Le recensement","L''enquête"],"answer":"L''échantillon"}'),

('Taille de l''échantillon', 1, 18000, 'Plus l''échantillon est grand, plus les résultats sont représentatifs.',
 '{"type":"mcq","question":"Pour estimer les préférences d''une école de 800 élèves, quel échantillon est le plus représentatif ?","options":["10 élèves","50 élèves","100 élèves","200 élèves"],"answer":"200 élèves"}'),

('Diagramme à ligne brisée : tendance', 1, 20000, 'Un graphique dont les points montent de gauche à droite montre une tendance à la hausse.',
 '{"type":"mcq","question":"Un graphique des ventes montre : Jan: 100, Fév: 120, Mar: 140, Avr: 160. Quelle est la tendance ?","options":["À la baisse","Stable","À la hausse","Aléatoire"],"answer":"À la hausse"}'),

('Somme des fréquences relatives', 1, 18000, 'La somme de toutes les fréquences relatives est toujours égale à 1 (ou 100%).',
 '{"type":"mcq","question":"La somme de toutes les fréquences relatives d''une distribution est...","options":["50%","75%","100%","Variable"],"answer":"100%"}'),

('Calculer une moyenne à partir d''un tableau', 1, 22000, 'Données : 5 élèves ont 60, 8 ont 70, 7 ont 80. Somme = 300+560+560=1420. Moyenne = 1420/20 = 71.',
 '{"type":"mcq","question":"5 élèves ont 60, 8 élèves ont 70 et 7 élèves ont 80. Quelle est la moyenne du groupe ?","options":["70","71","72","73"],"answer":"71"}'),

('Médiane avec nombre pair de données', 1, 22000, 'Données paires : médiane = moyenne des deux valeurs centrales. (7+9)/2 = 8.',
 '{"type":"mcq","question":"Quelle est la médiane de l''ensemble {5, 7, 9, 11} ?","options":["7","8","9","8,5"],"answer":"8"}'),

('Comparer moyenne et médiane', 1, 22000, 'Avec une valeur aberrante haute, la moyenne > médiane.',
 '{"type":"mcq","question":"L''ensemble {2, 3, 4, 5, 100} a une moyenne de 22,8 et une médiane de 4. Pourquoi la moyenne est-elle si élevée ?","options":["À cause de la valeur 2","À cause de la valeur 100","Les deux sont égaux","La médiane est fausse"],"answer":"À cause de la valeur 100"}'),

('Interprétation des données manquantes', 1, 22000, 'Si la moyenne est 10 et on a 4 valeurs dont 8, 10, 12, la 4e est 10×4 − 8−10−12 = 40−30 = 10.',
 '{"type":"mcq","question":"La moyenne de 4 notes est 10. Trois notes sont 8, 10 et 12. Quelle est la 4e note ?","options":["8","9","10","12"],"answer":"10"}'),

('Graphique en bâtons : trouver la classe modale', 1, 20000, 'La classe modale est l''intervalle le plus fréquent.',
 '{"type":"mcq","question":"Dans un histogramme, les fréquences par intervalle sont : 10−20: 5, 20−30: 12, 30−40: 8, 40−50: 4. Quel est l''intervalle modal ?","options":["10−20","20−30","30−40","40−50"],"answer":"20−30"}'),

-- DIFFICULTÉ 2 (25 questions)
('Moyenne pondérée à plusieurs poids', 2, 32000, 'MG = (0,40×85 + 0,30×78 + 0,30×92) = 34 + 23,4 + 27,6 = 85.',
 '{"type":"mcq","question":"Un cours est noté : examen 40%, travaux 30%, présentation 30%. Notes : 85, 78, 92. Quelle est la note finale ?","options":["83","84","85","86"],"answer":"85"}'),

('Écart à la moyenne', 2, 30000, 'Écart = valeur − moyenne. Note = 72, moyenne = 80. Écart = −8.',
 '{"type":"mcq","question":"La moyenne de classe est 80. Un élève a obtenu 72. Quel est son écart à la moyenne ?","options":["−8","8","−72","152"],"answer":"−8"}'),

('Interpréter l''étendue d''un ensemble', 2, 30000, 'Grande étendue = données très dispersées. Petite étendue = données regroupées.',
 '{"type":"mcq","question":"Classe A : étendue de 5. Classe B : étendue de 30. Quelle classe a des résultats plus homogènes ?","options":["Classe A","Classe B","Les deux sont identiques","Impossible à savoir"],"answer":"Classe A"}'),

('Construire un tableau de fréquences', 2, 35000, 'Données : 1,1,2,3,3,3,4. Fréquences : 1→2, 2→1, 3→3, 4→1.',
 '{"type":"mcq","question":"Quelles sont les fréquences de chaque valeur dans {1, 1, 2, 3, 3, 3, 4} ?","options":["1:1, 2:2, 3:3, 4:1","1:2, 2:1, 3:3, 4:1","1:3, 2:1, 3:2, 4:1","1:2, 2:3, 3:1, 4:1"],"answer":"1:2, 2:1, 3:3, 4:1"}'),

('Diagramme circulaire : calculer les angles', 2, 32000, '25% × 360° = 90°.',
 '{"type":"mcq","question":"Un secteur représente 25% d''un diagramme circulaire. Quel est son angle ?","options":["25°","45°","90°","180°"],"answer":"90°"}'),

('Interpréter une corrélation positive', 2, 30000, 'Corrélation positive : quand une variable augmente, l''autre aussi.',
 '{"type":"mcq","question":"Un graphique montre que les élèves qui étudient plus longtemps obtiennent de meilleures notes. Quel type de corrélation est-ce ?","options":["Corrélation négative","Corrélation nulle","Corrélation positive","Absence de relation"],"answer":"Corrélation positive"}'),

('Interpréter une corrélation négative', 2, 30000, 'Corrélation négative : quand une variable augmente, l''autre diminue.',
 '{"type":"mcq","question":"Un graphique montre que plus on est absent, moins la note est élevée. Quel type de corrélation est-ce ?","options":["Corrélation positive","Corrélation nulle","Corrélation négative","Corrélation parfaite"],"answer":"Corrélation négative"}'),

('Corrélation vs causalité', 2, 32000, 'Corrélation ne signifie pas causalité. Deux variables peuvent être corrélées sans l''une causer l''autre.',
 '{"type":"mcq","question":"La vente de crème glacée et le nombre de noyades sont corrélés positivement. Cela signifie-t-il que la crème glacée cause des noyades ?","options":["Oui, corrélation = causalité","Non, les deux sont liées à un facteur commun (la chaleur)","Oui, il faut interdire la crème glacée","Non, la causalité est négative"],"answer":"Non, les deux sont liées à un facteur commun (la chaleur)"}'),

('Droite de tendance : utiliser pour prédire', 2, 35000, 'Si la droite y = 2x + 10 représente la relation, pour x = 5 : y = 20.',
 '{"type":"mcq","question":"La droite de tendance d''un graphique est y = 2x + 10. Si x = 5, quelle valeur de y prédit-on ?","options":["15","20","25","30"],"answer":"20"}'),

('Fréquence cumulée', 2, 32000, 'Fréquence cumulée jusqu''à 70 = fréquence(≤60) + fréquence(60-70) = 5 + 8 = 13.',
 '{"type":"mcq","question":"Notes ≤60 : 5 élèves, notes 60-70 : 8 élèves, notes 70-80 : 10 élèves. Combien d''élèves ont ≤70 ?","options":["8","10","13","23"],"answer":"13"}'),

('Percentile : interprétation', 2, 32000, 'Le 75e percentile = 75% des données sont en dessous de cette valeur.',
 '{"type":"mcq","question":"Sofia est au 75e percentile pour sa taille. Cela signifie qu''elle est plus grande que...","options":["75 élèves","75% des élèves","25% des élèves","3/4 des élèves"],"answer":"75% des élèves"}'),

('Biais d''échantillonnage', 2, 32000, 'Sonder uniquement les élèves d''un sport = biais de sélection.',
 '{"type":"mcq","question":"Pour savoir le sport préféré de tous les élèves, on interroge uniquement ceux du club de soccer. Ce sondage est-il biaisé ?","options":["Non, c''est représentatif","Oui, car les amateurs de soccer ne représentent pas tous les élèves","Non, si l''échantillon est assez grand","Oui, mais seulement si moins de 50% jouent au soccer"],"answer":"Oui, car les amateurs de soccer ne représentent pas tous les élèves"}'),

('Choisir la mesure appropriée', 2, 30000, 'Pour des revenus avec quelques très hautes valeurs, la médiane est préférable à la moyenne.',
 '{"type":"mcq","question":"Pour décrire les revenus d''un quartier où quelques résidents sont très riches, quelle mesure de tendance est la plus représentative ?","options":["La moyenne","La médiane","Le mode","L''étendue"],"answer":"La médiane"}'),

('Comparaison de deux groupes par médiane', 2, 32000, 'Groupe A : médiane 75. Groupe B : médiane 85. Groupe B a de meilleurs résultats typiques.',
 '{"type":"mcq","question":"Groupe A a une médiane de 75 et groupe B une médiane de 85. Lequel a de meilleurs résultats typiques ?","options":["Groupe A","Groupe B","Ils sont équivalents","Impossible à dire"],"answer":"Groupe B"}'),

('Tableau croisé : interpréter', 2, 32000, 'Lire la cellule correspondant à la croisée des deux catégories.',
 '{"type":"mcq","question":"Un tableau croisé montre : garçons/soccer=15, garçons/hockey=12, filles/soccer=10, filles/hockey=8. Combien de filles jouent au soccer ?","options":["8","10","12","15"],"answer":"10"}'),

('Calculer un taux de variation', 2, 30000, 'Taux = (nouvelle valeur − ancienne valeur) / ancienne valeur × 100. (120−100)/100 = 20%.',
 '{"type":"mcq","question":"Les ventes passent de 100 à 120 unités. Quel est le taux de variation ?","options":["10%","20%","120%","20 unités"],"answer":"20%"}'),

('Interpréter une boîte à moustaches (quartiles)', 2, 35000, 'Q1 = 25e percentile, Q2 = médiane, Q3 = 75e percentile. L''écart interquartile = Q3 − Q1.',
 '{"type":"mcq","question":"Dans une boîte à moustaches, Q1 = 40 et Q3 = 70. Quel est l''écart interquartile ?","options":["30","40","55","110"],"answer":"30"}'),

('Identifier la distribution symétrique', 2, 32000, 'Une distribution symétrique : moyenne = médiane = mode.',
 '{"type":"mcq","question":"Dans une distribution symétrique parfaite, quel est le rapport entre la moyenne et la médiane ?","options":["La moyenne > médiane","La médiane > moyenne","Moyenne = médiane","Impossible à dire"],"answer":"Moyenne = médiane"}'),

('Interpolation à partir d''une droite', 2, 35000, 'Interpoler = estimer une valeur entre deux points connus. Extrapoler = estimer hors de la plage.',
 '{"type":"mcq","question":"Estimer une valeur entre des points connus d''un graphique s''appelle...","options":["Extrapolation","Interpolation","Corrélation","Régression"],"answer":"Interpolation"}'),

('Graphique à double axe : lire deux variables', 2, 32000, 'Chaque axe représente une variable différente avec sa propre unité et échelle.',
 '{"type":"mcq","question":"Un graphique à double axe montre les ventes (axe gauche) et la température (axe droit). En janvier, les barres indiquent ventes = 50 et température = −5. Que vaut la température en janvier ?","options":["−5°","50°","5°","45°"],"answer":"−5°"}'),

('Trouver une donnée manquante avec la moyenne', 2, 30000, 'Somme totale = moyenne × n = 75 × 5 = 375. Somme connue = 70+80+65+75 = 290. Donnée = 375 − 290 = 85.',
 '{"type":"mcq","question":"La moyenne de 5 notes est 75. Quatre notes sont 70, 80, 65 et 75. Quelle est la 5e note ?","options":["75","80","85","90"],"answer":"85"}'),

('Distribution bimodale', 2, 30000, 'Une distribution bimodale a deux modes (deux pics de fréquence).',
 '{"type":"mcq","question":"Dans un graphique des âges dans un parc, on voit deux pics : un à 5−10 ans et un à 25−35 ans. Cette distribution est...","options":["Unimodale","Bimodale","Uniforme","Asymétrique"],"answer":"Bimodale"}'),

('Comparer deux ensembles : moyenne vs étendue', 2, 32000, 'Même moyenne, étendues différentes : groupes différemment dispersés.',
 '{"type":"mcq","question":"Classe A : moyenne 75, étendue 10. Classe B : moyenne 75, étendue 40. Laquelle est plus homogène ?","options":["Classe A","Classe B","Les deux sont identiques","Impossible à dire"],"answer":"Classe A"}'),

('Lecture d''un diagramme en boîte à moustaches', 2, 32000, 'La médiane est représentée par la ligne au centre de la boîte.',
 '{"type":"mcq","question":"Dans une boîte à moustaches, la ligne au centre de la boîte représente...","options":["La moyenne","La médiane","Le mode","L''étendue"],"answer":"La médiane"}'),

('Données qualitatives vs quantitatives', 2, 28000, 'Qualitative = catégorielle. Quantitative = numérique mesurable.',
 '{"type":"mcq","question":"Laquelle de ces variables est quantitative ?","options":["La couleur préférée","La langue parlée","La taille en cm","Le genre"],"answer":"La taille en cm"}'),

-- DIFFICULTÉ 3 (25 questions)
('Calculer l''écart-type (concept)', 3, 45000, 'L''écart-type mesure la dispersion autour de la moyenne. Grand écart-type = données très dispersées.',
 '{"type":"mcq","question":"Deux classes ont la même moyenne de 70. Classe A : notes de 60 à 80. Classe B : notes de 40 à 100. Laquelle a le plus grand écart-type ?","options":["Classe A","Classe B","Les deux sont égaux","Impossible à dire"],"answer":"Classe B"}'),

('Interprétation du coefficient de corrélation', 3, 45000, 'r proche de 1 = corrélation positive forte. r proche de −1 = corrélation négative forte. r ≈ 0 = pas de corrélation.',
 '{"type":"mcq","question":"Quel coefficient de corrélation indique la relation linéaire la plus forte ?","options":["r = 0,3","r = −0,9","r = 0,5","r = 0,1"],"answer":"r = −0,9"}'),

('Droite de régression : interprétation de la pente', 3, 45000, 'Pente = 2 signifie qu''à chaque unité supplémentaire de x, y augmente de 2.',
 '{"type":"mcq","question":"La droite de régression est y = 2x + 5. Que signifie la pente 2 dans ce contexte où x = heures d''étude et y = note ?","options":["La note de base est 2","Pour chaque heure d''étude supplémentaire, la note augmente de 2","La note maximale est 2","Pour 2 heures, on obtient 5"],"answer":"Pour chaque heure d''étude supplémentaire, la note augmente de 2"}'),

('Régression : prédiction et limites', 3, 45000, 'Extrapoler loin des données observées est risqué car le modèle peut ne plus s''appliquer.',
 '{"type":"mcq","question":"Une droite de régression basée sur des données de 10 à 50 est utilisée pour prédire une valeur à x = 200. Cette prédiction est...","options":["Très fiable","Peu fiable, c''est une extrapolation","Fiable si r est proche de 1","Fiable si l''étendue est grande"],"answer":"Peu fiable, c''est une extrapolation"}'),

('Comparaison de distributions asymétriques', 3, 45000, 'Distribution à droite (positive) : queue à droite, moyenne > médiane.',
 '{"type":"mcq","question":"Une distribution avec une longue queue à droite est dite...","options":["Asymétrique négative","Symétrique","Asymétrique positive","Bimodale"],"answer":"Asymétrique positive"}'),

('Calculer et comparer des percentiles', 3, 45000, 'Percentile = rang de la donnée × 100 / n. Donnée 8 dans {2,4,6,8,10} est au 80e percentile.',
 '{"type":"mcq","question":"Dans un ensemble ordonné de 10 valeurs, une valeur est à la 7e position. À quel percentile se trouve-t-elle ?","options":["60e","65e","70e","75e"],"answer":"70e"}'),

('Interpréter une corrélation quasi-nulle', 3, 42000, 'r ≈ 0 signifie absence de relation linéaire, mais peut exister une relation non linéaire.',
 '{"type":"mcq","question":"Le coefficient de corrélation entre la taille d''un chaussure et la note en maths est r = 0,02. Que peut-on conclure ?","options":["Il y a une forte relation entre ces variables","La pointure prédit bien les notes","Il n''y a pratiquement pas de relation linéaire","La relation est quadratique"],"answer":"Il n''y a pratiquement pas de relation linéaire"}'),

('Tableau croisé : fréquences relatives conditionnelles', 3, 45000, 'Fréquence conditionnelle = nb dans cellule / total de la ligne ou colonne.',
 '{"type":"mcq","question":"60 filles ont été sondées, dont 24 préfèrent le soccer. Quelle est la fréquence relative conditionnelle des filles qui aiment le soccer ?","options":["24%","40%","60%","36%"],"answer":"40%"}'),

('Interpréter une boîte à moustaches : asymétrie', 3, 45000, 'Si la boîte est décalée vers la droite et les moustaches asymétriques, la distribution est asymétrique.',
 '{"type":"mcq","question":"Dans une boîte à moustaches, la moustache droite est beaucoup plus longue que la gauche. Qu''est-ce que cela indique ?","options":["Distribution symétrique","La médiane est élevée","Distribution asymétrique à droite","Absence de valeurs aberrantes"],"answer":"Distribution asymétrique à droite"}'),

('Calculer la variance (concept)', 3, 45000, 'Variance = moyenne des carrés des écarts. Données {2, 4, 6} : moyenne = 4, écarts = −2, 0, 2, carrés = 4,0,4, variance = 8/3 ≈ 2,67.',
 '{"type":"mcq","question":"Pour l''ensemble {2, 4, 6}, calculer la variance. Moyenne = 4, écarts² = 4, 0, 4. Variance = ?","options":["2","2,67","3","4"],"answer":"2,67"}'),

('Comparer des distributions par l''écart interquartile', 3, 42000, 'L''écart interquartile (EIQ) mesure la dispersion des 50% centraux des données.',
 '{"type":"mcq","question":"Distribution A : Q1=50, Q3=70. Distribution B : Q1=40, Q3=80. Quelle distribution a les données du milieu plus dispersées ?","options":["Distribution A","Distribution B","Elles sont pareilles","Impossible à dire sans la médiane"],"answer":"Distribution B"}'),

('Construire une droite de tendance', 3, 45000, 'La droite de tendance minimise la somme des carrés des résidus (méthode des moindres carrés).',
 '{"type":"mcq","question":"Quelle est l''utilité principale de la droite de tendance (régression linéaire) ?","options":["Calculer la médiane","Décrire la relation entre deux variables et faire des prédictions","Trouver le mode des données","Calculer l''étendue"],"answer":"Décrire la relation entre deux variables et faire des prédictions"}'),

('Échantillon représentatif : méthodes', 3, 42000, 'Échantillonnage aléatoire simple = chaque individu a la même probabilité d''être choisi.',
 '{"type":"mcq","question":"Pour un sondage représentatif d''une école, quelle méthode est la plus appropriée ?","options":["Interroger uniquement les amis du chercheur","Choisir aléatoirement les noms dans une liste complète des élèves","Interroger les premiers élèves arrivés","Interroger uniquement les élèves du cours d''informatique"],"answer":"Choisir aléatoirement les noms dans une liste complète des élèves"}'),

('Interpréter une droite de tendance décroissante', 3, 42000, 'Pente négative = relation inverse entre les deux variables.',
 '{"type":"mcq","question":"La droite de tendance est y = −3x + 90 (x = temps d''écran en h, y = note). Que peut-on conclure ?","options":["Plus on passe de temps sur les écrans, meilleures sont les notes","Il n''y a aucune relation","Plus on passe de temps sur les écrans, plus les notes baissent","La note de départ est −3"],"answer":"Plus on passe de temps sur les écrans, plus les notes baissent"}'),

('Taille de l''effet statistique', 3, 45000, 'Une différence statistiquement significative peut être petite en pratique si l''échantillon est très grand.',
 '{"type":"mcq","question":"Une étude avec 10 000 participants trouve une différence de 0,1 point entre deux groupes (significative statistiquement). Cette différence est-elle importante en pratique ?","options":["Oui, car elle est statistiquement significative","Pas nécessairement, une différence significative peut être très petite en pratique","Oui, car l''échantillon est grand","Non, car l''échantillon est trop petit"],"answer":"Pas nécessairement, une différence significative peut être très petite en pratique"}'),

('Reconstruction d''une distribution à partir d''un résumé', 3, 45000, 'À partir de : n=5, médiane=7, mode=5, étendue=10, min=2 → max=12. Possible : {2, 5, 5, 7, 12}.',
 '{"type":"mcq","question":"Un ensemble de 5 valeurs a : médiane=7, mode=5, étendue=10, minimum=2. Quelle valeur maximale est-elle possible ?","options":["10","12","14","17"],"answer":"12"}'),

('Données discrètes vs continues', 3, 40000, 'Données discrètes : valeurs entières countables. Continues : peuvent prendre toutes valeurs dans un intervalle.',
 '{"type":"mcq","question":"Laquelle de ces variables est une donnée continue ?","options":["Nombre de frères et sœurs","Note A, B, C, D, E","Taille en cm","Nombre d''absences"],"answer":"Taille en cm"}'),

('Simulation et données expérimentales', 3, 43000, 'Plus on effectue d''essais, plus les fréquences expérimentales se rapprochent des probabilités théoriques.',
 '{"type":"mcq","question":"On lance une pièce 10 fois et obtient 7 faces. Si on relance 1000 fois, que s''approchera-t-on davantage ?","options":["70% de faces","50% de faces","100% de faces","Impossible à prédire"],"answer":"50% de faces"}'),

('Interpréter un graphique de dispersion', 3, 42000, 'Un nuage de points dense autour d''une ligne droite indique une forte corrélation linéaire.',
 '{"type":"mcq","question":"Un graphique de dispersion montre des points très rapprochés d''une ligne droite montante. Cela indique...","options":["Une faible corrélation positive","Une forte corrélation positive","Une forte corrélation négative","Pas de corrélation"],"answer":"Une forte corrélation positive"}'),

('Analyse critique d''un sondage', 3, 45000, 'Un sondage en ligne auto-sélectif crée un biais : seules les personnes motivées répondent.',
 '{"type":"mcq","question":"Un sondage en ligne ouvert à tous recueille 500 réponses. Quel biais principal affecte ces résultats ?","options":["Biais de confirmation","Biais de sélection (seules les personnes motivées répondent)","Aucun biais","Biais de mesure"],"answer":"Biais de sélection (seules les personnes motivées répondent)"}'),

('Interprétation multicritère', 3, 45000, 'Choisir la mesure selon le contexte : moyenne pour données symétriques sans aberrants, médiane sinon.',
 '{"type":"mcq","question":"Salaires d''une entreprise : 5 employés à 30 000 $, 4 à 40 000 $, 1 PDG à 500 000 $. Quelle mesure reflète mieux le salaire typique ?","options":["La moyenne (≈ 87 000 $)","La médiane (35 000 $)","Le mode (30 000 $)","L''étendue (470 000 $)"],"answer":"La médiane (35 000 $)"}'),

('Comparer deux groupes avec plusieurs statistiques', 3, 45000, 'On compare groupes par plusieurs mesures pour avoir un portrait complet.',
 '{"type":"mcq","question":"Groupe A : moyenne=70, écart-type=15. Groupe B : moyenne=70, écart-type=5. Lequel est plus consistent ?","options":["Groupe A","Groupe B","Les deux sont équivalents","Impossible à dire"],"answer":"Groupe B"}'),

('Choisir le graphique approprié', 3, 40000, 'Pour montrer l''évolution dans le temps, un graphique à ligne brisée est le plus approprié.',
 '{"type":"mcq","question":"Vous voulez montrer l''évolution des températures sur 12 mois. Quel type de graphique est le plus approprié ?","options":["Diagramme circulaire","Diagramme à barres","Graphique à ligne brisée","Histogramme"],"answer":"Graphique à ligne brisée"}'),

('Validation d''une hypothèse par les données', 3, 45000, 'Les données peuvent soutenir ou infirmer une hypothèse, mais n''en apportent jamais la preuve absolue.',
 '{"type":"mcq","question":"Une hypothèse est que les élèves qui dorment plus ont de meilleures notes. Une étude sur 200 élèves montre une corrélation de r = 0,65. Que peut-on conclure ?","options":["L''hypothèse est prouvée","Les données sont compatibles avec l''hypothèse mais ne la prouvent pas","L''hypothèse est réfutée","r = 0,65 est trop faible pour conclure quoi que ce soit"],"answer":"Les données sont compatibles avec l''hypothèse mais ne la prouvent pas"}'),

('Interprétation d''un diagramme à points superposés', 3, 42000, 'Les points qui se superposent indiquent plusieurs observations de la même valeur.',
 '{"type":"mcq","question":"Dans un diagramme à points, trois points superposés à la valeur 85 signifient que...","options":["Une seule personne a obtenu 85","Trois personnes ont obtenu 85","85 est la valeur maximale","85 est la médiane"],"answer":"Trois personnes ont obtenu 85"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);

-- Supplément SEC1_MAT_probabilites : +81 questions (69 → 150)
-- PFEQ-MAT-SEC1-PROB

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-PROB') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (27 questions)
('Définition de la probabilité', 1, 18000, 'La probabilité d''un événement = nombre de cas favorables / nombre total de cas.',
 '{"type":"mcq","question":"Quelle formule calcule la probabilité d''un événement ?","options":["P = cas favorables + cas totaux","P = cas favorables / cas totaux","P = cas totaux / cas favorables","P = cas favorables × cas totaux"],"answer":"P = cas favorables / cas totaux"}'),

('Probabilité certaine et impossible', 1, 18000, 'P(certain) = 1. P(impossible) = 0. Toute probabilité est entre 0 et 1.',
 '{"type":"mcq","question":"Quelle est la probabilité d''un événement impossible ?","options":["0","1/2","1","−1"],"answer":"0"}'),

('Probabilité d''un dé équilibré', 1, 20000, 'Un dé a 6 faces. P(4) = 1/6.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir le 4 ?","options":["1/4","1/5","1/6","4/6"],"answer":"1/6"}'),

('Probabilité d''un événement composé (dé)', 1, 20000, 'Obtenir un nombre pair sur un dé : {2, 4, 6} → 3 cas sur 6 → P = 3/6 = 1/2.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un nombre pair ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/2"}'),

('Probabilité d''une pièce de monnaie', 1, 18000, 'Une pièce a 2 faces : pile ou face. P(pile) = 1/2.',
 '{"type":"mcq","question":"On lance une pièce de monnaie équilibrée. Quelle est la probabilité d''obtenir pile ?","options":["0","1/4","1/2","1"],"answer":"1/2"}'),

('Probabilité complémentaire', 1, 22000, 'P(contraire) = 1 − P(événement). P(pas 6) = 1 − 1/6 = 5/6.',
 '{"type":"mcq","question":"La probabilité de gagner est 1/4. Quelle est la probabilité de ne pas gagner ?","options":["1/4","1/2","3/4","1"],"answer":"3/4"}'),

('Tirer une carte d''une couleur', 1, 20000, 'Un jeu de 52 cartes a 13 cœurs. P(cœur) = 13/52 = 1/4.',
 '{"type":"mcq","question":"On tire une carte d''un jeu standard de 52 cartes. Quelle est la probabilité de tirer un cœur ?","options":["1/2","1/4","1/13","4/52"],"answer":"1/4"}'),

('Tirer une carte de valeur spécifique', 1, 20000, 'Il y a 4 as dans un jeu de 52 cartes. P(as) = 4/52 = 1/13.',
 '{"type":"mcq","question":"On tire une carte d''un jeu de 52 cartes. Quelle est la probabilité de tirer un As ?","options":["1/52","1/13","4/13","1/4"],"answer":"1/13"}'),

('Espace échantillon d''un dé', 1, 18000, 'L''espace échantillon est l''ensemble de tous les résultats possibles : {1, 2, 3, 4, 5, 6}.',
 '{"type":"mcq","question":"Quel est l''espace échantillon du lancer d''un dé à 6 faces ?","options":["{1, 2, 3}","{1, 2, 3, 4, 5, 6}","{pair, impair}","Infini"],"answer":"{1, 2, 3, 4, 5, 6}"}'),

('Probabilité d''obtenir moins que 4', 1, 20000, 'Valeurs < 4 sur un dé : {1, 2, 3} → 3 cas → P = 3/6 = 1/2.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un résultat inférieur à 4 ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/2"}'),

('Probabilité d''obtenir plus que 4', 1, 20000, 'Valeurs > 4 sur un dé : {5, 6} → 2 cas → P = 2/6 = 1/3.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un résultat supérieur à 4 ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/3"}'),

('Piger une bille d''une couleur', 1, 20000, '5 billes rouges + 3 bleues = 8 total. P(rouge) = 5/8.',
 '{"type":"mcq","question":"Un sac contient 5 billes rouges et 3 billes bleues. Quelle est la probabilité de piger une bille rouge ?","options":["3/8","5/3","5/8","1/2"],"answer":"5/8"}'),

('Exprimer une probabilité en pourcentage', 1, 20000, '1/4 = 0,25 = 25%.',
 '{"type":"mcq","question":"Une probabilité de 1/4 correspond à quel pourcentage ?","options":["10%","20%","25%","40%"],"answer":"25%"}'),

('Comparer des probabilités', 1, 20000, '1/3 ≈ 0,33 et 2/5 = 0,4. Donc 2/5 > 1/3.',
 '{"type":"mcq","question":"Quel événement est le plus probable : probabilité de 1/3 ou de 2/5 ?","options":["1/3","2/5","Ils sont égaux","Impossible à comparer"],"answer":"2/5"}'),

('Événements impossibles sur un dé', 1, 18000, 'P(obtenir 7 avec un dé à 6 faces) = 0 car 7 n''est pas possible.',
 '{"type":"mcq","question":"Quelle est la probabilité d''obtenir 7 en lançant un dé à 6 faces ?","options":["7/6","1/7","0","7"],"answer":"0"}'),

('Probabilité certaine', 1, 18000, 'P(obtenir ≤ 6 avec un dé à 6 faces) = 1 car tous les résultats sont ≤ 6.',
 '{"type":"mcq","question":"Quelle est la probabilité d''obtenir un nombre inférieur ou égal à 6 avec un dé à 6 faces ?","options":["1/6","1/2","5/6","1"],"answer":"1"}'),

('Lancer deux pièces : espace échantillon', 1, 22000, 'Lancer 2 pièces : {PP, PF, FP, FF} → 4 résultats.',
 '{"type":"mcq","question":"On lance 2 pièces de monnaie. Combien de résultats possibles y a-t-il ?","options":["2","3","4","6"],"answer":"4"}'),

('Probabilité : pile-pile avec 2 pièces', 1, 22000, 'P(PP) = 1/4 car il y a 4 résultats possibles et 1 cas favorable.',
 '{"type":"mcq","question":"On lance 2 pièces. Quelle est la probabilité d''obtenir deux piles ?","options":["1/2","1/3","1/4","1/8"],"answer":"1/4"}'),

('Probabilité : au moins une face', 1, 22000, 'Contraire de «au moins une face» = «aucune face» = PP. P(PP) = 1/4. P(au moins F) = 3/4.',
 '{"type":"mcq","question":"On lance 2 pièces. Quelle est la probabilité d''obtenir au moins une face ?","options":["1/4","1/2","3/4","1"],"answer":"3/4"}'),

('Probabilité fréquentielle', 1, 20000, 'Probabilité fréquentielle = nombre de succès / nombre total d''essais. 40/100 = 0,4.',
 '{"type":"mcq","question":"On lance un dé 100 fois et on obtient un 6 à 40 reprises. Quelle est la probabilité fréquentielle d''obtenir un 6 ?","options":["6/100","1/6","40/100","60/100"],"answer":"40/100"}'),

('Identifier un événement certain', 1, 18000, 'Un événement certain a une probabilité de 1.',
 '{"type":"mcq","question":"Quel est un exemple d''événement certain ?","options":["Obtenir un 7 avec un dé à 6 faces","Tirer un cœur rouge","Obtenir un nombre entre 1 et 6 avec un dé à 6 faces","Tirer un as noir"],"answer":"Obtenir un nombre entre 1 et 6 avec un dé à 6 faces"}'),

('Probabilité à partir d''une roue à secteurs', 1, 22000, 'Secteur rouge = 3/8 du cercle. P(rouge) = 3/8.',
 '{"type":"mcq","question":"Une roue divisée en 8 secteurs égaux a 3 secteurs rouges. Quelle est la probabilité d''atterrir sur rouge ?","options":["1/8","3/8","5/8","3/5"],"answer":"3/8"}'),

('Somme des probabilités d''événements mutuellement exclusifs', 1, 20000, 'Si les événements sont mutuellement exclusifs, la somme de leurs probabilités = P(A ou B).',
 '{"type":"mcq","question":"P(rouge) = 1/3 et P(bleu) = 1/4. Ces couleurs s''excluent mutuellement. Quelle est P(rouge ou bleu) ?","options":["1/12","7/12","1/3","3/4"],"answer":"7/12"}'),

('Sac de bonbons : probabilité simple', 1, 20000, 'Citron: 4, Fraise: 6, Chocolat: 5. Total = 15. P(fraise) = 6/15 = 2/5.',
 '{"type":"mcq","question":"Un sac contient 4 bonbons au citron, 6 à la fraise et 5 au chocolat. Quelle est la probabilité de piger un bonbon à la fraise ?","options":["6/15","6/11","2/5","1/3"],"answer":"2/5"}'),

('Probabilité et dénombrement', 1, 22000, 'P(impair) = {1,3,5} = 3 cas sur 6. P = 3/6 = 1/2.',
 '{"type":"mcq","question":"On lance un dé. Quelle est la probabilité d''obtenir un nombre impair ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/2"}'),

('Probabilité d''un multiple', 1, 22000, 'Multiples de 3 sur un dé à 6 faces : {3, 6} → 2 cas → P = 2/6 = 1/3.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un multiple de 3 ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/3"}'),

('Probabilité d''un nombre premier', 1, 22000, 'Nombres premiers sur un dé à 6 faces : {2, 3, 5} → 3 cas → P = 3/6 = 1/2.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un nombre premier ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/2"}'),

-- DIFFICULTÉ 2 (27 questions)
('Événements indépendants : multiplication', 2, 32000, 'P(A et B) = P(A) × P(B). P(pile) × P(face) = 1/2 × 1/2 = 1/4.',
 '{"type":"mcq","question":"On lance une pièce deux fois. Quelle est la probabilité d''obtenir pile puis face ?","options":["1/2","1/4","1/8","3/4"],"answer":"1/4"}'),

('Deux lancers de dés : somme spécifique', 2, 35000, 'P(somme=7) : cas favorables {(1,6),(2,5),(3,4),(4,3),(5,2),(6,1)} = 6/36 = 1/6.',
 '{"type":"mcq","question":"On lance deux dés. Quelle est la probabilité que la somme soit 7 ?","options":["1/12","1/8","1/6","7/36"],"answer":"1/6"}'),

('Deux lancers de dés : double', 2, 35000, 'Doubles : {(1,1),(2,2),(3,3),(4,4),(5,5),(6,6)} = 6/36 = 1/6.',
 '{"type":"mcq","question":"On lance deux dés. Quelle est la probabilité d''obtenir un double (même nombre sur les deux dés) ?","options":["1/12","1/6","1/3","6/12"],"answer":"1/6"}'),

('Probabilité conditionnelle : concept', 2, 35000, 'P(B|A) = P(A et B) / P(A). La condition restreint l''espace échantillon.',
 '{"type":"mcq","question":"P(A) = 0,4, P(A et B) = 0,12. Quelle est P(B|A) ?","options":["0,12","0,3","0,4","0,48"],"answer":"0,3"}'),

('Tirage sans remise : premier tirage', 2, 32000, 'Sac : 3 rouges + 7 bleues = 10 billes. P(rouge d''abord) = 3/10.',
 '{"type":"mcq","question":"Un sac contient 3 billes rouges et 7 billes bleues. On tire une bille. Quelle est la probabilité qu''elle soit rouge ?","options":["3/7","3/10","7/10","1/3"],"answer":"3/10"}'),

('Tirage sans remise : deuxième tirage', 2, 35000, 'Après avoir tiré rouge (sans remettre) : 2 rouges + 7 bleues = 9 billes. P(rouge) = 2/9.',
 '{"type":"mcq","question":"Un sac contient 3 rouges et 7 bleues. On tire une rouge sans la remettre. Quelle est la probabilité que la 2e bille soit rouge ?","options":["2/10","2/9","3/10","3/9"],"answer":"2/9"}'),

('Diagramme en arbre : deux étapes', 2, 35000, 'P(RR) = P(R₁) × P(R₂|R₁) = 3/10 × 2/9 = 6/90 = 1/15.',
 '{"type":"mcq","question":"Sac : 3 rouges, 7 bleues. On tire 2 billes sans remise. Quelle est la probabilité de tirer 2 rouges ?","options":["9/100","3/100","1/15","1/20"],"answer":"1/15"}'),

('Événements mutuellement exclusifs', 2, 30000, 'Deux événements mutuellement exclusifs ne peuvent pas se produire en même temps.',
 '{"type":"mcq","question":"On lance un dé. Les événements «obtenir 2» et «obtenir 5» sont-ils mutuellement exclusifs ?","options":["Oui, car on ne peut pas obtenir 2 et 5 en même temps","Non, car les deux sont des nombres","Oui, car les deux ont la même probabilité","Non, car 2 + 5 = 7"],"answer":"Oui, car on ne peut pas obtenir 2 et 5 en même temps"}'),

('Principe de multiplication du dénombrement', 2, 32000, 'Menus : 3 entrées × 4 plats × 2 desserts = 24 combinaisons.',
 '{"type":"mcq","question":"Un menu offre 3 entrées, 4 plats principaux et 2 desserts. Combien de repas différents peut-on composer ?","options":["9","18","24","36"],"answer":"24"}'),

('Permutations simples', 2, 35000, '3 personnes en ligne : 3 × 2 × 1 = 6 ordres possibles.',
 '{"type":"mcq","question":"De combien de façons peut-on placer 3 personnes différentes en ligne ?","options":["3","6","9","12"],"answer":"6"}'),

('Combinaisons : choisir 2 parmi 4', 2, 35000, 'C(4,2) = 4!/(2!×2!) = 6.',
 '{"type":"mcq","question":"On choisit 2 élèves parmi 4 pour un projet. De combien de façons peut-on faire ce choix ?","options":["4","6","8","12"],"answer":"6"}'),

('Probabilité et table de résultats', 2, 32000, 'Table 4×4 pour deux dés tétraédriques (1-4). Total = 16. Somme = 5 : {(1,4),(2,3),(3,2),(4,1)} = 4. P = 4/16 = 1/4.',
 '{"type":"mcq","question":"On lance deux dés à 4 faces (numérotés 1-4). Quelle est la probabilité que la somme soit 5 ?","options":["1/8","3/16","4/16","5/16"],"answer":"4/16"}'),

('Probabilité d''une union (formule)', 2, 35000, 'P(A ou B) = P(A) + P(B) − P(A et B) = 0,4 + 0,3 − 0,1 = 0,6.',
 '{"type":"mcq","question":"P(A) = 0,4, P(B) = 0,3, P(A et B) = 0,1. Quelle est P(A ou B) ?","options":["0,6","0,7","0,8","0,9"],"answer":"0,6"}'),

('Simulation en probabilité', 2, 32000, 'Une simulation est une expérience menée pour estimer des probabilités difficiles à calculer théoriquement.',
 '{"type":"mcq","question":"Pourquoi effectue-t-on des simulations en probabilité ?","options":["Pour remplacer les calculs","Pour estimer des probabilités d''événements complexes ou difficiles à calculer théoriquement","Pour trouver la probabilité exacte","Pour éviter le hasard"],"answer":"Pour estimer des probabilités d''événements complexes ou difficiles à calculer théoriquement"}'),

('Loi des grands nombres', 2, 32000, 'La fréquence relative se rapproche de la probabilité théorique quand le nombre d''essais augmente.',
 '{"type":"mcq","question":"On lance une pièce 10 fois et obtient 8 faces. Si on relance 10 000 fois, la fréquence de faces sera plus proche de...","options":["80%","50%","20%","100%"],"answer":"50%"}'),

('Probabilité théorique vs expérimentale', 2, 30000, 'Probabilité théorique calculée vs expérimentale observée. Elles peuvent différer mais convergent avec beaucoup d''essais.',
 '{"type":"mcq","question":"La probabilité théorique d''obtenir 6 avec un dé est 1/6. On le lance 30 fois et obtient 6 sept fois. Quel énoncé est vrai ?","options":["Le dé est biaisé","7/30 ≈ 1/6, ce qui est normal pour 30 essais","La probabilité théorique est fausse","On devrait toujours obtenir exactement 5 fois"],"answer":"7/30 ≈ 1/6, ce qui est normal pour 30 essais"}'),

('Probabilité conditionnelle avec tableau', 2, 35000, 'P(B|A) = 12/30 = 2/5. La condition A restreint à la ligne/colonne de A.',
 '{"type":"mcq","question":"Tableau : 30 garçons dont 12 aiment le soccer, 20 filles dont 8 aiment le soccer. P(aime soccer | est garçon) = ?","options":["12/50","12/30","20/50","8/20"],"answer":"12/30"}'),

('Dénombrement : arrangements avec répétition', 2, 32000, 'Mot de passe 4 chiffres (0-9, répétition permise) : 10⁴ = 10 000 possibilités.',
 '{"type":"mcq","question":"Un code PIN à 4 chiffres (0-9, répétition permise). Combien de codes différents existe-t-il ?","options":["40","400","4000","10 000"],"answer":"10 000"}'),

('Probabilité et génétique', 2, 35000, 'Croisement Bb × Bb : BB=1/4, Bb=2/4, bb=1/4. P(dominant=BB ou Bb) = 3/4.',
 '{"type":"mcq","question":"Dans un croisement Bb × Bb, quelle est la probabilité d''un descendant à phénotype dominant (BB ou Bb) ?","options":["1/4","1/2","3/4","1"],"answer":"3/4"}'),

('Diagramme de Venn et probabilité', 2, 35000, 'P(A et B) = 8/40 = 1/5. Le centre du diagramme de Venn.',
 '{"type":"mcq","question":"Dans un groupe de 40 élèves : 20 font du sport, 15 font de la musique, 8 font les deux. Quelle est la probabilité de faire les deux ?","options":["1/5","1/4","8/35","3/8"],"answer":"1/5"}'),

('Probabilité d''événements complémentaires enchaînés', 2, 35000, 'P(au moins un 6 en 2 lancers) = 1 − P(aucun 6) = 1 − (5/6)² = 1 − 25/36 = 11/36.',
 '{"type":"mcq","question":"On lance un dé deux fois. Quelle est la probabilité d''obtenir au moins un 6 ?","options":["1/36","11/36","12/36","1/3"],"answer":"11/36"}'),

('Tirage avec remise', 2, 32000, 'Avec remise : P(RR) = P(R) × P(R) = 3/10 × 3/10 = 9/100.',
 '{"type":"mcq","question":"Sac : 3 rouges, 7 bleues. On tire avec remise. Quelle est la probabilité de tirer 2 rouges ?","options":["3/45","6/90","9/100","3/10"],"answer":"9/100"}'),

('Comparer tirage avec et sans remise', 2, 32000, 'Avec remise : indépendant. Sans remise : dépendant, probabilités changent.',
 '{"type":"mcq","question":"Quelle différence y a-t-il entre un tirage avec remise et sans remise ?","options":["Aucune différence","Avec remise : événements indépendants. Sans remise : dépendants","Sans remise : événements indépendants. Avec remise : dépendants","Seule la probabilité finale change"],"answer":"Avec remise : événements indépendants. Sans remise : dépendants"}'),

('Événements indépendants vs dépendants', 2, 32000, 'Deux événements sont indépendants si le résultat d''un n''influence pas l''autre.',
 '{"type":"mcq","question":"Lancer un dé et tirer une carte d''un jeu. Ces événements sont-ils indépendants ?","options":["Non, le dé influence la carte","Oui, le résultat du dé n''influence pas celui de la carte","Non, ils utilisent le même espace échantillon","Oui, mais seulement si le dé a 4 faces"],"answer":"Oui, le résultat du dé n''influence pas celui de la carte"}'),

('Fréquence attendue', 2, 32000, 'Fréquence attendue = probabilité × nombre d''essais. 1/6 × 120 = 20.',
 '{"type":"mcq","question":"On lance un dé 120 fois. Combien de fois s''attend-on à obtenir un 5 ?","options":["5","10","20","30"],"answer":"20"}'),

('Probabilité avec dés colorés', 2, 32000, 'Dé rouge : 1-3 vert, 4-6 rouge. P(vert) = 3/6 = 1/2. Dé bleu : idem. P(vert et vert) = 1/4.',
 '{"type":"mcq","question":"Chaque dé à 6 faces a 3 faces vertes et 3 faces rouges. On lance 2 dés. P(2 faces vertes) ?","options":["1/2","1/4","1/6","1/3"],"answer":"1/4"}'),

('Trouver la probabilité complémentaire complexe', 2, 35000, 'P(au moins 1 garçon dans 3 enfants) = 1 − P(aucun garçon) = 1 − (1/2)³ = 7/8.',
 '{"type":"mcq","question":"Une famille a 3 enfants. Quelle est la probabilité qu''il y ait au moins 1 garçon ? (P garçon = 1/2)","options":["1/2","3/4","7/8","1/8"],"answer":"7/8"}'),

-- DIFFICULTÉ 3 (27 questions)
('Probabilité conditionnelle formelle', 3, 45000, 'P(A|B) = P(A et B) / P(B) = 0,15 / 0,3 = 0,5.',
 '{"type":"mcq","question":"P(B) = 0,3 et P(A et B) = 0,15. Quelle est P(A|B) ?","options":["0,15","0,30","0,45","0,50"],"answer":"0,50"}'),

('Théorème de Bayes : application simple', 3, 45000, 'P(test+|malade) = 0,9. P(malade) = 0,01. P(test+) = 0,01×0,9 + 0,99×0,1 = 0,108. P(malade|test+) = 0,009/0,108 ≈ 0,083.',
 '{"type":"mcq","question":"Un test médical détecte correctement la maladie 90% du temps. La maladie touche 1% de la population. 10% des personnes saines testent positif. Un résultat positif signifie-t-il nécessairement être malade ?","options":["Oui, à 90%","Non, la probabilité d''être malade avec test positif est bien inférieure à 90%","Oui, à 99%","Oui, à 100%"],"answer":"Non, la probabilité d''être malade avec test positif est bien inférieure à 90%"}'),

('Permutations avec objets identiques', 3, 45000, 'Mot MISSISSIPPI : 11!/(4!4!2!) arrangements.',
 '{"type":"mcq","question":"De combien de façons peut-on arranger les lettres du mot «MAMAN» ?","options":["5!","5!/2!","5!/2!×2!","5!/2!×3!"],"answer":"5!/2!×2!"}'),

('Combinaisons : choisir 3 parmi 6', 3, 45000, 'C(6,3) = 6!/(3!×3!) = 720/(6×6) = 20.',
 '{"type":"mcq","question":"On choisit 3 représentants parmi 6 candidats. De combien de façons peut-on faire ce choix ?","options":["18","20","30","120"],"answer":"20"}'),

('Probabilité avec combinaisons', 3, 45000, 'Choisir 2 cartes parmi 52. P(2 as) = C(4,2)/C(52,2) = 6/1326 = 1/221.',
 '{"type":"mcq","question":"On tire 2 cartes d''un jeu de 52. Quelle est la probabilité de tirer exactement 2 as ? C(4,2)=6, C(52,2)=1326.","options":["1/169","1/221","4/52","1/338"],"answer":"1/221"}'),

('Espace échantillon d''événements successifs', 3, 42000, 'Lancer d''un dé puis d''une pièce : 6 × 2 = 12 résultats possibles.',
 '{"type":"mcq","question":"On lance un dé à 6 faces puis une pièce de monnaie. Combien y a-t-il de résultats possibles ?","options":["8","10","12","14"],"answer":"12"}'),

('Probabilité de l''union avec intersection', 3, 45000, 'P(A∪B) = P(A)+P(B)−P(A∩B) = 0,5+0,4−0,2 = 0,7.',
 '{"type":"mcq","question":"P(A) = 0,5, P(B) = 0,4, P(A et B) = 0,2. Quelle est P(A ou B) ?","options":["0,5","0,7","0,9","1,1"],"answer":"0,7"}'),

('Probabilité enchaînée sans remise à 3 tirages', 3, 45000, 'Sac : 4 rouges, 6 bleues. P(RRR sans remise) = 4/10 × 3/9 × 2/8 = 24/720 = 1/30.',
 '{"type":"mcq","question":"Sac : 4 rouges, 6 bleues. On tire 3 sans remise. P(3 rouges) ?","options":["1/30","1/25","4/30","1/15"],"answer":"1/30"}'),

('Dénombrement : arrangements de couleurs', 3, 45000, '5 personnes dans 5 sièges : 5! = 120 arrangements.',
 '{"type":"mcq","question":"De combien de façons différentes peut-on asseoir 5 personnes sur 5 chaises en ligne ?","options":["25","60","100","120"],"answer":"120"}'),

('Probabilité d''une main de cartes', 3, 45000, 'Choisir 5 cartes parmi 52. P(toutes rouges) = C(26,5)/C(52,5).',
 '{"type":"mcq","question":"Si on tire 5 cartes d''un jeu de 52, la probabilité d''obtenir 5 cartes rouges est de C(26,5)/C(52,5). C(26,5)=65780, C(52,5)=2598960. Approx =","options":["2,5%","3,6%","4,5%","6,7%"],"answer":"2,5%"}'),

('Espérance mathématique : concept', 3, 45000, 'Espérance = Σ(valeur × probabilité). Jeu: +3$ (P=1/3) ou −1$ (P=2/3). E = 3(1/3) + (−1)(2/3) = 1−2/3 = 1/3.',
 '{"type":"mcq","question":"Un jeu offre +3 $ avec probabilité 1/3 ou −1 $ avec probabilité 2/3. Quelle est l''espérance de gain ?","options":["1 $","1/3 $","−1/3 $","0 $"],"answer":"1/3 $"}'),

('Jeu équitable', 3, 45000, 'Un jeu est équitable si l''espérance de gain est 0.',
 '{"type":"mcq","question":"Quand dit-on qu''un jeu est «équitable» ?","options":["Quand les deux joueurs ont les mêmes règles","Quand l''espérance de gain est 0 pour tous les joueurs","Quand chaque joueur a les mêmes probabilités de gagner","Quand le jeu dure un temps égal pour tous"],"answer":"Quand l''espérance de gain est 0 pour tous les joueurs"}'),

('Simulation : nombre d''essais nécessaires', 3, 42000, 'Plus d''essais = résultats plus proches de la probabilité théorique (loi des grands nombres).',
 '{"type":"mcq","question":"Une simulation de 100 essais donne P(succès) = 0,45. Une autre de 10 000 essais donne 0,52. Si P théorique = 0,5, laquelle est plus fiable ?","options":["100 essais","10 000 essais","Les deux sont équivalents","Aucune n''est fiable"],"answer":"10 000 essais"}'),

('Probabilité d''exactement k succès sur n essais', 3, 45000, 'Loi binomiale: P(X=2 sur 3) = C(3,2) × (1/2)² × (1/2)¹ = 3 × 1/4 × 1/2 = 3/8.',
 '{"type":"mcq","question":"On lance une pièce 3 fois. Quelle est la probabilité d''obtenir exactement 2 faces ?","options":["1/4","3/8","1/2","3/4"],"answer":"3/8"}'),

('Probabilité d''au moins k succès', 3, 45000, 'P(≥1 face en 3 lancers) = 1 − P(0 face) = 1 − (1/2)³ = 7/8.',
 '{"type":"mcq","question":"On lance une pièce 3 fois. P(au moins 1 face) = ?","options":["1/2","3/4","7/8","1"],"answer":"7/8"}'),

('Modèle des urnes (problème classique)', 3, 45000, 'Urne A : 3R, 2B. Urne B : 1R, 4B. On choisit urne A avec P=1/2. P(rouge) = 1/2×3/5 + 1/2×1/5 = 3/10+1/10 = 2/5.',
 '{"type":"mcq","question":"Urne A : 3 rouges, 2 bleues. Urne B : 1 rouge, 4 bleues. On choisit une urne au hasard (P=1/2 chacune) et on tire une bille. P(bille rouge) ?","options":["1/5","2/5","3/5","4/10"],"answer":"2/5"}'),

('Problème de l''anniversaire (concept)', 3, 45000, 'Dans un groupe de 23 personnes, P(2 ont même anniversaire) > 50%. Ce résultat contre-intuitif s''explique par le nombre de paires.',
 '{"type":"mcq","question":"Dans un groupe de 23 personnes, la probabilité que 2 aient le même anniversaire est d''environ 50%. Ce résultat est-il surprenant ?","options":["Non, c''est évident","Oui, on s''attendrait à un groupe bien plus grand","Non, car 23 > 365/2","Oui, il faudrait 183 personnes pour atteindre 50%"],"answer":"Oui, on s''attendrait à un groupe bien plus grand"}'),

('Distribution binomiale : paramètres', 3, 42000, 'La loi binomiale B(n,p) modélise le nombre de succès dans n essais indépendants avec probabilité de succès p.',
 '{"type":"mcq","question":"Quelle condition DOIT être respectée pour utiliser la loi binomiale ?","options":["Les essais sont dépendants","Les probabilités de succès varient","Les essais sont indépendants avec P(succès) constante","Il doit y avoir exactement 2 succès"],"answer":"Les essais sont indépendants avec P(succès) constante"}'),

('Paradoxe de Monty Hall (concept)', 3, 45000, 'Monty Hall : changer de porte double la probabilité de gagner (2/3 vs 1/3).',
 '{"type":"mcq","question":"Dans le problème de Monty Hall, après que l''animateur a ouvert une mauvaise porte, vaut-il mieux changer de porte ?","options":["Non, 50/50","Oui, P(gagner en changeant) = 2/3","Non, P(gagner en changeant) = 1/3","Peu importe, les deux sont 1/3"],"answer":"Oui, P(gagner en changeant) = 2/3"}'),

('Probabilité avec contrainte', 3, 45000, '5 filles, 3 garçons. Choisir 2 : C(8,2)=28. Exactement 1 fille : C(5,1)×C(3,1)=15. P = 15/28.',
 '{"type":"mcq","question":"Un comité de 2 élèves est choisi parmi 5 filles et 3 garçons. P(exactement 1 fille) = C(5,1)×C(3,1)/C(8,2) = 15/28 ≈","options":["0,25","0,42","0,54","0,64"],"answer":"0,54"}'),

('Espérance et prise de décision', 3, 45000, 'Option A : E = 1000×0,5 + 0×0,5 = 500$. Option B : 400$ certains. Option B est «moins risquée» même si E(A) > E(B).',
 '{"type":"mcq","question":"Option A : gagner 1000 $ avec P=0,5 ou rien. Option B : gagner 400 $ avec certitude. L''espérance de A est 500 $. Un individu «averse au risque» préfèrera...","options":["Option A car espérance plus haute","Option B car gain certain","Option A car 1000 $ est attractif","Les deux sont équivalents"],"answer":"Option B car gain certain"}'),

('Probabilité géométrique', 3, 45000, 'Une cible de 1m² dans un mur de 10m². P(toucher cible) = 1/10.',
 '{"type":"mcq","question":"Une fléchette est lancée au hasard sur un mur de 10 m². Ce mur contient une cible de 1 m². Quelle est la probabilité de toucher la cible ?","options":["1/10","1/100","10%","Les deux premières réponses"],"answer":"Les deux premières réponses"}'),

('Probabilité dans un graphe de réseau', 3, 45000, 'Route A: 2 chemins directs, B: 3 chemins. Total = 5. P(route A) = 2/5.',
 '{"type":"mcq","question":"Pour aller de X à Y, il y a 2 routes passant par A et 3 routes passant par B. Si on choisit une route au hasard, P(passer par A) = ?","options":["1/5","2/5","1/3","1/2"],"answer":"2/5"}'),

('Probabilité et diagramme de Venn à 3 cercles', 3, 45000, 'P(A seul) = P(A) − P(A∩B) − P(A∩C) + P(A∩B∩C).',
 '{"type":"mcq","question":"Dans un diagramme de Venn : P(A)=0,5, P(B)=0,3, P(A∩B)=0,1. P(A seulement, sans B) = ?","options":["0,2","0,4","0,5","0,6"],"answer":"0,4"}'),

('Modèle probabiliste de la qualité', 3, 45000, 'P(défectueux) = 0,02. P(2 défectueux sur 3) = C(3,2)×(0,02)²×(0,98) ≈ 0,00118.',
 '{"type":"mcq","question":"Une usine produit des articles avec 2% de défauts. Sur 3 articles choisis, P(exactement 2 défectueux) ≈","options":["0,0012","0,02","0,04","0,12"],"answer":"0,0012"}'),

('Probabilité et paradoxe de Simpson', 3, 45000, 'Le paradoxe de Simpson : une tendance visible dans des sous-groupes peut s''inverser quand les groupes sont combinés.',
 '{"type":"mcq","question":"Le paradoxe de Simpson décrit une situation où...","options":["La probabilité dépasse 1","Une tendance dans des sous-groupes s''inverse quand on combine les données","La loi des grands nombres ne s''applique pas","Deux événements indépendants semblent liés"],"answer":"Une tendance dans des sous-groupes s''inverse quand on combine les données"}'),

('Probabilité d''un chemin dans une grille', 3, 45000, 'Grille 2×2, bouger droite/haut aléatoirement. Chemin de (0,0) à (2,2) : 4 mouvements, 2 droites, 2 hauts. C(4,2)=6 chemins.',
 '{"type":"mcq","question":"Une fourmi marche aléatoirement sur une grille 2×2 de (0,0) à (2,2) en ne faisant que des pas droite ou haut. Combien de chemins différents peut-elle prendre ?","options":["4","6","8","12"],"answer":"6"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);

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

-- Supplément SEC1_FRA_conjugaison : +79 questions (71 → 150)
-- PFEQ-FRA-SEC1-CONJ

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-CONJ') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- DIFFICULTÉ 1 (26 questions)
('Présent de l''indicatif : être', 1, 18000, 'Conjugaison de «être» au présent : je suis, tu es, il est, nous sommes, vous êtes, ils sont.',
 '{"type":"mcq","question":"Quelle est la forme correcte de «être» à la 2e personne du singulier, présent ?","options":["suis","es","est","êtes"],"answer":"es"}'),

('Présent de l''indicatif : avoir', 1, 18000, 'Conjugaison de «avoir» au présent : j''ai, tu as, il a, nous avons, vous avez, ils ont.',
 '{"type":"mcq","question":"Quelle est la forme correcte de «avoir» à la 3e personne du pluriel, présent ?","options":["avons","avez","ont","as"],"answer":"ont"}'),

('Présent : verbe du 1er groupe en -er', 1, 18000, 'Terminaisons du 1er groupe au présent : -e, -es, -e, -ons, -ez, -ent.',
 '{"type":"mcq","question":"Conjugue «chanter» à la 3e personne du pluriel, présent.","options":["chante","chantez","chantent","chantons"],"answer":"chantent"}'),

('Présent : verbe du 2e groupe en -ir', 1, 18000, 'Terminaisons du 2e groupe au présent : -is, -is, -it, -issons, -issez, -issent.',
 '{"type":"mcq","question":"Conjugue «finir» à la 3e personne du singulier, présent.","options":["finis","finit","finissons","finissent"],"answer":"finit"}'),

('Présent : verbe «aller»', 1, 20000, '«Aller» est irrégulier : je vais, tu vas, il va, nous allons, vous allez, ils vont.',
 '{"type":"mcq","question":"Conjugue «aller» à la 1re personne du singulier, présent.","options":["alle","vas","vais","aille"],"answer":"vais"}'),

('Présent : verbe «faire»', 1, 20000, '«Faire» est irrégulier : je fais, tu fais, il fait, nous faisons, vous faites, ils font.',
 '{"type":"mcq","question":"Conjugue «faire» à la 2e personne du pluriel, présent.","options":["faisez","faites","faisons","font"],"answer":"faites"}'),

('Présent : verbe «prendre»', 1, 20000, '«Prendre» : je prends, tu prends, il prend, nous prenons, vous prenez, ils prennent.',
 '{"type":"mcq","question":"Conjugue «prendre» à la 3e personne du pluriel, présent.","options":["prennent","prends","prend","prenons"],"answer":"prennent"}'),

('Imparfait : terminaisons', 1, 20000, 'Terminaisons de l''imparfait : -ais, -ais, -ait, -ions, -iez, -aient.',
 '{"type":"mcq","question":"Quelle est la terminaison de l''imparfait à la 1re personne du pluriel ?","options":["-ais","-ait","-ions","-iez"],"answer":"-ions"}'),

('Imparfait : verbe «parler»', 1, 20000, 'Imparfait de «parler» : je parlais, tu parlais, il parlait, nous parlions, vous parliez, ils parlaient.',
 '{"type":"mcq","question":"Conjugue «parler» à la 3e personne du singulier, imparfait.","options":["parle","parlait","parlera","parlait"],"answer":"parlait"}'),

('Imparfait : verbe «être»', 1, 20000, 'Imparfait de «être» : j''étais, tu étais, il était, nous étions, vous étiez, ils étaient.',
 '{"type":"mcq","question":"Conjugue «être» à la 1re personne du singulier, imparfait.","options":["suis","serai","étais","étions"],"answer":"étais"}'),

('Futur simple : terminaisons', 1, 20000, 'Terminaisons du futur : -rai, -ras, -ra, -rons, -rez, -ront.',
 '{"type":"mcq","question":"Quelle est la terminaison du futur simple à la 3e personne du pluriel ?","options":["-rai","-ra","-rons","-ront"],"answer":"-ront"}'),

('Futur simple : verbe du 1er groupe', 1, 20000, 'Futur du 1er groupe = infinitif + terminaisons. Parler : je parlerai.',
 '{"type":"mcq","question":"Conjugue «travailler» à la 1re personne du singulier, futur simple.","options":["travaille","travaillais","travaillerai","travaillera"],"answer":"travaillerai"}'),

('Futur simple : verbe «venir»', 1, 22000, '«Venir» est irrégulier au futur : je viendrai, tu viendras, il viendra...',
 '{"type":"mcq","question":"Conjugue «venir» à la 3e personne du singulier, futur simple.","options":["vient","venait","viendra","viendr"],"answer":"viendra"}'),

('Futur simple : verbe «avoir»', 1, 22000, 'Futur de «avoir» : j''aurai, tu auras, il aura, nous aurons, vous aurez, ils auront.',
 '{"type":"mcq","question":"Conjugue «avoir» à la 2e personne du pluriel, futur simple.","options":["avez","aviez","aurez","aurons"],"answer":"aurez"}'),

('Passé composé : formation', 1, 22000, 'Passé composé = auxiliaire (avoir/être) au présent + participe passé.',
 '{"type":"mcq","question":"Quelle est la bonne formation du passé composé ?","options":["infinitif + -é","imparfait + participe passé","avoir/être au présent + participe passé","futur + participe passé"],"answer":"avoir/être au présent + participe passé"}'),

('Passé composé avec avoir : manger', 1, 22000, 'Passé composé de «manger» : j''ai mangé (auxiliaire avoir + p.p. mangé).',
 '{"type":"mcq","question":"Conjugue «manger» à la 3e personne du singulier, passé composé.","options":["il mangea","il a mangé","il avait mangé","il mange"],"answer":"il a mangé"}'),

('Passé composé avec être : partir', 1, 22000, 'Passé composé de «partir» avec être : je suis parti(e).',
 '{"type":"mcq","question":"Conjugue «partir» à la 1re personne du singulier (masculin), passé composé.","options":["j''ai parti","je suis partis","je suis parti","j''étais parti"],"answer":"je suis parti"}'),

('Verbes conjugués avec être au passé composé', 1, 20000, 'Verbes avec être au p.c. : aller, venir, partir, arriver, naître, mourir, rester, retourner...',
 '{"type":"mcq","question":"Lequel de ces verbes se conjugue avec «être» au passé composé ?","options":["manger","écrire","arriver","lire"],"answer":"arriver"}'),

('Impératif présent : 2e personne du singulier', 1, 20000, 'Impératif présent des verbes en -er : pas de «s» à la 2e personne du singulier. «Chante !» (pas «Chantes !»).',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif (2e personne du singulier) de «écouter» ?","options":["Écoutes !","Écoute !","Écoutes-toi !","Écoutez !"],"answer":"Écoute !"}'),

('Impératif présent : 1re personne du pluriel', 1, 20000, 'Impératif 1re personne du pluriel : terminaison -ons.',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif (1re pers. du pluriel) de «finir» ?","options":["Finissons !","Finissez !","Finissent !","Finissons-nous !"],"answer":"Finissons !"}'),

('Choisir l''auxiliaire : être ou avoir', 1, 22000, 'Les verbes pronominaux et certains verbes de mouvement prennent être. Les autres prennent avoir.',
 '{"type":"mcq","question":"Quel auxiliaire prend «tomber» au passé composé ?","options":["avoir","être","les deux","aucun"],"answer":"être"}'),

('Présent : verbe «pouvoir»', 1, 22000, '«Pouvoir» : je peux, tu peux, il peut, nous pouvons, vous pouvez, ils peuvent.',
 '{"type":"mcq","question":"Conjugue «pouvoir» à la 3e personne du singulier, présent.","options":["peut","peux","pouvons","peuvent"],"answer":"peut"}'),

('Présent : verbe «vouloir»', 1, 22000, '«Vouloir» : je veux, tu veux, il veut, nous voulons, vous voulez, ils veulent.',
 '{"type":"mcq","question":"Conjugue «vouloir» à la 3e personne du pluriel, présent.","options":["voulons","voulez","veulent","veut"],"answer":"veulent"}'),

('Présent : verbe «savoir»', 1, 22000, '«Savoir» : je sais, tu sais, il sait, nous savons, vous savez, ils savent.',
 '{"type":"mcq","question":"Conjugue «savoir» à la 1re personne du singulier, présent.","options":["savons","savent","sais","sait"],"answer":"sais"}'),

('Temps de base : passé, présent, futur', 1, 18000, 'Présent = maintenant. Imparfait/p.c. = passé. Futur = plus tard.',
 '{"type":"mcq","question":"Le verbe «jouait» est à quel temps ?","options":["Présent","Futur","Imparfait","Passé composé"],"answer":"Imparfait"}'),

('Reconnaître le passé composé', 1, 18000, 'Le passé composé est formé de l''auxiliaire au présent + participe passé.',
 '{"type":"mcq","question":"Quelle phrase est au passé composé ?","options":["Il chantait.","Il chantera.","Il a chanté.","Il chante."],"answer":"Il a chanté."}'),

-- DIFFICULTÉ 2 (27 questions)
('Plus-que-parfait : formation', 2, 30000, 'Plus-que-parfait = auxiliaire à l''imparfait + participe passé. «J''avais mangé.»',
 '{"type":"mcq","question":"Quelle est la formation du plus-que-parfait ?","options":["avoir/être au futur + p.p.","avoir/être au présent + p.p.","avoir/être à l''imparfait + p.p.","avoir/être au passé simple + p.p."],"answer":"avoir/être à l''imparfait + p.p."}'),

('Plus-que-parfait : verbe «dormir»', 2, 30000, 'P.-q.-p. de «dormir» : j''avais dormi, tu avais dormi, il avait dormi...',
 '{"type":"mcq","question":"Conjugue «dormir» à la 3e personne du singulier, plus-que-parfait.","options":["il avait dormi","il avait dormit","il avait dormi","il aura dormi"],"answer":"il avait dormi"}'),

('Futur antérieur : formation', 2, 30000, 'Futur antérieur = auxiliaire au futur + participe passé. «J''aurai fini.»',
 '{"type":"mcq","question":"Quelle est la formation du futur antérieur ?","options":["avoir/être au présent + p.p.","avoir/être au futur simple + p.p.","avoir/être à l''imparfait + p.p.","avoir/être au passé composé + p.p."],"answer":"avoir/être au futur simple + p.p."}'),

('Futur antérieur : exemple', 2, 30000, 'Futur antérieur de «manger» : j''aurai mangé.',
 '{"type":"mcq","question":"Quelle phrase illustre correctement le futur antérieur ?","options":["J''ai mangé avant.","J''aurai mangé avant qu''il arrive.","Je mangerai avant.","J''avais mangé avant."],"answer":"J''aurai mangé avant qu''il arrive."}'),

('Conditionnel présent : formation', 2, 32000, 'Conditionnel présent = infinitif + terminaisons : -rais, -rais, -rait, -rions, -riez, -raient.',
 '{"type":"mcq","question":"Quelle est la terminaison du conditionnel présent à la 3e personne du singulier ?","options":["-rait","-rais","-rons","-raient"],"answer":"-rait"}'),

('Conditionnel présent : verbe «aller»', 2, 32000, 'Conditionnel de «aller» : j''irais, tu irais, il irait, nous irions, vous iriez, ils iraient.',
 '{"type":"mcq","question":"Conjugue «aller» à la 1re personne du singulier, conditionnel présent.","options":["j''alerais","j''allais","j''irais","je vais"],"answer":"j''irais"}'),

('Conditionnel passé : formation', 2, 32000, 'Conditionnel passé = auxiliaire au conditionnel + participe passé. «J''aurais mangé.»',
 '{"type":"mcq","question":"Conjugue «partir» à la 3e personne du singulier, conditionnel passé.","options":["il partirait","il est parti","il serait parti","il sera parti"],"answer":"il serait parti"}'),

('Subjonctif présent : concept', 2, 32000, 'Le subjonctif exprime le doute, la volonté, la nécessité. «Il faut que tu viennes.»',
 '{"type":"mcq","question":"Dans quelle phrase le verbe est-il au subjonctif ?","options":["Je viens demain.","Il faut que je vienne.","Je venais souvent.","Je suis venu hier."],"answer":"Il faut que je vienne."}'),

('Subjonctif présent : terminaisons', 2, 32000, 'Terminaisons du subjonctif présent : -e, -es, -e, -ions, -iez, -ent.',
 '{"type":"mcq","question":"Quelle est la terminaison du subjonctif à la 1re personne du pluriel ?","options":["-ons","-ions","-iez","-ent"],"answer":"-ions"}'),

('Subjonctif : verbe «avoir»', 2, 32000, 'Subjonctif de «avoir» : que j''aie, que tu aies, qu''il ait, que nous ayons, que vous ayez, qu''ils aient.',
 '{"type":"mcq","question":"Conjugue «avoir» au subjonctif, 3e personne du singulier.","options":["ait","a","aie","ayons"],"answer":"ait"}'),

('Subjonctif : verbe «être»', 2, 32000, 'Subjonctif de «être» : que je sois, que tu sois, qu''il soit, que nous soyons, que vous soyez, qu''ils soient.',
 '{"type":"mcq","question":"Conjugue «être» au subjonctif, 3e personne du pluriel.","options":["sont","étaient","soient","seraient"],"answer":"soient"}'),

('Distinguer imparfait et passé composé', 2, 30000, 'Imparfait = action continue/habituelle au passé. P.c. = action ponctuelle/achevée au passé.',
 '{"type":"mcq","question":"Quelle phrase exprime une action habituelle dans le passé ?","options":["Il est tombé.","Il tombait souvent.","Il tombe.","Il tombera."],"answer":"Il tombait souvent."}'),

('Temps des verbes et contexte narratif', 2, 30000, 'Dans un récit, l''imparfait décrit le contexte et le passé composé raconte les événements.',
 '{"type":"mcq","question":"Dans «Il pleuvait quand elle est arrivée», quel temps décrit le contexte ?","options":["«est arrivée» (passé composé)","«pleuvait» (imparfait)","Les deux décrivent le contexte","Ni l''un ni l''autre"],"answer":"«pleuvait» (imparfait)"}'),

('Passé simple : forme', 2, 32000, 'Passé simple du 1er groupe : -ai, -as, -a, -âmes, -âtes, -èrent.',
 '{"type":"mcq","question":"Conjugue «chanter» à la 3e personne du singulier, passé simple.","options":["chantait","a chanté","chanta","chanterait"],"answer":"chanta"}'),

('Passé simple : verbe «venir»', 2, 32000, 'Passé simple de «venir» : je vins, tu vins, il vint, nous vînmes, vous vîntes, ils vinrent.',
 '{"type":"mcq","question":"Conjugue «venir» à la 3e personne du singulier, passé simple.","options":["venait","vint","venu","est venu"],"answer":"vint"}'),

('Futur simple : verbe «être»', 2, 28000, 'Futur de «être» : je serai, tu seras, il sera, nous serons, vous serez, ils seront.',
 '{"type":"mcq","question":"Conjugue «être» à la 3e personne du pluriel, futur simple.","options":["sont","étaient","seront","soient"],"answer":"seront"}'),

('Imparfait : verbe «avoir»', 2, 28000, 'Imparfait de «avoir» : j''avais, tu avais, il avait, nous avions, vous aviez, ils avaient.',
 '{"type":"mcq","question":"Conjugue «avoir» à la 2e personne du pluriel, imparfait.","options":["avez","aurez","aviez","ayez"],"answer":"aviez"}'),

('Verbe pronominal : se laver', 2, 30000, 'Les verbes pronominaux se conjuguent avec un pronom réfléchi : me, te, se, nous, vous, se.',
 '{"type":"mcq","question":"Conjugue «se laver» à la 3e personne du singulier, présent.","options":["il lave","il se lave","il se laves","il se lavait"],"answer":"il se lave"}'),

('Verbe pronominal au passé composé', 2, 32000, 'Les verbes pronominaux se conjuguent avec être au p.c. «Elle s''est lavée.»',
 '{"type":"mcq","question":"Conjugue «se lever» à la 3e personne du singulier (féminin), passé composé.","options":["elle a levé","elle s''est levée","elle s''est levé","elle était levée"],"answer":"elle s''est levée"}'),

('Impératif des verbes pronominaux', 2, 30000, 'Impératif des verbes pronominaux : «Lève-toi !», «Levons-nous !», «Levez-vous !»',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif (2e pers. sing.) de «se dépêcher» ?","options":["Dépêche !","Te dépêche !","Dépêche-toi !","Dépêches-toi !"],"answer":"Dépêche-toi !"}'),

('Présent du subjonctif après «il faut que»', 2, 30000, '«Il faut que» est toujours suivi du subjonctif.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Il faut que tu ___ ce livre.»","options":["lisas","lis","lises","lise"],"answer":"lise"}'),

('Concordance des temps : si + présent', 2, 32000, 'Avec «si» de condition : si + présent, futur. «Si tu viens, je serai là.»',
 '{"type":"mcq","question":"Quelle phrase respecte la concordance des temps ?","options":["Si tu viendras, je serai là.","Si tu viens, je serai là.","Si tu venais, je serai là.","Si tu es venu, je serai là."],"answer":"Si tu viens, je serai là."}'),

('Concordance des temps : si + imparfait', 2, 32000, 'Condition au passé : si + imparfait, conditionnel présent. «Si j''avais le temps, j''irais.»',
 '{"type":"mcq","question":"Quelle phrase respecte la concordance des temps ?","options":["Si j''aurais le temps, j''irais.","Si j''avais le temps, j''irais.","Si j''ai le temps, j''irais.","Si j''eus le temps, j''irai."],"answer":"Si j''avais le temps, j''irais."}'),

('Futur simple : verbe «faire»', 2, 28000, 'Futur de «faire» : je ferai, tu feras, il fera, nous ferons, vous ferez, ils feront.',
 '{"type":"mcq","question":"Conjugue «faire» à la 1re personne du pluriel, futur simple.","options":["ferons","faisons","ferez","font"],"answer":"ferons"}'),

('Conditionnel : valeur d''hypothèse', 2, 30000, 'Le conditionnel exprime une hypothèse ou un souhait. «Je voudrais un café.»',
 '{"type":"mcq","question":"Dans «Je voudrais aller au cinéma», le conditionnel exprime...","options":["Un fait certain","Une hypothèse/un souhait","Un ordre","Un événement passé"],"answer":"Une hypothèse/un souhait"}'),

('Reconnaître l''infinitif passé', 2, 30000, 'L''infinitif passé = avoir/être + participe passé. «Après avoir mangé, il est sorti.»',
 '{"type":"mcq","question":"Dans «Après avoir terminé ses devoirs, elle est sortie», «avoir terminé» est...","options":["Un passé composé","Un infinitif passé","Un plus-que-parfait","Un futur antérieur"],"answer":"Un infinitif passé"}'),

('Impératif négatif', 2, 30000, 'Impératif négatif : «Ne mange pas !», «Ne mangeons pas !», «Ne mangez pas !»',
 '{"type":"mcq","question":"Quelle est la forme correcte de l''impératif négatif (2e pers. sing.) de «partir» ?","options":["Ne pas pars !","Ne pars pas !","Ne partis pas !","Pas partir !"],"answer":"Ne pars pas !"}'),

-- DIFFICULTÉ 3 (26 questions)
('Subjonctif passé : formation', 3, 45000, 'Subjonctif passé = auxiliaire au subjonctif présent + participe passé. «Bien qu''il soit parti.»',
 '{"type":"mcq","question":"Conjugue «partir» au subjonctif passé, 3e personne du singulier.","options":["qu''il partie","qu''il soit parti","qu''il serait parti","qu''il partît"],"answer":"qu''il soit parti"}'),

('Distinguer subjonctif et indicatif', 3, 45000, 'Après «douter», «craindre», «vouloir» → subjonctif. Après «savoir», «penser» + affirmation → indicatif.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Je veux que tu viens.","Je veux que tu viennes.","Je sais que tu viennes.","Je veux que tu venais."],"answer":"Je veux que tu viennes."}'),

('Subjonctif ou indicatif après «penser que»', 3, 45000, 'À l''affirmative : «Je pense qu''il vient.» (indicatif). À la négative ou interrogative : subjonctif possible.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Je pense qu''il ___»","options":["vienne","viendrait","viendra","vienne ou viendra selon le contexte"],"answer":"viendra"}'),

('Concordance des temps : si + plus-que-parfait', 3, 45000, 'Hypothèse dans le passé : si + plus-que-parfait, conditionnel passé.',
 '{"type":"mcq","question":"Complète : «Si tu ___ étudié, tu aurais réussi.»","options":["as","avais","auras","aurais"],"answer":"avais"}'),

('Discours indirect : transposition des temps', 3, 45000, 'Passé composé du discours direct → plus-que-parfait dans le discours indirect au passé.',
 '{"type":"mcq","question":"Transforme en discours indirect : «Elle a dit : ''J''ai fini.''»","options":["Elle a dit qu''elle finit.","Elle a dit qu''elle avait fini.","Elle a dit qu''elle a fini.","Elle a dit qu''elle finira."],"answer":"Elle a dit qu''elle avait fini."}'),

('Temps littéraires : passé simple vs imparfait', 3, 42000, 'En littérature, le passé simple remplace le passé composé pour les actions ponctuelles.',
 '{"type":"mcq","question":"Dans un récit littéraire au passé, quel temps remplace généralement le passé composé ?","options":["Le plus-que-parfait","Le conditionnel","Le passé simple","Le présent historique"],"answer":"Le passé simple"}'),

('Passé simple : verbe «être»', 3, 42000, 'Passé simple de «être» : je fus, tu fus, il fut, nous fûmes, vous fûtes, ils furent.',
 '{"type":"mcq","question":"Conjugue «être» à la 3e personne du singulier, passé simple.","options":["était","fut","est","aura été"],"answer":"fut"}'),

('Passé simple : verbe «avoir»', 3, 42000, 'Passé simple de «avoir» : j''eus, tu eus, il eut, nous eûmes, vous eûtes, ils eurent.',
 '{"type":"mcq","question":"Conjugue «avoir» à la 3e personne du pluriel, passé simple.","options":["eurent","avaient","ont eu","auront"],"answer":"eurent"}'),

('Passé simple : verbe «faire»', 3, 42000, 'Passé simple de «faire» : je fis, tu fis, il fit, nous fîmes, vous fîtes, ils firent.',
 '{"type":"mcq","question":"Conjugue «faire» à la 1re personne du singulier, passé simple.","options":["faisais","ferai","fis","faisait"],"answer":"fis"}'),

('Imparfait du subjonctif : notion', 3, 45000, 'L''imparfait du subjonctif est un temps littéraire. «Bien qu''il vînt» (vînt = imparfait du subjonctif de venir).',
 '{"type":"mcq","question":"L''imparfait du subjonctif est principalement utilisé...","options":["Dans la langue parlée quotidienne","Dans les textes littéraires ou soutenu","Toujours après «il faut»","Pour exprimer le futur"],"answer":"Dans les textes littéraires ou soutenu"}'),

('Verbe «naître» au passé composé', 3, 42000, '«Naître» prend l''auxiliaire «être». Je suis né(e), tu es né(e)...',
 '{"type":"mcq","question":"Conjugue «naître» à la 3e personne du singulier (féminin), passé composé.","options":["elle a née","elle est née","elle est né","elle naissait"],"answer":"elle est née"}'),

('Verbe «mourir» au passé composé', 3, 42000, '«Mourir» prend l''auxiliaire «être». Il est mort, elle est morte.',
 '{"type":"mcq","question":"Conjugue «mourir» à la 3e personne du pluriel (masculin), passé composé.","options":["ils ont mort","ils sont morts","ils sont mortes","ils ont mouri"],"answer":"ils sont morts"}'),

('Aspect : accompli vs inaccompli', 3, 42000, 'Aspect accompli : action terminée (passé composé, futur antérieur). Inaccompli : en cours (imparfait, futur).',
 '{"type":"mcq","question":"Lequel de ces temps exprime un aspect accompli ?","options":["L''imparfait","Le futur simple","Le passé composé","Le présent"],"answer":"Le passé composé"}'),

('Valeur du présent : narration historique', 3, 42000, 'Le présent de narration (présent historique) rend un événement passé plus vivant.',
 '{"type":"mcq","question":"Dans «En 1534, Cartier arrive au Canada», le présent exprime...","options":["Une action en cours maintenant","Un fait habituel","Une action historique racontée au présent","Une hypothèse"],"answer":"Une action historique racontée au présent"}'),

('Conditionnel journalistique', 3, 42000, 'Le conditionnel journalistique exprime une information non confirmée. «Le maire démissionnerait.»',
 '{"type":"mcq","question":"Dans un article de journal : «Le premier ministre aurait décidé de démissionner.» Le conditionnel exprime...","options":["Un souhait","Une information non confirmée","Un ordre","Une hypothèse future"],"answer":"Une information non confirmée"}'),

('Mode infinitif : après une préposition', 3, 40000, 'Après une préposition (à, de, pour, sans, avant de, après avoir)  → infinitif.',
 '{"type":"mcq","question":"Quelle forme est correcte ? «Il est parti sans ___ adieu.»","options":["dit","dire","disant","dise"],"answer":"dire"}'),

('Gérondif : formation et emploi', 3, 42000, 'Gérondif = «en» + participe présent. «En chantant, elle danse.» Simultanéité.',
 '{"type":"mcq","question":"Dans «Il travaille en écoutant de la musique», le gérondif exprime...","options":["La cause","La conséquence","La simultanéité","L''opposition"],"answer":"La simultanéité"}'),

('Participe présent vs adjectif verbal', 3, 45000, 'Participe présent (invariable) : «Des enfants jouant dehors.» Adjectif verbal (variable) : «Des enfants joueurs.»',
 '{"type":"mcq","question":"Dans «Des enfants chantants», «chantants» est...","options":["Un participe présent invariable","Un adjectif verbal qui s''accorde","Un gérondif","Un infinitif"],"answer":"Un adjectif verbal qui s''accorde"}'),

('Verbe «courir» au passé composé', 3, 40000, '«Courir» se conjugue avec «avoir» au p.c. «J''ai couru.»',
 '{"type":"mcq","question":"Conjugue «courir» à la 1re personne du singulier, passé composé.","options":["je suis couru","j''ai couru","j''étais couru","je courus"],"answer":"j''ai couru"}'),

('Verbe «ouvrir» au présent', 3, 40000, '«Ouvrir» se conjugue comme un verbe du 1er groupe au présent : j''ouvre, tu ouvres, il ouvre...',
 '{"type":"mcq","question":"Conjugue «ouvrir» à la 2e personne du singulier, présent.","options":["ouvris","ouvres","ouvrez","ouvre"],"answer":"ouvres"}'),

('Verbe «résoudre» au présent', 3, 42000, '«Résoudre» : je résous, tu résous, il résout, nous résolvons, vous résolvez, ils résolvent.',
 '{"type":"mcq","question":"Conjugue «résoudre» à la 3e personne du singulier, présent.","options":["résous","résout","résolvons","résolvent"],"answer":"résout"}'),

('Verbe «vaincre» au présent', 3, 42000, '«Vaincre» : je vaincs, tu vaincs, il vainc (sans c), nous vainquons...',
 '{"type":"mcq","question":"Conjugue «vaincre» à la 3e personne du singulier, présent.","options":["vainque","vaincs","vainc","vainquit"],"answer":"vainc"}'),

('Changer de mode : subjonctif ou indicatif', 3, 45000, 'Après «croire» à la négative ou interrogative, on peut employer le subjonctif.',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Je ne crois pas qu''il vient.","Je ne crois pas qu''il vienne.","Je ne crois pas qu''il viendra.","Les formes en gras et les deux premières sont acceptables."],"answer":"Je ne crois pas qu''il vienne."}'),

('Temps du discours indirect : futur → conditionnel', 3, 45000, 'En discours indirect au passé, le futur du discours direct devient conditionnel présent.',
 '{"type":"mcq","question":"Discours direct : «Il dit : ''Je viendrai demain.''» Transforme en discours indirect (verbe intro au passé).","options":["Il dit qu''il viendra demain.","Il a dit qu''il viendrait demain.","Il a dit qu''il est venu.","Il a dit qu''il venait demain."],"answer":"Il a dit qu''il viendrait demain."}'),

('Expression de la durée avec «depuis»', 3, 42000, '«Depuis» + présent = action qui a commencé dans le passé et continue. «Il travaille depuis 3 ans.»',
 '{"type":"mcq","question":"Quelle forme est correcte avec «depuis» ? «Il ___ ce projet depuis deux ans.»","options":["a travaillé","avait travaillé","travaille","travailla"],"answer":"travaille"}'),

('Infinitif après «faire»', 3, 40000, 'Après «faire», le verbe reste à l''infinitif. «Il fait construire une maison.»',
 '{"type":"mcq","question":"Quelle phrase est correcte ?","options":["Il fait construisant une maison.","Il fait construit une maison.","Il fait construire une maison.","Il fait construction une maison."],"answer":"Il fait construire une maison."}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);

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
