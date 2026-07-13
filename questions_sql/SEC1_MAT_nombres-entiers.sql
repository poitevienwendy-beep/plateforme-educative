-- ============================================================
-- BANQUE DE QUESTIONS — Nombres entiers (Sec. 1, Mathématiques)
-- PFEQ-MAT-SEC1-NE | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-MAT-SEC1-NE') AS skill_id,
  q.title,
  q.difficulty_level::int,
  q.expected_time_ms::int,
  q.explication,
  true,
  q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Opérations de base (30 questions) ──────────────────────

('Addition grands nombres', 1, 20000, 'On additionne colonne par colonne en partant des unités.',
 '{"type":"mcq","question":"Calcule : 347 + 256","options":["593","603","613","600"],"answer":"603"}'),

('Soustraction avec retenue', 1, 20000, 'On soustrait chiffre par chiffre; si le chiffre du bas est plus grand, on emprunte à la position supérieure.',
 '{"type":"mcq","question":"Calcule : 842 - 365","options":["477","487","467","577"],"answer":"477"}'),

('Multiplication de base', 1, 20000, 'On multiplie en utilisant la table de multiplication et on additionne les produits partiels.',
 '{"type":"mcq","question":"Calcule : 24 × 13","options":["288","302","312","282"],"answer":"312"}'),

('Division exacte', 1, 20000, 'Pour diviser, on cherche combien de fois le diviseur entre dans le dividende.',
 '{"type":"mcq","question":"Calcule : 144 ÷ 12","options":["10","11","12","13"],"answer":"12"}'),

('Priorité des opérations simple', 1, 25000, 'La multiplication est prioritaire sur l''addition : on calcule d''abord 4 × 2 = 8, puis 3 + 8 = 11.',
 '{"type":"mcq","question":"Calcule : 3 + 4 × 2","options":["14","11","8","24"],"answer":"11"}'),

('Arrondi à la dizaine', 1, 20000, 'On regarde le chiffre des unités : si ≥ 5 on arrondit vers le haut, sinon vers le bas.',
 '{"type":"mcq","question":"Arrondis 347 à la dizaine près.","options":["340","350","300","400"],"answer":"350"}'),

('Nombre pair ou impair', 1, 15000, 'Un nombre est pair si son chiffre des unités est 0, 2, 4, 6 ou 8.',
 '{"type":"mcq","question":"Lequel de ces nombres est pair ?","options":["37","53","48","71"],"answer":"48"}'),

('Identification nombre premier', 1, 25000, '17 est premier car il n''est divisible que par 1 et par lui-même.',
 '{"type":"mcq","question":"Lequel de ces nombres est un nombre premier ?","options":["9","15","21","17"],"answer":"17"}'),

('Multiple de 5', 1, 15000, 'Un nombre est multiple de 5 si son chiffre des unités est 0 ou 5.',
 '{"type":"mcq","question":"Lequel est un multiple de 5 ?","options":["43","67","85","92"],"answer":"85"}'),

('Valeur absolue', 1, 20000, 'La valeur absolue d''un nombre est sa distance à 0 sur la droite numérique; elle est toujours positive.',
 '{"type":"mcq","question":"Quelle est la valeur absolue de −15 ?","options":["-15","0","15","1/15"],"answer":"15"}'),

('Addition de trois nombres', 1, 20000, 'On peut additionner dans l''ordre ou regrouper les nombres pour simplifier.',
 '{"type":"mcq","question":"Calcule : 23 + 45 + 67","options":["125","135","145","130"],"answer":"135"}'),

('Soustraction à partir de 1000', 1, 20000, 'On peut utiliser la méthode du complément : 1000 - 437 = 563.',
 '{"type":"mcq","question":"Calcule : 1000 - 437","options":["553","563","573","463"],"answer":"563"}'),

('Multiplication par un chiffre', 1, 15000, '15 × 8 : on calcule 10 × 8 = 80 et 5 × 8 = 40, puis 80 + 40 = 120.',
 '{"type":"mcq","question":"Calcule : 15 × 8","options":["110","115","120","125"],"answer":"120"}'),

