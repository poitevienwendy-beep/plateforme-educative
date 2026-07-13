-- ============================================================
-- BANQUE DE QUESTIONS — Algèbre (Sec. 1, Mathématiques)
-- PFEQ-MAT-SEC1-ALG | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-ALG') AS skill_id,
  q.title,
  q.difficulty_level::int,
  q.expected_time_ms::int,
  q.explication,
  true,
  q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Concepts de base (30 questions) ────────────────────────

('Variable et expression', 1, 20000, 'Une variable est une lettre qui représente un nombre inconnu. Dans 3x, x est la variable.',
 '{"type":"mcq","question":"Si x = 4, quelle est la valeur de 3x ?","options":["7","12","34","43"],"answer":"12"}'),

('Substitution simple', 1, 20000, 'On remplace la variable par sa valeur. Si a = 5 : a + 7 = 5 + 7 = 12.',
 '{"type":"mcq","question":"Si a = 5, quelle est la valeur de a + 7 ?","options":["2","12","35","57"],"answer":"12"}'),

('Expression algébrique', 1, 20000, 'On remplace x par 3 : 2x + 1 = 2(3) + 1 = 6 + 1 = 7.',
 '{"type":"mcq","question":"Évalue 2x + 1 si x = 3.","options":["5","7","8","9"],"answer":"7"}'),

('Équation simple addition', 1, 20000, 'x + 5 = 9. On isole x en soustrayant 5 des deux côtés : x = 9 - 5 = 4.',
 '{"type":"mcq","question":"Trouve x : x + 5 = 9","options":["4","14","45","54"],"answer":"4"}'),

('Équation simple soustraction', 1, 20000, 'x - 3 = 7. On ajoute 3 des deux côtés : x = 7 + 3 = 10.',
 '{"type":"mcq","question":"Trouve x : x - 3 = 7","options":["4","7","10","21"],"answer":"10"}'),

('Équation simple multiplication', 1, 20000, '3x = 12. On divise les deux côtés par 3 : x = 12 ÷ 3 = 4.',
 '{"type":"mcq","question":"Trouve x : 3x = 12","options":["3","4","9","36"],"answer":"4"}'),

('Équation simple division', 1, 20000, 'x/4 = 5. On multiplie les deux côtés par 4 : x = 5 × 4 = 20.',
 '{"type":"mcq","question":"Trouve x : x/4 = 5","options":["1","9","20","45"],"answer":"20"}'),

('Termes semblables', 1, 20000, 'Les termes semblables ont la même variable. On additionne 3x + 5x = 8x.',
 '{"type":"mcq","question":"Simplifie : 3x + 5x","options":["8","8x","15x","8x²"],"answer":"8x"}'),

('Expression deux variables', 1, 25000, 'On remplace a=2 et b=3 : 2a + b = 2(2) + 3 = 4 + 3 = 7.',
 '{"type":"mcq","question":"Évalue 2a + b si a = 2 et b = 3.","options":["5","7","9","10"],"answer":"7"}'),

('Identifier terme constant', 1, 15000, 'Dans 4x + 7, le terme 7 est la constante (sans variable).',
 '{"type":"mcq","question":"Dans l''expression 4x + 7, quel est le terme constant ?","options":["4","x","4x","7"],"answer":"7"}'),

('Identifier coefficient', 1, 15000, 'Dans 5y, le coefficient est 5 (le nombre devant la variable).',
 '{"type":"mcq","question":"Dans l''expression 5y, quel est le coefficient de y ?","options":["y","1","5","5y"],"answer":"5"}'),

('Evaluer expression carrée', 1, 25000, 'Si x = 3 : x² = 3² = 9.',
 '{"type":"mcq","question":"Évalue x² si x = 3.","options":["6","8","9","27"],"answer":"9"}'),

('Additionner expressions', 1, 25000, '(2x + 3) + (4x + 1) = 6x + 4.',
 '{"type":"mcq","question":"Simplifie : (2x + 3) + (4x + 1)","options":["6x + 4","6x + 3","8x + 4","6 + 4x"],"answer":"6x + 4"}'),

