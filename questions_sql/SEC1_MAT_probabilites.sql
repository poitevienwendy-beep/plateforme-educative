-- ============================================================
-- BANQUE DE QUESTIONS — Probabilités (Sec. 1, Mathématiques)
-- PFEQ-MAT-SEC1-PROB | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-PROB') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Notions de base (34 questions) ─────────────────────────

('Probabilité simple dé', 1, 20000, 'P(6) = nombre de cas favorables ÷ nombre de cas totaux = 1 ÷ 6.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un 6 ?","options":["1/3","1/4","1/5","1/6"],"answer":"1/6"}'),

('Probabilité pile', 1, 20000, 'Une pièce de monnaie a 2 faces. P(pile) = 1/2.',
 '{"type":"mcq","question":"On lance une pièce de monnaie équilibrée. Quelle est la probabilité d''obtenir pile ?","options":["1/4","1/3","1/2","2/3"],"answer":"1/2"}'),

('Événement certain', 1, 15000, 'La probabilité d''un événement certain est toujours 1 (ou 100%).',
 '{"type":"mcq","question":"Quelle est la probabilité de piger un nombre entre 1 et 6 en lançant un dé à 6 faces ?","options":["0","1/6","1/2","1"],"answer":"1"}'),

('Événement impossible', 1, 15000, 'La probabilité d''un événement impossible est toujours 0.',
 '{"type":"mcq","question":"Quelle est la probabilité d''obtenir un 7 en lançant un dé standard à 6 faces ?","options":["0","1/7","1/6","7/6"],"answer":"0"}'),

('Probabilité complémentaire', 1, 25000, 'P(non-A) = 1 - P(A) = 1 - 1/4 = 3/4.',
 '{"type":"mcq","question":"La probabilité de gagner un jeu est 1/4. Quelle est la probabilité de NE PAS gagner ?","options":["1/4","1/2","3/4","4/4"],"answer":"3/4"}'),

('Espace échantillonnal', 1, 20000, 'L''espace échantillonnal d''un dé est {1, 2, 3, 4, 5, 6} — l''ensemble de tous les résultats possibles.',
 '{"type":"mcq","question":"Quel est l''espace échantillonnal d''un dé à 6 faces ?","options":["{1, 2, 3}","{1, 2, 3, 4, 5, 6}","{pair, impair}","{petit, grand}"],"answer":"{1, 2, 3, 4, 5, 6}"}'),

('Probabilité nombre pair dé', 1, 20000, 'Nombres pairs sur un dé : {2, 4, 6} → 3 résultats favorables. P(pair) = 3/6 = 1/2.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un nombre pair ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/2"}'),

('Probabilité bille sac', 1, 20000, 'Sac : 3 rouges, 2 bleues, 5 vertes = 10 billes. P(rouge) = 3/10.',
 '{"type":"mcq","question":"Un sac contient 3 billes rouges, 2 bleues et 5 vertes. Quelle est la probabilité de piger une bille rouge ?","options":["1/3","3/10","3/5","1/2"],"answer":"3/10"}'),

('Probabilité en pourcentage', 1, 20000, 'P = 2/5 = 0,4 = 40%.',
 '{"type":"mcq","question":"Une probabilité de 2/5 correspond à quel pourcentage ?","options":["20%","25%","40%","50%"],"answer":"40%"}'),

('Probabilité lettre voyelle', 1, 20000, 'Le mot PROBABILITE a les voyelles : O, A, I, I, E = 5 voyelles sur 13 lettres... Utilisons CLASSE: C,L,A,S,S,E → voyelles: A, E → 2/6 = 1/3.',
 '{"type":"mcq","question":"On tire au sort une lettre du mot CLASSE. Quelle est la probabilité d''obtenir une voyelle (A ou E) ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/3"}'),

('Probabilité carte rouge jeu', 1, 20000, 'Un jeu de 52 cartes a 26 cartes rouges (cœurs et carreaux). P(rouge) = 26/52 = 1/2.',
 '{"type":"mcq","question":"On tire une carte d''un jeu de 52 cartes. Quelle est la probabilité d''obtenir une carte rouge ?","options":["1/4","1/3","1/2","2/3"],"answer":"1/2"}'),

