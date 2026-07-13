-- ============================================================
-- COMPLÉMENT FRANÇAIS — Toutes compétences
-- Grammaire (+20), Conjugaison (+19), Orthographe (+15),
-- Vocabulaire (+22), Compréhension de texte (+15), Rédaction (+11)
-- Exécuter dans Supabase → SQL Editor → Run
-- ============================================================

-- ─── GRAMMAIRE (+20) ──────────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-GR') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Classes de mots — déterminant', 1, 15000, 'Un déterminant précède le nom et s accorde avec lui.',
 '{"type":"mcq","question":"Dans « les grandes forêts », quel mot est un déterminant ?","options":["les","grandes","forêts","et"],"answer":"les"}'),

('Classes de mots — adjectif qualificatif', 1, 15000, 'L adjectif qualificatif décrit ou caractérise le nom.',
 '{"type":"mcq","question":"Dans « un ciel bleu magnifique », combien y a-t-il d adjectifs qualificatifs ?","options":["1","2","3","0"],"answer":"2"}'),

('Groupe nominal — noyau', 1, 20000, 'Le noyau du GN est toujours un nom ou un pronom.',
 '{"type":"mcq","question":"Dans « la vieille maison abandonnée », quel est le noyau du GN ?","options":["vieille","maison","abandonnée","la"],"answer":"maison"}'),

('Sujet — trouver le sujet', 1, 20000, 'Le sujet répond à la question « qui est-ce qui ? ».',
 '{"type":"mcq","question":"Dans « Demain, mes amis arrivent. » Quel est le sujet ?","options":["Demain","mes","amis","arrivent"],"answer":"amis"}'),

('Prédicat de la phrase', 1, 20000, 'Le prédicat dit ce que fait ou ce qu est le sujet.',
 '{"type":"mcq","question":"Dans « Le chien dort paisiblement. » Quel est le prédicat ?","options":["Le chien","dort paisiblement","paisiblement","chien dort"],"answer":"dort paisiblement"}'),

('Phrase de base — structure', 1, 15000, 'La phrase de base a un sujet et un prédicat ; le complément de phrase est facultatif.',
 '{"type":"mcq","question":"Combien de constituants obligatoires a une phrase de base ?","options":["1","2","3","4"],"answer":"2"}'),

('Type de phrase — interrogative', 1, 15000, 'La phrase interrogative pose une question.',
 '{"type":"mcq","question":"Quel type de phrase est « Où vas-tu ce soir ? »","options":["déclarative","impérative","interrogative","exclamative"],"answer":"interrogative"}'),

('Type de phrase — exclamative', 1, 15000, 'La phrase exclamative exprime une émotion forte.',
 '{"type":"mcq","question":"Quel type de phrase est « Comme cette maison est belle ! »","options":["déclarative","exclamative","impérative","interrogative"],"answer":"exclamative"}'),

('Ponctuation — virgule dans une liste', 1, 15000, 'On sépare les éléments d une liste par des virgules.',
 '{"type":"mcq","question":"Laquelle est correctement ponctuée ?","options":["J aime les pommes et les poires, les cerises.","J aime les pommes, les poires et les cerises.","J aime, les pommes les poires et les cerises.","J aime les pommes, les poires, et les cerises,"],"answer":"J aime les pommes, les poires et les cerises."}'),

('Accord du verbe avec le sujet', 2, 25000, 'Le verbe s accorde en personne et en nombre avec son sujet.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Tes amis arrivent demain.","Tes amis arrive demain.","Tes amis arrivons demain.","Tes amis arrivez demain."],"answer":"Tes amis arrivent demain."}'),

('Complément direct du verbe', 2, 25000, 'Le CD répond à « qui ? » ou « quoi ? » après le verbe.',
 '{"type":"mcq","question":"Dans « Marie mange une pomme. » Quel est le complément direct ?","options":["Marie","mange","une pomme","une"],"answer":"une pomme"}'),

('Complément indirect du verbe', 2, 25000, 'Le CI est introduit par une préposition.',
 '{"type":"mcq","question":"Dans « Il parle à son ami. » Quel est le complément indirect ?","options":["Il","parle","à son ami","son ami"],"answer":"à son ami"}'),