('Division avec reste nul', 1, 15000, '96 ÷ 8 = 12 car 8 × 12 = 96.',
 '{"type":"mcq","question":"Calcule : 96 ÷ 8","options":["11","12","13","14"],"answer":"12"}'),

('Puissance de 5', 1, 20000, '5² = 5 × 5 = 25.',
 '{"type":"mcq","question":"Calcule : 5²","options":["10","20","25","30"],"answer":"25"}'),

('Divisibilité par 3', 1, 20000, 'Un nombre est divisible par 3 si la somme de ses chiffres est divisible par 3. Pour 63 : 6 + 3 = 9, et 9 est divisible par 3.',
 '{"type":"mcq","question":"Lequel de ces nombres est divisible par 3 ?","options":["47","52","63","71"],"answer":"63"}'),

('Nombre premier ou non', 1, 25000, '9 = 3 × 3, donc 9 n''est pas premier.',
 '{"type":"mcq","question":"Lequel de ces nombres N''est PAS un nombre premier ?","options":["2","3","7","9"],"answer":"9"}'),

('Grande addition', 1, 20000, '456 + 789 : on additionne les unités (6+9=15, retenue 1), les dizaines (5+8+1=14, retenue 1), les centaines (4+7+1=12).',
 '{"type":"mcq","question":"Calcule : 456 + 789","options":["1235","1245","1255","1215"],"answer":"1245"}'),

('Soustraction de 700', 1, 20000, '700 - 289 : on calcule 699 - 288 = 411.',
 '{"type":"mcq","question":"Calcule : 700 - 289","options":["401","411","421","391"],"answer":"411"}'),

('Multiplication par 25', 1, 25000, '32 × 25 = 32 × 100 ÷ 4 = 3200 ÷ 4 = 800.',
 '{"type":"mcq","question":"Calcule : 32 × 25","options":["750","780","800","820"],"answer":"800"}'),

('Parenthèses en premier', 1, 20000, 'Les parenthèses sont calculées en premier : (3 + 4) = 7, puis 5 × 7 = 35.',
 '{"type":"mcq","question":"Calcule : 5 × (3 + 4)","options":["19","22","35","40"],"answer":"35"}'),

('Puissance de 2', 1, 15000, '2³ = 2 × 2 × 2 = 4 × 2 = 8.',
 '{"type":"mcq","question":"Calcule : 2³","options":["6","8","9","12"],"answer":"8"}'),

('Multiple de 9', 1, 20000, 'La somme des chiffres de 45 est 4 + 5 = 9, donc 45 est divisible par 9.',
 '{"type":"mcq","question":"Lequel est un multiple de 9 ?","options":["45","56","67","74"],"answer":"45"}'),

('Addition de nombres négatifs', 1, 20000, '(-3) + (-7) = -(3 + 7) = -10.',
 '{"type":"mcq","question":"Calcule : (-3) + (-7)","options":["-4","-10","10","4"],"answer":"-10"}'),

('Multiplication par zéro', 1, 10000, 'Tout nombre multiplié par 0 donne 0.',
 '{"type":"mcq","question":"Calcule : 0 × 9999","options":["9999","1","0","9998"],"answer":"0"}'),

('Arrondi à la centaine', 1, 20000, 'On regarde le chiffre des dizaines : 6 ≥ 5, donc on arrondit 763 à 800.',
 '{"type":"mcq","question":"Arrondis 763 à la centaine près.","options":["700","760","770","800"],"answer":"800"}'),

('Priorité addition-multiplication', 1, 25000, 'On calcule la multiplication d''abord : 5 × 3 = 15, puis 4 + 15 - 2 = 17.',
 '{"type":"mcq","question":"Calcule : 4 + 5 × 3 - 2","options":["25","17","13","20"],"answer":"17"}'),

('Nombre impair', 1, 15000, 'Un nombre impair se termine par 1, 3, 5, 7 ou 9.',
 '{"type":"mcq","question":"Lequel de ces nombres est impair ?","options":["24","36","51","88"],"answer":"51"}'),