('Probabilité carte cœur', 1, 20000, 'Il y a 13 cœurs dans un jeu de 52 cartes. P(cœur) = 13/52 = 1/4.',
 '{"type":"mcq","question":"On tire une carte d''un jeu de 52 cartes. Quelle est la probabilité d''obtenir un cœur ?","options":["1/13","1/4","1/3","1/2"],"answer":"1/4"}'),

('Événements mutuellement exclusifs', 1, 25000, 'Deux événements sont mutuellement exclusifs s''ils ne peuvent pas se produire en même temps. Ex: obtenir 3 ET 5 avec un seul dé.',
 '{"type":"mcq","question":"Lesquels de ces événements sont mutuellement exclusifs lors d''un lancer de dé ?","options":["Obtenir un nombre pair ET un 4","Obtenir un 3 ET un 5","Obtenir un nombre pair ET un 2","Obtenir un 1 ET un nombre impair"],"answer":"Obtenir un 3 ET un 5"}'),

('Probabilité expérimentale', 1, 25000, 'Probabilité expérimentale = nombre de succès ÷ nombre d''essais = 15 ÷ 50 = 0,3 = 3/10.',
 '{"type":"mcq","question":"On lance un dé 50 fois et on obtient un 6 exactement 15 fois. Quelle est la probabilité expérimentale d''obtenir un 6 ?","options":["1/6","3/10","6/50","1/3"],"answer":"3/10"}'),

('Probabilité théorique vs expérimentale', 1, 25000, 'Avec plus d''essais, la probabilité expérimentale se rapproche de la probabilité théorique (loi des grands nombres).',
 '{"type":"mcq","question":"Qu''arrive-t-il à la probabilité expérimentale lorsqu''on répète l''expérience un très grand nombre de fois ?","options":["Elle reste toujours la même","Elle s''éloigne de la valeur théorique","Elle se rapproche de la probabilité théorique","Elle devient toujours égale à 1"],"answer":"Elle se rapproche de la probabilité théorique"}'),

('Probabilité nombre inférieur à 3', 1, 20000, 'Nombres < 3 sur un dé : {1, 2} → P = 2/6 = 1/3.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un nombre strictement inférieur à 3 ?","options":["1/6","1/4","1/3","1/2"],"answer":"1/3"}'),

('Probabilité nombre supérieur à 4', 1, 20000, 'Nombres > 4 sur un dé : {5, 6} → P = 2/6 = 1/3.',
 '{"type":"mcq","question":"On lance un dé à 6 faces. Quelle est la probabilité d''obtenir un nombre supérieur à 4 ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/3"}'),

('Fractions et probabilités', 1, 20000, 'P = 4/8 = 1/2. Il faut simplifier la fraction.',
 '{"type":"mcq","question":"Un sac a 8 jetons numérotés de 1 à 8. On en tire un. Quelle est la probabilité d''obtenir un nombre pair (2, 4, 6, 8) ?","options":["1/8","1/4","3/8","1/2"],"answer":"1/2"}'),

('Arbre de probabilité lecture', 1, 25000, 'Un arbre de probabilité liste toutes les issues possibles d''une expérience à plusieurs étapes.',
 '{"type":"mcq","question":"On lance une pièce 2 fois. Combien y a-t-il d''issues possibles dans l''arbre de probabilité ?","options":["2","3","4","6"],"answer":"4"}'),

('Notation probabilité', 1, 15000, 'P(A) représente la probabilité de l''événement A. Elle est toujours comprise entre 0 et 1.',
 '{"type":"mcq","question":"Laquelle de ces valeurs peut représenter une probabilité ?","options":["-0,5","1,5","0,75","5/4"],"answer":"0,75"}'),

('Probabilité as jeu cartes', 1, 20000, 'Il y a 4 as dans un jeu de 52 cartes. P(as) = 4/52 = 1/13.',
 '{"type":"mcq","question":"On tire une carte au hasard d''un jeu de 52 cartes. Quelle est la probabilité d''obtenir un as ?","options":["1/4","1/13","1/52","4/13"],"answer":"1/13"}'),

('Compter issues dé coloré', 1, 20000, 'Dé avec faces : 2 rouges, 3 bleues, 1 verte. P(bleue) = 3/6 = 1/2.',
 '{"type":"mcq","question":"Un dé a 2 faces rouges, 3 bleues et 1 verte. Quelle est la probabilité d''obtenir une face bleue ?","options":["1/6","1/3","1/2","2/3"],"answer":"1/2"}'),

