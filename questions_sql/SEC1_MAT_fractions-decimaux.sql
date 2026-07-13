-- ============================================================
-- BANQUE DE QUESTIONS — Fractions et décimaux (Sec. 1, Mathématiques)
-- PFEQ-MAT-SEC1-FD | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-FD') AS skill_id,
  q.title,
  q.difficulty_level::int,
  q.expected_time_ms::int,
  q.explication,
  true,
  q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Concepts de base (30 questions) ────────────────────────

('Fraction dun tout', 1, 20000, 'La fraction 3/4 signifie 3 parties sur 4 parties égales.',
 '{"type":"mcq","question":"Quelle fraction représente 3 parties sur 4 parties égales ?","options":["1/4","3/4","4/3","3/3"],"answer":"3/4"}'),

('Numérateur et dénominateur', 1, 15000, 'Dans la fraction 5/8, le numérateur est 5 (parties prises) et le dénominateur est 8 (parties totales).',
 '{"type":"mcq","question":"Dans la fraction 5/8, quel est le numérateur ?","options":["8","3","5","13"],"answer":"5"}'),

('Fraction décimale simple', 1, 20000, '1/10 = 0,1 car on divise 1 par 10.',
 '{"type":"mcq","question":"Quelle est la valeur décimale de 1/10 ?","options":["0,01","0,1","1,0","10"],"answer":"0,1"}'),

('Fraction décimale centième', 1, 20000, '1/100 = 0,01 car on divise 1 par 100.',
 '{"type":"mcq","question":"Quelle est la valeur décimale de 1/100 ?","options":["0,001","0,01","0,1","1"],"answer":"0,01"}'),

('Lire un nombre décimal', 1, 15000, '0,7 se lit «sept dixièmes» et vaut 7/10.',
 '{"type":"mcq","question":"Comment lit-on 0,7 ?","options":["sept centièmes","sept millièmes","sept dixièmes","zéro virgule sept"],"answer":"sept dixièmes"}'),

('Comparer fractions même dénominateur', 1, 20000, 'Quand le dénominateur est le même, on compare les numérateurs : 3 < 5, donc 3/7 < 5/7.',
 '{"type":"mcq","question":"Lequel est vrai ?","options":["5/7 < 3/7","3/7 = 5/7","3/7 > 5/7","3/7 < 5/7"],"answer":"3/7 < 5/7"}'),

('Fraction équivalente', 1, 20000, 'Pour obtenir une fraction équivalente, on multiplie le numérateur et le dénominateur par le même nombre. 1/2 = 2/4.',
 '{"type":"mcq","question":"Laquelle est une fraction équivalente à 1/2 ?","options":["1/3","2/3","2/4","3/4"],"answer":"2/4"}'),

('Addition décimaux simple', 1, 20000, '1,3 + 2,5 = 3,8. On additionne les dixièmes : 3 + 5 = 8.',
 '{"type":"mcq","question":"Calcule : 1,3 + 2,5","options":["3,5","3,7","3,8","4,0"],"answer":"3,8"}'),

('Soustraction décimaux simple', 1, 20000, '5,8 - 3,2 = 2,6. On soustrait les dixièmes : 8 - 2 = 6.',
 '{"type":"mcq","question":"Calcule : 5,8 - 3,2","options":["2,4","2,6","2,8","3,0"],"answer":"2,6"}'),

('Fraction propre ou impropre', 1, 15000, 'Une fraction propre a un numérateur plus petit que son dénominateur. 3/7 est propre car 3 < 7.',
 '{"type":"mcq","question":"Laquelle est une fraction propre ?","options":["7/3","5/5","3/7","9/4"],"answer":"3/7"}'),

('Fraction en décimal simple', 1, 20000, '1/2 = 0,5 car 1 divisé par 2 donne 0,5.',
 '{"type":"mcq","question":"Exprime 1/2 en nombre décimal.","options":["0,2","0,5","2,0","5,0"],"answer":"0,5"}'),

('Décimal en fraction', 1, 20000, '0,25 = 25/100 = 1/4 après simplification.',
 '{"type":"mcq","question":"Quelle fraction est équivalente à 0,25 ?","options":["1/2","1/4","2/5","1/5"],"answer":"1/4"}'),

