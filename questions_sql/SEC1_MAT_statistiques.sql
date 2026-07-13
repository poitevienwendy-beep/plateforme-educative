-- ============================================================
-- BANQUE DE QUESTIONS — Statistiques (Sec. 1, Mathématiques)
-- PFEQ-MAT-SEC1-STAT | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-STAT') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Notions de base (34 questions) ─────────────────────────

('Moyenne simple', 1, 25000, 'Moyenne = somme ÷ nombre de valeurs = (5+8+7+6+4) ÷ 5 = 30 ÷ 5 = 6.',
 '{"type":"mcq","question":"Quelle est la moyenne de ces données : 5, 8, 7, 6, 4 ?","options":["5","6","7","8"],"answer":"6"}'),

('Médiane impaire', 1, 25000, 'Ordonner : 2, 4, 5, 7, 9. La médiane est la valeur du milieu = 5.',
 '{"type":"mcq","question":"Quelle est la médiane de ces données : 7, 2, 9, 4, 5 ?","options":["4","5","6","7"],"answer":"5"}'),

('Médiane paire', 1, 30000, 'Ordonner : 3, 5, 7, 9. Médiane = (5+7) ÷ 2 = 6.',
 '{"type":"mcq","question":"Quelle est la médiane de ces données : 9, 3, 7, 5 ?","options":["5","6","7","8"],"answer":"6"}'),

('Mode', 1, 20000, 'Le mode est la valeur qui apparaît le plus souvent. 4 apparaît 3 fois.',
 '{"type":"mcq","question":"Quel est le mode de ces données : 3, 4, 7, 4, 2, 4, 6 ?","options":["2","3","4","7"],"answer":"4"}'),

('Étendue', 1, 20000, 'Étendue = valeur maximale - valeur minimale = 18 - 3 = 15.',
 '{"type":"mcq","question":"Quelle est l''étendue de ces données : 12, 3, 18, 7, 15 ?","options":["9","12","15","18"],"answer":"15"}'),

('Population vs échantillon', 1, 20000, 'Un échantillon est une partie d''une population. Sondage = on interroge un échantillon, pas tout le monde.',
 '{"type":"mcq","question":"On interroge 200 élèves sur 5 000 dans une école. Les 200 élèves représentent...","options":["La population","Un échantillon","La médiane","Un recensement"],"answer":"Un échantillon"}'),

('Lire tableau fréquences', 1, 20000, 'Le tableau montre 8 élèves avec une note de 80. La fréquence absolue de 80 est 8.',
 '{"type":"mcq","question":"Dans un tableau, 8 élèves ont obtenu 80 sur 100. Quelle est la fréquence absolue de la note 80 ?","options":["8","80","100","0,08"],"answer":"8"}'),

('Fréquence relative', 1, 25000, 'Fréquence relative = fréquence absolue ÷ total = 8 ÷ 40 = 0,20 = 20%.',
 '{"type":"mcq","question":"Dans un groupe de 40 élèves, 8 ont une note de 80. Quelle est la fréquence relative (%) de cette note ?","options":["8%","16%","20%","25%"],"answer":"20%"}'),

('Identifier classes', 1, 20000, 'Une classe d''intervalle regroupe les données. [60,70[ contient les données de 60 à 69 inclusivement.',
 '{"type":"mcq","question":"Dans quel intervalle classe-t-on une note de 65 ?","options":["[50, 60[","[60, 70[","[70, 80[","[65, 70["],"answer":"[60, 70["}'),

('Diagramme circulaire lecture', 1, 25000, 'Si une portion représente 25% du cercle, elle correspond à 25% × 360° = 90°.',
 '{"type":"mcq","question":"Dans un diagramme circulaire, une section représente 25%. Quel angle correspond à cette section ?","options":["25°","45°","90°","100°"],"answer":"90°"}'),

('Diagramme à barres lecture', 1, 20000, 'On lit la hauteur de la barre correspondant à la catégorie souhaitée.',
 '{"type":"mcq","question":"Dans un diagramme à barres, la barre « Bleu » atteint le niveau 15. Combien de personnes préfèrent le bleu ?","options":["5","10","15","20"],"answer":"15"}'),