('Attribut du sujet', 2, 30000, 'L attribut du sujet suit un verbe attributif comme « être, sembler, paraître ».',
 '{"type":"mcq","question":"Dans « Ce gâteau est délicieux. » Quel est l attribut du sujet ?","options":["Ce gâteau","est","délicieux","Ce"],"answer":"délicieux"}'),

('Phrase transformée — négative', 2, 25000, 'La négation encadre le verbe : ne…pas, ne…jamais, etc.',
 '{"type":"mcq","question":"Transforme en négative : « Il mange des légumes. »","options":["Il mange pas des légumes.","Il ne mange pas des légumes.","Il ne mange pas de légumes.","Il n mange pas légumes."],"answer":"Il ne mange pas de légumes."}'),

('Phrase passive', 2, 30000, 'À la voix passive, le sujet subit l action.',
 '{"type":"mcq","question":"Quelle phrase est à la voix passive ?","options":["Le chat mange la souris.","La souris est mangée par le chat.","Le chat a mangé.","La souris mange."],"answer":"La souris est mangée par le chat."}'),

('Subordonnée relative', 2, 30000, 'La subordonnée relative commence par un pronom relatif (qui, que, dont…).',
 '{"type":"mcq","question":"Dans « Le livre que tu lis est intéressant. » Quelle est la subordonnée relative ?","options":["Le livre","que tu lis","est intéressant","tu lis"],"answer":"que tu lis"}'),

('Subordonnée conjonctive — cause', 2, 30000, 'La conjonction « parce que » introduit une cause.',
 '{"type":"mcq","question":"Dans « Il est absent parce qu il est malade. » Quel lien logique la subordonnée exprime-t-elle ?","options":["but","conséquence","cause","opposition"],"answer":"cause"}'),

('Ellipse du sujet en coordination', 3, 35000, 'Quand le sujet est identique, on peut ne pas le répéter.',
 '{"type":"mcq","question":"Dans « Léa étudie et réussit. » Quel est le sujet de « réussit » ?","options":["étudie","et","Léa","réussit"],"answer":"Léa"}'),

('Coordination vs subordination', 3, 35000, 'La coordination relie des éléments de même niveau ; la subordination crée une hiérarchie.',
 '{"type":"mcq","question":"Dans « Il viendra quand il aura fini. » Quel rapport y a-t-il ?","options":["coordination","juxtaposition","subordination","apposition"],"answer":"subordination"}'),

('Sens de connecteurs', 3, 35000, 'Les connecteurs organisent les idées et indiquent les relations logiques.',
 '{"type":"mcq","question":"Quel connecteur indique une opposition ?","options":["donc","car","cependant","ainsi"],"answer":"cependant"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── CONJUGAISON (+19) ────────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-CONJ') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Indicatif présent — être', 1, 15000, 'Conjugaison du verbe être au présent.',
 '{"type":"mcq","question":"Conjugue « être » à la 3e personne du pluriel au présent.","options":["est","sont","étaient","seront"],"answer":"sont"}'),

('Indicatif présent — avoir', 1, 15000, 'Conjugaison du verbe avoir au présent.',
 '{"type":"mcq","question":"Conjugue « avoir » à la 1re personne du singulier au présent.","options":["as","ai","a","avons"],"answer":"ai"}'),

('Présent — verbe aller', 1, 15000, 'Aller est un verbe irrégulier très fréquent.',
 '{"type":"mcq","question":"Conjugue « aller » à la 2e personne du pluriel au présent.","options":["allez","vont","alles","allons"],"answer":"allez"}'),

('Présent — verbe pouvoir', 1, 20000, 'Pouvoir est un verbe modal irrégulier.',
 '{"type":"mcq","question":"Conjugue « pouvoir » à la 1re personne du singulier au présent.","options":["peut","pouvons","peux","pouves"],"answer":"peux"}'),

('Imparfait — terminaisons', 1, 20000, 'L imparfait se forme sur le radical du présent + terminaisons -ais, -ais, -ait…',
 '{"type":"mcq","question":"Quelle est la terminaison de l imparfait à la 1re personne du singulier ?","options":["-ais","-ai","-ait","-ons"],"answer":"-ais"}'),