('Soustraire expressions', 1, 25000, '(5x + 6) - (2x + 1) = 3x + 5.',
 '{"type":"mcq","question":"Simplifie : (5x + 6) - (2x + 1)","options":["3x + 5","3x + 7","7x + 7","3x - 5"],"answer":"3x + 5"}'),

('Vérifier solution', 1, 20000, 'On substitue x = 3 dans x + 4 = 7 : 3 + 4 = 7. Vrai !',
 '{"type":"mcq","question":"x = 3 est-il solution de x + 4 = 7 ?","options":["Oui","Non","Impossible à dire","Pas assez d''info"],"answer":"Oui"}'),

('Equation deux étapes', 1, 25000, '2x + 1 = 9. On soustrait 1 : 2x = 8. On divise par 2 : x = 4.',
 '{"type":"mcq","question":"Trouve x : 2x + 1 = 9","options":["4","5","8","10"],"answer":"4"}'),

('Expression avec négatif', 1, 25000, 'Si x = -2 : 3x + 5 = 3(-2) + 5 = -6 + 5 = -1.',
 '{"type":"mcq","question":"Évalue 3x + 5 si x = -2.","options":["-11","-1","1","11"],"answer":"-1"}'),

('Traduire phrase en équation', 1, 25000, '«Un nombre augmenté de 6 donne 15» s''écrit x + 6 = 15.',
 '{"type":"mcq","question":"«Un nombre augmenté de 6 donne 15.» Quelle équation représente cette situation ?","options":["x - 6 = 15","x + 6 = 15","6x = 15","x/6 = 15"],"answer":"x + 6 = 15"}'),

('Propriété distributive simple', 1, 25000, '3(x + 2) = 3x + 6. On distribue le 3 sur chaque terme.',
 '{"type":"mcq","question":"Développe : 3(x + 2)","options":["3x + 2","3x + 5","3x + 6","6x"],"answer":"3x + 6"}'),

('Identifier monôme', 1, 15000, 'Un monôme est une expression à un seul terme. 4x² est un monôme.',
 '{"type":"mcq","question":"Lequel est un monôme ?","options":["x + 2","3x - 1","4x²","x² + x"],"answer":"4x²"}'),

('Degré d''un polynôme', 1, 20000, 'Dans 3x² + 5x + 1, le terme de plus haut degré est 3x², donc le degré est 2.',
 '{"type":"mcq","question":"Quel est le degré du polynôme 3x² + 5x + 1 ?","options":["1","2","3","5"],"answer":"2"}'),

('Evaluer polynôme', 1, 25000, 'Si x = 2 : x² - 3x + 2 = 4 - 6 + 2 = 0.',
 '{"type":"mcq","question":"Évalue x² - 3x + 2 si x = 2.","options":["-2","0","2","4"],"answer":"0"}'),

('Equation solution négative', 1, 25000, 'x + 8 = 3. On soustrait 8 : x = 3 - 8 = -5.',
 '{"type":"mcq","question":"Trouve x : x + 8 = 3","options":["-5","5","11","-11"],"answer":"-5"}'),

('Multiplication monômes', 1, 25000, '3x × 4x = 12x² (on multiplie les coefficients et on additionne les exposants).',
 '{"type":"mcq","question":"Calcule : 3x × 4x","options":["7x","12x","12x²","7x²"],"answer":"12x²"}'),

('Inégalité simple', 1, 20000, 'x > 3 signifie que x peut être n''importe quel nombre plus grand que 3. La valeur 5 convient.',
 '{"type":"mcq","question":"Laquelle de ces valeurs satisfait l''inégalité x > 3 ?","options":["1","2","3","5"],"answer":"5"}'),

('Equation avec fractions simples', 1, 30000, 'x/2 = 6. On multiplie par 2 : x = 12.',
 '{"type":"mcq","question":"Trouve x : x/2 = 6","options":["3","4","8","12"],"answer":"12"}'),

('Évaluer avec deux opérations', 1, 25000, 'Si n = 4 : 5n - 3 = 20 - 3 = 17.',
 '{"type":"mcq","question":"Évalue 5n - 3 si n = 4.","options":["17","18","23","2"],"answer":"17"}'),

