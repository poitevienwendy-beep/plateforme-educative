-- ============================================================
-- BANQUE DE QUESTIONS — Orthographe (Sec. 1, Français)
-- PFEQ-FRA-SEC1-ORTH | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-ORTH') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Homophones et accords de base (34 questions) ───────────

('Homophone a vs à', 1, 20000, '« a » = verbe avoir conjugué (il a). « à » = préposition (on peut remplacer par « avait » ; si ça marche, c''est « a »).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il a faim à midi.","Il à faim a midi.","Il a faim a midi.","Il à faim à midi."],"answer":"Il a faim à midi."}'),

('Homophone et vs est', 1, 20000, '« est » = verbe être (il est). « et » = conjonction de coordination (on peut remplacer par « et puis »).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il est grand et fort.","Il est grand est fort.","Il et grand est fort.","Il et grand et fort."],"answer":"Il est grand et fort."}'),

('Homophone son vs sont', 1, 20000, '« sont » = verbe être au pluriel (on peut remplacer par « étaient »). « son » = déterminant possessif.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Ils son contents.","Ils sont contents.","Son frère sont là.","Ils sont content."],"answer":"Ils sont contents."}'),

('Homophone on vs ont', 1, 20000, '« ont » = verbe avoir (ils ont). « on » = pronom sujet (remplaçable par « il »).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["On a mangé, ils on dormi.","On a mangé, ils ont dormi.","Ont a mangé, ils ont dormi.","On a mangé, ils on dormi."],"answer":"On a mangé, ils ont dormi."}'),

('Homophone ou vs où', 1, 20000, '« ou » = conjonction (ou bien). « où » = pronom/adverbe de lieu (on peut remplacer par « là où »).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Où vas-tu ou restes-tu ?","Ou vas-tu où restes-tu ?","Où vas-tu ou restes-tu ?","Ou vas-tu ou restes-tu ?"],"answer":"Où vas-tu ou restes-tu ?"}'),

('Homophone ces vs ses vs c''est vs s''est', 1, 25000, '« ses » = déterminant possessif (les siens). « ces » = déterminant démonstratif (ceux-là).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Ces livres sont ses préférés.","Ses livres sont ces préférés.","Ces livres sont ces préférés.","Ses livres sont ses préférés."],"answer":"Ces livres sont ses préférés."}'),

('Homophone c''est vs s''est', 1, 25000, '« c''est » = ce + est. « s''est » = pronom se + est (verbe pronominal passé composé).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["C''est lui qui s''est blessé.","S''est lui qui c''est blessé.","C''est lui qui c''est blessé.","S''est lui qui s''est blessé."],"answer":"C''est lui qui s''est blessé."}'),

('Homophone mais vs mes', 1, 20000, '« mais » = conjonction d''opposition. « mes » = déterminant possessif 1re pers. pluriel.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["J''aime mes amis mais pas mes ennemis.","J''aime mais amis mes pas mes ennemis.","J''aime mes amis mes pas mes ennemis.","J''aime mais amis mais pas mes ennemis."],"answer":"J''aime mes amis mais pas mes ennemis."}'),

('Homophone ni vs n''y', 1, 25000, '« ni » = conjonction de coordination négative. « n''y » = adverbe de lieu négatif.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il n''y a ni pain ni lait.","Il ni a n''y pain n''y lait.","Il n''y a ni pain n''y lait.","Il ni a ni pain ni lait."],"answer":"Il n''y a ni pain ni lait."}'),

('Homophone leur vs leurs', 1, 20000, '« leur » invariable = pronom (je leur parle). « leurs » variable = déterminant possessif (leurs livres).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Je leur ai donné leurs livres.","Je leurs ai donné leur livres.","Je leur ai donné leur livres.","Je leurs ai donné leurs livres."],"answer":"Je leur ai donné leurs livres."}'),