('Table de multiplication 7', 1, 15000, '7 × 9 = 63.',
 '{"type":"mcq","question":"Calcule : 7 × 9","options":["54","56","63","72"],"answer":"63"}'),

('Arrondi à la dizaine 155', 1, 20000, 'Le chiffre des unités est 5, donc on arrondit vers le haut : 160.',
 '{"type":"mcq","question":"Arrondis 155 à la dizaine près.","options":["150","155","160","200"],"answer":"160"}'),

-- ── DIFFICULTÉ 2 — Opérations intermédiaires (40 questions) ───────────────

('Parenthèses doubles', 2, 30000, 'On calcule chaque parenthèse séparément : (3+4)=7 et (8-3)=5, puis 7 × 5 = 35.',
 '{"type":"mcq","question":"Calcule : (3 + 4) × (8 - 3)","options":["28","35","40","42"],"answer":"35"}'),

('Multiplication à deux chiffres', 2, 30000, '12 × 15 = 12 × 10 + 12 × 5 = 120 + 60 = 180.',
 '{"type":"mcq","question":"Calcule : 12 × 15","options":["160","170","180","190"],"answer":"180"}'),

('PGCD de deux nombres', 2, 35000, 'Les diviseurs de 12 sont 1,2,3,4,6,12. Les diviseurs de 18 sont 1,2,3,6,9,18. Le plus grand commun est 6.',
 '{"type":"mcq","question":"Quel est le PGCD de 12 et de 18 ?","options":["2","3","6","9"],"answer":"6"}'),

('PPCM de deux nombres', 2, 35000, 'Les multiples de 4 : 4,8,12,16... Les multiples de 6 : 6,12,18... Le plus petit commun est 12.',
 '{"type":"mcq","question":"Quel est le PPCM de 4 et de 6 ?","options":["6","12","18","24"],"answer":"12"}'),

('Ordre des opérations complet', 2, 30000, 'On calcule : 3×4=12, 5÷1=5, puis 2+12-5 = 9.',
 '{"type":"mcq","question":"Calcule : 2 + 3 × 4 - 5 ÷ 1","options":["9","11","13","16"],"answer":"9"}'),

('Nombre de nombres premiers', 2, 35000, 'Les nombres premiers entre 1 et 20 sont : 2, 3, 5, 7, 11, 13, 17, 19 → 8 nombres.',
 '{"type":"mcq","question":"Combien y a-t-il de nombres premiers entre 1 et 20 ?","options":["6","7","8","9"],"answer":"8"}'),

('Décomposition en facteurs premiers', 2, 40000, '36 = 4 × 9 = 2² × 3².',
 '{"type":"mcq","question":"Quelle est la décomposition de 36 en facteurs premiers ?","options":["2 × 18","4 × 9","2² × 3²","6²"],"answer":"2² × 3²"}'),

('Divisibilité par 6', 2, 30000, 'Un nombre est divisible par 6 s''il est divisible à la fois par 2 et par 3. Pour 42 : c''est pair (÷2) et 4+2=6 (÷3).',
 '{"type":"mcq","question":"Lequel est divisible par 6 ?","options":["38","44","42","50"],"answer":"42"}'),

('Soustraction de négatif', 2, 30000, 'Soustraire un négatif revient à additionner : 5 - (-3) = 5 + 3 = 8.',
 '{"type":"mcq","question":"Calcule : 5 - (-3)","options":["2","8","-2","-8"],"answer":"8"}'),

('Multiplication de négatifs', 2, 25000, 'Le produit de deux nombres de signes contraires est négatif : 5 × (-4) = -20.',
 '{"type":"mcq","question":"Calcule : 5 × (-4)","options":["20","-20","1","-1"],"answer":"-20"}'),

('Division de négatifs', 2, 25000, 'Le quotient de deux négatifs est positif : (-12) ÷ (-3) = 4.',
 '{"type":"mcq","question":"Calcule : (-12) ÷ (-3)","options":["-4","4","-36","36"],"answer":"4"}'),

('Carré d''un négatif', 2, 25000, '(-3)² = (-3) × (-3) = 9 (positif car deux négatifs).',
 '{"type":"mcq","question":"Calcule : (-3)²","options":["-9","6","9","-6"],"answer":"9"}'),