('Passé composé — auxiliaire avoir', 1, 20000, 'Passé composé = avoir (présent) + participe passé.',
 '{"type":"mcq","question":"Conjugue « manger » au passé composé à la 1re personne du singulier.","options":["j ai mangé","j avais mangé","j eus mangé","je mangeais"],"answer":"j ai mangé"}'),

('Passé composé — auxiliaire être', 1, 25000, 'Certains verbes forment leur passé composé avec « être ».',
 '{"type":"mcq","question":"Conjugue « partir » au passé composé à la 3e personne du singulier (sujet masculin).","options":["il a parti","il est parti","il avait parti","il fut parti"],"answer":"il est parti"}'),

('Futur simple — terminaisons', 1, 20000, 'Le futur simple se forme sur l infinitif + terminaisons -ai, -as, -a…',
 '{"type":"mcq","question":"Conjugue « chanter » au futur simple à la 2e personne du singulier.","options":["chanteras","chantera","chantais","chanteras"],"answer":"chanteras"}'),

('Futur simple — verbe venir', 1, 20000, 'Venir est irrégulier au futur : viendrai, viendras…',
 '{"type":"mcq","question":"Conjugue « venir » au futur simple à la 1re personne du singulier.","options":["veniras","viendrai","viendrais","venira"],"answer":"viendrai"}'),

('Conditionnel présent — formation', 2, 25000, 'Conditionnel = infinitif + terminaisons de l imparfait.',
 '{"type":"mcq","question":"Conjugue « parler » au conditionnel présent à la 3e personne du singulier.","options":["parlerait","parlait","parlera","parlerait"],"answer":"parlerait"}'),

('Subjonctif présent — que je', 2, 30000, 'Le subjonctif est souvent introduit par « que ».',
 '{"type":"mcq","question":"Conjugue « faire » au subjonctif présent à la 1re personne du singulier.","options":["que je fais","que je ferai","que je fasse","que je faisais"],"answer":"que je fasse"}'),

('Accord du participe passé avec avoir', 2, 30000, 'Avec avoir, le participe s accorde avec le CD si celui-ci est placé avant.',
 '{"type":"mcq","question":"Dans « Les fleurs qu il a cueillies », pourquoi le participe est accordé ?","options":["Parce que le sujet est féminin","Parce que le CD précède le verbe","Parce que l auxiliaire est avoir","Le participe ne s accorde pas ici"],"answer":"Parce que le CD précède le verbe"}'),

('Accord du participe passé avec être', 2, 25000, 'Avec être, le participe s accorde avec le sujet.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["Elles sont partis.","Elles sont partie.","Elles sont parties.","Elles sont partied."],"answer":"Elles sont parties."}'),

('Impératif présent — 2e personne', 2, 25000, 'À l impératif, la 2e pers. sing. des verbes en -er perd le -s final.',
 '{"type":"mcq","question":"Quelle est la forme correcte de l impératif de « parler » à la 2e pers. sing. ?","options":["parles","parle","parlez","parlons"],"answer":"parle"}'),

('Passé simple — 3e personne sing.', 2, 30000, 'Le passé simple indique une action passée et délimitée dans le temps.',
 '{"type":"mcq","question":"Conjugue « venir » au passé simple à la 3e personne du singulier.","options":["il venait","il vint","il est venu","il viendra"],"answer":"il vint"}'),

('Distinguer imparfait et passé composé', 3, 35000, 'L imparfait décrit une durée ; le passé composé exprime un fait accompli.',
 '{"type":"mcq","question":"Quel temps choisir ? « Pendant qu il _____ (lire), le téléphone a sonné. »","options":["a lu","lisait","lira","lirait"],"answer":"lisait"}'),

('Concordance des temps', 3, 40000, 'Le temps de la subordonnée dépend du temps de la principale.',
 '{"type":"mcq","question":"Complète : « Je savais que tu _____ (venir) demain. »","options":["es venu","viendras","viendrais","venais"],"answer":"viendrais"}'),

('Voix passive — conjugaison', 3, 35000, 'Voix passive = être (temps voulu) + participe passé.',
 '{"type":"mcq","question":"Transforme à la voix passive : « Les enfants jouent le spectacle. »","options":["Le spectacle sera joué.","Le spectacle est joué par les enfants.","Les enfants sont joués.","Le spectacle joue les enfants."],"answer":"Le spectacle est joué par les enfants."}'),