('Soustraire termes semblables', 1, 20000, '7y - 3y = 4y.',
 '{"type":"mcq","question":"Simplifie : 7y - 3y","options":["4","4y","10y","21y"],"answer":"4y"}'),

('Equation mot', 1, 25000, '«Le double d''un nombre moins 3 égale 11» → 2x - 3 = 11 → 2x = 14 → x = 7.',
 '{"type":"mcq","question":"Le double d''un nombre moins 3 donne 11. Quel est ce nombre ?","options":["4","7","8","14"],"answer":"7"}'),

('Propriété commutative', 1, 15000, 'L''addition est commutative : a + b = b + a. Donc 3x + 5 = 5 + 3x.',
 '{"type":"mcq","question":"Laquelle est équivalente à 3x + 5 ?","options":["5 - 3x","5 + 3x","3 + 5x","15x"],"answer":"5 + 3x"}'),

-- ── DIFFICULTÉ 2 — Équations à deux étapes et plus (40 questions) ─────────

('Equation deux étapes avancée', 2, 35000, '3x - 4 = 11. On ajoute 4 : 3x = 15. On divise par 3 : x = 5.',
 '{"type":"mcq","question":"Trouve x : 3x - 4 = 11","options":["3","5","7","15"],"answer":"5"}'),

('Equation avec variable des deux côtés', 2, 40000, '5x - 2 = 3x + 8. On regroupe : 2x = 10. x = 5.',
 '{"type":"mcq","question":"Trouve x : 5x - 2 = 3x + 8","options":["3","5","6","10"],"answer":"5"}'),

('Développer et simplifier', 2, 35000, '2(3x + 4) - 5 = 6x + 8 - 5 = 6x + 3.',
 '{"type":"mcq","question":"Développe et simplifie : 2(3x + 4) - 5","options":["6x + 3","6x + 13","5x + 3","6x - 5"],"answer":"6x + 3"}'),

('Problème algébrique argent', 2, 40000, '3 articles coûtent 3x = 36, donc x = 12 $ chacun.',
 '{"type":"mcq","question":"Marie achète 3 articles identiques et paie 36 $ en tout. Quel est le prix d''un article ?","options":["9 $","12 $","15 $","18 $"],"answer":"12 $"}'),

('Equation parenthèses', 2, 40000, '2(x + 3) = 16. On développe : 2x + 6 = 16. 2x = 10. x = 5.',
 '{"type":"mcq","question":"Trouve x : 2(x + 3) = 16","options":["4","5","6","7"],"answer":"5"}'),

('Système notation algébrique', 2, 35000, 'L''expression 4(x - 2) + 3x = 4x - 8 + 3x = 7x - 8.',
 '{"type":"mcq","question":"Développe et simplifie : 4(x - 2) + 3x","options":["7x - 8","7x + 8","7x - 2","4x - 8"],"answer":"7x - 8"}'),

('Inégalité et résolution', 2, 35000, '2x + 3 > 11. On soustrait 3 : 2x > 8. On divise par 2 : x > 4.',
 '{"type":"mcq","question":"Résous : 2x + 3 > 11","options":["x > 4","x < 4","x > 7","x < 7"],"answer":"x > 4"}'),

('Problème âge algèbre', 2, 40000, 'Luc a x ans. Sa sœur a x + 5. Somme : x + (x+5) = 23. 2x + 5 = 23. 2x = 18. x = 9.',
 '{"type":"mcq","question":"Luc est 5 ans plus jeune que sa sœur. Leur âge total est 23 ans. Quel âge a Luc ?","options":["7","8","9","10"],"answer":"9"}'),

('Équation décimale', 2, 40000, '0,5x + 1,5 = 4. 0,5x = 2,5. x = 5.',
 '{"type":"mcq","question":"Trouve x : 0,5x + 1,5 = 4","options":["2,5","5","8","11"],"answer":"5"}'),

('Factoriser expression', 2, 35000, '6x + 9 = 3(2x + 3). On met en évidence le facteur commun 3.',
 '{"type":"mcq","question":"Factorise : 6x + 9","options":["3(2x + 3)","3(x + 3)","6(x + 9)","2(3x + 9)"],"answer":"3(2x + 3)"}'),