('PGCD de 24 et 36', 2, 35000, 'Les facteurs communs de 24 et 36 sont 1,2,3,4,6,12. Le plus grand est 12.',
 '{"type":"mcq","question":"Quel est le PGCD de 24 et de 36 ?","options":["6","8","12","18"],"answer":"12"}'),

('PPCM de 3 et 4', 2, 30000, 'Les multiples de 3 : 3,6,9,12... Les multiples de 4 : 4,8,12... Le premier commun est 12.',
 '{"type":"mcq","question":"Quel est le PPCM de 3 et de 4 ?","options":["7","9","12","24"],"answer":"12"}'),

('Opération avec division et addition', 2, 30000, 'Priorité : division et multiplication avant addition. 144÷12=12, puis 12+5=17.',
 '{"type":"mcq","question":"Calcule : 144 ÷ 12 + 5","options":["12","14","17","20"],"answer":"17"}'),

('Prochain nombre premier', 2, 30000, 'Après 23, on vérifie 24 (non), 25 (non), 26 (non), 27 (non), 28 (non), 29 (premier, car divisible uniquement par 1 et 29).',
 '{"type":"mcq","question":"Quel est le nombre premier qui suit immédiatement 23 ?","options":["25","27","29","31"],"answer":"29"}'),

('Addition de négatif et positif', 2, 25000, '(-8) + 5 : le négatif est plus grand en valeur absolue, donc le résultat est négatif : -3.',
 '{"type":"mcq","question":"Calcule : (-8) + 5","options":["-3","3","-13","13"],"answer":"-3"}'),

('Problème passagers', 2, 35000, '48 passagers × 6 trajets = 288 passagers au total.',
 '{"type":"mcq","question":"Un autobus transporte 48 passagers par trajet. Combien de passagers en tout pour 6 trajets ?","options":["264","276","288","300"],"answer":"288"}'),

('Arrondi au millier', 2, 25000, 'Le chiffre des centaines de 3478 est 4 < 5, donc on arrondit vers le bas : 3000.',
 '{"type":"mcq","question":"Arrondis 3478 au millier près.","options":["3000","3400","3500","4000"],"answer":"3000"}'),

('Multiplication 17 × 18', 2, 35000, '17 × 18 = 17 × 20 - 17 × 2 = 340 - 34 = 306.',
 '{"type":"mcq","question":"Calcule : 17 × 18","options":["296","300","306","316"],"answer":"306"}'),

('Division 240 ÷ 16', 2, 30000, '240 ÷ 16 = 15 car 16 × 15 = 240.',
 '{"type":"mcq","question":"Calcule : 240 ÷ 16","options":["12","14","15","16"],"answer":"15"}'),

('Problème achat multiple', 2, 35000, '3 articles à 12 $ et 5 articles à 8 $ : 3×12 + 5×8 = 36 + 40 = 76 $.',
 '{"type":"mcq","question":"Marc achète 3 articles à 12 $ et 5 articles à 8 $. Combien paie-t-il en tout ?","options":["68 $","72 $","76 $","80 $"],"answer":"76 $"}'),

('Puissance 2 exposant 4', 2, 25000, '2⁴ = 2 × 2 × 2 × 2 = 16.',
 '{"type":"mcq","question":"Calcule : 2⁴","options":["8","12","16","24"],"answer":"16"}'),

('Problème élèves et classes', 2, 35000, '432 élèves ÷ 18 classes = 24 élèves par classe.',
 '{"type":"mcq","question":"Une école a 432 élèves répartis également dans 18 classes. Combien d''élèves par classe ?","options":["22","23","24","25"],"answer":"24"}'),

('Carré de 15', 2, 25000, '15² = 15 × 15 = 225.',
 '{"type":"mcq","question":"Calcule : 15²","options":["175","200","215","225"],"answer":"225"}'),

