-- ============================================================
-- COMPLÉMENT MATHÉMATIQUES — Partie 1
-- Nombres entiers (+40), Fractions et décimaux (+40), Algèbre (+32)
-- Exécuter dans Supabase → SQL Editor → Run
-- ============================================================

-- ─── NOMBRES ENTIERS (+40) ────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-NE') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Décomposition en facteurs premiers A', 1, 25000, 'On divise par les petits premiers : 2, 3, 5, 7…',
 '{"type":"mcq","question":"Décompose 12 en facteurs premiers.","options":["2 × 6","2² × 3","3 × 4","2 × 2 × 3"],"answer":"2² × 3"}'),

('Pair ou impair — règle', 1, 15000, 'Un nombre est pair si son chiffre des unités est 0, 2, 4, 6 ou 8.',
 '{"type":"mcq","question":"Lequel de ces nombres est impair ?","options":["348","572","613","900"],"answer":"613"}'),

('Valeur absolue', 1, 15000, 'La valeur absolue est la distance à zéro ; elle est toujours positive.',
 '{"type":"mcq","question":"Quelle est la valeur absolue de −15 ?","options":["−15","0","15","150"],"answer":"15"}'),

('Comparaison d entiers négatifs', 1, 15000, 'Sur la droite numérique, les nombres à gauche sont plus petits.',
 '{"type":"mcq","question":"Lequel est le plus petit ?","options":["−2","−8","−1","0"],"answer":"−8"}'),

('Addition d entiers négatifs', 1, 20000, 'Additionner deux négatifs donne un résultat encore plus négatif.',
 '{"type":"mcq","question":"Calcule : (−7) + (−5)","options":["12","2","−2","−12"],"answer":"−12"}'),

('Soustraction d entiers relatifs', 1, 20000, 'Soustraire un négatif revient à additionner sa valeur absolue.',
 '{"type":"mcq","question":"Calcule : 3 − (−4)","options":["−1","1","7","−7"],"answer":"7"}'),

('Multiplication signe positif', 1, 20000, 'Le produit de deux négatifs est positif.',
 '{"type":"mcq","question":"Calcule : (−6) × (−3)","options":["−18","18","−9","9"],"answer":"18"}'),

('Division entiers relatifs', 1, 20000, 'Un négatif divisé par un positif donne un négatif.',
 '{"type":"mcq","question":"Calcule : (−36) ÷ 4","options":["9","−9","−6","6"],"answer":"−9"}'),

('Priorité : parenthèses d abord', 1, 20000, 'Les parenthèses ont la plus haute priorité.',
 '{"type":"mcq","question":"Calcule : (2 + 3) × 4","options":["14","20","24","10"],"answer":"20"}'),

('Puissance de 2', 1, 15000, '2⁵ signifie 2 multiplié par lui-même 5 fois.',
 '{"type":"mcq","question":"Calcule : 2⁵","options":["10","25","32","16"],"answer":"32"}'),

('Ordre croissant', 1, 15000, 'Mettre du plus petit au plus grand.',
 '{"type":"mcq","question":"Quel est l ordre croissant de : 5, −3, 0, −7, 2 ?","options":["−7 < −3 < 0 < 2 < 5","−3 < −7 < 0 < 2 < 5","5 > 2 > 0 > −3 > −7","0 < 2 < 5 < −3 < −7"],"answer":"−7 < −3 < 0 < 2 < 5"}'),

('Multiple ou diviseur', 1, 15000, 'a est diviseur de b si b ÷ a donne un entier.',
 '{"type":"mcq","question":"Lequel est un diviseur de 24 ?","options":["5","7","6","9"],"answer":"6"}'),

('Zéro dans les opérations', 1, 15000, 'Tout nombre multiplié par 0 donne 0.',
 '{"type":"mcq","question":"Calcule : 567 × 0","options":["567","1","0","indéfini"],"answer":"0"}'),

('Nombre opposé', 1, 15000, 'L opposé de n est −n ; leur somme est 0.',
 '{"type":"mcq","question":"Quel est l opposé de −9 ?","options":["9","−9","0","1/9"],"answer":"9"}'),