('Homophone tout vs tous', 1, 25000, '« tous » adjectif ou pronom (tous les élèves, ils sont tous là). « tout » adverbe (invariable, = très).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Tous les élèves sont tout contents.","Tous les élèves sont tous contents.","Tout les élèves sont tout contents.","Tout les élèves sont tous contents."],"answer":"Tous les élèves sont tout contents."}'),

('Accord pluriel des noms en -al', 1, 20000, 'Les noms en -al font généralement leur pluriel en -aux (cheval → chevaux, journal → journaux).',
 '{"type":"mcq","question":"Quel est le pluriel de « animal » ?","options":["animals","animaux","animeaux","animals"],"answer":"animaux"}'),

('Accord pluriel des noms en -ou', 1, 20000, 'La plupart des noms en -ou prennent -s. Mais : bijou, caillou, chou, genou, hibou, joujou, pou → -oux.',
 '{"type":"mcq","question":"Quel est le pluriel de « genou » ?","options":["genous","genoux","genouds","genous"],"answer":"genoux"}'),

('Féminin des adjectifs — doublement de consonne', 1, 20000, 'Certains adjectifs doublent leur consonne finale au féminin : bon → bonne, gros → grosse, ancien → ancienne.',
 '{"type":"mcq","question":"Quel est le féminin de l''adjectif « ancien » ?","options":["anciene","ancienne","ancièn","anciens"],"answer":"ancienne"}'),

('Féminin adjectifs en -eux', 1, 20000, 'Les adjectifs en -eux font leur féminin en -euse (heureux → heureuse, joyeux → joyeuse).',
 '{"type":"mcq","question":"Quel est le féminin de l''adjectif « heureux » ?","options":["heureuse","heureuxe","heureuse","heureusse"],"answer":"heureuse"}'),

('Féminin des noms — métiers', 1, 20000, 'On forme souvent le féminin des métiers en ajoutant -e ou en changeant la terminaison : directeur → directrice.',
 '{"type":"mcq","question":"Quel est le féminin du mot « directeur » ?","options":["directrice","directeure","directeuse","directère"],"answer":"directrice"}'),

('Accord sujet-verbe avec plusieurs sujets', 1, 25000, 'Quand il y a plusieurs sujets, le verbe se met au pluriel.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Pierre et Marie arrive.","Pierre et Marie arrivent.","Pierre et Marie arrivons.","Pierre et Marie arrivez."],"answer":"Pierre et Marie arrivent."}'),

('Accord de l''adjectif au pluriel', 1, 20000, 'L''adjectif s''accorde en genre et en nombre avec le nom. Nom pluriel → adjectif + -s.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Des fleurs rouge.","Des fleurs rouges.","Des fleurs rouges.","Des fleur rouge."],"answer":"Des fleurs rouges."}'),

('Homophone quand vs quant vs qu''en', 1, 25000, '« quand » = conjonction de temps. « quant à » = pour ce qui concerne. « qu''en » = que + en.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Quand arriveras-tu ? Quant à moi, je pars.","Quant arriveras-tu ? Quand à moi, je pars.","Quand arriveras-tu ? Quand à moi, je pars.","Quant arriveras-tu ? Quant à moi, je pars."],"answer":"Quand arriveras-tu ? Quant à moi, je pars."}'),

('Trait d''union — nombres', 1, 20000, 'On met un trait d''union entre les dizaines et les unités : vingt-deux, trente-cinq, soixante-dix.',
 '{"type":"mcq","question":"Laquelle de ces graphies est correcte ?","options":["vingt deux","vingt-deux","vingtdeux","vingts-deux"],"answer":"vingt-deux"}'),

('Majuscule en début de phrase', 1, 15000, 'Toute phrase commence par une majuscule et se termine par un point (. ! ?).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correctement commencée ?","options":["le chat dort.","Le chat dort.","LE chat dort.","le Chat dort."],"answer":"Le chat dort."}'),