('Somme 10 premiers naturels', 2, 35000, '1+2+3+4+5+6+7+8+9+10 = 55. On peut utiliser la formule n(n+1)÷2 = 10×11÷2 = 55.',
 '{"type":"mcq","question":"Quelle est la somme des 10 premiers nombres naturels (1 à 10) ?","options":["45","50","55","60"],"answer":"55"}'),

('Priorité avec division', 2, 30000, 'On calcule d''abord 4 × 3 = 12, puis 48 ÷ 12 = 4, puis 4 + 2 = 6.',
 '{"type":"mcq","question":"Calcule : 48 ÷ (4 × 3) + 2","options":["4","6","8","14"],"answer":"6"}'),

('Opération mixte avec parenthèses', 2, 35000, '3 × (10 - 4) ÷ 2 + 1 = 3 × 6 ÷ 2 + 1 = 18 ÷ 2 + 1 = 9 + 1 = 10.',
 '{"type":"mcq","question":"Calcule : 3 × (10 - 4) ÷ 2 + 1","options":["8","9","10","13"],"answer":"10"}'),

('Facteurs de 24', 2, 30000, '24 = 1×24 = 2×12 = 3×8 = 4×6. Ses diviseurs sont : 1,2,3,4,6,8,12,24 → 8 diviseurs.',
 '{"type":"mcq","question":"Combien de diviseurs positifs le nombre 24 possède-t-il ?","options":["6","7","8","9"],"answer":"8"}'),

('Multiple commun', 2, 35000, 'On cherche un nombre divisible par 4 ET par 6. PPCM(4,6)=12. Parmi les choix, 36 = 3×12.',
 '{"type":"mcq","question":"Lequel est un multiple à la fois de 4 et de 6 ?","options":["14","20","36","38"],"answer":"36"}'),

('Puissance de 10', 2, 20000, '10³ = 10 × 10 × 10 = 1000.',
 '{"type":"mcq","question":"Calcule : 10³","options":["30","100","1000","10000"],"answer":"1000"}'),

('Problème économies', 2, 35000, 'Sophie économise 35 $ par semaine. En 8 semaines : 35 × 8 = 280 $.',
 '{"type":"mcq","question":"Sophie économise 35 $ par semaine. Combien aura-t-elle économisé après 8 semaines ?","options":["240 $","270 $","280 $","290 $"],"answer":"280 $"}'),

('Division avec vérification', 2, 30000, '195 ÷ 15 = 13 car 15 × 13 = 195.',
 '{"type":"mcq","question":"Calcule : 195 ÷ 15","options":["11","12","13","14"],"answer":"13"}'),

('Opération avec exposant', 2, 30000, 'On calcule l''exposant d''abord : 3² = 9, puis 2 × 9 + 5 = 18 + 5 = 23.',
 '{"type":"mcq","question":"Calcule : 2 × 3² + 5","options":["15","17","23","29"],"answer":"23"}'),

('Multiplication par 11', 2, 25000, '45 × 11 = 45 × 10 + 45 = 450 + 45 = 495.',
 '{"type":"mcq","question":"Calcule : 45 × 11","options":["455","475","490","495"],"answer":"495"}'),

('Problème distance', 2, 35000, 'Un cycliste roule à 24 km/h pendant 3 heures : 24 × 3 = 72 km.',
 '{"type":"mcq","question":"Un cycliste roule à 24 km/h pendant 3 heures. Quelle distance parcourt-il ?","options":["60 km","66 km","72 km","78 km"],"answer":"72 km"}'),

('Carré de 12', 2, 25000, '12² = 12 × 12 = 144.',
 '{"type":"mcq","question":"Calcule : 12²","options":["120","132","144","148"],"answer":"144"}'),

('Addition entiers avec négatifs', 2, 25000, '(-15) + 8 = -7 car 15 - 8 = 7 et le négatif est dominant.',
 '{"type":"mcq","question":"Calcule : (-15) + 8","options":["-23","-7","7","23"],"answer":"-7"}'),

('Soustraction résultat négatif', 2, 25000, '3 - 10 = -7.',
 '{"type":"mcq","question":"Calcule : 3 - 10","options":["-7","7","-13","13"],"answer":"-7"}'),