('Reste de division', 2, 25000, 'Le reste est ce qui reste après la division entière.',
 '{"type":"mcq","question":"Quel est le reste de 47 ÷ 5 ?","options":["2","1","3","4"],"answer":"2"}'),

('PGCD de deux nombres', 2, 30000, 'Le PGCD est le plus grand entier qui divise les deux nombres.',
 '{"type":"mcq","question":"Quel est le PGCD de 18 et 24 ?","options":["3","6","8","12"],"answer":"6"}'),

('PPCM de deux nombres', 2, 30000, 'Le PPCM est le plus petit multiple commun à deux nombres.',
 '{"type":"mcq","question":"Quel est le PPCM de 4 et 6 ?","options":["12","24","8","6"],"answer":"12"}'),

('Carré d un entier', 2, 20000, 'n² = n × n.',
 '{"type":"mcq","question":"Calcule : 13²","options":["169","139","163","196"],"answer":"169"}'),

('Cube d un entier', 2, 25000, 'n³ = n × n × n.',
 '{"type":"mcq","question":"Calcule : 4³","options":["12","48","64","24"],"answer":"64"}'),

('Expression avec puissance', 2, 25000, 'Appliquer les exposants avant les autres opérations.',
 '{"type":"mcq","question":"Calcule : 2³ + 3²","options":["13","17","23","25"],"answer":"17"}'),

('Divisibilité par 3', 2, 20000, 'Un nombre est divisible par 3 si la somme de ses chiffres l est.',
 '{"type":"mcq","question":"Lequel est divisible par 3 ?","options":["124","217","321","415"],"answer":"321"}'),

('Divisibilité par 9', 2, 20000, 'Un nombre est divisible par 9 si la somme de ses chiffres est divisible par 9.',
 '{"type":"mcq","question":"Lequel est divisible par 9 ?","options":["126","135","207","351"],"answer":"351"}'),

('Signe du produit — trois facteurs', 2, 20000, 'Trois négatifs donnent un produit négatif.',
 '{"type":"mcq","question":"Quel est le signe de (−2) × (−3) × (−5) ?","options":["positif","négatif","nul","indéfini"],"answer":"négatif"}'),

('Encadrement entre deux entiers', 2, 20000, 'Trouver les entiers consécutifs qui encadrent une valeur.',
 '{"type":"mcq","question":"Entre quels entiers consécutifs se trouve 38 ÷ 7 ?","options":["4 et 5","5 et 6","6 et 7","7 et 8"],"answer":"5 et 6"}'),

('Arrondi à la dizaine', 2, 20000, 'Si le chiffre des unités ≥ 5, on arrondit à la dizaine supérieure.',
 '{"type":"mcq","question":"Arrondi à la dizaine : 347","options":["300","340","350","400"],"answer":"350"}'),

('Arrondi au centième près', 2, 20000, 'Regarder le chiffre en position millième pour arrondir.',
 '{"type":"mcq","question":"Arrondi à l unité : 18,6","options":["18","19","20","18,5"],"answer":"19"}'),

('Propriété de la multiplication', 2, 25000, 'La distributivité : a(b + c) = ab + ac.',
 '{"type":"mcq","question":"Calcule en utilisant la distributivité : 7 × (10 + 3)","options":["70","73","91","83"],"answer":"91"}'),

('Puissance négative base', 2, 25000, '(−a)² est positif, (−a)³ est négatif.',
 '{"type":"mcq","question":"Calcule : (−4)²","options":["−16","16","−8","8"],"answer":"16"}'),

('Factorisation simple', 2, 30000, 'On cherche le facteur commun et on le met devant la parenthèse.',
 '{"type":"mcq","question":"Factorise : 12 + 8","options":["4(3 + 2)","2(6 + 4)","8(1 + 0,5)","4(3 + 2) ou 2(6 + 4)"],"answer":"4(3 + 2) ou 2(6 + 4)"}'),