('Probabilité et équiprobabilité', 1, 20000, 'Des événements équiprobables ont tous la même probabilité. Sur un dé standard, chaque face a P = 1/6.',
 '{"type":"mcq","question":"Sur un dé standard équilibré, quelle est la probabilité de chaque face ?","options":["1/3","1/5","1/6","1/12"],"answer":"1/6"}'),

('Probabilité événement contraire', 1, 20000, 'P(ne pas piger de bille verte) = 1 - P(verte) = 1 - 5/12 = 7/12.',
 '{"type":"mcq","question":"Un sac contient 5 billes vertes et 7 billes d''autres couleurs. P(verte) = 5/12. Quelle est P(pas verte) ?","options":["5/12","6/12","7/12","1/12"],"answer":"7/12"}'),

('Résultat certain dé', 1, 15000, 'P(pair ou impair) = P(tous les résultats) = 1 car tout nombre est soit pair soit impair.',
 '{"type":"mcq","question":"On lance un dé. Quelle est la probabilité d''obtenir un nombre pair OU impair ?","options":["1/2","2/3","5/6","1"],"answer":"1"}'),

('Jeu de cartes figurer', 1, 20000, 'Figures : valet, dame, roi = 3 figures × 4 couleurs = 12. P(figure) = 12/52 = 3/13.',
 '{"type":"mcq","question":"On tire une carte d''un jeu de 52. Quelle est la probabilité d''obtenir une figure (valet, dame ou roi) ?","options":["1/13","3/13","3/52","4/13"],"answer":"3/13"}'),

('Probabilité tirages billes 2', 1, 20000, 'Sac : 6 rouges, 4 bleues = 10. P(bleue) = 4/10 = 2/5.',
 '{"type":"mcq","question":"Un sac contient 6 billes rouges et 4 billes bleues. Quelle est la probabilité de piger une bille bleue ?","options":["1/4","2/5","4/6","1/2"],"answer":"2/5"}'),

('Probabilité > 0 et < 1', 1, 20000, 'Toute probabilité est entre 0 (impossible) et 1 (certain). Une P de 2 est impossible.',
 '{"type":"mcq","question":"Laquelle de ces probabilités est impossible ?","options":["0","0,5","0,99","2"],"answer":"2"}'),

('Tirage sans remise concept', 1, 25000, 'Tirage sans remise : l''objet tiré n''est pas remis. La probabilité change à chaque tirage.',
 '{"type":"mcq","question":"On tire une bille d''un sac de 5 sans la remettre. On tire ensuite une 2e. Qu''arrive-t-il à la probabilité du 2e tirage ?","options":["Elle reste identique","Elle change car il y a maintenant 4 billes","Elle devient 0","Elle double"],"answer":"Elle change car il y a maintenant 4 billes"}'),

('Probabilité nombre multiple', 1, 20000, 'Multiples de 3 dans {1,...,12} : 3, 6, 9, 12 → 4 nombres. P = 4/12 = 1/3.',
 '{"type":"mcq","question":"On tire un nombre entier au hasard de 1 à 12. Quelle est la probabilité d''obtenir un multiple de 3 ?","options":["1/4","1/3","1/2","3/12"],"answer":"1/3"}'),

('Somme probabilités complémentaires', 1, 20000, 'P(A) + P(A'') = 1 toujours. Si P(pluie) = 0,3 alors P(pas de pluie) = 0,7.',
 '{"type":"mcq","question":"La probabilité qu''il pleuve demain est 0,3. Quelle est la probabilité qu''il ne pleuve pas ?","options":["0,3","0,5","0,6","0,7"],"answer":"0,7"}'),

('Probabilité multiple de 2 ou 3', 1, 25000, 'Sur {1,...,6}: multiples de 2: {2,4,6}, multiples de 3: {3,6}. Union: {2,3,4,6} = 4 résultats. P = 4/6 = 2/3.',
 '{"type":"mcq","question":"On lance un dé. Quelle est la probabilité d''obtenir un multiple de 2 OU un multiple de 3 ?","options":["1/2","2/3","3/4","5/6"],"answer":"2/3"}'),