('Gérondif — formation et sens', 3, 35000, 'Gérondif = en + participe présent ; il exprime la simultanéité ou la manière.',
 '{"type":"mcq","question":"Dans « Il écoute de la musique en faisant ses devoirs. » Quel sens a le gérondif ?","options":["cause","but","simultanéité","opposition"],"answer":"simultanéité"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── ORTHOGRAPHE (+15) ────────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-ORTH') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Homophones a / à', 1, 15000, '« a » = verbe avoir ; « à » = préposition. Remplace par « avait » pour vérifier.',
 '{"type":"mcq","question":"Complète : « Il ___ beaucoup de talent. »","options":["à","a","ah","â"],"answer":"a"}'),

('Homophones ce / se', 1, 15000, '« se » est un pronom réfléchi ; « ce » est un déterminant ou pronom démonstratif.',
 '{"type":"mcq","question":"Complète : « ___ livre est le mien. »","options":["Se","Ce","S","Ça"],"answer":"Ce"}'),

('Accord nom et adjectif — féminin', 1, 20000, 'L adjectif s accorde en genre et en nombre avec le nom qu il qualifie.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["une robe bleue","une robe bleu","un robe bleue","une robe bleues"],"answer":"une robe bleue"}'),

('Accord nom et adjectif — pluriel', 1, 20000, 'Au pluriel, on ajoute un -s sauf si le mot se termine déjà par -s, -x, -z.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["des fleurs belles","des fleurs belle","des fleur belles","des fleurs belles"],"answer":"des fleurs belles"}'),

('Majuscule — début de phrase', 1, 10000, 'On met une majuscule au début de chaque phrase.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["le chat dort.","Le chat dort.","le Chat dort.","Le Chat dort."],"answer":"Le chat dort."}'),

('Homophones ou / où', 1, 15000, '« ou » est une conjonction (sinon = « ou bien ») ; « où » indique le lieu ou le temps.',
 '{"type":"mcq","question":"Complète : « Vas-tu à Québec ___ à Montréal ? »","options":["où","ou","oh","au"],"answer":"ou"}'),

('Doublement de la consonne finale', 2, 25000, 'Certains verbes doublent la consonne avant -er : jeter → je jette.',
 '{"type":"mcq","question":"Laquelle est correcte au présent ?","options":["il jete","il jette","il jets","il jètte"],"answer":"il jette"}'),

('Accentuation — é vs è', 2, 20000, 'L accent grave (è) s utilise sur une syllabe ouverte suivie d une consonne prononcée.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["il lève","il leve","il lêve","il lève"],"answer":"il lève"}'),

('Pluriel des noms en -eau', 2, 20000, 'Les noms en -eau font leur pluriel en -eaux.',
 '{"type":"mcq","question":"Quel est le pluriel de « gâteau » ?","options":["gâteaux","gâteaus","gâteaues","gâteausses"],"answer":"gâteaux"}'),

('Pluriel des noms en -al', 2, 25000, 'La plupart des noms en -al font leur pluriel en -aux.',
 '{"type":"mcq","question":"Quel est le pluriel de « animal » ?","options":["animals","animaux","animalx","animales"],"answer":"animaux"}'),

('Tréma — distinction', 2, 20000, 'Le tréma indique que la voyelle doit être prononcée séparément.',
 '{"type":"mcq","question":"Lequel s écrit avec un tréma ?","options":["naïf","naitre","nuit","voix"],"answer":"naïf"}'),

('Trait d union dans les nombres', 2, 20000, 'On met un trait d union entre les dizaines et les unités (si pas de « et »).',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["vingt et deux","vingt-deux","vingt deux","vingt-et-deux"],"answer":"vingt-deux"}'),

('Accord du participe en -ant', 3, 35000, 'Le participe présent est invariable ; l adjectif verbal s accorde.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["des enfants souriants","des enfants souriant","des enfants souriantes","des enfants sourianttes"],"answer":"des enfants souriants"}'),

('Homophones leur / leurs', 3, 30000, '« leurs » est pluriel quand il y a plusieurs objets possédés.',
 '{"type":"mcq","question":"Laquelle est correcte ? Les élèves ont oublié ___ cahiers.","options":["leur","leurs","leure","luers"],"answer":"leurs"}'),

