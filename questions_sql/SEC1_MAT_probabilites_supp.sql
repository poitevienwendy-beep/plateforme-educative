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
