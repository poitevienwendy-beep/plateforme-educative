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