('Accord PP avec avoir — pas de CD', 1, 25000, 'Avec avoir, si le CD est placé APRÈS le verbe, le PP ne s''accorde pas.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Elle a mangées des fruits.","Elle a mangé des fruits.","Elle a mangés des fruits.","Elle a mangée des fruits."],"answer":"Elle a mangé des fruits."}'),

('Homophone peu vs peux vs peut', 1, 25000, '« peu » = adverbe (petite quantité). « peux » = verbe pouvoir 1re/2e pers. « peut » = verbe pouvoir 3e pers.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il peut manger un peu.","Il peux manger un peu.","Il peu manger un peu.","Il peut manger un peux."],"answer":"Il peut manger un peu."}'),

('Homophone -é vs -er', 1, 25000, 'Après un verbe conjugué, on utilise l''infinitif (-er), pas le participe (-é). Exception : après être ou avoir.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il veut manger.","Il veut mangé.","Il veut mangée.","Il veut manges."],"answer":"Il veut manger."}'),

('Participe passé vs infinitif', 1, 25000, 'Si on peut remplacer le verbe par « vendre » (infinitif), c''est -er. Si on peut remplacer par « vendu » (participe), c''est -é.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Elle a décidé de partir.","Elle a décider de partir.","Elle a décidée de partir.","Elle a décider de partie."],"answer":"Elle a décidé de partir."}'),

('Accord adjectif de couleur', 1, 25000, 'Les adjectifs de couleur s''accordent sauf quand ils sont composés ou qu''ils proviennent d''un nom (marron, orange, kaki).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Des robes orange et des sacs marrons.","Des robes oranges et des sacs marron.","Des robes orange et des sacs marron.","Des robes oranges et des sacs marrons."],"answer":"Des robes orange et des sacs marron."}'),

('Accord de quel vs qu''elle', 1, 25000, '« quel » (adj. interrogatif) s''accorde avec le nom. « qu''elle » = que + elle (pronom + conjonction).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Quelle belle journée ! Je suis content qu''elle soit là.","Qu''elle belle journée ! Je suis content quel soit là.","Quelle belle journée ! Je suis content quel soit là.","Qu''elle belle journée ! Je suis content qu''elle soit là."],"answer":"Quelle belle journée ! Je suis content qu''elle soit là."}'),

('Accord après « c''est »', 1, 25000, '« c''est » + adjectif → adjectif au masculin singulier (invariable). « ils sont » → accord normal.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["C''est beaux ces fleurs.","C''est belles ces fleurs.","C''est beau, ces fleurs.","Ce sont beau, ces fleurs."],"answer":"C''est beau, ces fleurs."}'),

('Homophone sans vs s''en', 1, 25000, '« sans » = préposition (privation). « s''en » = pronom se + pronom en (elle s''en va).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il part sans rien dire et s''en va.","Il part s''en rien dire et sans va.","Il part sans rien dire et sans va.","Il part s''en rien dire et s''en va."],"answer":"Il part sans rien dire et s''en va."}'),

('Accent grave — là vs la', 1, 20000, '« là » (avec accent) = adverbe de lieu (ici/là). « la » = déterminant ou pronom.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["La fille est la, regarde-la.","La fille est là, regarde-la.","Là fille est là, regarde-la.","La fille est la, regarde-là."],"answer":"La fille est là, regarde-la."}'),

('Deux points et majuscule', 1, 20000, 'Après les deux points, on ne met pas de majuscule sauf si ce qui suit est un nom propre ou une citation (discours direct).',
 '{"type":"mcq","question":"Laquelle utilise correctement les deux points ?","options":["Il a dit : \"Bonne nuit.\"","Il a dit : bonne nuit.","Il a dit: \"Bonne nuit.\"","Il a dit; \"Bonne nuit.\""],"answer":"Il a dit : \"Bonne nuit.\""}'),

('Accord du PP — être', 1, 25000, 'Avec être, le PP s''accorde avec le sujet en genre et en nombre.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Ils sont partis hier.","Ils sont partie hier.","Ils sont parties hier.","Ils sont partis hier."],"answer":"Ils sont partis hier."}'),

