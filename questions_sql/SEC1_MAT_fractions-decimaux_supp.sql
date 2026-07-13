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