('Nombre mixte', 1, 20000, 'Le nombre mixte 2 1/3 signifie 2 entiers et 1/3. En fraction impropre : (2×3+1)/3 = 7/3.',
 '{"type":"mcq","question":"Quel est le nombre mixte équivalent à 7/3 ?","options":["1 2/3","2 1/3","3 1/7","2 3/7"],"answer":"2 1/3"}'),

('Comparer décimaux', 1, 15000, '0,8 = 0,80 et 0,75 < 0,80, donc 0,75 < 0,8.',
 '{"type":"mcq","question":"Lequel est vrai ?","options":["0,75 > 0,8","0,75 = 0,8","0,8 < 0,75","0,75 < 0,8"],"answer":"0,75 < 0,8"}'),

('Arrondi décimal à la dixième', 1, 20000, 'Pour arrondir 3,47 à la dixième, on regarde le centième (7 ≥ 5) : on arrondit à 3,5.',
 '{"type":"mcq","question":"Arrondis 3,47 à la dixième près.","options":["3,4","3,5","3,47","4,0"],"answer":"3,5"}'),

('Multiplication décimal par 10', 1, 15000, 'Multiplier par 10 déplace la virgule d''un rang vers la droite : 2,34 × 10 = 23,4.',
 '{"type":"mcq","question":"Calcule : 2,34 × 10","options":["0,234","2,340","23,4","234"],"answer":"23,4"}'),

('Division décimal par 10', 1, 15000, 'Diviser par 10 déplace la virgule d''un rang vers la gauche : 56,7 ÷ 10 = 5,67.',
 '{"type":"mcq","question":"Calcule : 56,7 ÷ 10","options":["0,567","5,67","567","5670"],"answer":"5,67"}'),

('Fraction de 12', 1, 20000, '3/4 de 12 = 3 × (12 ÷ 4) = 3 × 3 = 9.',
 '{"type":"mcq","question":"Calcule les 3/4 de 12.","options":["3","6","9","15"],"answer":"9"}'),

('Identifier fraction sur droite numérique', 1, 20000, 'Sur une droite numérique entre 0 et 1 divisée en 5 parts égales, le 2e trait correspond à 2/5.',
 '{"type":"mcq","question":"Sur une droite entre 0 et 1 divisée en 5 parties égales, quel nombre se trouve au 2e repère ?","options":["1/5","2/5","3/5","2/3"],"answer":"2/5"}'),

('Simplifier fraction', 1, 20000, 'On divise numérateur et dénominateur par leur PGCD. PGCD(6,8)=2. 6/8 = 3/4.',
 '{"type":"mcq","question":"Simplifie la fraction 6/8.","options":["2/4","3/4","4/6","6/8"],"answer":"3/4"}'),

('Addition décimaux avec retenue', 1, 20000, '4,7 + 2,8 = 7,5. Les dixièmes : 7 + 8 = 15, on écrit 5 et retient 1.',
 '{"type":"mcq","question":"Calcule : 4,7 + 2,8","options":["6,5","7,5","7,15","8,5"],"answer":"7,5"}'),

('Valeur positionnelle décimale', 1, 15000, 'Dans 3,456, le chiffre 5 est à la position des centièmes.',
 '{"type":"mcq","question":"Dans le nombre 3,456, quel est le chiffre à la position des centièmes ?","options":["3","4","5","6"],"answer":"5"}'),

('Fraction demi', 1, 15000, '1/2 de 30 = 30 ÷ 2 = 15.',
 '{"type":"mcq","question":"Quel est la moitié de 30 ?","options":["10","12","15","20"],"answer":"15"}'),

('Décimal à la fraction centième', 1, 20000, '0,37 = 37/100.',
 '{"type":"mcq","question":"Exprime 0,37 sous forme de fraction.","options":["37/10","3/7","37/100","3,7/100"],"answer":"37/100"}'),