-- ── DIFFICULTÉ 2 — Règles complexes et pièges courants (33 questions) ─────

('Homophone davantage vs d''avantage', 2, 35000, '« davantage » = adverbe (plus). « d''avantage(s) » = de + avantage(s) (un nom).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il gagne davantage de points.","Il gagne d''avantage de points.","Il gagne davantage des points.","Il gagne d''avantages de points."],"answer":"Il gagne davantage de points."}'),

('Accord de TOUT', 2, 40000, '« tout » adverbe devant adjectif féminin commençant par consonne ou H aspiré s''accorde (toute, toutes). Devant voyelle, il reste invariable.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Elle est toute contente.","Elle est tout contente.","Elle est touts contente.","Elle est toutes contente."],"answer":"Elle est toute contente."}'),

('Ne… que (restriction)', 2, 35000, '« ne… que » exprime une restriction (seulement). Différent de la négation ne… pas.',
 '{"type":"mcq","question":"Laquelle de ces phrases exprime la restriction ?","options":["Il ne mange pas de légumes.","Il ne mange que des légumes.","Il ne mange ni légumes.","Il ne mange jamais de légumes."],"answer":"Il ne mange que des légumes."}'),

('PP après un pronom relatif', 2, 40000, 'Si le pronom relatif « que » est CD et précède le PP (auxiliaire avoir), le PP s''accorde.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["La robe que j''ai acheté est belle.","La robe que j''ai achetée est belle.","La robe que j''ai acheté est belles.","La robe que j''ai achetées est belle."],"answer":"La robe que j''ai achetée est belle."}'),

('Accord adjectif — épithète détachée', 2, 40000, 'L''adjectif épithète détachée (mis en apposition) s''accorde avec le nom auquel il se rapporte.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Fatiguée, Marie s''est couchée tôt.","Fatigué, Marie s''est couchée tôt.","Fatiguée, Marie s''est coucher tôt.","Fatiguées, Marie s''est couchée tôt."],"answer":"Fatiguée, Marie s''est couchée tôt."}'),

('Invariabilité de certains adverbes', 2, 35000, 'Les adverbes sont invariables. « Possible » employé avec « le plus possible » est adverbe → invariable.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Répondez le plus vite possible.","Répondez le plus vite possibles.","Répondez les plus vite possibles.","Répondez le plus vite possiblement."],"answer":"Répondez le plus vite possible."}'),

('Accord de demi', 2, 35000, '« demi » avant le nom (avec trait d''union) est invariable. « demi » après le nom s''accorde en genre seulement.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["une demi-heure et demie","une demi-heure et demi","une demie-heure et demi","une demi-heure et demies"],"answer":"une demi-heure et demie"}'),

('Accord de même', 2, 35000, '« même » adjectif s''accorde. « même » adverbe (= aussi, jusqu''à) est invariable.',
 '{"type":"mcq","question":"Dans « Les enfants eux-mêmes ont ri », « mêmes » est...","options":["Un adjectif variable","Un adverbe invariable","Un verbe conjugué","Une préposition"],"answer":"Un adjectif variable"}'),

('Accord de tel', 2, 40000, '« tel » s''accorde avec le nom qui suit : « telle une étoile ». « tel que » s''accorde avec le nom qui précède.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Des experts tels que lui sont rares.","Des experts tel que lui sont rares.","Des experts tels qu''ils sont rares.","Des experts tel qu''eux sont rares."],"answer":"Des experts tels que lui sont rares."}'),

('Accord de nu', 2, 35000, '« nu » avant le nom (avec trait d''union) est invariable. Après le nom, il s''accorde.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il marche nu-pieds.","Il marche nu-pied.","Il marche nus-pieds.","Ils marchent pieds nus."],"answer":"Ils marchent pieds nus."}'),