('Nombre premier ou non', 2, 25000, 'Un nombre premier n a que 1 et lui-même comme diviseurs.',
 '{"type":"mcq","question":"Lequel est un nombre premier ?","options":["1","15","17","21"],"answer":"17"}'),

('Suite d entiers — terme manquant', 3, 30000, 'Trouver la raison de la suite pour en déduire le terme.',
 '{"type":"mcq","question":"Suite : 3, 6, 12, 24, _. Quel est le terme manquant ?","options":["36","48","30","42"],"answer":"48"}'),

('Problème de partage équitable', 3, 35000, 'Diviser puis vérifier avec le reste.',
 '{"type":"mcq","question":"On répartit 100 billes en parts égales dans 7 sacs. Combien reste-t-il ?","options":["1","2","3","4"],"answer":"2"}'),

('Valeur d une expression entière', 3, 35000, 'Remplacer la variable par sa valeur et calculer.',
 '{"type":"mcq","question":"Si n = −3, calcule n² − n","options":["6","12","−6","9"],"answer":"12"}'),

('Résoudre une inégalité entière', 3, 35000, 'Trouver les entiers vérifiant la condition.',
 '{"type":"mcq","question":"Quels entiers vérifient −2 < x < 3 ?","options":["−1, 0, 1, 2","−2, −1, 0, 1, 2, 3","0, 1, 2","−1, 0, 1, 2, 3"],"answer":"−1, 0, 1, 2"}'),

('Opérations priorité complexe', 3, 35000, 'PEMDAS : puissances, puis ×÷, puis +−.',
 '{"type":"mcq","question":"Calcule : 4 + 3 × 2² − 1","options":["11","15","19","27"],"answer":"15"}'),

('Diviseurs communs', 3, 35000, 'Les diviseurs communs sont les diviseurs du PGCD.',
 '{"type":"mcq","question":"Combien de diviseurs communs ont 12 et 18 ?","options":["2","3","4","6"],"answer":"4"}'),

('Problème — âge entiers', 3, 40000, 'Mettre en équation et résoudre.',
 '{"type":"mcq","question":"Marie a 3 fois l âge de son frère. Dans 4 ans, la somme de leurs âges sera 40. Quel est l âge actuel du frère ?","options":["6","7","8","9"],"answer":"8"}'),

('Décomposition prime composée', 3, 35000, 'Diviser successivement par les premiers.',
 '{"type":"mcq","question":"Décompose 60 en facteurs premiers.","options":["2² × 3 × 5","2 × 3 × 10","4 × 15","2³ × 5"],"answer":"2² × 3 × 5"}'),

('Problème — monnaie', 3, 40000, 'Convertir et calculer avec des entiers.',
 '{"type":"mcq","question":"J ai 5 billets de 20 $ et 3 pièces de 25 ¢. Combien de cents au total ?","options":["10 075 ¢","10 025 ¢","975 ¢","500 ¢"],"answer":"10 075 ¢"}'),

('Algorithme d Euclide', 3, 40000, 'On divise et on remplace jusqu à obtenir un reste nul.',
 '{"type":"mcq","question":"Utilise l algorithme d Euclide : PGCD(48, 18)","options":["3","6","9","18"],"answer":"6"}'),

('Puissance et multiplication', 3, 35000, 'aⁿ × aᵐ = aⁿ⁺ᵐ',
 '{"type":"mcq","question":"Simplifie : 2³ × 2⁴","options":["2¹²","2⁷","4⁷","2⁸"],"answer":"2⁷"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── FRACTIONS ET DÉCIMAUX (+40) ──────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-FD') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Fraction d une collection', 1, 20000, 'La fraction indique quelle partie d un tout on considère.',
 '{"type":"mcq","question":"3/4 de 20 élèves, c est combien d élèves ?","options":["5","10","15","20"],"answer":"15"}'),

('Fraction irréductible', 1, 20000, 'On divise numérateur et dénominateur par leur PGCD.',
 '{"type":"mcq","question":"Quelle fraction est irréductible ?","options":["4/6","6/9","5/7","8/12"],"answer":"5/7"}'),

