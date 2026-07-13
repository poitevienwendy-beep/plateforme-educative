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