('Comparer fraction et décimal', 1, 20000, '1/4 = 0,25. On compare 0,25 et 0,3 : 0,25 < 0,30.',
 '{"type":"mcq","question":"Lequel est plus grand : 1/4 ou 0,3 ?","options":["1/4","0,3","Ils sont égaux","Impossible à comparer"],"answer":"0,3"}'),

('Addition fractions même dénominateur', 1, 20000, '2/7 + 3/7 = (2+3)/7 = 5/7. On garde le dénominateur et on additionne les numérateurs.',
 '{"type":"mcq","question":"Calcule : 2/7 + 3/7","options":["5/14","5/7","6/7","1"],"answer":"5/7"}'),

('Soustraction fractions même dénominateur', 1, 20000, '6/8 - 2/8 = (6-2)/8 = 4/8 = 1/2.',
 '{"type":"mcq","question":"Calcule : 6/8 - 2/8","options":["4/16","4/8","1/2","3/4"],"answer":"4/8"}'),

('Multiplication décimal par entier', 1, 20000, '0,5 × 6 = 3,0. On peut aussi faire 1/2 × 6 = 3.',
 '{"type":"mcq","question":"Calcule : 0,5 × 6","options":["0,30","3,0","3,5","30"],"answer":"3,0"}'),

('Ordonner fractions', 1, 25000, 'On convertit tout en dixièmes : 1/5=2/10, 3/10, 2/5=4/10. Ordre croissant : 1/5 < 3/10 < 2/5.',
 '{"type":"mcq","question":"Range dans l''ordre croissant : 3/10, 1/5, 2/5","options":["1/5, 2/5, 3/10","3/10, 1/5, 2/5","1/5, 3/10, 2/5","2/5, 3/10, 1/5"],"answer":"1/5, 3/10, 2/5"}'),

('Fraction de 100', 1, 20000, '3/4 de 100 = 75. C''est aussi équivalent à 75%.',
 '{"type":"mcq","question":"Calcule les 3/4 de 100.","options":["33","50","75","80"],"answer":"75"}'),

-- ── DIFFICULTÉ 2 — Opérations intermédiaires (40 questions) ───────────────

('Addition fractions dénominateurs différents', 2, 35000, 'On réduit au même dénominateur. PPCM(3,4)=12. 1/3=4/12 et 1/4=3/12. Somme : 7/12.',
 '{"type":"mcq","question":"Calcule : 1/3 + 1/4","options":["2/7","2/12","7/12","1/2"],"answer":"7/12"}'),

('Soustraction fractions dénominateurs différents', 2, 35000, 'PPCM(2,3)=6. 1/2=3/6 et 1/3=2/6. Différence : 3/6-2/6=1/6.',
 '{"type":"mcq","question":"Calcule : 1/2 - 1/3","options":["0","1/6","1/5","1/3"],"answer":"1/6"}'),

('Multiplication fractions', 2, 30000, 'On multiplie les numérateurs entre eux et les dénominateurs entre eux. 2/3 × 3/4 = 6/12 = 1/2.',
 '{"type":"mcq","question":"Calcule : 2/3 × 3/4","options":["5/7","6/12","1/2","5/12"],"answer":"1/2"}'),

('Division de fractions', 2, 35000, 'Diviser par une fraction revient à multiplier par son inverse. 2/3 ÷ 4/5 = 2/3 × 5/4 = 10/12 = 5/6.',
 '{"type":"mcq","question":"Calcule : 2/3 ÷ 4/5","options":["8/15","5/6","10/15","2/3"],"answer":"5/6"}'),

('Multiplication décimaux', 2, 30000, '1,2 × 3,4 : on calcule 12 × 34 = 408, puis on place 2 décimales : 4,08.',
 '{"type":"mcq","question":"Calcule : 1,2 × 3,4","options":["3,6","4,08","4,8","40,8"],"answer":"4,08"}'),

('Division décimaux', 2, 35000, '7,2 ÷ 0,9 : on multiplie les deux par 10 pour éviter les décimales au diviseur : 72 ÷ 9 = 8.',
 '{"type":"mcq","question":"Calcule : 7,2 ÷ 0,9","options":["0,8","8","80","0,08"],"answer":"8"}'),