('Fraction et décimal — conversion simple', 1, 15000, 'Diviser le numérateur par le dénominateur.',
 '{"type":"mcq","question":"Convertis 3/4 en décimal.","options":["0,25","0,50","0,75","1,25"],"answer":"0,75"}'),

('Addition fractions même dénominateur', 1, 20000, 'On additionne les numérateurs en gardant le même dénominateur.',
 '{"type":"mcq","question":"Calcule : 2/7 + 3/7","options":["5/14","5/7","1/7","6/7"],"answer":"5/7"}'),

('Soustraction fractions même dénominateur', 1, 20000, 'On soustrait les numérateurs.',
 '{"type":"mcq","question":"Calcule : 6/9 − 2/9","options":["4/9","4/0","8/9","2/3"],"answer":"4/9"}'),

('Multiplication de fractions', 1, 20000, 'On multiplie les numérateurs ensemble et les dénominateurs ensemble.',
 '{"type":"mcq","question":"Calcule : 2/3 × 3/5","options":["6/15","5/8","2/5","6/8"],"answer":"2/5"}'),

('Division de fractions', 1, 25000, 'Diviser par une fraction = multiplier par son inverse.',
 '{"type":"mcq","question":"Calcule : 4/5 ÷ 2/5","options":["8/25","2","1/2","4/10"],"answer":"2"}'),

('Comparer deux fractions', 1, 20000, 'On ramène au même dénominateur puis on compare les numérateurs.',
 '{"type":"mcq","question":"Laquelle est la plus grande : 3/4 ou 2/3 ?","options":["2/3","3/4","Elles sont égales","Impossible à comparer"],"answer":"3/4"}'),

('Fraction impropre → nombre mixte', 1, 20000, 'On divise le numérateur par le dénominateur.',
 '{"type":"mcq","question":"Convertis 11/4 en nombre mixte.","options":["2 et 3/4","2 et 1/4","3 et 1/4","2 et 2/4"],"answer":"2 et 3/4"}'),

('Nombre mixte → fraction impropre', 1, 20000, 'Partie entière × dénominateur + numérateur.',
 '{"type":"mcq","question":"Convertis 3 et 2/5 en fraction impropre.","options":["12/5","17/5","15/5","8/5"],"answer":"17/5"}'),

('Addition décimaux simples', 1, 15000, 'Aligner les virgules avant d additionner.',
 '{"type":"mcq","question":"Calcule : 2,35 + 1,4","options":["3,75","3,7","3,40","2,49"],"answer":"3,75"}'),

('Soustraction décimaux', 1, 20000, 'Aligner les virgules et soustraire colonne par colonne.',
 '{"type":"mcq","question":"Calcule : 5,00 − 2,37","options":["2,63","3,63","2,73","2,33"],"answer":"2,63"}'),

('Multiplication par 10, 100, 1000', 1, 15000, 'On décale la virgule à droite d autant de zéros.',
 '{"type":"mcq","question":"Calcule : 3,46 × 100","options":["34,6","346","0,346","3 460"],"answer":"346"}'),

('Division par 10, 100', 1, 15000, 'On décale la virgule à gauche d autant de zéros.',
 '{"type":"mcq","question":"Calcule : 47,3 ÷ 10","options":["473","4,73","0,473","4,7"],"answer":"4,73"}'),

('Fraction d un prix', 1, 20000, 'Calculer une fraction d une quantité concrète.',
 '{"type":"mcq","question":"Un vêtement coûte 80 $. Il est en solde à 3/4 du prix. Quel est le prix soldé ?","options":["20 $","40 $","60 $","75 $"],"answer":"60 $"}'),

('Addition fractions dénominateurs différents', 2, 30000, 'On cherche le PPCM des dénominateurs.',
 '{"type":"mcq","question":"Calcule : 1/3 + 1/4","options":["2/7","7/12","1/12","5/12"],"answer":"7/12"}'),

('Soustraction fractions dén. différents', 2, 30000, 'On cherche le dénominateur commun.',
 '{"type":"mcq","question":"Calcule : 3/4 − 1/6","options":["2/3","7/12","1/2","11/12"],"answer":"7/12"}'),