('Facteur commun', 2, 30000, 'Les diviseurs communs de 30 et 45 sont 1, 3, 5, 15. Le PGCD est 15.',
 '{"type":"mcq","question":"Quel est le PGCD de 30 et de 45 ?","options":["5","10","15","20"],"answer":"15"}'),

('Puissance carré', 2, 25000, '7² = 49.',
 '{"type":"mcq","question":"Calcule : 7²","options":["14","42","47","49"],"answer":"49"}'),

-- ── DIFFICULTÉ 3 — Problèmes complexes (30 questions) ─────────────────────

('PGCD et application', 3, 45000, 'PGCD(48, 36) = 12. On peut diviser 48 filles en 12 groupes de 4 et 36 garçons en 12 groupes de 3.',
 '{"type":"mcq","question":"On veut former des groupes mixtes égaux avec 48 filles et 36 garçons, sans mélanger les genres. Quel est le nombre maximal de groupes ?","options":["6","9","12","18"],"answer":"12"}'),

('PPCM et problème de rencontre', 3, 45000, 'PPCM(8, 12) = 24. Ils se retrouvent à l''arrêt toutes les 24 minutes.',
 '{"type":"mcq","question":"Un bus passe toutes les 8 minutes et un autre toutes les 12 minutes. Ils se trouvent en même temps à l''arrêt. Dans combien de minutes se retrouveront-ils ensemble ?","options":["4","20","24","48"],"answer":"24"}'),

('Décomposition facteurs premiers complexe', 3, 45000, '120 = 8 × 15 = 2³ × 3 × 5.',
 '{"type":"mcq","question":"Quelle est la décomposition de 120 en facteurs premiers ?","options":["2² × 30","2³ × 15","2³ × 3 × 5","4 × 5 × 6"],"answer":"2³ × 3 × 5"}'),

('Ordre des opérations complexe', 3, 40000, 'On calcule : 3² = 9, 2³ = 8, puis 4 × 9 - 2 × 8 + 10 ÷ 2 = 36 - 16 + 5 = 25.',
 '{"type":"mcq","question":"Calcule : 4 × 3² - 2 × 2³ + 10 ÷ 2","options":["21","25","29","33"],"answer":"25"}'),

('Nombre de diviseurs carré parfait', 3, 45000, '36 = 2² × 3². Les diviseurs de 36 sont : 1,2,3,4,6,9,12,18,36 → 9 diviseurs.',
 '{"type":"mcq","question":"Combien de diviseurs positifs le nombre 36 possède-t-il ?","options":["7","8","9","10"],"answer":"9"}'),

('Somme de nombres premiers consécutifs', 3, 40000, 'Les nombres premiers entre 10 et 20 sont 11, 13, 17, 19. Leur somme est 11+13+17+19 = 60.',
 '{"type":"mcq","question":"Quelle est la somme de tous les nombres premiers situés entre 10 et 20 ?","options":["50","55","60","65"],"answer":"60"}'),

('Problème multi-étapes argent', 3, 45000, 'Alex a 250 $. Il dépense 3 fois 35 $ = 105 $, puis reçoit 2 fois 20 $ = 40 $. Il reste 250 - 105 + 40 = 185 $.',
 '{"type":"mcq","question":"Alex a 250 $. Il fait 3 achats de 35 $ chacun, puis reçoit 2 cadeaux de 20 $ chacun. Combien lui reste-t-il ?","options":["165 $","175 $","185 $","195 $"],"answer":"185 $"}'),

('Puissance et comparaison', 3, 40000, '2¹⁰ = 1024. On compare : 2¹⁰ = 1024 > 1000.',
 '{"type":"mcq","question":"Quelle est la valeur de 2¹⁰ ?","options":["512","1000","1024","2048"],"answer":"1024"}'),

('PPCM à trois nombres', 3, 50000, 'PPCM(2,3,5) = 30. Les multiples de 2,3,5 à la fois sont les multiples de 30.',
 '{"type":"mcq","question":"Quel est le plus petit entier positif divisible par 2, 3 et 5 à la fois ?","options":["15","20","30","60"],"answer":"30"}'),