('Equation avec fraction', 2, 40000, 'x/3 + 2 = 6. x/3 = 4. x = 12.',
 '{"type":"mcq","question":"Trouve x : x/3 + 2 = 6","options":["6","8","12","24"],"answer":"12"}'),

('Périmètre et algèbre', 2, 40000, 'Périmètre = 2(longueur + largeur) = 2(2x + x) = 6x = 36. x = 6. Longueur = 12, largeur = 6.',
 '{"type":"mcq","question":"Un rectangle a une longueur deux fois sa largeur. Son périmètre est 36 cm. Quelle est sa largeur ?","options":["6 cm","8 cm","9 cm","12 cm"],"answer":"6 cm"}'),

('Equation avec négatif des deux côtés', 2, 40000, '-2x + 8 = 2. -2x = -6. x = 3.',
 '{"type":"mcq","question":"Trouve x : -2x + 8 = 2","options":["-3","3","5","-5"],"answer":"3"}'),

('Problème partage algèbre', 2, 40000, 'Total = 3 parts de x. 3x - 12 = 48. 3x = 60. x = 20.',
 '{"type":"mcq","question":"Trois amis partagent une somme. Après que chacun dépense 12 $, il reste 48 $ en tout. Combien chacun avait-il au départ ?","options":["16 $","18 $","20 $","24 $"],"answer":"20 $"}'),

('Développer double distributive', 2, 40000, '(x + 2)(x + 3) = x² + 3x + 2x + 6 = x² + 5x + 6.',
 '{"type":"mcq","question":"Développe : (x + 2)(x + 3)","options":["x² + 6","x² + 5x","x² + 5x + 6","x² + 6x + 6"],"answer":"x² + 5x + 6"}'),

('Inégalité négative', 2, 40000, '-3x < 12. On divise par -3 (on inverse le signe) : x > -4.',
 '{"type":"mcq","question":"Résous : -3x < 12","options":["x < -4","x > -4","x < 4","x > 4"],"answer":"x > -4"}'),

('Problème vitesse algèbre', 2, 40000, 'Distance = vitesse × temps. 120 = v × 2. v = 60 km/h.',
 '{"type":"mcq","question":"Une voiture parcourt 120 km en 2 heures à vitesse constante. Quelle est son équation de vitesse et sa valeur ?","options":["40 km/h","50 km/h","60 km/h","70 km/h"],"answer":"60 km/h"}'),

('Additionner polynômes', 2, 35000, '(3x² + 2x - 1) + (x² - 4x + 5) = 4x² - 2x + 4.',
 '{"type":"mcq","question":"Additionne : (3x² + 2x - 1) + (x² - 4x + 5)","options":["4x² - 2x + 4","4x² + 6x + 4","4x² - 2x - 4","2x² + 6x + 4"],"answer":"4x² - 2x + 4"}'),

('Soustraire polynômes', 2, 40000, '(5x² + 3x - 2) - (2x² - x + 4) = 3x² + 4x - 6.',
 '{"type":"mcq","question":"Soustrait : (5x² + 3x - 2) - (2x² - x + 4)","options":["3x² + 2x - 6","3x² + 4x - 6","3x² + 4x + 2","7x² + 2x - 6"],"answer":"3x² + 4x - 6"}'),

('Équation avec parenthèses des deux côtés', 2, 45000, '3(x + 1) = 2(x + 4). 3x + 3 = 2x + 8. x = 5.',
 '{"type":"mcq","question":"Trouve x : 3(x + 1) = 2(x + 4)","options":["4","5","6","7"],"answer":"5"}'),

('Problème tableau algébrique', 2, 40000, 'Côté = x. Périmètre d''un carré = 4x = 28. x = 7 cm.',
 '{"type":"mcq","question":"Le périmètre d''un carré est 28 cm. Quelle est la mesure de son côté ?","options":["4 cm","5 cm","7 cm","14 cm"],"answer":"7 cm"}'),