('Fraction impropre en nombre mixte', 2, 30000, '11/4 = 2 reste 3 = 2 3/4.',
 '{"type":"mcq","question":"Convertis 11/4 en nombre mixte.","options":["1 3/4","2 1/4","2 3/4","3 1/4"],"answer":"2 3/4"}'),

('Nombre mixte en fraction impropre', 2, 30000, '3 2/5 = (3×5+2)/5 = 17/5.',
 '{"type":"mcq","question":"Convertis 3 2/5 en fraction impropre.","options":["15/5","16/5","17/5","32/5"],"answer":"17/5"}'),

('Pourcentage simple', 2, 30000, '20% de 80 = 0,20 × 80 = 16. Ou : 80 × 20 ÷ 100 = 16.',
 '{"type":"mcq","question":"Calcule 20% de 80.","options":["8","12","16","20"],"answer":"16"}'),

('Décimal en pourcentage', 2, 25000, '0,35 × 100 = 35%. Pour convertir un décimal en %, on multiplie par 100.',
 '{"type":"mcq","question":"Exprime 0,35 en pourcentage.","options":["0,35%","3,5%","35%","350%"],"answer":"35%"}'),

('Pourcentage en décimal', 2, 25000, '45% ÷ 100 = 0,45. Pour convertir un % en décimal, on divise par 100.',
 '{"type":"mcq","question":"Exprime 45% en nombre décimal.","options":["4,5","0,045","0,45","45"],"answer":"0,45"}'),

('Fraction en pourcentage', 2, 30000, '3/4 = 0,75 = 75%. On divise le numérateur par le dénominateur et on multiplie par 100.',
 '{"type":"mcq","question":"Quel pourcentage correspond à la fraction 3/4 ?","options":["34%","43%","70%","75%"],"answer":"75%"}'),

('Addition nombres mixtes', 2, 35000, '1 1/2 + 2 1/3 = 1 3/6 + 2 2/6 = 3 5/6.',
 '{"type":"mcq","question":"Calcule : 1 1/2 + 2 1/3","options":["3 1/5","3 2/5","3 5/6","4 1/6"],"answer":"3 5/6"}'),

('Soustraction nombres mixtes', 2, 35000, '4 3/4 - 2 1/4 = 2 2/4 = 2 1/2.',
 '{"type":"mcq","question":"Calcule : 4 3/4 - 2 1/4","options":["2 1/4","2 1/2","2 3/4","3 1/4"],"answer":"2 1/2"}'),

('Arrondi décimal au centième', 2, 25000, 'Pour arrondir 4,836 au centième, on regarde le millième (6 ≥ 5) : on arrondit à 4,84.',
 '{"type":"mcq","question":"Arrondis 4,836 au centième près.","options":["4,83","4,84","4,9","5,0"],"answer":"4,84"}'),

('Comparer fractions différents dénominateurs', 2, 35000, 'On réduit au même dénominateur. 2/3=8/12 et 3/4=9/12. Donc 2/3 < 3/4.',
 '{"type":"mcq","question":"Lequel est vrai ?","options":["2/3 > 3/4","2/3 = 3/4","2/3 < 3/4","Impossible à comparer"],"answer":"2/3 < 3/4"}'),

('Problème partage fraction', 2, 35000, 'Julie mange 3/8 d''une pizza de 24 parts. Elle mange 3/8 × 24 = 9 parts.',
 '{"type":"mcq","question":"Une pizza est coupée en 24 parts égales. Julie mange 3/8 de la pizza. Combien de parts mange-t-elle ?","options":["6","8","9","12"],"answer":"9"}'),

('Multiplication décimaux précision', 2, 35000, '0,3 × 0,4 = 0,12. On calcule 3 × 4 = 12, puis on place 2 décimales.',
 '{"type":"mcq","question":"Calcule : 0,3 × 0,4","options":["0,07","0,12","1,2","12"],"answer":"0,12"}'),

('Problème prix réduit', 2, 35000, 'Rabais de 15% sur 60 $ : 0,15 × 60 = 9 $. Prix final : 60 - 9 = 51 $.',
 '{"type":"mcq","question":"Un article coûte 60 $. Il est en rabais de 15%. Quel est le prix final ?","options":["45 $","51 $","54 $","57 $"],"answer":"51 $"}'),