('Données ordonnées', 1, 20000, 'Ordonner en ordre croissant : 2, 3, 5, 7, 8, 11.',
 '{"type":"mcq","question":"Lequel de ces ensembles est déjà en ordre croissant ?","options":["5, 3, 7, 2","8, 5, 3, 1","2, 4, 6, 8","9, 7, 5, 3"],"answer":"2, 4, 6, 8"}'),

('Moyenne vs médiane', 1, 25000, 'Données : 1, 2, 3, 4, 100. Moyenne = 110/5 = 22. Médiane = 3. La médiane est moins influencée par les extrêmes.',
 '{"type":"mcq","question":"Pour les données 1, 2, 3, 4, 100, quelle mesure est moins influencée par la valeur extrême 100 ?","options":["La moyenne","La médiane","L''étendue","La somme"],"answer":"La médiane"}'),

('Somme pour trouver valeur', 1, 25000, 'Moyenne = 7, 5 valeurs → somme = 7 × 5 = 35. Si on connaît 4 valeurs : 6+8+5+9 = 28. Valeur manquante = 35 - 28 = 7.',
 '{"type":"mcq","question":"La moyenne de 5 nombres est 7. Quatre d''entre eux sont 6, 8, 5 et 9. Quel est le 5e nombre ?","options":["5","6","7","8"],"answer":"7"}'),

('Pictogramme lecture', 1, 20000, 'Chaque symbole = 5 éléments. 4 symboles = 4 × 5 = 20.',
 '{"type":"mcq","question":"Dans un pictogramme, chaque symbole représente 5 personnes. Une ligne montre 4 symboles. Combien de personnes cela représente-t-il ?","options":["4","9","20","45"],"answer":"20"}'),

('Diagramme ligne brisée', 1, 20000, 'Un diagramme à ligne brisée (polygone de fréquences) est idéal pour visualiser l''évolution dans le temps.',
 '{"type":"mcq","question":"Quel type de graphique est le mieux adapté pour montrer l''évolution d''une température sur une semaine ?","options":["Diagramme circulaire","Diagramme à ligne brisée","Pictogramme","Tableau de fréquences"],"answer":"Diagramme à ligne brisée"}'),

('Variable qualitative vs quantitative', 1, 20000, 'La couleur des yeux est qualitative (catégories), la taille est quantitative (mesurable).',
 '{"type":"mcq","question":"Lequel de ces exemples est une variable quantitative ?","options":["Couleur préférée","Genre","Taille en cm","Nationalité"],"answer":"Taille en cm"}'),

('Variable discrète vs continue', 1, 20000, 'Nombre d''élèves = discret (entiers seulement). Température = continue (peut prendre n''importe quelle valeur).',
 '{"type":"mcq","question":"Laquelle de ces variables est continue ?","options":["Nombre de voitures","Nombre d''élèves","Résultat d''un dé","Longueur d''un poisson"],"answer":"Longueur d''un poisson"}'),

('Tableau de distribution fréquences', 1, 25000, 'Fréquences cumulées : on additionne les fréquences jusqu''à la classe souhaitée.',
 '{"type":"mcq","question":"Un tableau montre 5 élèves entre 60-70 et 8 élèves entre 70-80. Combien d''élèves ont une note inférieure à 80 ?","options":["5","8","13","15"],"answer":"13"}'),

('Lire boîte à moustaches', 1, 30000, 'Dans une boîte à moustaches, la ligne centrale représente la médiane.',
 '{"type":"mcq","question":"Dans une boîte à moustaches, que représente la ligne verticale à l''intérieur de la boîte ?","options":["La moyenne","La médiane","L''étendue","Le mode"],"answer":"La médiane"}'),

('Q1 et Q3', 1, 30000, 'Q1 est la médiane de la moitié inférieure. Q3 est la médiane de la moitié supérieure. Données : 2,4,6,8,10,12,14 → Q1=4, Q3=12.',
 '{"type":"mcq","question":"Pour les données 2, 4, 6, 8, 10, 12, 14, quel est le premier quartile (Q1) ?","options":["2","4","6","8"],"answer":"4"}'),