('Probabilité chiffre spécifique', 1, 20000, 'On choisit un chiffre de 1 à 10. P(> 7) = P(8, 9, 10) = 3/10.',
 '{"type":"mcq","question":"On choisit au hasard un entier de 1 à 10. Quelle est la probabilité d''obtenir un nombre supérieur à 7 ?","options":["1/10","3/10","7/10","3/7"],"answer":"3/10"}'),

-- ── DIFFICULTÉ 2 — Applications et combinaisons (33 questions) ────────────

('Probabilité deux événements indépendants', 2, 35000, 'Événements indépendants: P(A et B) = P(A) × P(B) = 1/2 × 1/6 = 1/12.',
 '{"type":"mcq","question":"On lance une pièce ET un dé. Quelle est la probabilité d''obtenir pile ET un 3 ?","options":["1/12","1/6","1/3","1/2"],"answer":"1/12"}'),

('Probabilité deux lancers dé', 2, 35000, 'P(6 et 6) = 1/6 × 1/6 = 1/36.',
 '{"type":"mcq","question":"On lance un dé deux fois. Quelle est la probabilité d''obtenir un 6 aux DEUX lancers ?","options":["1/36","2/36","1/6","1/12"],"answer":"1/36"}'),

('Dénombrement tableau', 2, 35000, 'Tableau 2D : 3 choix de shirts × 2 choix de pantalons = 6 tenues possibles.',
 '{"type":"mcq","question":"Un enfant a 3 chemises et 2 pantalons. Combien de tenues différentes peut-il former ?","options":["2","3","5","6"],"answer":"6"}'),

('Principe de multiplication', 2, 30000, 'Nombre d''issues = 4 × 3 × 2 = 24 (principe de multiplication).',
 '{"type":"mcq","question":"Un code a 3 chiffres. Le 1er peut être 1,2,3,4 ; le 2e peut être 1,2,3 ; le 3e peut être 1,2. Combien de codes différents existent ?","options":["9","12","18","24"],"answer":"24"}'),

('Probabilité union événements exclusifs', 2, 35000, 'P(A ou B) = P(A) + P(B) si A et B sont mutuellement exclusifs. P(2 ou 3) = 1/6 + 1/6 = 2/6 = 1/3.',
 '{"type":"mcq","question":"On lance un dé. Quelle est la probabilité d''obtenir un 2 OU un 3 ?","options":["1/6","1/4","1/3","1/2"],"answer":"1/3"}'),

('Probabilité conditionnelle introductive', 2, 40000, 'Sac: 5 rouges, 3 bleues = 8. On tire rouge (sans remise): il reste 4 rouges et 3 bleues = 7. P(rouge ensuite) = 4/7.',
 '{"type":"mcq","question":"Un sac contient 5 billes rouges et 3 bleues. On tire une rouge et on ne la remet pas. Quelle est la probabilité de tirer une rouge ensuite ?","options":["4/7","5/8","4/8","5/7"],"answer":"4/7"}'),

('Arbre probabilité calcul', 2, 40000, 'P(pile-pile) = 1/2 × 1/2 = 1/4. P(pile-face) = 1/4. P(face-pile) = 1/4. P(face-face) = 1/4.',
 '{"type":"mcq","question":"On lance une pièce 2 fois. Quelle est la probabilité d''obtenir exactement une pile et une face (dans n''importe quel ordre) ?","options":["1/4","1/3","1/2","3/4"],"answer":"1/2"}'),

('Probabilité union générale', 2, 40000, 'P(A ou B) = P(A) + P(B) - P(A et B). P(pair ou > 4) = 3/6 + 2/6 - 1/6 = 4/6 = 2/3.',
 '{"type":"mcq","question":"On lance un dé. A = obtenir un pair, B = obtenir > 4. Quelle est la probabilité de A OU B ?","options":["1/2","2/3","5/6","1"],"answer":"2/3"}'),

('Simulation probabiliste', 2, 35000, 'La simulation est utile quand le calcul théorique est difficile. Plus le nombre de simulations est grand, plus le résultat est fiable.',
 '{"type":"mcq","question":"On simule 10 000 lancers d''une pièce équilibrée. Combien de fois devrait-on approximativement obtenir pile ?","options":["2 500","5 000","7 500","10 000"],"answer":"5 000"}'),