('Division fractions simplifiée', 2, 35000, '5/6 ÷ 5/3 = 5/6 × 3/5 = 15/30 = 1/2.',
 '{"type":"mcq","question":"Calcule : 5/6 ÷ 5/3","options":["1/3","1/2","25/18","3/2"],"answer":"1/2"}'),

('Ordonner decimaux', 2, 25000, 'On aligne les décimales : 0,305 < 0,35 < 0,503 < 0,53.',
 '{"type":"mcq","question":"Range dans l''ordre croissant : 0,35 — 0,503 — 0,305 — 0,53","options":["0,305, 0,35, 0,503, 0,53","0,35, 0,305, 0,53, 0,503","0,503, 0,53, 0,305, 0,35","0,53, 0,503, 0,35, 0,305"],"answer":"0,305, 0,35, 0,503, 0,53"}'),

('Fraction dun montant', 2, 35000, '2/5 de 75 $ = 2 × (75÷5) = 2 × 15 = 30 $.',
 '{"type":"mcq","question":"Deux cinquièmes d''un montant de 75 $ représentent combien de dollars ?","options":["15 $","25 $","30 $","45 $"],"answer":"30 $"}'),

('Multiplication fraction par entier', 2, 30000, '3/5 × 20 = 60/5 = 12.',
 '{"type":"mcq","question":"Calcule : 3/5 × 20","options":["6","10","12","15"],"answer":"12"}'),

('Problème partage décimal', 2, 35000, 'On partage 8,4 L en 4 parts égales : 8,4 ÷ 4 = 2,1 L.',
 '{"type":"mcq","question":"On partage 8,4 litres d''eau également entre 4 personnes. Chacune reçoit combien de litres ?","options":["1,8 L","2,1 L","2,4 L","3,2 L"],"answer":"2,1 L"}'),

('Simplifier fraction avancé', 2, 30000, 'PGCD(18,24)=6. 18/24 = 3/4.',
 '{"type":"mcq","question":"Simplifie 18/24 à sa plus simple expression.","options":["6/8","3/4","9/12","2/3"],"answer":"3/4"}'),

('Pourcentage dune quantité', 2, 30000, '30% de 150 = 0,30 × 150 = 45.',
 '{"type":"mcq","question":"Calcule 30% de 150.","options":["30","40","45","50"],"answer":"45"}'),

('Problème décimal multi-étapes', 2, 40000, 'Coût total : 3 × 4,75 = 14,25 $. Monnaie rendue : 20 - 14,25 = 5,75 $.',
 '{"type":"mcq","question":"Léa achète 3 cahiers à 4,75 $ chacun et paie avec un billet de 20 $. Combien reçoit-elle en monnaie ?","options":["5,25 $","5,50 $","5,75 $","6,00 $"],"answer":"5,75 $"}'),

('Equivalence fractions decimaux pourcentage', 2, 35000, '1/4 = 0,25 = 25%. Ces trois représentations sont équivalentes.',
 '{"type":"mcq","question":"Laquelle de ces expressions est équivalente à 1/4 ?","options":["0,14","14%","25%","40%"],"answer":"25%"}'),

('Addition decimaux à trois termes', 2, 30000, '1,25 + 3,60 + 2,15 = 7,00.',
 '{"type":"mcq","question":"Calcule : 1,25 + 3,60 + 2,15","options":["6,90","7,00","7,10","7,50"],"answer":"7,00"}'),

('Fraction et division', 2, 30000, 'La fraction 5/8 peut s''interpréter comme 5 ÷ 8 = 0,625.',
 '{"type":"mcq","question":"Quelle est la valeur décimale de 5/8 ?","options":["0,58","0,625","0,65","0,8"],"answer":"0,625"}'),

('Problème pourcentage hausse', 2, 35000, 'Augmentation de 10% sur 240 $ : 10% × 240 = 24. Nouveau prix : 240 + 24 = 264 $.',
 '{"type":"mcq","question":"Le prix d''un abonnement passe de 240 $ à +10%. Quel est le nouveau prix ?","options":["224 $","250 $","264 $","270 $"],"answer":"264 $"}'),