('Écart interquartile', 1, 25000, 'Écart interquartile (EIQ) = Q3 - Q1. Il mesure la dispersion des 50% centraux.',
 '{"type":"mcq","question":"Si Q1 = 25 et Q3 = 45, quel est l''écart interquartile ?","options":["15","20","25","70"],"answer":"20"}'),

('Anomalie (outlier)', 1, 25000, 'Une donnée aberrante est très éloignée des autres valeurs et peut fausser la moyenne.',
 '{"type":"mcq","question":"Dans la série 10, 12, 11, 13, 95, quelle valeur est une donnée aberrante ?","options":["10","11","13","95"],"answer":"95"}'),

('Choix mesure centrale', 1, 25000, 'Pour des données avec une valeur extrême, la médiane est plus représentative que la moyenne.',
 '{"type":"mcq","question":"Un groupe de 5 personnes gagne : 30k, 32k, 29k, 31k, 500k $. Quelle mesure représente mieux le salaire typique ?","options":["Moyenne","Médiane","Mode","Étendue"],"answer":"Médiane"}'),

('Total à partir de fréquence relative', 1, 25000, '20% d''un total = 8 personnes → total = 8 ÷ 0,20 = 40 personnes.',
 '{"type":"mcq","question":"20% d''un groupe aime le chocolat, ce qui représente 8 personnes. Combien y a-t-il de personnes au total ?","options":["20","30","40","50"],"answer":"40"}'),

('Diagramme à tige et feuilles', 1, 30000, 'Dans un diagramme à tige et feuilles, la tige représente les dizaines et les feuilles les unités.',
 '{"type":"mcq","question":"Dans un diagramme à tiges et feuilles, tige = 5 et feuilles = 2, 4, 7. Quelles valeurs sont représentées ?","options":["52, 54, 57","5, 2, 4, 7","25, 45, 75","520, 540, 570"],"answer":"52, 54, 57"}'),

('Comparaison deux groupes', 1, 25000, 'Pour comparer deux groupes, on peut comparer leurs moyennes et leurs étendues.',
 '{"type":"mcq","question":"Groupe A : moyenne = 72, étendue = 40. Groupe B : moyenne = 75, étendue = 10. Quel groupe est plus homogène ?","options":["Groupe A car plus grande étendue","Groupe B car plus petite étendue","Groupe A car plus petite moyenne","Les deux groupes sont identiques"],"answer":"Groupe B car plus petite étendue"}'),

('Fréquences cumulées croissantes', 1, 25000, 'Fréquence cumulée croissante jusqu''à la classe [70,80[ = nombre d''élèves avec note < 80.',
 '{"type":"mcq","question":"Classes: [60,70[: 5 élèves; [70,80[: 8 élèves; [80,90[: 7 élèves. Combien ont une note inférieure à 80 ?","options":["5","7","8","13"],"answer":"13"}'),

('Graphique adapté à catégories', 1, 20000, 'Le diagramme à barres (ou bâtons) est idéal pour comparer des catégories distinctes.',
 '{"type":"mcq","question":"Quel type de graphique est le mieux adapté pour comparer le nombre d''élèves dans différentes classes ?","options":["Ligne brisée","Diagramme circulaire","Diagramme à barres","Boîte à moustaches"],"answer":"Diagramme à barres"}'),

('Angle secteur circulaire', 1, 25000, 'Si 30% des élèves préfèrent les maths : angle = 30% × 360° = 108°.',
 '{"type":"mcq","question":"Dans un sondage, 30% des élèves préfèrent les maths. Quel angle représente cette proportion dans un diagramme circulaire ?","options":["30°","54°","90°","108°"],"answer":"108°"}'),

('Classe modale', 1, 20000, 'La classe modale est l''intervalle ayant la fréquence la plus élevée.',
 '{"type":"mcq","question":"Classes: [0,10[: 3; [10,20[: 8; [20,30[: 5; [30,40[: 4. Quelle est la classe modale ?","options":["[0,10[","[10,20[","[20,30[","[30,40["],"answer":"[10,20["}'),