('Espérance mathématique', 2, 40000, 'Espérance = Σ (valeur × probabilité). E = 1×(1/6) + 2×(1/6) + ... + 6×(1/6) = 21/6 = 3,5.',
 '{"type":"mcq","question":"On lance un dé équilibré. Quelle est l''espérance mathématique (valeur moyenne attendue) ?","options":["3","3,5","4","21"],"answer":"3,5"}'),

('Dénombrement avec répétition', 2, 35000, 'Code à 4 chiffres (0-9 avec répétition): 10 × 10 × 10 × 10 = 10 000 codes possibles.',
 '{"type":"mcq","question":"Un NIP à 4 chiffres utilise des chiffres de 0 à 9 (répétition permise). Combien de NIP différents existent ?","options":["40","1 000","5 040","10 000"],"answer":"10 000"}'),

('Probabilité trois lancers', 2, 40000, 'P(3 six d''affilée) = (1/6)³ = 1/216.',
 '{"type":"mcq","question":"On lance un dé 3 fois. Quelle est la probabilité d''obtenir un 6 les trois fois ?","options":["1/6","1/18","1/36","1/216"],"answer":"1/216"}'),

('Probabilité au moins un', 2, 40000, 'P(au moins un 6) = 1 - P(aucun 6) = 1 - (5/6)² = 1 - 25/36 = 11/36.',
 '{"type":"mcq","question":"On lance un dé deux fois. Quelle est la probabilité d''obtenir AU MOINS un 6 ?","options":["1/36","10/36","11/36","12/36"],"answer":"11/36"}'),

('Permutations arrangments simples', 2, 40000, 'Arrangements de 3 personnes parmi 5: P(5,3) = 5×4×3 = 60.',
 '{"type":"mcq","question":"De combien de façons peut-on choisir 3 personnes parmi 5 et les arranger en ligne (l''ordre compte) ?","options":["10","15","60","120"],"answer":"60"}'),

('Combinaisons intro', 2, 40000, 'Comité de 2 parmi 5 (ordre ne compte pas): C(5,2) = 5×4 ÷ (2×1) = 10.',
 '{"type":"mcq","question":"De combien de façons peut-on choisir un comité de 2 personnes parmi 5 (l''ordre ne compte pas) ?","options":["5","10","20","25"],"answer":"10"}'),

('Jeu équitable', 2, 35000, 'Un jeu est équitable si l''espérance = 0, c''est-à-dire si on ne gagne ni ne perd en moyenne.',
 '{"type":"mcq","question":"Un jeu coûte 2$. Tu gagnes 6$ si tu obtiens un 6 (probabilité 1/6). L''espérance de gain est 6×(1/6) - 2 = 1-2 = -1$. Ce jeu est...","options":["Favorable au joueur","Équitable","Défavorable au joueur","Impossible à analyser"],"answer":"Défavorable au joueur"}'),

('Événements non mutuellement exclusifs', 2, 40000, 'P(pair OU multiple de 3) = P(pair) + P(mult. de 3) - P(pair ET mult. de 3). {2,4,6} + {3,6} - {6} = {2,3,4,6} = 4/6.',
 '{"type":"mcq","question":"On lance un dé. Quelle est la probabilité d''obtenir un nombre pair OU un multiple de 3 ?","options":["3/6","4/6","5/6","6/6"],"answer":"4/6"}'),

('Probabilité conditionnelle formule', 2, 40000, 'P(A|B) = P(A et B) ÷ P(B) = (1/6) ÷ (3/6) = 1/3.',
 '{"type":"mcq","question":"P(A et B) = 1/6 et P(B) = 3/6. Quelle est la probabilité conditionnelle P(A|B) ?","options":["1/18","1/6","1/3","1/2"],"answer":"1/3"}'),

('Événements indépendants vérification', 2, 40000, 'A et B sont indépendants si P(A et B) = P(A) × P(B). Vérifier: 1/4 = 1/2 × 1/2 ✓.',
 '{"type":"mcq","question":"P(A) = 1/2, P(B) = 1/2, P(A et B) = 1/4. Les événements A et B sont-ils indépendants ?","options":["Oui, car P(A et B) = P(A) × P(B)","Non, car P(A et B) ≠ P(A) + P(B)","Oui, car P(A) = P(B)","Non, car les probabilités sont égales"],"answer":"Oui, car P(A et B) = P(A) × P(B)"}'),