('Produit nombres mixtes', 2, 40000, '1 1/2 × 2 2/3 = 3/2 × 8/3 = 24/6 = 4.',
 '{"type":"mcq","question":"Calcule : 1 1/2 × 2 2/3","options":["3","4","4 1/3","5"],"answer":"4"}'),

-- ── DIFFICULTÉ 3 — Problèmes complexes (30 questions) ─────────────────────

('Fraction complexe multi-étapes', 3, 50000, '3/4 de 2/3 = 3/4 × 2/3 = 6/12 = 1/2.',
 '{"type":"mcq","question":"Calcule les 3/4 des 2/3 d''un gâteau. Quelle fraction du gâteau obtient-on ?","options":["5/12","1/2","7/12","6/7"],"answer":"1/2"}'),

('Problème pourcentage complexe', 3, 50000, 'Prix original x. Après réduction de 25% : 0,75x = 90, donc x = 90 ÷ 0,75 = 120 $.',
 '{"type":"mcq","question":"Un article soldé à 90 $ a subi une réduction de 25%. Quel était son prix original ?","options":["112,50 $","115 $","120 $","125 $"],"answer":"120 $"}'),

('Suite de fractions', 3, 45000, 'Chaque terme est le précédent plus 1/6. Après 1/6, 2/6, 3/6, 4/6, 5/6 vient 6/6 = 1.',
 '{"type":"mcq","question":"Dans la suite 1/6, 2/6, 3/6, 4/6, quel est le terme suivant ?","options":["4/6","5/6","1","6/5"],"answer":"5/6"}'),

('Résoudre équation avec fraction', 3, 50000, 'x/3 + 1/2 = 5/6. x/3 = 5/6 - 1/2 = 5/6 - 3/6 = 2/6 = 1/3. x = 3 × 1/3 = 1.',
 '{"type":"mcq","question":"Trouve la valeur de x : x/3 + 1/2 = 5/6","options":["1/3","1","2","3"],"answer":"1"}'),

('Problème décimal précision', 3, 50000, 'Coût total : 3 × 12,45 + 2 × 8,99 = 37,35 + 17,98 = 55,33 $.',
 '{"type":"mcq","question":"Marc achète 3 livres à 12,45 $ et 2 revues à 8,99 $. Quel est le coût total ?","options":["54,33 $","55,33 $","56,33 $","57,33 $"],"answer":"55,33 $"}'),

('Comparer expressions fractionnaires', 3, 45000, '2/3 + 1/4 = 8/12 + 3/12 = 11/12. Et 3/4 = 9/12. Donc 11/12 > 9/12.',
 '{"type":"mcq","question":"Lequel est plus grand : 2/3 + 1/4 ou 3/4 ?","options":["3/4","2/3 + 1/4","Ils sont égaux","Impossible à dire"],"answer":"2/3 + 1/4"}'),

('Problème partage inégal', 3, 50000, 'Total = 5+3 = 8 parts. Pierre : 5/8 × 96 = 60 $. Marie : 3/8 × 96 = 36 $.',
 '{"type":"mcq","question":"Pierre et Marie partagent 96 $ dans un ratio 5:3. Combien Pierre reçoit-il ?","options":["50 $","55 $","60 $","65 $"],"answer":"60 $"}'),

('Fraction de fraction complexe', 3, 50000, '(2/3) / (4/9) = 2/3 × 9/4 = 18/12 = 3/2 = 1 1/2.',
 '{"type":"mcq","question":"Calcule : (2/3) ÷ (4/9)","options":["8/27","2/3","3/2","2"],"answer":"3/2"}'),

('Problème pourcentage séquentiel', 3, 55000, 'Première réduction : 200 - 20% = 160 $. Deuxième réduction : 160 - 10% = 144 $. Réduction totale : 200 - 144 = 56 $ = 28%.',
 '{"type":"mcq","question":"Un téléviseur à 200 $ est d''abord réduit de 20%, puis encore de 10%. Quel est le prix final ?","options":["136 $","140 $","144 $","148 $"],"answer":"144 $"}'),