('PP du verbe laisser + infinitif', 2, 40000, 'Le PP du verbe « laisser » suivi d''un infinitif est généralement invariable.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Elle s''est laissé tomber.","Elle s''est laissée tomber.","Elle s''est laissés tomber.","Elle s''est laissée tombé."],"answer":"Elle s''est laissé tomber."}'),

('Accord de PP — verbe faire', 2, 40000, 'Le PP du verbe « faire » suivi d''un infinitif est toujours invariable.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Elle les a fait courir.","Elle les a faits courir.","Elle les a faites courir.","Elle les a faire courir."],"answer":"Elle les a fait courir."}'),

('Erreur fréquente — palais/palace', 2, 35000, 'Ne pas confondre les mots de la même famille ou les homophones approximatifs. « Palais » vs « palace » (anglicisme).',
 '{"type":"mcq","question":"Laquelle de ces phrases utilise correctement un mot français ?","options":["Il habite dans un palace.","Il habite dans un palais.","Il habite dans un pâlace.","Il habite dans un pallas."],"answer":"Il habite dans un palais."}'),

('Accord après « se faire »', 2, 40000, 'Le PP de « se faire » suivi d''un infinitif est invariable (comme faire).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Elle s''est fait attaquer.","Elle s''est faite attaquer.","Elle s''est fait attaqué.","Elle s''est faites attaquer."],"answer":"Elle s''est fait attaquer."}'),

('Accord de l''attribut du CD', 2, 40000, 'L''attribut du CD (après rendre, appeler, trouver, élire, nommer, juger) s''accorde avec le CD.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["On les a nommé présidentes.","On les a nommées présidentes.","On les a nommés présidente.","On les a nommé présidente."],"answer":"On les a nommées présidentes."}'),

('Doubles consonnes — règle', 2, 35000, 'Certains préfixes entraînent un doublement : ir- + rationnel = irrationnel. Re- devant voyelle = redoublement possible.',
 '{"type":"mcq","question":"Lequel de ces mots est correctement orthographié ?","options":["irresponsable","iresponsable","irrresponsable","irresponsables"],"answer":"irresponsable"}'),

('Tréma', 2, 35000, 'Le tréma indique que deux voyelles consécutives se prononcent séparément (naïf, noël, maïs).',
 '{"type":"mcq","question":"Lequel de ces mots nécessite un tréma ?","options":["noel","noël","nöel","noël"],"answer":"noël"}'),

('Cédille', 2, 30000, 'La cédille se place sous le c (ç) devant a, o, u pour obtenir le son [s]. Ex : garçon, leçon, façon.',
 '{"type":"mcq","question":"Lequel de ces mots est correctement orthographié ?","options":["garcon","garçon","garçone","garçeons"],"answer":"garçon"}'),

-- ── DIFFICULTÉ 3 — Pièges avancés et cas particuliers (33 questions) ──────

('PP verbe impersonnel', 3, 50000, 'Le PP des verbes impersonnels (il a fallu, il a plu, il a neigé) est toujours invariable.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Les efforts qu''il a fallu faire étaient énormes.","Les efforts qu''il a fallus faire étaient énormes.","Les efforts qu''il a fallues faire étaient énormes.","Les efforts qu''il a fallut faire étaient énormes."],"answer":"Les efforts qu''il a fallu faire étaient énormes."}'),

('Accord de PP — verbes d''opinion', 3, 55000, 'Le PP des verbes de perception (voir, entendre, sentir) suivi d''un infinitif s''accorde si le CD fait l''action de l''infinitif.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ? (Les filles chantaient — elles font l''action)","options":["Les filles que j''ai entendu chanter étaient belles.","Les filles que j''ai entendues chanter étaient belles.","Les filles que j''ai entendus chanter étaient belles.","Les filles que j''ai entendue chanter étaient belles."],"answer":"Les filles que j''ai entendues chanter étaient belles."}'),

('Accord de PP — en', 3, 50000, 'Quand le CD est le pronom « en », le PP reste invariable.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Des pommes ? J''en ai mangées.","Des pommes ? J''en ai mangé.","Des pommes ? J''en ai mangés.","Des pommes ? J''en ai mangée."],"answer":"Des pommes ? J''en ai mangé."}'),