('Fraction d un périmètre', 2, 30000, 'Calculer une fraction d une mesure géométrique.',
 '{"type":"mcq","question":"Un carré a un périmètre de 36 cm. Quelle fraction du périmètre représente un côté ?","options":["1/2","1/3","1/4","1/6"],"answer":"1/4"}'),

('Décimal récurrent simple', 2, 25000, '1/3 = 0,333… — la barre indique la répétition.',
 '{"type":"mcq","question":"Quelle fraction donne 0,666… ?","options":["1/3","2/3","6/10","3/5"],"answer":"2/3"}'),

('Pourcentage — fraction de 100', 2, 25000, 'p % = p/100',
 '{"type":"mcq","question":"35 % de 200, c est combien ?","options":["35","70","65","700"],"answer":"70"}'),

('Taux de réduction', 2, 30000, 'Réduction = prix initial × taux de réduction.',
 '{"type":"mcq","question":"Un article à 120 $ est réduit de 25 %. Quel est le nouveau prix ?","options":["30 $","90 $","95 $","100 $"],"answer":"90 $"}'),

('Fraction et aire', 2, 30000, 'Calculer quelle fraction d une surface est colorée.',
 '{"type":"mcq","question":"Sur 24 cases, 6 sont colorées. Quelle fraction irréductible représentent-elles ?","options":["6/24","1/4","1/3","2/8"],"answer":"1/4"}'),

('Multiplication décimaux', 2, 30000, 'On multiplie sans virgule puis on replace la virgule.',
 '{"type":"mcq","question":"Calcule : 1,2 × 0,5","options":["0,06","0,6","6","1,7"],"answer":"0,6"}'),

('Division décimaux', 2, 30000, 'On peut multiplier dividende et diviseur par la même puissance de 10.',
 '{"type":"mcq","question":"Calcule : 4,5 ÷ 0,9","options":["0,5","4","5","50"],"answer":"5"}'),

('Ordre de grandeur fraction', 2, 25000, 'Une fraction entre 0 et 1 est inférieure à 1.',
 '{"type":"mcq","question":"Laquelle est la plus proche de 1 ?","options":["4/5","7/9","11/12","5/6"],"answer":"11/12"}'),

('Fraction et proportion', 2, 30000, 'Si a/b = c/d, alors a × d = b × c.',
 '{"type":"mcq","question":"Si 3/4 = x/20, quelle est la valeur de x ?","options":["12","15","5","16"],"answer":"15"}'),

('Taux de TVQ approximatif', 2, 35000, 'TVQ ≈ 9,975 % ≈ 10 % pour une estimation rapide.',
 '{"type":"mcq","question":"Estime la TVQ (≈10 %) sur un achat de 85 $.","options":["7 $","8,50 $","8 $","9 $"],"answer":"8,50 $"}'),

('Suite de fractions croissante', 2, 30000, 'Comparer successivement les fractions.',
 '{"type":"mcq","question":"Ordonne du plus petit au plus grand : 2/3, 3/5, 7/10","options":["2/3 < 3/5 < 7/10","3/5 < 2/3 < 7/10","7/10 < 3/5 < 2/3","3/5 < 7/10 < 2/3"],"answer":"3/5 < 2/3 < 7/10"}'),

('Fraction → pourcentage', 2, 25000, 'Multiplier la fraction par 100.',
 '{"type":"mcq","question":"Convertis 3/8 en pourcentage.","options":["30 %","35 %","37,5 %","38 %"],"answer":"37,5 %"}'),

('Problème fractions — recette', 3, 40000, 'Adapter les quantités proportionnellement.',
 '{"type":"mcq","question":"Une recette pour 4 personnes demande 2/3 tasse de farine. Pour 6 personnes, combien faut-il de tasses ?","options":["1","4/3","3/2","2"],"answer":"1"}'),