('Orthographe — verbes en -eler/-eter', 3, 35000, 'Appeler : j appelle (doublement) ; jeter : je jette.',
 '{"type":"mcq","question":"Laquelle est correcte ?","options":["j appèle","j appelle","j appel","japel"],"answer":"j appelle"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── VOCABULAIRE (+22) ────────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-VOC') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Synonymes de « beau »', 1, 15000, 'Les synonymes ont un sens proche mais des nuances différentes.',
 '{"type":"mcq","question":"Quel mot est synonyme de « beau » ?","options":["laid","magnifique","étrange","faible"],"answer":"magnifique"}'),

('Antonyme de « rapide »', 1, 15000, 'Les antonymes ont des sens opposés.',
 '{"type":"mcq","question":"Quel est l antonyme de « rapide » ?","options":["vite","lent","fort","grand"],"answer":"lent"}'),

('Sens d un mot en contexte', 1, 20000, 'Le sens d un mot peut changer selon le contexte.',
 '{"type":"mcq","question":"Dans « Il a une mine épuisée », que signifie « mine » ?","options":["excavation","expression du visage","ressource minière","crayon"],"answer":"expression du visage"}'),

('Préfixe — dé/dis', 1, 15000, 'Le préfixe « dé- » ou « dis- » indique souvent une action inverse.',
 '{"type":"mcq","question":"Que signifie « désaccord » ?","options":["très bon accord","accord partiel","manque d accord","accord rapide"],"answer":"manque d accord"}'),

('Suffixe — -eur/-eure', 1, 15000, 'Le suffixe -eur indique souvent une personne qui fait une action.',
 '{"type":"mcq","question":"Que désigne « lecteur » ?","options":["action de lire","personne qui lit","livre","bibliothèque"],"answer":"personne qui lit"}'),

('Champ lexical de la nature', 1, 15000, 'Un champ lexical regroupe des mots autour d un même thème.',
 '{"type":"mcq","question":"Lequel N APPARTIENT PAS au champ lexical de la forêt ?","options":["arbre","feuille","racine","volant"],"answer":"volant"}'),

('Mot générique et mot spécifique', 1, 15000, 'Le générique est plus large ; le spécifique est plus précis.',
 '{"type":"mcq","question":"Quel mot est le plus générique ?","options":["chêne","bouleau","arbre","sapin"],"answer":"arbre"}'),

('Famille de mots — racine', 1, 15000, 'Les mots d une même famille partagent une racine commune.',
 '{"type":"mcq","question":"Lequel appartient à la même famille que « soleil » ?","options":["sol","solaire","solide","isolation"],"answer":"solaire"}'),

('Polysémie — double sens', 2, 25000, 'Un mot polysémique a plusieurs sens différents.',
 '{"type":"mcq","question":"Dans « La note de musique est haute » et « Il a eu une bonne note », quel phénomène observe-t-on ?","options":["synonymie","homonymie","polysémie","antonymie"],"answer":"polysémie"}'),

('Registre soutenu vs familier', 2, 25000, 'Le registre soutenu est plus formel ; le familier, plus décontracté.',
 '{"type":"mcq","question":"Quel mot appartient au registre soutenu ?","options":["bosser","travailler","boulot","taffer"],"answer":"travailler"}'),

('Expression figurée — métaphore', 2, 30000, 'Une métaphore compare sans utiliser « comme ».',
 '{"type":"mcq","question":"Dans « Il est une étoile du football. » Quel procédé stylistique est utilisé ?","options":["comparaison","métaphore","hyperbole","antithèse"],"answer":"métaphore"}'),

('Niveau de langue — choix', 2, 25000, 'On adapte son vocabulaire selon le contexte (formel ou informel).',
 '{"type":"mcq","question":"Quel mot convient dans une lettre formelle pour « J ai pogné un rhume » ?","options":["attrapé","pris","eu","contracté"],"answer":"contracté"}'),

('Nuance entre synonymes', 2, 30000, 'Les synonymes peuvent exprimer des nuances de degré ou de sens.',
 '{"type":"mcq","question":"Lequel exprime la plus grande intensité de « peur » ?","options":["inquiétude","appréhension","terreur","méfiance"],"answer":"terreur"}'),