('Factorise GCF', 2, 35000, '12x² + 8x = 4x(3x + 2). Le facteur commun est 4x.',
 '{"type":"mcq","question":"Factorise : 12x² + 8x","options":["4x(3x + 2)","4(3x² + 2x)","2x(6x + 4)","8x(x + 1)"],"answer":"4x(3x + 2)"}'),

('Equation produit nul', 2, 40000, 'Si x(x - 3) = 0, alors x = 0 ou x - 3 = 0, donc x = 0 ou x = 3.',
 '{"type":"mcq","question":"Trouve les valeurs de x : x(x - 3) = 0","options":["x = 0 seulement","x = 3 seulement","x = 0 ou x = 3","x = 0 et x = 3"],"answer":"x = 0 ou x = 3"}'),

('Inégalité double', 2, 40000, '-1 ≤ x ≤ 4 signifie que x est entre -1 et 4 inclusivement. La valeur 2 convient.',
 '{"type":"mcq","question":"Laquelle satisfait -1 ≤ x ≤ 4 ?","options":["-2","5","2","4,5"],"answer":"2"}'),

('Résolution problème nombres consécutifs', 2, 40000, 'Deux entiers consécutifs : n et n+1. n + (n+1) = 35. 2n + 1 = 35. n = 17.',
 '{"type":"mcq","question":"La somme de deux entiers consécutifs est 35. Quel est le plus petit ?","options":["16","17","18","19"],"answer":"17"}'),

('Substitution dans formule', 2, 35000, 'Aire = l × w. Avec l = 2x et w = x + 3, Aire = 2x(x+3) = 2x² + 6x.',
 '{"type":"mcq","question":"Si l = 2x et w = x + 3, exprime l''aire du rectangle A = l × w.","options":["2x + 3","2x² + 3","2x² + 6x","2x² + 6x + 3"],"answer":"2x² + 6x"}'),

('Problème pourcentage algébrique', 2, 40000, '15% de x = 45. 0,15x = 45. x = 300.',
 '{"type":"mcq","question":"15% d''un nombre est 45. Quel est ce nombre ?","options":["200","250","300","350"],"answer":"300"}'),

('Développer avec signe négatif', 2, 35000, '-(3x - 5) = -3x + 5.',
 '{"type":"mcq","question":"Développe : -(3x - 5)","options":["-3x - 5","-3x + 5","3x - 5","3x + 5"],"answer":"-3x + 5"}'),

('Équation rationnelle simple', 2, 40000, '(2x + 4) / 2 = 7. On multiplie par 2 : 2x + 4 = 14. 2x = 10. x = 5.',
 '{"type":"mcq","question":"Trouve x : (2x + 4) / 2 = 7","options":["3","4","5","6"],"answer":"5"}'),

('Problème grandeurs proportionnelles', 2, 40000, 'Si 4 stylos coûtent 6 $, alors x stylos coûtent 15 $. 4/6 = x/15. 6x = 60. x = 10 stylos.',
 '{"type":"mcq","question":"Si 4 stylos coûtent 6 $, combien de stylos peut-on acheter avec 15 $ ?","options":["8","9","10","12"],"answer":"10"}'),

('Monomials produit règle exposants', 2, 35000, 'x³ × x² = x^(3+2) = x⁵.',
 '{"type":"mcq","question":"Simplifie : x³ × x²","options":["x⁵","x⁶","2x⁵","x"],"answer":"x⁵"}'),

-- ── DIFFICULTÉ 3 — Problèmes complexes (30 questions) ─────────────────────

('Système équations par substitution', 3, 55000, 'y = 2x et x + y = 9. On substitue : x + 2x = 9. 3x = 9. x = 3, y = 6.',
 '{"type":"mcq","question":"Résous le système : y = 2x et x + y = 9","options":["x=2, y=4","x=3, y=6","x=4, y=8","x=3, y=7"],"answer":"x=3, y=6"}'),

('Développer trinôme carré', 3, 50000, '(x + 4)² = x² + 8x + 16.',
 '{"type":"mcq","question":"Développe : (x + 4)²","options":["x² + 16","x² + 4x + 16","x² + 8x + 16","x² + 8x + 8"],"answer":"x² + 8x + 16"}'),