('Problème distance et fraction', 3, 40000, 'Calculer une fraction de distance parcourue.',
 '{"type":"mcq","question":"Anna a parcouru 3/5 d un trajet de 45 km. Combien de km lui reste-t-il ?","options":["18 km","27 km","15 km","30 km"],"answer":"18 km"}'),

('Expression avec fractions', 3, 40000, 'Effectuer plusieurs opérations de suite sur des fractions.',
 '{"type":"mcq","question":"Calcule : 1/2 + 1/3 × 3/4","options":["3/4","5/8","7/8","1"],"answer":"3/4"}'),

('Fractions et entiers négatifs', 3, 40000, 'Combiner fractions et entiers relatifs.',
 '{"type":"mcq","question":"Calcule : −1/2 + 3/4","options":["−1/4","1/4","1/2","−1/2"],"answer":"1/4"}'),

('Partie entière d une fraction', 3, 35000, 'La partie entière est le quotient entier.',
 '{"type":"mcq","question":"Quelle est la partie entière de 17/5 ?","options":["2","3","4","5"],"answer":"3"}'),

('Densité des rationnels', 3, 40000, 'Entre deux fractions, il y en a toujours une autre.',
 '{"type":"mcq","question":"Trouve une fraction entre 1/3 et 1/2.","options":["2/5","3/7","5/12","Toutes ces réponses"],"answer":"Toutes ces réponses"}'),

('Encadrement décimal', 3, 35000, 'Arrondir par défaut et par excès.',
 '{"type":"mcq","question":"Encadre 0,347 entre deux centièmes consécutifs.","options":["0,33 < 0,347 < 0,34","0,34 < 0,347 < 0,35","0,3 < 0,347 < 0,4","0,347 < 0,35 < 0,36"],"answer":"0,34 < 0,347 < 0,35"}'),

('Taux de change', 3, 40000, 'Multiplier ou diviser selon le sens de la conversion.',
 '{"type":"mcq","question":"1 USD = 1,35 CAD. Combien de CAD pour 40 USD ?","options":["29,60 CAD","54 CAD","40 CAD","135 CAD"],"answer":"54 CAD"}'),

('Problème combiné fraction-décimal', 3, 45000, 'Convertir pour travailler avec la même représentation.',
 '{"type":"mcq","question":"Calcule : 0,5 + 1/4 + 3/8","options":["1","1,125","1,875","1,5"],"answer":"1,125"}'),

('Fraction d une somme d argent', 3, 40000, 'Calculer successivement deux fractions.',
 '{"type":"mcq","question":"Paul dépense 1/3 de ses 90 $ en livres et 1/5 du reste en collations. Combien dépense-t-il en collations ?","options":["6 $","10 $","12 $","18 $"],"answer":"12 $"}'),

('Rapport et fraction', 3, 40000, 'Un rapport a:b correspond à la fraction a/(a+b).',
 '{"type":"mcq","question":"Dans un groupe, le rapport filles:garçons est 3:2. Quelle fraction sont des filles ?","options":["3/2","2/5","3/5","2/3"],"answer":"3/5"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── ALGÈBRE (+32) ────────────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-ALG') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Variable — définition', 1, 15000, 'Une variable est une lettre qui représente une valeur inconnue.',
 '{"type":"mcq","question":"Dans l expression 3x + 5, quelle est la variable ?","options":["3","5","x","3x"],"answer":"x"}'),

('Évaluer une expression — substitution', 1, 20000, 'On remplace la lettre par sa valeur et on calcule.',
 '{"type":"mcq","question":"Si x = 4, calcule 2x + 3.","options":["9","11","14","24"],"answer":"11"}'),

('Terme et coefficient', 1, 15000, 'Dans 5y, le coefficient est 5 et la variable est y.',
 '{"type":"mcq","question":"Quel est le coefficient dans −7n ?","options":["n","7","−7","−1"],"answer":"−7"}'),

('Addition de termes semblables', 1, 20000, 'On additionne uniquement les termes qui ont la même variable.',
 '{"type":"mcq","question":"Simplifie : 4x + 3x","options":["7x²","7x","12x","7"],"answer":"7x"}'),