('Variation données', 1, 20000, 'Une grande étendue ou un grand écart interquartile indique une plus grande variabilité dans les données.',
 '{"type":"mcq","question":"Quelle mesure indique à quel point les données sont dispersées ?","options":["La moyenne","La médiane","L''étendue","Le mode"],"answer":"L''étendue"}'),

('Fréquence relative cumulative', 1, 25000, 'Fréquences relatives : [60,70[: 20%, [70,80[: 35%. Cumulée jusqu''à 80 = 20 + 35 = 55%.',
 '{"type":"mcq","question":"Fréquences relatives: [60,70[: 20%, [70,80[: 35%, [80,90[: 45%. Quelle est la fréquence relative cumulée jusqu''à 80 ?","options":["35%","45%","55%","80%"],"answer":"55%"}'),

('Calcul moyenne avec tableau', 1, 30000, 'Moyenne = (2×3 + 4×1 + 6×2) ÷ (3+1+2) = (6+4+12) ÷ 6 = 22 ÷ 6 ≈ 3,7.',
 '{"type":"mcq","question":"Notes: 2 (fréq. 3), 4 (fréq. 1), 6 (fréq. 2). Quelle est la moyenne ?","options":["3","3,7","4","4,5"],"answer":"3,7"}'),

-- ── DIFFICULTÉ 2 — Analyse et interprétation (33 questions) ───────────────

('Corrélation positive', 2, 35000, 'Une corrélation positive signifie que quand une variable augmente, l''autre augmente aussi.',
 '{"type":"mcq","question":"On observe que plus les élèves étudient, meilleures sont leurs notes. Quel type de corrélation est-ce ?","options":["Corrélation négative","Aucune corrélation","Corrélation positive","Corrélation parfaite"],"answer":"Corrélation positive"}'),

('Corrélation négative', 2, 35000, 'Une corrélation négative : quand une variable augmente, l''autre diminue.',
 '{"type":"mcq","question":"Plus on s''absente de l''école, plus les notes sont basses. Quel type de corrélation est-ce ?","options":["Corrélation positive","Corrélation négative","Aucune corrélation","Corrélation parfaite"],"answer":"Corrélation négative"}'),

('Nuage de points tendance', 2, 35000, 'La droite de tendance (régression) représente la relation générale entre deux variables.',
 '{"type":"mcq","question":"Dans un nuage de points, quelle ligne permet de mieux représenter la tendance générale des données ?","options":["La médiane","La droite de régression","La ligne modale","L''étendue"],"answer":"La droite de régression"}'),

('Effet valeur extrême sur moyenne', 2, 35000, 'Ajouter une valeur très grande augmente la moyenne mais peut ne pas changer la médiane.',
 '{"type":"mcq","question":"Si on ajoute la valeur 1000 à la série 5, 6, 7, 8, 9, quelle mesure change le plus ?","options":["La médiane","Le mode","La moyenne","L''écart interquartile"],"answer":"La moyenne"}'),

('Calcul moyenne pondérée', 2, 40000, 'Moyenne pondérée = (70×0,3 + 80×0,3 + 90×0,4) = 21 + 24 + 36 = 81.',
 '{"type":"mcq","question":"Un élève obtient 70 (poids 30%), 80 (poids 30%) et 90 (poids 40%). Quelle est sa moyenne pondérée ?","options":["80","80,5","81","82"],"answer":"81"}'),

('Comparer boîtes à moustaches', 2, 40000, 'La boîte à moustaches avec Q1 et Q3 plus serrés indique moins de variabilité dans les données centrales.',
 '{"type":"mcq","question":"Groupe A: Q1=40, Q3=60. Groupe B: Q1=30, Q3=70. Quel groupe a les données les plus dispersées ?","options":["Groupe A","Groupe B","Les deux pareil","Impossible à dire"],"answer":"Groupe B"}'),