('Factoriser trinôme', 3, 55000, 'x² + 5x + 6 = (x + 2)(x + 3). On cherche deux nombres dont le produit est 6 et la somme est 5.',
 '{"type":"mcq","question":"Factorise : x² + 5x + 6","options":["(x+1)(x+6)","(x+2)(x+3)","(x-2)(x-3)","(x+6)(x-1)"],"answer":"(x+2)(x+3)"}'),

('Problème multi-étapes algèbre', 3, 55000, 'Pierre a p $, Marc a 3p - 10, Léa a 2p + 5. Total = 6p - 5 = 115. 6p = 120. p = 20. Marc = 50 $.',
 '{"type":"mcq","question":"Pierre a p $, Marc a le triple de Pierre moins 10 $, Léa a le double de Pierre plus 5 $. Ensemble ils ont 115 $. Combien Marc a-t-il ?","options":["30 $","40 $","50 $","60 $"],"answer":"50 $"}'),

('Inégalité avec fraction', 3, 50000, 'x/3 - 2 ≥ 1. x/3 ≥ 3. x ≥ 9.',
 '{"type":"mcq","question":"Résous : x/3 - 2 ≥ 1","options":["x ≥ 1","x ≥ 3","x ≥ 9","x ≥ 12"],"answer":"x ≥ 9"}'),

('Système par addition', 3, 55000, 'x + y = 10 et x - y = 4. On additionne : 2x = 14, x = 7, y = 3.',
 '{"type":"mcq","question":"Résous : x + y = 10 et x - y = 4","options":["x=5, y=5","x=6, y=4","x=7, y=3","x=8, y=2"],"answer":"x=7, y=3"}'),

('Problème rectangles algèbre', 3, 55000, 'Longueur = x + 5, largeur = x. Aire = x(x+5) = 84. x² + 5x - 84 = 0. (x+12)(x-7)=0. x=7. Longueur = 12.',
 '{"type":"mcq","question":"La longueur d''un rectangle est 5 cm de plus que sa largeur. Son aire est 84 cm². Quelle est la longueur ?","options":["10 cm","11 cm","12 cm","14 cm"],"answer":"12 cm"}'),

('Développer et évaluer', 3, 50000, 'On développe (2x - 1)(x + 3) = 2x² + 6x - x - 3 = 2x² + 5x - 3. Pour x=2 : 8+10-3=15.',
 '{"type":"mcq","question":"Développe (2x - 1)(x + 3) puis évalue pour x = 2.","options":["13","15","17","19"],"answer":"15"}'),

('Problème vitesses opposées', 3, 55000, 'Deux trains partent en même temps dans des directions opposées à 80 et 100 km/h. Après t heures, distance = 180t = 540. t = 3 heures.',
 '{"type":"mcq","question":"Deux trains partent en sens opposés à 80 km/h et 100 km/h. Au bout de combien d''heures seront-ils à 540 km l''un de l''autre ?","options":["2 h","3 h","4 h","5 h"],"answer":"3 h"}'),

('Factoriser différence de carrés', 3, 50000, 'x² - 25 = (x+5)(x-5). Différence de deux carrés : a² - b² = (a+b)(a-b).',
 '{"type":"mcq","question":"Factorise : x² - 25","options":["(x-5)²","(x+5)(x-5)","(x-5)(x+5)","x(x-25)"],"answer":"(x+5)(x-5)"}'),

('Résolution équation quadratique', 3, 55000, 'x² - 7x + 12 = 0. On factorise : (x-3)(x-4) = 0. x = 3 ou x = 4.',
 '{"type":"mcq","question":"Résous : x² - 7x + 12 = 0","options":["x=3 ou x=4","x=3 et x=4","x=-3 ou x=-4","x=6 ou x=2"],"answer":"x=3 ou x=4"}'),

('Problème poids algèbre', 3, 55000, 'Sac A + Sac B = 50 kg. Sac A = 2 × Sac B + 5. Substitution : 2B + 5 + B = 50. 3B = 45. B = 15, A = 35.',
 '{"type":"mcq","question":"Deux sacs pèsent 50 kg ensemble. Le premier pèse 5 kg de plus que le double du second. Quel est le poids du premier sac ?","options":["30 kg","33 kg","35 kg","38 kg"],"answer":"35 kg"}'),

