-- ============================================================
-- BANQUE DE QUESTIONS — Vocabulaire (Sec. 1, Français)
-- PFEQ-FRA-SEC1-VOC | 100 questions
-- À coller dans Supabase → SQL Editor → Run
-- ============================================================

INSERT INTO questions (skill_id, title, difficulty_level, expected_time_ms, explanation, is_active, content)
SELECT
  (SELECT id FROM skills WHERE pfeq_reference = 'PFEQ-FRA-SEC1-VOC') AS skill_id,
  q.title, q.difficulty_level::int, q.expected_time_ms::int, q.explication, true, q.content::jsonb
FROM (VALUES

-- ── DIFFICULTÉ 1 — Sens des mots et relations lexicales (34 questions) ────

('Synonyme — rapide', 1, 20000, 'Un synonyme est un mot qui a le même sens ou un sens proche d''un autre mot.',
 '{"type":"mcq","question":"Quel est un synonyme du mot « rapide » ?","options":["lent","vite","lourd","sombre"],"answer":"vite"}'),

('Synonyme — triste', 1, 20000, 'Triste = mélancolique, chagriné, abattu, morne, déprimé.',
 '{"type":"mcq","question":"Quel est un synonyme du mot « triste » ?","options":["joyeux","content","mélancolique","heureux"],"answer":"mélancolique"}'),

('Synonyme — courageux', 1, 20000, 'Courageux = brave, vaillant, intrépide, audacieux.',
 '{"type":"mcq","question":"Quel est un synonyme du mot « courageux » ?","options":["lâche","timide","peureux","brave"],"answer":"brave"}'),

('Synonyme — erreur', 1, 20000, 'Erreur = faute, méprise, inexactitude, bévue.',
 '{"type":"mcq","question":"Quel est un synonyme du mot « erreur » ?","options":["succès","réussite","faute","exploit"],"answer":"faute"}'),

('Antonyme — grand', 1, 20000, 'Un antonyme est un mot qui a le sens contraire d''un autre mot. Grand ≠ petit.',
 '{"type":"mcq","question":"Quel est l''antonyme de « grand » ?","options":["énorme","gros","petit","large"],"answer":"petit"}'),

('Antonyme — généreux', 1, 20000, 'Généreux ≠ avare, égoïste.',
 '{"type":"mcq","question":"Quel est l''antonyme de « généreux » ?","options":["aimable","gentil","avare","charitable"],"answer":"avare"}'),

('Antonyme — victoire', 1, 20000, 'Victoire ≠ défaite, échec.',
 '{"type":"mcq","question":"Quel est l''antonyme de « victoire » ?","options":["succès","triomphe","défaite","récompense"],"answer":"défaite"}'),

('Champ lexical', 1, 20000, 'Le champ lexical est un ensemble de mots rattachés au même thème ou domaine.',
 '{"type":"mcq","question":"Lequel de ces mots n''appartient PAS au champ lexical de l''école ?","options":["cahier","professeur","bureau","nuage"],"answer":"nuage"}'),

('Champ lexical — nature', 1, 20000, 'Les mots du champ lexical de la nature : forêt, rivière, montagne, fleur, arbres, oiseau…',
 '{"type":"mcq","question":"Lequel de ces mots appartient au champ lexical de la nature ?","options":["voiture","ordinateur","rivière","téléphone"],"answer":"rivière"}'),

('Sens propre et figuré', 1, 25000, 'Le sens propre est le sens littéral. Le sens figuré est le sens métaphorique ou imagé.',
 '{"type":"mcq","question":"Dans la phrase « Il a un cœur de pierre », « cœur de pierre » est utilisé au sens...","options":["propre","figuré","péjoratif","formel"],"answer":"figuré"}'),

('Sens propre', 1, 25000, 'Au sens propre, les mots ont leur signification habituelle et directe.',
 '{"type":"mcq","question":"Dans laquelle de ces phrases le mot « feu » est-il utilisé au sens propre ?","options":["Il a le feu sacré.","Le feu de la passion le consume.","Ils ont allumé un feu de camp.","Ses yeux lançaient des feux."],"answer":"Ils ont allumé un feu de camp."}'),

('Préfixe — sens', 1, 20000, 'Le préfixe « in- » (ou im-, ir-, il-) donne un sens contraire ou privatif : incapable (pas capable).',
 '{"type":"mcq","question":"Que signifie le préfixe « in- » dans le mot « incroyable » ?","options":["très","pas","encore","presque"],"answer":"pas"}'),

('Préfixe re-', 1, 20000, 'Le préfixe « re- » (ré-) indique une répétition ou un retour en arrière.',
 '{"type":"mcq","question":"Que signifie le préfixe « re- » dans « recommencer » ?","options":["encore une fois","avant","ensuite","presque"],"answer":"encore une fois"}'),

('Suffixe -eur', 1, 20000, 'Le suffixe -eur (ou -teur) indique souvent un agent, celui qui fait l''action : chanteur, acteur.',
 '{"type":"mcq","question":"Que désigne généralement le suffixe « -eur » (ex : chanteur, vendeur) ?","options":["Une action","Celui qui fait l''action","Un résultat","Un lieu"],"answer":"Celui qui fait l''action"}'),

('Suffixe -tion', 1, 20000, 'Le suffixe -tion transforme souvent un verbe en nom désignant l''action : créer → création.',
 '{"type":"mcq","question":"Le suffixe -tion dans « construction » désigne...","options":["Un lieu","Celui qui construit","L''action de construire","Un outil"],"answer":"L''action de construire"}'),

('Formation des mots — radical', 1, 20000, 'Le radical (ou racine) est la partie de base du mot qui porte le sens principal.',
 '{"type":"mcq","question":"Quel est le radical commun aux mots « lecture, lecteur, lire, lisible » ?","options":["lis-/lect-","ture","eur","ible"],"answer":"lis-/lect-"}'),

('Famille de mots', 1, 20000, 'Une famille de mots regroupe tous les mots qui partagent le même radical.',
 '{"type":"mcq","question":"Lequel de ces mots N''appartient PAS à la famille de « terre » ?","options":["terrain","terrasse","enterrer","trembler"],"answer":"trembler"}'),

('Polysémie', 1, 25000, 'Un mot polysémique a plusieurs sens. « Verre » peut désigner le matériau ou le récipient.',
 '{"type":"mcq","question":"Le mot « vol » peut désigner quoi ?","options":["Seulement le déplacement en avion","Seulement un délit","Le déplacement dans les airs ET l''action de voler qqch","Seulement un oiseau"],"answer":"Le déplacement dans les airs ET l''action de voler qqch"}'),

('Niveau de langue — familier', 1, 20000, 'Le niveau de langue familier s''utilise avec des amis ou en famille. On ne l''utilise pas dans un texte officiel.',
 '{"type":"mcq","question":"Lequel de ces mots appartient au niveau de langue familier ?","options":["automobile","véhicule","bagnole","voiture"],"answer":"bagnole"}'),

('Niveau de langue — soutenu', 1, 20000, 'Le niveau de langue soutenu s''utilise dans les écrits officiels, les discours formels.',
 '{"type":"mcq","question":"Lequel de ces mots appartient au niveau de langue soutenu ?","options":["bouffe","becqueter","nourriture","alimenter"],"answer":"alimenter"}'),

('Mot générique vs spécifique', 1, 20000, 'Un mot générique désigne une catégorie (fruit). Un mot spécifique désigne un élément particulier (pomme, poire).',
 '{"type":"mcq","question":"Lequel de ces mots est le plus général (générique) ?","options":["rose","tulipe","pivoine","fleur"],"answer":"fleur"}'),

('Sens d''un mot en contexte', 1, 25000, 'Le contexte permet de comprendre le sens d''un mot polysémique.',
 '{"type":"mcq","question":"Dans « Il a perdu la tête dans cette situation », que signifie « perdu la tête » ?","options":["Il a oublié où est sa tête","Il s''est décapité","Il a perdu son sang-froid","Il est tombé"],"answer":"Il a perdu son sang-froid"}'),

('Expression figée', 1, 25000, 'Une expression figée (ou locution) a un sens global différent du sens de chaque mot pris séparément.',
 '{"type":"mcq","question":"Que signifie l''expression « casser les pieds » ?","options":["Se blesser les pieds","Ennuyer quelqu''un","Courir vite","Danser"],"answer":"Ennuyer quelqu''un"}'),

('Expression figée — fil du temps', 1, 25000, 'Au fil du temps = progressivement, avec le passage du temps.',
 '{"type":"mcq","question":"Que signifie l''expression « au fil du temps » ?","options":["Très rapidement","Avec des fils","Progressivement, avec le temps","À l''heure exacte"],"answer":"Progressivement, avec le temps"}'),

('Connotation positive/négative', 1, 25000, 'La connotation est la valeur affective associée à un mot. « Mince » est plutôt positif. « Maigre » est plutôt négatif.',
 '{"type":"mcq","question":"Lequel de ces mots a une connotation généralement POSITIVE ?","options":["ruse","astucieux","fourbe","manipulateur"],"answer":"astucieux"}'),

('Péjoratif vs mélioratif', 1, 20000, 'Un mot péjoratif donne une image négative. Un mot mélioratif donne une image positive.',
 '{"type":"mcq","question":"Lequel de ces mots est péjoratif (sens négatif) ?","options":["courageux","héroïque","téméraire","vaillant"],"answer":"téméraire"}'),

('Définition d''un mot', 1, 25000, 'Comprendre la définition d''un mot inconnu grâce au contexte ou à la structure du mot.',
 '{"type":"mcq","question":"D''après sa structure (préfixe + radical), que signifie « préhistoire » ?","options":["L''histoire principale","L''histoire récente","Avant l''histoire","L''histoire mondiale"],"answer":"Avant l''histoire"}'),

('Antonyme — préfixe négatif', 1, 20000, 'On peut former des antonymes avec des préfixes négatifs : heureux → malheureux; poli → impoli.',
 '{"type":"mcq","question":"Quel est l''antonyme de « possible » formé avec un préfixe ?","options":["non possible","impossible","despossible","malpossible"],"answer":"impossible"}'),

('Sens de mots courants', 1, 20000, 'Comprendre le sens de mots courants selon le contexte.',
 '{"type":"mcq","question":"Que signifie le mot « frugal » ?","options":["Abondant","Luxueux","Simple et peu coûteux","Délicieux"],"answer":"Simple et peu coûteux"}'),

('Terme scientifique vs courant', 1, 20000, 'Le vocabulaire scientifique est plus précis que le vocabulaire courant.',
 '{"type":"mcq","question":"Quel est le terme scientifique pour désigner un être vivant qui fait sa propre nourriture grâce à la lumière ?","options":["Carnivore","Omnivore","Autotrophe","Hétérotrophe"],"answer":"Autotrophe"}'),

('Hyperonyme', 1, 20000, 'Un hyperonyme est un mot dont le sens inclut d''autres mots (catégorie générale). « Animal » est l''hyperonyme de « chien ».',
 '{"type":"mcq","question":"Quel est l''hyperonyme (terme générique) qui englobe « chêne, pin, sapin, érable » ?","options":["Forêt","Bois","Arbre","Feuille"],"answer":"Arbre"}'),

('Hyponyme', 1, 20000, 'Un hyponyme est un terme spécifique inclus dans une catégorie générale. « Labrador » est un hyponyme de « chien ».',
 '{"type":"mcq","question":"Lequel de ces mots est un hyponyme (terme plus spécifique) de « outil » ?","options":["objet","chose","équipement","marteau"],"answer":"marteau"}'),

('Paronymes', 1, 25000, 'Des paronymes sont des mots qui se ressemblent par leur prononciation mais ont des sens différents.',
 '{"type":"mcq","question":"Lesquels de ces mots sont des paronymes ?","options":["maison / maison","arbre / arbuste","collision / collusion","chat / chaton"],"answer":"collision / collusion"}'),

('Mots composés', 1, 20000, 'Un mot composé est formé de deux ou plusieurs mots. Porte-monnaie, arc-en-ciel, chemin de fer.',
 '{"type":"mcq","question":"Lequel de ces mots est un mot composé ?","options":["soleil","prairie","arc-en-ciel","montagne"],"answer":"arc-en-ciel"}'),

-- ── DIFFICULTÉ 2 — Figures de style et registres (33 questions) ───────────

('Métaphore', 2, 35000, 'La métaphore est une comparaison implicite (sans « comme »). « La vie est un voyage » est une métaphore.',
 '{"type":"mcq","question":"Laquelle de ces phrases contient une métaphore ?","options":["Il court comme le vent.","Ses yeux sont deux étoiles.","Elle est grande.","Le chien aboie."],"answer":"Ses yeux sont deux étoiles."}'),

('Comparaison', 2, 35000, 'La comparaison utilise un outil de comparaison : comme, tel que, pareil à, semblable à.',
 '{"type":"mcq","question":"Laquelle de ces phrases contient une comparaison ?","options":["Elle est un ange.","Il court comme le vent.","Sa voix est musicale.","La pluie tombe."],"answer":"Il court comme le vent."}'),

('Personnification', 2, 35000, 'La personnification attribue des caractéristiques humaines à une chose ou un animal.',
 '{"type":"mcq","question":"Laquelle de ces phrases contient une personnification ?","options":["Le vent souffle.","La forêt murmure des secrets.","Il fait soleil.","Le chat dort."],"answer":"La forêt murmure des secrets."}'),

('Hyperbole', 2, 35000, 'L''hyperbole est une exagération volontaire pour créer un effet : « Je t''ai dit mille fois ».',
 '{"type":"mcq","question":"Laquelle de ces phrases contient une hyperbole ?","options":["Il court vite.","Je suis un peu fatigué.","Je suis mort de fatigue.","Il fait chaud aujourd''hui."],"answer":"Je suis mort de fatigue."}'),

('Litote', 2, 40000, 'La litote dit moins pour suggérer plus. « Ce n''est pas mal » pour dire « c''est très bien ».',
 '{"type":"mcq","question":"« Ce film n''est pas désagréable. » Cette phrase est un exemple de...","options":["Hyperbole","Litote","Métaphore","Oxymore"],"answer":"Litote"}'),

('Oxymore', 2, 40000, 'L''oxymore réunit deux termes de sens contraires : « un silence assourdissant ».',
 '{"type":"mcq","question":"Lequel de ces exemples est un oxymore ?","options":["un vieux chêne","une sombre nuit","une obscure clarté","une rapide voiture"],"answer":"une obscure clarté"}'),

('Anaphore', 2, 40000, 'L''anaphore est la répétition d''un mot ou d''un groupe de mots en début de phrases ou de propositions successives.',
 '{"type":"mcq","question":"Dans « Je rêve, je crie, je vis. », quel procédé stylistique est utilisé ?","options":["Métaphore","Comparaison","Anaphore","Allitération"],"answer":"Anaphore"}'),

('Allitération', 2, 40000, 'L''allitération est la répétition d''un même son consonantique au début de plusieurs mots.',
 '{"type":"mcq","question":"Dans « Pour qui sont ces serpents qui sifflent sur vos têtes » (Racine), quel procédé est utilisé ?","options":["Assonance","Allitération","Oxymore","Chiasme"],"answer":"Allitération"}'),

('Euphémisme', 2, 40000, 'Un euphémisme atténue une réalité désagréable ou dure en utilisant des termes plus doux.',
 '{"type":"mcq","question":"Lequel de ces exemples est un euphémisme pour parler de la mort ?","options":["Il est crevé","Il est décédé","Il a trépassé","Il a rendu l''âme"],"answer":"Il a rendu l''âme"}'),

('Vocabulaire littéraire — registre comique', 2, 35000, 'Le registre comique cherche à faire rire ou sourire. Il peut utiliser l''ironie, l''humour, les jeux de mots.',
 '{"type":"mcq","question":"Lequel de ces extraits appartient au registre comique ?","options":["Il mourut dans les affres de la douleur.","Je tremble à la seule pensée de cette nuit.","Mon mari a rangé ses chaussettes dans le frigo — il les cherche depuis hier.","L''obscurité enveloppait la plaine silencieuse."],"answer":"Mon mari a rangé ses chaussettes dans le frigo — il les cherche depuis hier."}'),

('Vocabulaire — champ sémantique', 2, 35000, 'Le champ sémantique d''un mot regroupe tous ses sens possibles. À ne pas confondre avec le champ lexical.',
 '{"type":"mcq","question":"Quel est le champ sémantique du mot « tête » ? (= tous ses sens)","options":["Seulement la partie du corps","La partie du corps ET la faculté de penser ET le chef ET l''extrémité d''un objet","Seulement l''organe du cerveau","Seulement une expression comme perdre la tête"],"answer":"La partie du corps ET la faculté de penser ET le chef ET l''extrémité d''un objet"}'),

('Ironie', 2, 40000, 'L''ironie consiste à dire le contraire de ce qu''on pense, souvent pour critiquer ou faire rire.',
 '{"type":"mcq","question":"Dans « Bravo, tu as encore oublié tes devoirs ! », quel procédé est utilisé ?","options":["Métaphore","Comparaison","Ironie","Euphémisme"],"answer":"Ironie"}'),

('Mot d''origine latine', 2, 35000, 'Beaucoup de mots français viennent du latin. Le mot « aquatique » vient de « aqua » (eau en latin).',
 '{"type":"mcq","question":"Quel est le sens du radical latin « aqua » dans les mots comme « aquatique, aqueduc » ?","options":["feu","terre","eau","air"],"answer":"eau"}'),

('Mot d''origine grecque', 2, 35000, 'Le radical grec « bio » signifie vie. On le retrouve dans biologie, biosphère, antibiotique.',
 '{"type":"mcq","question":"Quel est le sens du radical grec « bio » dans le mot « biologie » ?","options":["terre","eau","vie","mort"],"answer":"vie"}'),

('Sens de préfixes grecs et latins', 2, 35000, 'Le préfixe « poly- » (du grec) signifie plusieurs, nombreux : polygone (plusieurs angles).',
 '{"type":"mcq","question":"Que signifie « poly- » dans « polyglotte » (qui parle plusieurs langues) ?","options":["Un","Deux","Plusieurs","Aucun"],"answer":"Plusieurs"}'),

('Néologisme', 2, 35000, 'Un néologisme est un mot nouvellement créé ou emprunté à une autre langue. Courriel est un néologisme québécois pour e-mail.',
 '{"type":"mcq","question":"Lequel de ces mots est un néologisme québécois recommandé à la place d''un anglicisme ?","options":["email","text","courriel","chat"],"answer":"courriel"}'),

('Anglicisme et équivalent français', 2, 35000, 'Un anglicisme est un mot emprunté à l''anglais. L''Office québécois de la langue française propose des équivalents.',
 '{"type":"mcq","question":"Quel est l''équivalent français recommandé pour le mot « parking » ?","options":["parkage","stationnement","parking-lot","parc"],"answer":"stationnement"}'),

('Registre soutenu vs courant', 2, 35000, 'Le même sens peut être exprimé dans différents registres : décéder (soutenu), mourir (courant), crever (familier).',
 '{"type":"mcq","question":"Lequel de ces mots pour « avoir faim » appartient au registre le plus soutenu ?","options":["j''ai la dalle","je crève de faim","j''éprouve la faim","j''ai faim"],"answer":"j''éprouve la faim"}'),

('Sens d''un préfixe — anti-', 2, 35000, 'Le préfixe « anti- » indique l''opposition : antibiotique, anti-inflammatoire, anticonformiste.',
 '{"type":"mcq","question":"Que signifie le préfixe « anti- » dans « antivirus » ?","options":["pour","avec","avant","contre"],"answer":"contre"}'),

('Sens d''un préfixe — hyper-', 2, 35000, 'Le préfixe « hyper- » signifie au-delà, excessif : hyperactif, hypertendu, hypertrophié.',
 '{"type":"mcq","question":"Que signifie le préfixe « hyper- » dans « hyperactif » ?","options":["peu","normal","sous","excessivement"],"answer":"excessivement"}'),

('Dérivation', 2, 35000, 'La dérivation est un procédé de formation de nouveaux mots par l''ajout de préfixes ou de suffixes.',
 '{"type":"mcq","question":"Par quel procédé de formation le mot « inacceptable » a-t-il été créé ?","options":["Composition","Dérivation","Emprunt","Troncation"],"answer":"Dérivation"}'),

('Composition', 2, 35000, 'La composition crée des mots en combinant deux ou plusieurs mots existants.',
 '{"type":"mcq","question":"Par quel procédé de formation le mot « chou-fleur » a-t-il été créé ?","options":["Dérivation","Composition","Sigle","Emprunt"],"answer":"Composition"}'),

('Troncation', 2, 35000, 'La troncation raccourcit un mot en enlevant une ou plusieurs syllabes : cinéma → ciné, téléphone → télé.',
 '{"type":"mcq","question":"Le mot « prof » est la troncation de quel mot ?","options":["profond","profiter","professeur","profil"],"answer":"professeur"}'),

('Sigle et acronyme', 2, 35000, 'Un sigle est formé des initiales de plusieurs mots. Un acronyme se prononce comme un mot.',
 '{"type":"mcq","question":"Lequel de ces exemples est un acronyme (prononcé comme un mot) ?","options":["CHUM","ONU","NASA","SOS"],"answer":"NASA"}'),

-- ── DIFFICULTÉ 3 — Analyse stylistique et étymologie (33 questions) ───────

('Champ lexical du texte', 3, 50000, 'Identifier le champ lexical dominant permet de dégager le thème principal d''un texte.',
 '{"type":"mcq","question":"Dans un texte qui contient les mots : lumière, soleil, chauffer, rayons, brûler, astre — quel est le champ lexical dominant ?","options":["L''eau","La nourriture","Le feu et la chaleur","La nuit"],"answer":"Le feu et la chaleur"}'),

('Gradation', 3, 50000, 'La gradation est une figure de style qui consiste à présenter des termes en ordre croissant ou décroissant d''intensité.',
 '{"type":"mcq","question":"Dans « Je le vis, je rougis, je pâlis à sa vue », quel procédé est utilisé ?","options":["Anaphore","Gradation","Litote","Métonymie"],"answer":"Gradation"}'),

('Synecdoque', 3, 55000, 'La synecdoque est une figure qui désigne un tout par une partie (ou une partie par le tout) : « des voiles » pour « des bateaux ».',
 '{"type":"mcq","question":"Dans « La France a gagné » (pour dire l''équipe française), quel procédé est utilisé ?","options":["Métaphore","Comparaison","Synecdoque","Allitération"],"answer":"Synecdoque"}'),

('Métonymie', 3, 55000, 'La métonymie remplace un terme par un autre qui entretient un rapport logique avec lui (contenant pour contenu, cause pour effet).',
 '{"type":"mcq","question":"Dans « Boire un verre » (boire le contenu du verre), quel procédé est utilisé ?","options":["Synecdoque","Métonymie","Hyperbole","Antithèse"],"answer":"Métonymie"}'),

('Antithèse', 3, 50000, 'L''antithèse oppose deux réalités contraires dans la même phrase ou le même paragraphe.',
 '{"type":"mcq","question":"Dans « L''homme est petit mais ses rêves sont immenses », quel procédé est utilisé ?","options":["Oxymore","Antithèse","Métaphore","Litote"],"answer":"Antithèse"}'),

('Registre tragique', 3, 50000, 'Le registre tragique est caractérisé par un sentiment de fatalité, d''impuissance face au destin. Il utilise un vocabulaire solennel et souvent négatif.',
 '{"type":"mcq","question":"Lequel de ces extraits appartient au registre tragique ?","options":["Il riait et chantait à gorge déployée.","Condamné par le sort, il voyait sa fin approcher inexorablement.","Il prit un café et continua à travailler.","Le chat se faufila entre les jambes de sa maîtresse."],"answer":"Condamné par le sort, il voyait sa fin approcher inexorablement."}'),

('Étymologie — racine phil-', 3, 50000, 'La racine grecque « phil- » (philo-) signifie amour, ami : philosophie (amour de la sagesse), philharmonique.',
 '{"type":"mcq","question":"Que signifie le radical « phil- » dans « philanthrope » ?","options":["haïr","ignorer","aimer","tuer"],"answer":"aimer"}'),

('Étymologie — racine anthrop-', 3, 50000, 'La racine grecque « anthrop- » signifie homme, être humain : anthropologie, philanthrope.',
 '{"type":"mcq","question":"Que signifie la racine « anthrop- » dans « philanthrope » (qui aime les hommes) ?","options":["animal","végétal","être humain","dieu"],"answer":"être humain"}'),

('Connotation culturelle', 3, 55000, 'La connotation peut varier selon la culture. Certains mots ou couleurs ont des significations différentes selon les cultures.',
 '{"type":"mcq","question":"Dans la culture française, quelle connotation a généralement la couleur blanche dans un contexte de deuil ?","options":["Joie","Pureté et deuil dans certaines cultures","Danger","Amour"],"answer":"Pureté et deuil dans certaines cultures"}'),

('Registre lyrique', 3, 50000, 'Le registre lyrique exprime les émotions et les sentiments du locuteur. Il utilise souvent le « je » et un vocabulaire émotionnel.',
 '{"type":"mcq","question":"Lequel de ces extraits appartient au registre lyrique ?","options":["Le train part à 8h.","La formule chimique de l''eau est H₂O.","Ah ! comme la neige a neigé ! Ma vitre est un jardin de givre (Nelligan)","Fermez les rideaux avant de sortir."],"answer":"Ah ! comme la neige a neigé ! Ma vitre est un jardin de givre (Nelligan)"}'),

('Vocabulaire précis en contexte', 3, 55000, 'Choisir le mot précis selon le contexte est essentiel pour la clarté et la richesse du style.',
 '{"type":"mcq","question":"Laquelle de ces phrases utilise le vocabulaire le plus précis pour décrire un état physique ?","options":["Il était pas bien.","Il n''allait pas top.","Il souffrait d''une grande lassitude.","Il était fatigué ou quelque chose comme ça."],"answer":"Il souffrait d''une grande lassitude."}'),

('Registre épique', 3, 50000, 'Le registre épique met en scène des héros, des batailles, des exploits extraordinaires. Il utilise des superlatifs et des hyperboles.',
 '{"type":"mcq","question":"Lequel de ces extraits appartient au registre épique ?","options":["Il alla au marché.","Il tomba endormi sur son canapé.","Tel un titan, il abattit mille ennemis d''un seul souffle.","Il réfléchit à son problème de maths."],"answer":"Tel un titan, il abattit mille ennemis d''un seul souffle."}'),

('Faux amis anglais-français', 3, 50000, 'Les faux amis sont des mots qui ressemblent à des mots anglais mais ont un sens différent.',
 '{"type":"mcq","question":"Le mot français « librairie » est un faux ami. Que signifie-t-il en français (et pas en anglais) ?","options":["Une bibliothèque","Un livre","Un magasin de livres","Un lecteur"],"answer":"Un magasin de livres"}')

) AS q(title, difficulty_level, expected_time_ms, explication, content);