('Probabilité boîte chocolats', 2, 35000, 'Boîte: 5 noir, 8 lait, 7 blanc = 20. P(deux chocolats noirs sans remise) = 5/20 × 4/19 = 20/380 = 1/19.',
 '{"type":"mcq","question":"Une boîte contient 5 chocolats noirs, 8 au lait et 7 blancs. On en prend 2 sans remise. Quelle est la probabilité de prendre deux chocolats noirs ?","options":["1/16","1/19","1/20","1/25"],"answer":"1/19"}'),

('Dénombrement chemins', 2, 35000, 'Pour aller de A à B, il y a 3 chemins. De B à C, il y a 4 chemins. Total = 3 × 4 = 12 chemins.',
 '{"type":"mcq","question":"De A à B: 3 routes. De B à C: 4 routes. Combien y a-t-il de chemins différents de A à C en passant par B ?","options":["7","9","12","24"],"answer":"12"}'),

('Simulation biais', 2, 35000, 'Pour simuler un événement avec P = 1/3, on peut utiliser un dé et définir {1, 2} comme succès, {3, 4, 5, 6} comme échec.',
 '{"type":"mcq","question":"On veut simuler un événement de probabilité 1/3 avec un dé. Quelle correspondance utiliser ?","options":["Face 1 = succès","Faces 1 et 2 = succès","Faces 1, 2 et 3 = succès","Toutes les faces paires = succès"],"answer":"Faces 1 et 2 = succès"}'),

('Probabilité dés somme', 2, 40000, 'Lancer 2 dés: 36 issues. Somme = 7: (1,6),(2,5),(3,4),(4,3),(5,2),(6,1) = 6 issues. P = 6/36 = 1/6.',
 '{"type":"mcq","question":"On lance deux dés. Quelle est la probabilité que leur somme soit égale à 7 ?","options":["1/12","1/7","1/6","6/12"],"answer":"1/6"}'),

-- ── DIFFICULTÉ 3 — Problèmes complexes (33 questions) ─────────────────────

('Probabilité conditionnelle problème', 3, 55000, '60% ont un chat, 40% un chien, 20% les deux. P(chat|chien) = P(chat et chien)/P(chien) = 0,20/0,40 = 0,5 = 50%.',
 '{"type":"mcq","question":"60% des élèves ont un chat, 40% ont un chien et 20% ont les deux. Si un élève a un chien, quelle est la probabilité qu''il ait aussi un chat ?","options":["20%","30%","50%","60%"],"answer":"50%"}'),

('Problème urn boules', 3, 55000, 'Urne A: 3 rouges, 2 bleues. Urne B: 1 rouge, 4 bleues. P(rouge | urne A) × P(A) + P(rouge | urne B) × P(B) = 3/5 × 1/2 + 1/5 × 1/2 = 0,3 + 0,1 = 0,4.',
 '{"type":"mcq","question":"On choisit au hasard une urne parmi A (3 rouges, 2 bleues) et B (1 rouge, 4 bleues), puis on tire une bille. Quelle est la probabilité qu''elle soit rouge ?","options":["0,3","0,4","0,5","0,6"],"answer":"0,4"}'),

('Problème paradoxe Monty Hall simplifié', 3, 60000, 'Dans 2 cas sur 3, le premier choix est mauvais. Si on change de porte, on gagne dans ces 2 cas. P(gagner en changeant) = 2/3.',
 '{"type":"mcq","question":"Dans un jeu, 3 portes cachent 2 chèvres et 1 voiture. Vous choisissez une porte, puis l''hôte ouvre une porte avec une chèvre. Si vous changez de porte, quelle est la probabilité de gagner la voiture ?","options":["1/3","1/2","2/3","3/4"],"answer":"2/3"}'),

('Espérance jeu gain', 3, 55000, 'E = 10×(1/6) + 0×(5/6) - 2 = 10/6 - 2 ≈ 1,67 - 2 = -0,33$. On perd en moyenne 0,33$ par partie.',
 '{"type":"mcq","question":"Un jeu coûte 2$. On gagne 10$ si on obtient un 6 (prob. 1/6), sinon rien. Quelle est l''espérance de gain par partie ?","options":["-0,67$","-0,33$","0,33$","1,67$"],"answer":"-0,33$"}'),