('Expression avec deux variables complexe', 3, 50000, 'Si a = -2 et b = 3 : 2a² - 3b + ab = 2(4) - 9 + (-6) = 8 - 9 - 6 = -7.',
 '{"type":"mcq","question":"Évalue 2a² - 3b + ab pour a = -2 et b = 3.","options":["-7","-5","7","5"],"answer":"-7"}'),

('Problème mixte algèbre-géométrie', 3, 55000, 'Triangle : base = x, hauteur = x + 4. Aire = (1/2)x(x+4) = 30. x(x+4) = 60. x² + 4x - 60 = 0. (x+10)(x-6) = 0. x = 6. Hauteur = 10.',
 '{"type":"mcq","question":"La hauteur d''un triangle est 4 cm de plus que sa base. Son aire est 30 cm². Quelle est la hauteur ?","options":["8 cm","9 cm","10 cm","12 cm"],"answer":"10 cm"}'),

('Système applications', 3, 55000, 'Adulte = a $, enfant = e $. 2a + 3e = 35 et a + 2e = 20. De la 2e : a = 20-2e. Substitution : 2(20-2e)+3e=35. 40-4e+3e=35. e=5. a=10.',
 '{"type":"mcq","question":"2 adultes et 3 enfants paient 35 $. 1 adulte et 2 enfants paient 20 $. Quel est le prix d''un billet adulte ?","options":["8 $","9 $","10 $","12 $"],"answer":"10 $"}'),

('Formule inverse', 3, 50000, 'v = d/t. On isole t : t = d/v = 240/60 = 4 heures.',
 '{"type":"mcq","question":"Un véhicule doit parcourir 240 km à 60 km/h. En utilisant la formule d = v × t, combien d''heures faut-il ?","options":["3 h","4 h","5 h","6 h"],"answer":"4 h"}'),

('Inégalité double résolution', 3, 50000, '-3 < 2x + 1 ≤ 9. On soustrait 1 : -4 < 2x ≤ 8. On divise par 2 : -2 < x ≤ 4.',
 '{"type":"mcq","question":"Résous : -3 < 2x + 1 ≤ 9","options":["-2 < x ≤ 4","-1 < x ≤ 5","-3 < x ≤ 9","x ≥ -2"],"answer":"-2 < x ≤ 4"}'),

('Problème taux de remplissage', 3, 55000, 'Robinet A remplit la piscine en 6h, B en 4h. Ensemble : 1/6 + 1/4 = 2/12 + 3/12 = 5/12 par heure. Temps = 12/5 = 2,4 h = 2h24.',
 '{"type":"mcq","question":"Le robinet A remplit une piscine en 6h, le robinet B en 4h. Combien de temps faut-il en les ouvrant ensemble ?","options":["2,0 h","2,4 h","2,5 h","3,0 h"],"answer":"2,4 h"}'),

('Développer trinôme négatif', 3, 50000, '(x - 3)² = x² - 6x + 9.',
 '{"type":"mcq","question":"Développe : (x - 3)²","options":["x² - 9","x² - 3x + 9","x² - 6x + 9","x² + 6x - 9"],"answer":"x² - 6x + 9"}'),

('Problème algèbre et proportions', 3, 55000, 'Ratio garçons:filles = 3:5. Total = 240. Garçons = 3/8 × 240 = 90. Filles = 5/8 × 240 = 150. Différence = 60.',
 '{"type":"mcq","question":"Dans une école de 240 élèves, le ratio garçons:filles est 3:5. Combien y a-t-il de filles de plus que de garçons ?","options":["40","50","60","80"],"answer":"60"}'),

('Système non linéaire simple', 3, 55000, 'y = x² et y = x + 2. x² = x + 2. x² - x - 2 = 0. (x-2)(x+1) = 0. x = 2 ou x = -1.',
 '{"type":"mcq","question":"Trouve les valeurs de x pour : y = x² et y = x + 2","options":["x = 2 seulement","x = -1 seulement","x = 2 ou x = -1","x = 1 ou x = -2"],"answer":"x = 2 ou x = -1"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