('Accord de PP — attribut', 3, 55000, 'Le PP employé comme attribut du sujet (avec être) s''accorde avec le sujet.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Ces questions semblent bien posés.","Ces questions semblent bien posées.","Ces questions semblent bien posée.","Ces questions semblent bien poser."],"answer":"Ces questions semblent bien posées."}'),

('Homophones — censé vs sensé', 3, 50000, '« censé » (supposé, est censé faire). « sensé » (qui a du sens, une idée sensée).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il est censé arriver à 9h.","Il est sensé arriver à 9h.","Il est censée arriver à 9h.","Il est sensée arriver à 9h."],"answer":"Il est censé arriver à 9h."}'),

('Homophones — pallier vs pâlir', 3, 50000, '« pallier » = remédier à (pallier un problème, sans préposition « à »).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Il faut pallier à ce problème.","Il faut pallier ce problème.","Il faut pâlier ce problème.","Il faut palier à ce problème."],"answer":"Il faut pallier ce problème."}'),

('Accord de « nu-tête » etc.', 3, 50000, '« Nu » devant un nom (avec trait d''union) est invariable : nu-pieds, nu-tête, nu-bras.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Ils sont sortis nus-pieds.","Ils sont sortis nu-pieds.","Ils sont sortis nud-pieds.","Ils sont sortis nue-pieds."],"answer":"Ils sont sortis nu-pieds."}'),

('Accord de PP — collectifs', 3, 55000, 'Après un collectif (une foule de, un groupe de, la majorité de), le PP s''accorde avec le nom collectif ou avec le nom qui suit selon le sens.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["La majorité des élèves est venue.","La majorité des élèves sont venus.","La majorité des élèves a venus.","La majorité des élèves est venu."],"answer":"La majorité des élèves est venue."}'),

('Double négation', 3, 50000, 'En français standard, une double négation est à éviter. « Je n''ai rien vu » (pas « Je n''ai pas rien vu »).',
 '{"type":"mcq","question":"Laquelle de ces phrases est correctement formulée ?","options":["Je n''ai pas rien dit.","Je n''ai rien dit.","Je ai rien dit.","Je n''ai pas dit rien."],"answer":"Je n''ai rien dit."}'),

('Erreur sur l''apostrophe', 3, 50000, 'On élide les voyelles a, e, i devant un mot commençant par une voyelle ou un h muet. Mais pas devant un h aspiré.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Je suis allé en Haïti l''été passé.","Je suis allé en Haïti l''été passé.","Je suis allé en Haïti la été passé.","Je suis allée en Haïti l''été passée."],"answer":"Je suis allé en Haïti l''été passé."}'),

('Accord après « plus d''un »', 3, 55000, '« Plus d''un » est suivi d''un verbe au singulier. « Moins de deux » est suivi d''un verbe au pluriel.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Plus d''un élève ont réussi.","Plus d''un élève a réussi.","Plus d''un élève ont réussit.","Plus d''un élève réussirent."],"answer":"Plus d''un élève a réussi."}'),

('PP après « combien »', 3, 55000, 'Quand « combien de » est CD et placé avant le verbe (avoir), le PP s''accorde avec le nom sous-entendu.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Combien de pages as-tu lu ?","Combien de pages as-tu lues ?","Combien de pages as-tu lus ?","Combien de pages as-tu lis ?"],"answer":"Combien de pages as-tu lues ?"}'),

('Accord adjectif — invariable', 3, 50000, 'Certains adjectifs sont toujours invariables : chic, sympa, super, extra, bon marché, etc.',
 '{"type":"mcq","question":"Laquelle de ces phrases est correcte ?","options":["Des prix bon marché.","Des prix bons marchés.","Des prix bons marché.","Des prix bon marchés."],"answer":"Des prix bon marché."}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