('Identifier biais sondage', 2, 35000, 'Un sondage biaisé n''est pas représentatif. Questionner seulement les clients du magasin pour connaître les habitudes d''achat de tous les Québécois est biaisé.',
 '{"type":"mcq","question":"On sonde uniquement les abonnés d''un magazine pour connaître les habitudes de lecture de tous les Québécois. Ce sondage est...","options":["Représentatif","Biaisé","Parfait","Aléatoire"],"answer":"Biaisé"}'),

('Taille échantillon', 2, 35000, 'Un plus grand échantillon donne en général des résultats plus fiables et représentatifs.',
 '{"type":"mcq","question":"Quel échantillon donnera les résultats les plus fiables pour représenter une ville de 100 000 habitants ?","options":["50 personnes","100 personnes","500 personnes","1 000 personnes"],"answer":"1 000 personnes"}'),

('Histogramme vs barres', 2, 35000, 'Un histogramme représente des données continues (classes d''intervalles). Les barres se touchent. Un diagramme à barres représente des catégories discrètes séparées.',
 '{"type":"mcq","question":"Quelle est la différence principale entre un histogramme et un diagramme à barres ?","options":["Un histogramme a des barres qui se touchent","Un histogramme utilise des couleurs","Un diagramme à barres n''a pas d''axe","Un histogramme ne peut pas être vertical"],"answer":"Un histogramme a des barres qui se touchent"}'),

('Valeur aberrante effet', 2, 35000, 'Une valeur aberrante peut augmenter ou diminuer la moyenne mais a peu d''effet sur la médiane.',
 '{"type":"mcq","question":"Quelle mesure est la plus ROBUSTE face aux valeurs aberrantes ?","options":["La moyenne","La médiane","L''étendue","La somme"],"answer":"La médiane"}'),

('Calculer écart type interprétation', 2, 40000, 'Un écart type plus petit = données plus regroupées autour de la moyenne. Classe A (éc. type = 2) est plus homogène que classe B (éc. type = 12).',
 '{"type":"mcq","question":"Classe A: moyenne=75, écart type=2. Classe B: moyenne=75, écart type=12. Dans quelle classe les notes sont-elles les plus homogènes ?","options":["Classe A","Classe B","Elles sont identiques","Impossible à dire"],"answer":"Classe A"}'),

('Lire histogramme classes inégales', 2, 40000, 'Pour des classes inégales, l''aire (et non la hauteur) représente la fréquence.',
 '{"type":"mcq","question":"Pourquoi peut-on utiliser l''aire (et non seulement la hauteur) d''un histogramme pour comparer des classes d''intervalles inégales ?","options":["Parce que l''aire tient compte de la largeur","Parce que l''axe y est toujours en %","Parce que les classes sont toujours égales","Parce que la hauteur est toujours identique"],"answer":"Parce que l''aire tient compte de la largeur"}'),

('Moyenne de groupes distincts', 2, 40000, 'Moyenne combinée = (Σ sommes) ÷ (Σ effectifs) = (30×72 + 20×78) ÷ 50 = (2160+1560)÷50 = 3720÷50 = 74,4.',
 '{"type":"mcq","question":"Groupe A (30 élèves, moyenne 72) et Groupe B (20 élèves, moyenne 78). Quelle est la moyenne combinée ?","options":["74","74,4","75","76"],"answer":"74,4"}'),

('Corrélation vs causalité', 2, 35000, 'Corrélation ne signifie pas causalité. Deux variables peuvent évoluer ensemble sans que l''une cause l''autre.',
 '{"type":"mcq","question":"On observe que les ventes de glace et les noyades augmentent en même temps l''été. La glace cause-t-elle les noyades ?","options":["Oui, il y a causalité","Non, c''est une coïncidence liée à la chaleur","Oui, les données le prouvent","Non, il n''y a aucune corrélation"],"answer":"Non, c''est une coïncidence liée à la chaleur"}'),

('Interpolation droite régression', 2, 40000, 'Droite y = 2x + 10. Pour x = 5 : y = 2×5 + 10 = 20.',
 '{"type":"mcq","question":"La droite de régression d''un nuage de points est y = 2x + 10. Pour x = 5, quelle est la valeur prédite de y ?","options":["15","17","20","25"],"answer":"20"}'),