('Addition fractions trois termes', 3, 45000, 'PPCM(2,3,4)=12. 1/2=6/12, 1/3=4/12, 1/4=3/12. Somme : 13/12 = 1 1/12.',
 '{"type":"mcq","question":"Calcule : 1/2 + 1/3 + 1/4","options":["3/9","11/12","13/12","1 1/12"],"answer":"13/12"}'),

('Problème coût unitaire', 3, 45000, 'Prix unitaire : 3,60 ÷ 4 = 0,90 $. Pour 7 items : 7 × 0,90 = 6,30 $.',
 '{"type":"mcq","question":"4 articles coûtent 3,60 $ en tout. Quel est le prix de 7 de ces articles ?","options":["5,90 $","6,00 $","6,30 $","6,60 $"],"answer":"6,30 $"}'),

('Fraction décimale récurrente', 3, 45000, '1/3 = 0,333... La barre au-dessus indique la répétition.',
 '{"type":"mcq","question":"Quelle est la valeur décimale de 1/3 ?","options":["0,3","0,13","0,33","0,333..."],"answer":"0,333..."}'),

('Pourcentage de changement', 3, 50000, 'Variation : (150-120)/120 × 100 = 30/120 × 100 = 25%.',
 '{"type":"mcq","question":"Le prix d''un produit passe de 120 $ à 150 $. Quel est le pourcentage d''augmentation ?","options":["20%","25%","30%","35%"],"answer":"25%"}'),

('Problème distance fraction', 3, 50000, '3/5 du trajet = 120 km. Donc le trajet total = 120 ÷ (3/5) = 120 × 5/3 = 200 km.',
 '{"type":"mcq","question":"Emma a parcouru les 3/5 d''un trajet, soit 120 km. Quelle est la longueur totale du trajet ?","options":["72 km","180 km","200 km","240 km"],"answer":"200 km"}'),

('Operation mixte fractions et decimaux', 3, 50000, '0,5 + 1/4 + 0,75 = 1/2 + 1/4 + 3/4 = 2/4 + 1/4 + 3/4 = 6/4 = 1,5.',
 '{"type":"mcq","question":"Calcule : 0,5 + 1/4 + 0,75","options":["1,25","1,5","1,75","2,0"],"answer":"1,5"}'),

('Problème fraction du temps', 3, 45000, 'Temps de révision : 1/3 de 3h = 1h. Temps de lecture : 1/4 de 3h = 45min. Total utilisé : 1h45min. Temps libre : 3h - 1h45 = 1h15 = 75min.',
 '{"type":"mcq","question":"Un élève a 3 heures. Il consacre 1/3 à réviser et 1/4 à lire. Combien de minutes lui reste-t-il ?","options":["60 min","75 min","90 min","105 min"],"answer":"75 min"}'),

('Problème taux', 3, 50000, 'Vitesse = 225 km ÷ 2,5 h = 90 km/h.',
 '{"type":"mcq","question":"Une voiture parcourt 225 km en 2,5 heures. Quelle est sa vitesse en km/h ?","options":["80 km/h","85 km/h","90 km/h","95 km/h"],"answer":"90 km/h"}'),

('Fraction après opération', 3, 45000, 'Si tu augmentes 3/4 d''un tiers : 3/4 × (1 + 1/3) = 3/4 × 4/3 = 12/12 = 1.',
 '{"type":"mcq","question":"On augmente la fraction 3/4 d''un tiers de sa valeur. Quel est le résultat ?","options":["4/4","3/3","1","7/6"],"answer":"1"}'),

('Comparaison pourcentages', 3, 45000, '15% de 80 = 12. 20% de 55 = 11. Donc 15% de 80 > 20% de 55.',
 '{"type":"mcq","question":"Lequel est plus grand : 15% de 80 ou 20% de 55 ?","options":["15% de 80","20% de 55","Ils sont égaux","Impossible à déterminer"],"answer":"15% de 80"}'),