('Problème partage équitable', 3, 45000, '756 ÷ 12 = 63 par élève.',
 '{"type":"mcq","question":"Un professeur distribue 756 billes également entre 12 élèves. Chaque élève en reçoit combien ?","options":["61","62","63","64"],"answer":"63"}'),

('Carré de grand nombre', 3, 40000, '25² = 625.',
 '{"type":"mcq","question":"Calcule : 25²","options":["500","600","625","650"],"answer":"625"}'),

('Problème production et stock', 3, 45000, 'Stock initial 380 + production 5×75=375 - ventes 4×85=340 = 380+375-340 = 415.',
 '{"type":"mcq","question":"Une usine démarre avec 380 pièces. Elle produit 75 pièces par jour pendant 5 jours et vend 85 pièces par jour pendant 4 jours. Quel est le stock final ?","options":["395","405","415","425"],"answer":"415"}'),

('Nombre avec chiffres contraints', 3, 45000, 'Le nombre doit être pair (unités = 0,2,4,6,8), entre 200 et 300, et divisible par 3. Vérification : 246 → 2+4+6=12 (÷3), pair, entre 200 et 300.',
 '{"type":"mcq","question":"Quel nombre est pair, se situe entre 200 et 300, et est divisible par 3 ?","options":["214","231","246","257"],"answer":"246"}'),

('Différence de carrés', 3, 40000, '8² - 5² = 64 - 25 = 39.',
 '{"type":"mcq","question":"Calcule : 8² - 5²","options":["9","33","39","89"],"answer":"39"}'),

('Opération avec trois exposants', 3, 45000, '2² + 3² + 4² = 4 + 9 + 16 = 29.',
 '{"type":"mcq","question":"Calcule : 2² + 3² + 4²","options":["21","25","29","36"],"answer":"29"}'),

('Problème âge', 3, 40000, 'Luc a x ans. Sophie a 3 fois plus : 3x. Dans 5 ans, Sophie aura 3x+5 = 29, donc 3x = 24, x = 8. Luc a 8 ans.',
 '{"type":"mcq","question":"Sophie a 3 fois l''âge de Luc. Dans 5 ans, Sophie aura 29 ans. Quel âge a Luc maintenant ?","options":["6","7","8","9"],"answer":"8"}'),

('PGCD par algorithme d''Euclide', 3, 50000, 'PGCD(252, 180) : 252 = 1×180 + 72; 180 = 2×72 + 36; 72 = 2×36 + 0. Donc PGCD = 36.',
 '{"type":"mcq","question":"Quel est le PGCD de 252 et de 180 ?","options":["18","24","36","48"],"answer":"36"}'),

('Nombre de multiples dans intervalle', 3, 45000, 'Les multiples de 7 entre 1 et 100 : 7,14,...,98. Le nombre de multiples est ⌊100÷7⌋ = 14.',
 '{"type":"mcq","question":"Combien de multiples de 7 se trouvent entre 1 et 100 (inclusivement) ?","options":["13","14","15","16"],"answer":"14"}'),

('Problème vitesse et durée', 3, 45000, 'Distance totale : 3h à 60 km/h + 2h à 45 km/h = 180 + 90 = 270 km.',
 '{"type":"mcq","question":"Une voiture roule 3 heures à 60 km/h, puis 2 heures à 45 km/h. Quelle distance totale a-t-elle parcourue ?","options":["240 km","255 km","270 km","285 km"],"answer":"270 km"}'),

('Propriété des exposants', 3, 40000, '2⁵ × 2³ = 2^(5+3) = 2⁸ = 256.',
 '{"type":"mcq","question":"Calcule : 2⁵ × 2³","options":["64","128","256","512"],"answer":"256"}'),

('Divisibilité par 11', 3, 45000, 'Un nombre est divisible par 11 si la différence alternée de ses chiffres est divisible par 11. Pour 121 : 1-2+1 = 0, donc 121 ÷ 11 = 11.',
 '{"type":"mcq","question":"Lequel de ces nombres est divisible par 11 ?","options":["112","121","132","143"],"answer":"121"}'),