('Tableau de contingence lecture', 2, 35000, 'Dans un tableau de contingence, on peut calculer des pourcentages par ligne ou par colonne.',
 '{"type":"mcq","question":"Dans un tableau de contingence, 30 garçons et 20 filles préfèrent le sport. Il y a 50 garçons et 40 filles en tout. Quel % des filles préfère le sport ?","options":["20%","40%","50%","60%"],"answer":"50%"}'),

('Fréquence relative normalisation', 2, 35000, 'La somme de toutes les fréquences relatives doit toujours être égale à 1 (ou 100%).',
 '{"type":"mcq","question":"Dans un tableau de fréquences, les fréquences relatives sont 0,25, 0,35, 0,15 et ___. Quelle est la valeur manquante ?","options":["0,15","0,20","0,25","0,30"],"answer":"0,25"}'),

('Biais de sélection', 2, 35000, 'Le biais de sélection survient quand l''échantillon ne représente pas bien la population cible.',
 '{"type":"mcq","question":"Pour sonder l''opinion sur les parcs de la ville, on interroge seulement des gens dans un parc. Quel biais commet-on ?","options":["Biais de confirmation","Biais de sélection","Biais de mémoire","Biais de réponse"],"answer":"Biais de sélection"}'),

('Comparer distributions', 2, 40000, 'Distribution A: médiane=70, EIQ=20. Distribution B: médiane=70, EIQ=40. B est plus dispersée.',
 '{"type":"mcq","question":"Deux distributions ont la même médiane de 70. Distribution A a un EIQ de 20, Distribution B un EIQ de 40. Que peut-on dire ?","options":["A est plus dispersée","B est plus dispersée","Elles sont identiques","Impossible à comparer"],"answer":"B est plus dispersée"}'),

('Prédiction hors données', 2, 40000, 'L''extrapolation (prédire au-delà des données) est risquée car la tendance peut ne pas se maintenir.',
 '{"type":"mcq","question":"Pourquoi est-il risqué d''utiliser une droite de régression pour prédire des valeurs très loin des données observées ?","options":["La droite peut ne pas représenter la tendance","Les calculs deviennent difficiles","La droite change de pente","L''axe des x est trop petit"],"answer":"La droite peut ne pas représenter la tendance"}'),

('Percentile', 2, 35000, 'Le 60e percentile signifie que 60% des données se trouvent en dessous de cette valeur.',
 '{"type":"mcq","question":"Un élève est au 60e percentile. Cela signifie que...","options":["Il a obtenu 60%","60% des élèves ont fait mieux","60% des élèves ont fait moins bien","Il est dans le 60e rang"],"answer":"60% des élèves ont fait moins bien"}'),

('Données manquantes', 2, 35000, 'Les données manquantes peuvent biaiser les résultats si elles ne sont pas réparties aléatoirement.',
 '{"type":"mcq","question":"Si seulement les élèves forts répondent à un sondage sur les notes, les résultats seront...","options":["Représentatifs","Sous-estimés","Surestimés","Exacts"],"answer":"Surestimés"}'),

('Calcul proportion diagramme', 2, 35000, '360° total. Section = 90°. Proportion = 90÷360 = 25%.',
 '{"type":"mcq","question":"Une section d''un diagramme circulaire mesure 90°. Quelle proportion de l''ensemble représente-t-elle ?","options":["9%","25%","30%","90%"],"answer":"25%"}'),

('Médiane données groupées', 2, 40000, 'Pour trouver la médiane dans un tableau groupé, on cherche la classe où la fréquence cumulée atteint 50%.',
 '{"type":"mcq","question":"Total: 20 valeurs. Classes: [0,10[: 5; [10,20[: 8; [20,30[: 7. Dans quelle classe se trouve la médiane ?","options":["[0,10[","[10,20[","[20,30[","Impossible à dire"],"answer":"[10,20["}'),