('Problème superficie fraction', 3, 50000, 'Surface totale : 12 × 8 = 96 m². Jardin : 3/8 × 96 = 36 m².',
 '{"type":"mcq","question":"Un terrain rectangulaire mesure 12 m × 8 m. Les 3/8 du terrain sont réservés au jardin. Quelle est la superficie du jardin ?","options":["28 m²","32 m²","36 m²","40 m²"],"answer":"36 m²"}'),

('Division décimale complexe', 3, 45000, '12,6 ÷ 0,04 = 1260 ÷ 4 = 315.',
 '{"type":"mcq","question":"Calcule : 12,6 ÷ 0,04","options":["31,5","315","3150","0,315"],"answer":"315"}'),

('Problème investissement', 3, 50000, 'Intérêt annuel : 5% de 800 = 40 $. Après 3 ans : 40 × 3 = 120 $. Total : 800 + 120 = 920 $.',
 '{"type":"mcq","question":"On place 800 $ à un taux d''intérêt simple de 5% par an. Quelle somme a-t-on après 3 ans ?","options":["880 $","900 $","920 $","940 $"],"answer":"920 $"}'),

('Equivalence complexe', 3, 45000, '7/8 = 0,875 = 87,5%. Parmi les choix, 87,5% correspond à 7/8.',
 '{"type":"mcq","question":"Laquelle de ces valeurs est équivalente à 7/8 ?","options":["78%","80%","87,5%","88%"],"answer":"87,5%"}'),

('Fraction du périmètre', 3, 50000, 'Périmètre = 4 × 6 = 24 cm. On veut 5/6 × 24 = 20 cm.',
 '{"type":"mcq","question":"Le périmètre d''un carré est 24 cm. Quelle fraction représente 20 cm par rapport au périmètre ?","options":["3/4","4/5","5/6","7/8"],"answer":"5/6"}'),

('Problème économies fractions', 3, 50000, 'Économies semaine 1 : 1/5 × 100 = 20 $. Semaine 2 : 1/4 × 100 = 25 $. Total économisé : 45 $. Reste : 100 - 45 = 55 $.',
 '{"type":"mcq","question":"Lucas a 100 $. La première semaine, il dépense 1/5. La deuxième semaine, il dépense 1/4 du montant initial. Combien lui reste-t-il ?","options":["45 $","50 $","55 $","60 $"],"answer":"55 $"}'),

('Multiplication decimaux trois facteurs', 3, 45000, '0,2 × 0,5 × 0,4 = 0,10 × 0,4 = 0,04.',
 '{"type":"mcq","question":"Calcule : 0,2 × 0,5 × 0,4","options":["0,04","0,4","0,40","4,0"],"answer":"0,04"}'),

('Fractions opération imbriquée', 3, 55000, '(1/2 + 1/3) × (1/4 - 1/6) = (5/6) × (3/12 - 2/12) = (5/6) × (1/12) = 5/72.',
 '{"type":"mcq","question":"Calcule : (1/2 + 1/3) × (1/4 - 1/6)","options":["5/72","1/12","5/6","1/6"],"answer":"5/72"}'),

('Problème de mélange', 3, 50000, 'Récipient A contient 2,4 L de jus. Récipient B contient 1,75 L. On transfère 0,85 L de A à B. Nouveau A : 2,4 - 0,85 = 1,55 L. Nouveau B : 1,75 + 0,85 = 2,60 L.',
 '{"type":"mcq","question":"On transfère 0,85 L du récipient A (2,4 L) vers le récipient B (1,75 L). Combien de litres contient maintenant le récipient B ?","options":["2,50 L","2,60 L","2,65 L","2,75 L"],"answer":"2,60 L"}'),

('Pourcentage inverse complexe', 3, 55000, 'Après hausse de 20% : prix × 1,2 = 144. Prix original = 144 ÷ 1,2 = 120 $.',
 '{"type":"mcq","question":"Après une augmentation de 20%, un article coûte 144 $. Quel était son prix initial ?","options":["115 $","118 $","120 $","124 $"],"answer":"120 $"}'),

('Fraction avec exposant', 3, 50000, '(2/3)² = 4/9.',
 '{"type":"mcq","question":"Calcule : (2/3)²","options":["4/3","4/9","2/9","4/6"],"answer":"4/9"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