('Probabilité au moins deux succès', 3, 60000, 'P(exactement 2 succès sur 3) = C(3,2) × (1/2)² × (1/2)¹ = 3 × 1/4 × 1/2 = 3/8.',
 '{"type":"mcq","question":"On lance une pièce 3 fois. Quelle est la probabilité d''obtenir exactement 2 fois pile ?","options":["1/8","2/8","3/8","4/8"],"answer":"3/8"}'),

('Problème code secret', 3, 50000, 'Code: 4 lettres parmi A-Z (26), sans répétition. P(5,4) = 26×25×24×23 = 358 800.',
 '{"type":"mcq","question":"Un code à 4 lettres utilise les lettres A à Z (26 lettres) sans répétition. Combien de codes différents peut-on former ?","options":["104","2 600","14 950","358 800"],"answer":"358 800"}'),

('Analyse probabiliste décision', 3, 55000, 'La stratégie optimale minimise le risque ou maximise l''espérance de gain selon le contexte.',
 '{"type":"mcq","question":"Jeu A: gain certain de 50$. Jeu B: 80% de chance de gagner 70$, 20% de perdre 30$. Quelle est l''espérance du Jeu B ?","options":["56$","50$","46$","40$"],"answer":"56$"}'),

('Probabilité naissance', 3, 55000, 'P(exactement 2 garçons parmi 3 enfants) = C(3,2) × (1/2)³ = 3 × 1/8 = 3/8.',
 '{"type":"mcq","question":"Un couple a 3 enfants. Si P(garçon) = P(fille) = 1/2, quelle est la probabilité d''avoir exactement 2 garçons ?","options":["1/8","2/8","3/8","4/8"],"answer":"3/8"}'),

('Faux positifs et sensibilité test', 3, 60000, 'Vrai positif: 99% × 1% = 0,99%. Faux positif: 5% × 99% = 4,95%. P(malade | test+) = 0,99/(0,99+4,95) ≈ 17%.',
 '{"type":"mcq","question":"Un test détecte une maladie (1% de la pop.) avec 99% de sensibilité et 5% de faux positifs. Si le test est positif, quelle est la probabilité approximative d''être vraiment malade ?","options":["1%","17%","50%","99%"],"answer":"17%"}'),

('Probabilité conditionnelle tableau', 3, 55000, 'Du tableau: 30 femmes actives sur 80 femmes totales. P(active | femme) = 30/80 = 3/8.',
 '{"type":"mcq","question":"Tableau: Hommes actifs 40, inactifs 20; Femmes actives 30, inactives 50. Quelle est la probabilité qu''une femme choisie au hasard soit active ?","options":["3/14","3/8","3/7","30/140"],"answer":"3/8"}'),

('Problème pari sportif EV', 3, 55000, 'P(gagner) = 0,4. Mise = 100$. Gain si victoire = 200$ (net = 100$). E = 100×0,4 + (-100)×0,6 = 40 - 60 = -20$.',
 '{"type":"mcq","question":"On parie 100$ sur une équipe. On gagne 200$ (gain net = 100$) avec probabilité 0,4, sinon on perd 100$. Quelle est l''espérance ?","options":["-20$","0$","20$","40$"],"answer":"-20$"}'),

('Permutation circulaire', 3, 55000, 'Arrangements circulaires de n éléments = (n-1)!. Pour 5 personnes: (5-1)! = 4! = 24.',
 '{"type":"mcq","question":"De combien de façons peut-on asseoir 5 personnes autour d''une table ronde (les arrangements par rotation sont considérés identiques) ?","options":["5","24","60","120"],"answer":"24"}'),

('Problème billes deux couleurs complet', 3, 55000, 'Sac: 4 rouges, 6 bleues. P(1 rouge et 1 bleue en 2 tirages sans remise) = P(RB) + P(BR) = (4/10 × 6/9) + (6/10 × 4/9) = 24/90 + 24/90 = 48/90 = 8/15.',
 '{"type":"mcq","question":"Un sac contient 4 billes rouges et 6 bleues. On tire 2 billes sans remise. Quelle est la probabilité d''obtenir exactement 1 de chaque couleur ?","options":["24/90","8/15","4/9","12/20"],"answer":"8/15"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