('Préfixe « anti- »', 2, 25000, 'Anti- signifie « contre ».',
 '{"type":"mcq","question":"Que signifie « anticonstitutionnel » ?","options":["conforme à la constitution","contre la constitution","pour la constitution","sans constitution"],"answer":"contre la constitution"}'),

('Mot-valise', 2, 25000, 'Un mot-valise combine deux mots pour en créer un nouveau.',
 '{"type":"mcq","question":"« Courriel » est formé à partir de…","options":["courrier + email","courrir + mail","cour + riel","courante + mail"],"answer":"courrier + email"}'),

('Homonymes — sens différents', 2, 25000, 'Les homonymes se prononcent pareil mais ont des sens différents.',
 '{"type":"mcq","question":"Lequel est un homonyme de « mer » ?","options":["mère","amère","mer","mère et mère"],"answer":"mère"}'),

('Périphrases courantes', 3, 35000, 'Une périphrase remplace un mot par une expression plus longue.',
 '{"type":"mcq","question":"Quelle périphrase désigne le soleil ?","options":["l astre du jour","l étoile polaire","la planète rouge","le globe céleste"],"answer":"l astre du jour"}'),

('Etymologie grecque — philo', 3, 35000, 'Philo- vient du grec et signifie « ami de, qui aime ».',
 '{"type":"mcq","question":"Que signifie « philanthrope » ?","options":["ennemi des humains","qui aime les humains","qui craint les humains","qui étudie les humains"],"answer":"qui aime les humains"}'),

('Connotation positive ou négative', 3, 35000, 'Certains mots ont une connotation positive ou négative au-delà de leur sens littéral.',
 '{"type":"mcq","question":"Lequel a une connotation positive ?","options":["rusé","calculateur","déterminé","entêté"],"answer":"déterminé"}'),

('Figement d une expression', 3, 35000, 'Une expression figée ne peut pas être modifiée sans perdre son sens.',
 '{"type":"mcq","question":"Que signifie l expression « avoir le cafard » ?","options":["avoir un insecte","être triste","être malade","être fatigué"],"answer":"être triste"}'),

('Néologisme — mot nouveau', 3, 35000, 'Un néologisme est un mot nouveau créé pour désigner une réalité moderne.',
 '{"type":"mcq","question":"Lequel est un néologisme lié aux technologies ?","options":["table","selfie","chaise","arbre"],"answer":"selfie"}'),

('Champ sémantique — nuances', 3, 40000, 'Les mots d un champ sémantique partagent un domaine de sens.',
 '{"type":"mcq","question":"Quel mot appartient au champ sémantique de « colère » ?","options":["joie","fureur","mélancolie","sérénité"],"answer":"fureur"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── COMPRÉHENSION DE TEXTE (+15) ─────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-COMP') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Identifier le sujet d un texte', 1, 20000, 'Le sujet est le thème principal dont traite le texte.',
 '{"type":"mcq","question":"Un texte parle des habitudes alimentaires des ours. Quel est son sujet principal ?","options":["les ours","la forêt","les animaux","la nourriture"],"answer":"les ours"}'),

('Distinguer fait et opinion', 1, 20000, 'Un fait est vérifiable ; une opinion exprime un point de vue.',
 '{"type":"mcq","question":"Laquelle est une opinion ?","options":["Le loup est un mammifère.","Les loups vivent en meutes.","Le loup est le plus bel animal.","Il existe plusieurs espèces de loups."],"answer":"Le loup est le plus bel animal."}'),

('Inférence simple', 1, 25000, 'Une inférence est une conclusion qu on tire de ce qui n est pas dit explicitement.',
 '{"type":"mcq","question":"« Marie met son imperméable avant de sortir. » Qu en déduit-on ?","options":["Il fait chaud.","Il pleut ou il va pleuvoir.","Marie aime les imperméables.","Marie sort pour courir."],"answer":"Il pleut ou il va pleuvoir."}'),

('Titre et contenu', 1, 20000, 'Le titre annonce généralement le sujet ou le thème principal.',
 '{"type":"mcq","question":"Quel titre convient à un texte sur les effets du sport sur la santé ?","options":["Les sports extrêmes","Bouger pour mieux vivre","Les Jeux olympiques","L histoire du soccer"],"answer":"Bouger pour mieux vivre"}'),