('Diagramme temps série', 2, 35000, 'Une série chronologique montre l''évolution d''une variable dans le temps. On la représente avec un graphique à ligne brisée.',
 '{"type":"mcq","question":"Quel graphique convient le mieux pour représenter les ventes mensuelles sur 2 ans ?","options":["Diagramme circulaire","Histogramme","Graphique à ligne brisée","Tableau de contingence"],"answer":"Graphique à ligne brisée"}'),

('Q2 = médiane', 2, 30000, 'Le deuxième quartile (Q2) est identique à la médiane. Il partage les données en deux moitiés égales.',
 '{"type":"mcq","question":"Quelle est la relation entre le deuxième quartile (Q2) et la médiane ?","options":["Q2 = moyenne","Q2 = médiane","Q2 = mode","Q2 = étendue"],"answer":"Q2 = médiane"}'),

('Interprétation corrélation forte', 2, 35000, 'Un coefficient de corrélation proche de 1 (ou -1) indique une corrélation forte.',
 '{"type":"mcq","question":"Un coefficient de corrélation de 0,95 indique...","options":["Une faible corrélation positive","Une forte corrélation négative","Une forte corrélation positive","Aucune corrélation"],"answer":"Une forte corrélation positive"}'),

-- ── DIFFICULTÉ 3 — Problèmes complexes (33 questions) ─────────────────────

('Problème décision statistique', 3, 55000, 'Il faut comparer les médianes ET les dispersions. Si les médianes sont proches, on regarde l''EIQ ou l''étendue.',
 '{"type":"mcq","question":"Groupe A: Q1=60, médiane=70, Q3=80. Groupe B: Q1=50, médiane=72, Q3=90. Quel groupe a les notes les plus stables ?","options":["Groupe A (EIQ=20)","Groupe B (EIQ=40)","Impossible à déterminer","Les deux groupes sont équivalents"],"answer":"Groupe A (EIQ=20)"}'),

('Moyenne pondérée manquante', 3, 55000, 'Moyenne finale = 80. Travaux (40%) = 75. Examen (60%) = x. 75×0,4 + x×0,6 = 80. 30 + 0,6x = 80. x = 50/0,6 ≈ 83,3.',
 '{"type":"mcq","question":"Un élève a une moyenne pondérée de 80. Ses travaux (40%) valent 75. Quel était son résultat à l''examen (60%) ?","options":["80","82","83,3","85"],"answer":"83,3"}'),

('Analyse série chronologique', 3, 55000, 'Une tendance générale à la hausse avec des fluctuations saisonnières est caractéristique d''une série avec tendance et saisonnalité.',
 '{"type":"mcq","question":"Les ventes d''un magasin augmentent chaque année mais sont toujours plus élevées en décembre. Ce phénomène indique...","options":["Une tendance seulement","Une saisonnalité seulement","Une tendance et une saisonnalité","Une valeur aberrante"],"answer":"Une tendance et une saisonnalité"}'),

('Simuler échantillonnage', 3, 50000, 'Échantillonnage aléatoire simple : chaque membre de la population a une chance égale d''être sélectionné.',
 '{"type":"mcq","question":"Quelle méthode d''échantillonnage assure que chaque élève d''une école a la même probabilité d''être sélectionné ?","options":["Interroger les amis du chercheur","Utiliser une liste et tirer au sort","Questionner ceux qui se portent volontaires","Interroger les 10 premiers arrivés"],"answer":"Utiliser une liste et tirer au sort"}'),

('Interprétation droite régression', 3, 55000, 'Pente = 2,5 signifie que pour chaque heure d''étude supplémentaire, la note augmente de 2,5 points en moyenne.',
 '{"type":"mcq","question":"La droite de régression note = 2,5×heures + 50. Que signifie la pente 2,5 ?","options":["La note de départ sans étude","Chaque heure d''étude ajoute 2,5 points en moyenne","La note maximale possible","Le nombre d''heures nécessaires pour réussir"],"answer":"Chaque heure d''étude ajoute 2,5 points en moyenne"}'),

