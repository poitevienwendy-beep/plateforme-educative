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