('Séquence chronologique', 1, 20000, 'Les marqueurs temporels organisent les événements dans le temps.',
 '{"type":"mcq","question":"Quel marqueur indique la conclusion d une séquence ?","options":["d abord","ensuite","finalement","pendant"],"answer":"finalement"}'),

('Pronoms de reprise', 2, 25000, 'Un pronom reprend un mot ou groupe mentionné auparavant.',
 '{"type":"mcq","question":"Dans « Julie a trouvé un chaton. Elle l a ramené chez elle. » À quoi réfère « l » ?","options":["Julie","Elle","un chaton","chez elle"],"answer":"un chaton"}'),

('Intention de l auteur', 2, 30000, 'L auteur peut vouloir informer, convaincre, divertir ou émouvoir.',
 '{"type":"mcq","question":"Un texte liste des statistiques sur la pollution avec des données chiffrées. Quelle est l intention principale ?","options":["divertir","convaincre","émouvoir","informer"],"answer":"informer"}'),

('Mot-clé et idée principale', 2, 30000, 'L idée principale résume ce que le paragraphe dit sur le sujet.',
 '{"type":"mcq","question":"Un paragraphe parle des avantages de la lecture : imagination, vocabulaire et concentration. Quelle est l idée principale ?","options":["La lecture développe l imagination.","La lecture améliore le vocabulaire.","La lecture présente plusieurs avantages.","La lecture aide à se concentrer."],"answer":"La lecture présente plusieurs avantages."}'),

('Repérer un argument', 2, 30000, 'Un argument soutient la thèse défendue dans un texte argumentatif.',
 '{"type":"mcq","question":"Dans un texte qui soutient le recyclage, laquelle est un argument ?","options":["Le recyclage date de l Antiquité.","Le recyclage réduit les déchets dans les dépotoirs.","Certaines personnes recyclent mal.","Le recyclage est difficile à mettre en place."],"answer":"Le recyclage réduit les déchets dans les dépotoirs."}'),

('Ton d un texte', 2, 30000, 'Le ton peut être humoristique, sérieux, ironique, nostalgique…',
 '{"type":"mcq","question":"Un texte utilise beaucoup d exclamations et de jeux de mots. Quel est son ton ?","options":["sérieux","nostalgique","humoristique","tragique"],"answer":"humoristique"}'),

('Texte narratif — structure', 2, 25000, 'Un récit suit : situation initiale → perturbation → péripéties → résolution → situation finale.',
 '{"type":"mcq","question":"Quel élément structurel déclenche l action dans un récit ?","options":["situation initiale","résolution","perturbation","péripétie"],"answer":"perturbation"}'),

('Comparaison et métaphore — effet', 3, 40000, 'Les figures de style créent des effets de sens particuliers.',
 '{"type":"mcq","question":"Dans « Ses mots étaient des couteaux. » Quel effet crée la métaphore ?","options":["Suggère la gentillesse","Évoque la douleur causée par les mots","Décrit un personnage cuisinier","Montre la force du personnage"],"answer":"Évoque la douleur causée par les mots"}'),

('Résumer un texte', 3, 40000, 'Un résumé inclut l idée principale et les idées secondaires essentielles.',
 '{"type":"mcq","question":"Qu est-ce qu un bon résumé doit éviter ?","options":["Mentionner le sujet","Inclure l idée principale","Copier des phrases entières du texte","Être plus court que l original"],"answer":"Copier des phrases entières du texte"}'),

('Point de vue — narrateur', 3, 35000, 'Le narrateur omniscient sait tout ; le narrateur interne vit l histoire.',
 '{"type":"mcq","question":"Dans un récit à la 1re personne (« Je »), quel type de narrateur est utilisé ?","options":["omniscient","externe","interne","neutre"],"answer":"interne"}'),