('Problème suite numérique', 3, 40000, 'La suite augmente de 7 à chaque fois : 5, 12, 19, 26, 33, 40, 47, 54, 61, 68. Le 10e terme est 5 + 9×7 = 68.',
 '{"type":"mcq","question":"Dans la suite 5, 12, 19, 26, ..., quel est le 10e terme ?","options":["61","68","75","82"],"answer":"68"}'),

('PPCM de trois nombres', 3, 50000, 'PPCM(4, 6, 10) = PPCM(12, 10) = 60.',
 '{"type":"mcq","question":"Quel est le PPCM de 4, 6 et 10 ?","options":["20","40","60","120"],"answer":"60"}'),

('Problème de reste', 3, 45000, '150 ÷ 7 = 21 reste 3. Il reste 3 élèves non placés.',
 '{"type":"mcq","question":"On place 150 élèves dans des rangées de 7. Combien d''élèves ne peuvent pas être placés dans une rangée complète ?","options":["1","2","3","4"],"answer":"3"}'),

('Multiplication avec exposants', 3, 40000, '(2³)² = 2^(3×2) = 2⁶ = 64.',
 '{"type":"mcq","question":"Calcule : (2³)²","options":["12","32","64","128"],"answer":"64"}'),

('Problème géométrique entiers', 3, 45000, 'Périmètre d''un rectangle : 2×(longueur + largeur) = 2×(24+18) = 2×42 = 84 m.',
 '{"type":"mcq","question":"Un terrain rectangulaire mesure 24 m de longueur et 18 m de largeur. Quelle est la longueur de la clôture qui l''entoure ?","options":["76 m","80 m","84 m","88 m"],"answer":"84 m"}'),

('Somme de diviseurs', 3, 50000, 'Les diviseurs de 28 sont : 1, 2, 4, 7, 14, 28. Leur somme est 1+2+4+7+14+28 = 56.',
 '{"type":"mcq","question":"Quelle est la somme de tous les diviseurs de 28 ?","options":["48","52","56","60"],"answer":"56"}'),

('Problème remplissage', 3, 45000, 'Robinet A remplit 1/6 du réservoir par heure, robinet B remplit 1/4. Ensemble : 1/6 + 1/4 = 2/12 + 3/12 = 5/12 par heure. Pour remplir : 12/5 = 2,4 heures... Hmm, ce problème implique des fractions. Changeons-le. / Un entrepôt contient 1200 boîtes. On enlève 145 boîtes par jour. Au bout de combien de jours restera-t-il moins de 500 boîtes ? 1200-145d < 500, 145d > 700, d > 4,8 → 5 jours.',
 '{"type":"mcq","question":"Un entrepôt contient 1200 boîtes. On en retire 145 par jour. Au bout de combien de jours restera-t-il moins de 500 boîtes ?","options":["4","5","6","7"],"answer":"5"}'),

('Décomposition et PGCD', 3, 50000, '84 = 2² × 3 × 7 et 126 = 2 × 3² × 7. PGCD = 2 × 3 × 7 = 42.',
 '{"type":"mcq","question":"Quel est le PGCD de 84 et de 126 ?","options":["14","21","42","63"],"answer":"42"}'),

('Exposant et ordre', 3, 40000, '10 + 2³ × 3 - 4² ÷ 2 = 10 + 8×3 - 16÷2 = 10 + 24 - 8 = 26.',
 '{"type":"mcq","question":"Calcule : 10 + 2³ × 3 - 4² ÷ 2","options":["18","22","26","30"],"answer":"26"}'),

('Problème économies avancé', 3, 50000, 'Thomas épargne 45 $ la 1re semaine, 50 $ la 2e, 55 $ la 3e (hausse de 5 $ par semaine). En 6 semaines : 45+50+55+60+65+70 = 345 $.',
 '{"type":"mcq","question":"Thomas épargne 45 $ la première semaine, puis augmente ses économies de 5 $ chaque semaine. Combien aura-t-il épargné après 6 semaines ?","options":["315 $","330 $","345 $","360 $"],"answer":"345 $"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