('Soustraction de termes semblables', 1, 20000, 'On soustrait les coefficients des termes semblables.',
 '{"type":"mcq","question":"Simplifie : 9a − 4a","options":["5a","5","5a²","13a"],"answer":"5a"}'),

('Termes non semblables', 1, 15000, '3x et 3y ne peuvent pas être combinés.',
 '{"type":"mcq","question":"Peut-on simplifier 5x + 3y ?","options":["Oui, 8xy","Oui, 8x","Non","Oui, 2x"],"answer":"Non"}'),

('Équation — vrai ou faux', 1, 15000, 'Substituer et vérifier si les deux membres sont égaux.',
 '{"type":"mcq","question":"x = 3 est-il solution de 2x − 1 = 5 ?","options":["Oui","Non","Impossible à dire","Parfois"],"answer":"Oui"}'),

('Résoudre — addition inverse', 1, 20000, 'Pour isoler x, on effectue l opération inverse.',
 '{"type":"mcq","question":"Résous : x + 7 = 15","options":["x = 8","x = 22","x = 7","x = 15"],"answer":"x = 8"}'),

('Résoudre — soustraction inverse', 1, 20000, 'On additionne le même nombre des deux côtés.',
 '{"type":"mcq","question":"Résous : x − 4 = 9","options":["x = 5","x = 13","x = −5","x = 36"],"answer":"x = 13"}'),

('Résoudre — multiplication inverse', 1, 20000, 'On divise les deux membres par le coefficient.',
 '{"type":"mcq","question":"Résous : 5x = 30","options":["x = 6","x = 25","x = 150","x = 5"],"answer":"x = 6"}'),

('Résoudre — division inverse', 1, 20000, 'On multiplie les deux membres par le diviseur.',
 '{"type":"mcq","question":"Résous : x ÷ 3 = 7","options":["x = 21","x = 10","x = 4","x = 3"],"answer":"x = 21"}'),

('Distribuer un facteur', 2, 25000, 'a(b + c) = ab + ac',
 '{"type":"mcq","question":"Développe : 3(x + 4)","options":["3x + 4","3x + 12","x + 12","3x + 7"],"answer":"3x + 12"}'),

('Développer et réduire', 2, 30000, 'On distribue puis on regroupe les termes semblables.',
 '{"type":"mcq","question":"Développe et réduis : 2(x + 3) + 4x","options":["6x + 6","6x + 3","2x + 10","8x"],"answer":"6x + 6"}'),

('Équation à deux étapes', 2, 30000, 'On effectue d abord l addition/soustraction, puis la division.',
 '{"type":"mcq","question":"Résous : 2x + 5 = 13","options":["x = 4","x = 9","x = 3","x = 8"],"answer":"x = 4"}'),

('Équation — termes de chaque côté', 2, 35000, 'On regroupe les x d un côté et les constantes de l autre.',
 '{"type":"mcq","question":"Résous : 3x + 2 = x + 10","options":["x = 4","x = 3","x = 6","x = 8"],"answer":"x = 4"}'),

('Inégalité simple', 2, 25000, 'On résout comme une équation, mais on garde le signe d inégalité.',
 '{"type":"mcq","question":"Résous : x + 3 > 7","options":["x > 4","x < 4","x > 10","x > −4"],"answer":"x > 4"}'),

('Vérifier une solution', 2, 20000, 'On substitue la valeur trouvée dans l équation originale.',
 '{"type":"mcq","question":"Est-ce que x = 5 vérifie 3x − 2 = 13 ?","options":["Oui","Non","Parfois","Impossible"],"answer":"Oui"}'),

('Table de valeurs', 2, 30000, 'On substitue chaque valeur de x dans l expression.',
 '{"type":"mcq","question":"Pour f(x) = 2x − 1, quelle est la valeur quand x = 3 ?","options":["5","6","7","8"],"answer":"5"}'),

('Expression algébrique — traduction', 2, 25000, 'Traduire une phrase en expression algébrique.',
 '{"type":"mcq","question":"Le double d un nombre diminué de 3 : comment l écrire ?","options":["2 + n − 3","2n − 3","2(n − 3)","n ÷ 2 − 3"],"answer":"2n − 3"}'),