('Implicite dans un texte', 3, 40000, 'Ce qui est implicite n est pas dit directement mais se comprend du contexte.',
 '{"type":"mcq","question":"« En entrant dans la pièce, il vit les chandelles éteintes et le gâteau à moitié mangé. » Qu implique ce passage ?","options":["La fête vient de commencer.","La fête est terminée ou à moitié faite.","Il n y avait pas de fête.","Le personnage a faim."],"answer":"La fête est terminée ou à moitié faite."}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);


-- ─── RÉDACTION (+11) ──────────────────────────────────────────────────────────
INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-RED') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

('Unité du paragraphe', 1, 20000, 'Un paragraphe développe une seule idée principale.',
 '{"type":"mcq","question":"Combien d idées principales un paragraphe bien construit doit-il développer ?","options":["0","1","2 ou 3","Le plus possible"],"answer":"1"}'),

('Phrase de clôture', 1, 20000, 'La phrase de clôture résume ou conclut l idée du paragraphe.',
 '{"type":"mcq","question":"Où se trouve généralement la phrase de clôture dans un paragraphe ?","options":["au début","au milieu","à la fin","n importe où"],"answer":"à la fin"}'),

('Connecteurs — addition', 1, 15000, 'Pour ajouter une idée, on utilise : de plus, en outre, également…',
 '{"type":"mcq","question":"Quel connecteur exprime l addition ?","options":["cependant","pourtant","de plus","néanmoins"],"answer":"de plus"}'),

('Schéma narratif — péripétie', 1, 20000, 'Les péripéties sont les événements qui se succèdent entre la perturbation et la résolution.',
 '{"type":"mcq","question":"Qu est-ce qu une péripétie dans un récit ?","options":["L introduction du héros","Un événement perturbateur","Un rebondissement de l action","La fin du récit"],"answer":"Un rebondissement de l action"}'),

('Cohérence — lien entre les phrases', 2, 25000, 'Les phrases d un texte doivent se relier logiquement entre elles.',
 '{"type":"mcq","question":"Quel problème y a-t-il dans ce texte ? « J aime les chats. Les voitures roulent vite. Les chats ronronnent. »","options":["Manque de majuscules","Manque de cohérence entre les idées","Manque de ponctuation","Phrases trop longues"],"answer":"Manque de cohérence entre les idées"}'),

('Registre adapté au destinataire', 2, 25000, 'On adapte son niveau de langue selon à qui on s adresse.',
 '{"type":"mcq","question":"On écrit une lettre au directeur de l école. Quel registre utiliser ?","options":["familier","populaire","soutenu","vulgaire"],"answer":"soutenu"}'),

('Révision — erreurs fréquentes', 2, 30000, 'La révision permet de corriger les fautes d orthographe et de syntaxe.',
 '{"type":"mcq","question":"Quelle étape vient après avoir rédigé le brouillon ?","options":["Planification","Révision et correction","Mise en page","Trouver des idées"],"answer":"Révision et correction"}'),

('Description d un personnage', 2, 30000, 'Une bonne description combine traits physiques, psychologiques et comportementaux.',
 '{"type":"mcq","question":"Quel type de détails rend une description de personnage plus vivante ?","options":["Uniquement son nom","Seulement sa taille","Détails physiques, psychologiques et comportements","Son adresse seulement"],"answer":"Détails physiques, psychologiques et comportements"}'),

('Texte argumentatif — structure', 3, 35000, 'Un texte argumentatif comporte une thèse, des arguments et une conclusion.',
 '{"type":"mcq","question":"Dans un texte argumentatif, à quoi sert la conclusion ?","options":["Présenter les contre-arguments","Reformuler la thèse et ouvrir sur une réflexion","Lister les exemples","Introduire le sujet"],"answer":"Reformuler la thèse et ouvrir sur une réflexion"}'),

('Procédés stylistiques — hyperbole', 3, 35000, 'L hyperbole exagère pour créer un effet.',
 '{"type":"mcq","question":"Dans « Je t ai attendu une éternité ! » Quel procédé stylistique est utilisé ?","options":["métaphore","comparaison","hyperbole","antithèse"],"answer":"hyperbole"}'),

('Réécriture et reformulation', 3, 40000, 'Reformuler une idée en changeant la structure sans changer le sens.',
 '{"type":"mcq","question":"Quelle reformulation garde le même sens que « Le chat a attrapé la souris » ?","options":["La souris a attrapé le chat.","La souris a été attrapée par le chat.","Le chat a lâché la souris.","Le chat cherche la souris."],"answer":"La souris a été attrapée par le chat."}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