('Erreur d''interprétation graphique', 3, 50000, 'Un axe qui ne commence pas à 0 peut exagérer visuellement les différences entre les valeurs.',
 '{"type":"mcq","question":"Un diagramme à barres montre des barres de 98 et 99 cm, mais l''axe y commence à 97. Quel problème cela cause-t-il ?","options":["Les barres paraissent très différentes alors qu''elles ne le sont presque pas","Les données sont incorrectes","L''axe x est mal étiqueté","Le diagramme ne peut pas être lu"],"answer":"Les barres paraissent très différentes alors qu''elles ne le sont presque pas"}'),

('Calcul percentile spécifique', 3, 55000, 'Données ordonnées : 15 valeurs. Percentile 80 = rang 0,80 × 15 = 12e valeur (arrondie).',
 '{"type":"mcq","question":"Dans une série ordonnée de 15 valeurs, quel rang correspond approximativement au 80e percentile ?","options":["8e","10e","12e","14e"],"answer":"12e"}'),

('Analyse complète données', 3, 55000, 'Pour décrire complètement une distribution, on rapporte la tendance centrale (moyenne/médiane/mode) ET la dispersion (étendue, EIQ, écart type).',
 '{"type":"mcq","question":"Pour décrire complètement une distribution de données, on doit rapporter...","options":["Seulement la moyenne","Seulement l''étendue","Une mesure de tendance centrale ET une mesure de dispersion","Le nombre de données seulement"],"answer":"Une mesure de tendance centrale ET une mesure de dispersion"}'),

('Comparaison nuages de points', 3, 50000, 'Nuage de points dispersé = faible corrélation. Nuage en forme de ligne = forte corrélation.',
 '{"type":"mcq","question":"Nuage A: points très éparpillés. Nuage B: points alignés en ligne montante. Quel nuage a la corrélation la plus forte ?","options":["Nuage A (corrélation négative)","Nuage B (forte corrélation positive)","Les deux ont la même corrélation","Nuage A (forte corrélation positive)"],"answer":"Nuage B (forte corrélation positive)"}'),

('Problème de sondage complet', 3, 55000, 'Pour minimiser les biais : échantillon aléatoire, taille suffisante, questions neutres, couverture de toutes les sous-groupes.',
 '{"type":"mcq","question":"Pour sonder les habitudes sportives de tous les élèves du secondaire d''une ville, la meilleure approche est...","options":["Interroger les équipes sportives","Sélectionner aléatoirement des élèves dans plusieurs écoles","Interroger les élèves pendant le cours de sport","Poster un sondage en ligne et attendre les réponses"],"answer":"Sélectionner aléatoirement des élèves dans plusieurs écoles"}'),

('Transformation données effet', 3, 55000, 'Si on ajoute 5 à chaque valeur : la moyenne, la médiane et le mode augmentent de 5. L''étendue ne change pas.',
 '{"type":"mcq","question":"On ajoute 5 à chaque valeur d''une distribution. Quelle mesure NE CHANGE PAS ?","options":["La moyenne","La médiane","Le mode","L''étendue"],"answer":"L''étendue"}'),

('Effet multiplication sur statistiques', 3, 50000, 'Si on multiplie chaque valeur par 2 : moyenne, médiane et mode sont multipliés par 2. L''étendue est aussi multipliée par 2.',
 '{"type":"mcq","question":"On double toutes les valeurs d''une distribution. Que devient l''étendue ?","options":["Elle reste la même","Elle est divisée par 2","Elle est doublée","Elle augmente de 2"],"answer":"Elle est doublée"}'),

('Données manquantes médiane', 3, 55000, 'Données : 3, x, 7, 9, 11 (ordonnées). Médiane = 3e valeur = 7. Donc x peut être n''importe quelle valeur entre 3 et 7.',
 '{"type":"mcq","question":"La série 3, x, 7, 9, 11 est en ordre croissant et sa médiane est 7. Quelle valeur x peut prendre ?","options":["x = 7","x peut être entre 3 et 7","x doit être supérieur à 7","x = 5"],"answer":"x peut être entre 3 et 7"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