('Équation avec parenthèses', 2, 35000, 'On développe les parenthèses avant d isoler x.',
 '{"type":"mcq","question":"Résous : 2(x + 1) = 10","options":["x = 4","x = 5","x = 3","x = 6"],"answer":"x = 4"}'),

('Équation avec négatifs', 2, 35000, 'Attention aux signes en déplaçant les termes.',
 '{"type":"mcq","question":"Résous : −3x = 12","options":["x = −4","x = 4","x = −3","x = 36"],"answer":"x = −4"}'),

('Substitution double variable', 2, 30000, 'Remplacer deux variables par leurs valeurs.',
 '{"type":"mcq","question":"Si a = 2 et b = −3, calcule 2a − b.","options":["1","7","−7","−1"],"answer":"7"}'),

('Problème — âge algébrique', 3, 40000, 'Poser une variable et écrire l équation.',
 '{"type":"mcq","question":"Emma a 5 ans de plus que son frère. La somme de leurs âges est 25. Quel est l âge d Emma ?","options":["10","15","13","18"],"answer":"15"}'),

('Équation fractionnaire simple', 3, 40000, 'Multiplier par le dénominateur pour éliminer la fraction.',
 '{"type":"mcq","question":"Résous : x/3 + 2 = 5","options":["x = 9","x = 3","x = 7","x = 21"],"answer":"x = 9"}'),

('Problème — périmètre', 3, 40000, 'Utiliser la formule du périmètre pour trouver un côté.',
 '{"type":"mcq","question":"Le périmètre d un rectangle est 34 cm. Sa largeur est 7 cm. Quelle est sa longueur ?","options":["10 cm","12 cm","15 cm","20 cm"],"answer":"10 cm"}'),

('Inégalité — multiplication par négatif', 3, 40000, 'Quand on multiplie par un négatif, le sens de l inégalité s inverse.',
 '{"type":"mcq","question":"Résous : −2x < 8","options":["x < −4","x > −4","x < 4","x > 4"],"answer":"x > −4"}'),

('Problème — vitesse et distance', 3, 40000, 'd = vt, donc v = d/t',
 '{"type":"mcq","question":"Un train parcourt 210 km en 3 h. Quelle est sa vitesse ?","options":["60 km/h","70 km/h","63 km/h","75 km/h"],"answer":"70 km/h"}'),

('Équation avec décimaux', 3, 40000, 'On peut multiplier toute l équation par 10 ou 100.',
 '{"type":"mcq","question":"Résous : 0,5x + 1,5 = 4","options":["x = 5","x = 6","x = 4","x = 7"],"answer":"x = 5"}'),

('Expression — valeur numérique', 3, 35000, 'Calculer la valeur d une expression pour x négatif.',
 '{"type":"mcq","question":"Si x = −2, calcule x² − 3x + 1.","options":["11","3","−3","−11"],"answer":"11"}'),

('Deux équations — méthode par substitution', 3, 45000, 'Isoler une variable dans une équation et substituer.',
 '{"type":"mcq","question":"x + y = 8 et x = 3. Quelle est la valeur de y ?","options":["5","11","3","8"],"answer":"5"}'),

('Problème — profit', 3, 40000, 'Profit = Revenus − Coûts.',
 '{"type":"mcq","question":"Un kiosque vend des limonades 2,50 $ chacune et les coûts fixes sont 15 $. Combien de limonades doit-on vendre pour faire un profit de 10 $ ?","options":["10","25","5","13"],"answer":"10"}'),

('Modèle algébrique — croissance', 3, 45000, 'Une relation linéaire peut être modélisée par une équation.',
 '{"type":"mcq","question":"Une plante mesure 5 cm et grandit de 2 cm/semaine. Après n semaines : h = 5 + 2n. Après 6 semaines, quelle est la hauteur ?","options":["12 cm","17 cm","11 cm","16 cm"],"answer":"17 cm"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
