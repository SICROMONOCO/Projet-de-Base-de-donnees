-- Insertion de données dans la table Examens

-- Insertion de données dans la table Matières

INSERT INTO Matières (professeur_id, matières_nom, matières_code) VALUES
(29, 'Mathématiques', 'MATH101'),
(30, 'Mathématiques', 'MATH102'),
(31, 'Français', 'FRAN101'),
(32, 'Français', 'FRAN102'),
(33, 'Histoire-Géographie', 'HIST101'),
(34, 'Histoire-Géographie', 'HIST102'),
(35, 'Sciences Physiques & Chimie', 'PHYS101'),
(36, 'Sciences Physiques & Chimie', 'PHYS102'),
(37, 'Sciences de la Vie et de la Terre', 'SVT101'),
(38, 'Sciences de la Vie et de la Terre', 'SVT102'),
(39, 'Anglais', 'ANGL101'),
(40, 'Anglais', 'ANGL102'),
(41, 'Espagnol', 'ESPA101'),
(42, 'Espagnol', 'ESPA102'),
(43, 'Allemand', 'ALLE101'),
(44, 'Allemand', 'ALLE102'),
(45, 'Éducation Physique et Sportive', 'EPS101'),
(46, 'Éducation Physique et Sportive', 'EPS102'),
(47, 'Informatique', 'INFO101'),
(48, 'Informatique', 'INFO102'),
(49, 'Arts', 'ARTS101'),
(50, 'Arts', 'ARTS102'),
(51, 'Musique', 'MUSI101'),
(52, 'Musique', 'MUSI102'),
(53, 'Philosophie', 'PHIL101'),
(54, 'Philosophie', 'PHIL102'),
(55, 'Économie', 'ECON101'),
(56, 'Économie', 'ECON102');

-- Insertion de données dans la table Professeurs

INSERT INTO Professeurs (personnel_nom, famille_nom, email, phone) VALUES
-- Professeurs de Mathématiques
('Sophie', 'Durand', 'sophie.durand@academie.fr', '0123456789'),
('Thomas', 'Leroy', 'thomas.leroy@academie.fr', '0123456790'),
-- Professeurs de Français
('Marie', 'Laurent', 'marie.laurent@academie.fr', '0123456791'),
('Pierre', 'Martin', 'pierre.martin@academie.fr', '0123456792'),
-- Professeurs d'Histoire-Géographie
('Claire', 'Girard', 'claire.girard@academie.fr', '0123456793'),
('François', 'Petit', 'francois.petit@academie.fr', '0123456794'),
-- Professeurs de Sciences Physiques & Chimie
('Isabelle', 'Dubois', 'isabelle.dubois@academie.fr', '0123456795'),
('Philippe', 'Moreau', 'philippe.moreau@academie.fr', '0123456796'),
-- Professeurs de Sciences de la Vie et de la Terre
('Anne', 'Lefebvre', 'anne.lefebvre@academie.fr', '0123456797'),
('Julien', 'Mercier', 'julien.mercier@academie.fr', '0123456798'),
-- Professeurs d'Anglais
('Caroline', 'Richard', 'caroline.richard@academie.fr', '0123456799'),
('David', 'Simon', 'david.simon@academie.fr', '0123456800'),
-- Professeurs d'Espagnol
('Elena', 'Garcia', 'elena.garcia@academie.fr', '0123456801'),
('Miguel', 'Rodriguez', 'miguel.rodriguez@academie.fr', '0123456802'),
-- Professeurs d'Allemand
('Katrin', 'Müller', 'katrin.muller@academie.fr', '0123456803'),
('Hans', 'Schmidt', 'hans.schmidt@academie.fr', '0123456804'),
-- Professeurs d'Éducation Physique et Sportive
('Mathieu', 'Bernard', 'mathieu.bernard@academie.fr', '0123456805'),
('Nathalie', 'Thomas', 'nathalie.thomas@academie.fr', '0123456806'),
-- Professeurs d'Informatique
('Éric', 'Rousseau', 'eric.rousseau@academie.fr', '0123456807'),
('Sylvie', 'Blanc', 'sylvie.blanc@academie.fr', '0123456808'),
-- Professeurs d'Arts
('Lucie', 'Perrin', 'lucie.perrin@academie.fr', '0123456809'),
('Vincent', 'Robert', 'vincent.robert@academie.fr', '0123456810'),
-- Professeurs de Musique
('Audrey', 'Fournier', 'audrey.fournier@academie.fr', '0123456811'),
('Benoît', 'Morel', 'benoit.morel@academie.fr', '0123456812'),
-- Professeurs de Philosophie
('Céline', 'Legrand', 'celine.legrand@academie.fr', '0123456813'),
('Olivier', 'Garnier', 'olivier.garnier@academie.fr', '0123456814'),
-- Professeurs d'Économie
('Stéphanie', 'Faure', 'stephanie.faure@academie.fr', '0123456815'),
('Nicolas', 'Lambert', 'nicolas.lambert@academie.fr', '0123456816');

-- Insertion de données dans la table Classe

INSERT INTO Classe (classe_nom) VALUES
  
('Terminale A'),
('Terminale B'),
('Terminale C');

INSERT INTO
  Etudiants (
    classe_id,
    personnel_nom,
    famille_nom,
    date_de_naissance,
    sexe,
    email,
    phone,
    adresse
  )
VALUES
  (
    1,
    'Thomas',
    'Martin',
    '2008-05-3',
    'Male',
    'thomas.martin@email.com',
    '0612345678',
    '1 Rue des Lilas, Paris'
  ),
  (
    1,
    'Julie',
    'Dubois',
    '2008-07-23',
    'Female',
    'julie.dubois@email.com',
    '0623456789',
    '27 Avenue Victor Hugo, Lyon'
  ),
  (
    1,
    'Antoine',
    'Leroy',
    '2008-03-2',
    'Male',
    'antoine.leroy@email.com',
    '0634567890',
    '1 Boulevard Pasteur, Marseille'
  ),
  (
    1,
    'Camille',
    'Moreau',
    '2008-09-30',
    'Female',
    'camille.moreau@email.com',
    '0645678901',
    '42 Rue des Fleurs, Toulouse'
  ),
  (
    1,
    'Lucas',
    'Fournier',
    '2008-2-05',
    'Male',
    'lucas.fournier@email.com',
    '0656789012',
    '3 Place de la République, Nice'
  ),
  (
    1,
    'Emma',
    'Girard',
    '2008-02-17',
    'Female',
    'emma.girard@email.com',
    '0667890123',
    '19 Rue Principale, Bordeaux'
  ),
  (
    1,
    'Maxime',
    'Rousseau',
    '2008-08-22',
    'Male',
    'maxime.rousseau@email.com',
    '0678901234',
    '56 Avenue des Roses, Lille'
  ),
  (
    1,
    'Léa',
    'Blanc',
    '2008-04-09',
    'Female',
    'lea.blanc@email.com',
    '0689012345',
    '2 Rue du Commerce, Nantes'
  ),
  (
    1,
    'Hugo',
    'Garnier',
    '2008-06-28',
    'Male',
    'hugo.garnier@email.com',
    '0690123456',
    '31 Boulevard des Alpes, Strasbourg'
  ),
  (
    1,
    'Manon',
    'Legrand',
    '2008-1-1',
    'Female',
    'manon.legrand@email.com',
    '0701234567',
    '77 Rue de la Paix, Montpellier'
  ),
  (
    1,
    'Nathan',
    'Gautier',
    '2008-01-07',
    'Male',
    'nathan.gautier@email.com',
    '0712345678',
    '2 Avenue du Parc, Rennes'
  ),
  (
    1,
    'Chloé',
    'Robin',
    '2008-3-19',
    'Female',
    'chloe.robin@email.com',
    '0723456789',
    '25 Rue Saint-Michel, Reims'
  ),
  (
    1,
    'Théo',
    'Bertrand',
    '2008-05-26',
    'Male',
    'theo.bertrand@email.com',
    '0734567890',
    '63 Boulevard des Champs, Le Havre'
  ),
  (
    1,
    'Sarah',
    'Morel',
    '2008-07-03',
    'Female',
    'sarah.morel@email.com',
    '0745678901',
    '17 Place du Marché, Saint-Étienne'
  ),
  (
    1,
    'Enzo',
    'Lefebvre',
    '2008-03-21',
    'Male',
    'enzo.lefebvre@email.com',
    '0756789012',
    '48 Rue de l\'Église, Toulon'
  ),
  (
    1,
    'Inès',
    'Mercier',
    '2008-09-2',
    'Female',
    'ines.mercier@email.com',
    '0767890123',
    '22 Avenue des Pins, Grenoble'
  ),
  (
    1,
    'Gabriel',
    'Dupuis',
    '2008-2-27',
    'Male',
    'gabriel.dupuis@email.com',
    '0778901234',
    '2 Place de la Liberté, Dijon'
  ),
  (
    1,
    'Jade',
    'Laurent',
    '2008-02-09',
    'Female',
    'jade.laurent@email.com',
    '0789012345',
    '33 Rue des Oliviers, Angers'
  ),
  (
    1,
    'Louis',
    'Simon',
    '2008-08-31',
    'Male',
    'louis.simon@email.com',
    '0790123456',
    '71 Boulevard Gambetta, Nîmes'
  ),
  (
    1,
    'Zoé',
    'Fontaine',
    '2008-04-16',
    'Female',
    'zoe.fontaine@email.com',
    '0801234567',
    '16 Avenue Jean Jaurès, Villeurbanne'
  ),
  (
    1,
    'Paul',
    'Lambert',
    '2008-06-05',
    'Male',
    'paul.lambert@email.com',
    '0812345678',
    '39 Rue du Moulin, Clermont-Ferrand'
  ),
  (
    1,
    'Lina',
    'Dumont',
    '2008-1-22',
    'Female',
    'lina.dumont@email.com',
    '0823456789',
    '84 Place Victor Hugo, Limoges'
  ),
  (
    1,
    'Raphaël',
    'Faure',
    '2008-01-1',
    'Male',
    'raphael.faure@email.com',
    '0834567890',
    '29 Boulevard des Écoles, Amiens'
  ),
  (
    1,
    'Eva',
    'Bonnet',
    '2008-3-28',
    'Female',
    'eva.bonnet@email.com',
    '0845678901',
    '53 Rue Saint-Jean, Aix-en-Provence'
  ),
  (
    1,
    'Mathis',
    'Perrin',
    '2008-05-19',
    'Male',
    'mathis.perrin@email.com',
    '0856789012',
    '3 Avenue de la Gare, Brest'
  ),
  (
    2,
    'Clara',
    'Roussel',
    '2008-07-08',
    'Female',
    'clara.roussel@email.com',
    '0867890123',
    '67 Rue des Chênes, Tours'
  ),
  (
    2,
    'Adam',
    'Gaillard',
    '2008-03-25',
    'Male',
    'adam.gaillard@email.com',
    '0878901234',
    '41 Place des Vosges, Perpignan'
  ),
  (
    2,
    'Lola',
    'Chevalier',
    '2008-09-2',
    'Female',
    'lola.chevalier@email.com',
    '0889012345',
    '1 Boulevard de la Mer, Metz'
  ),
  (
    2,
    'Jules',
    'Perrot',
    '2008-2-20',
    'Male',
    'jules.perrot@email.com',
    '0890123456',
    '35 Rue du Stade, Besançon'
  ),
  (
    2,
    'Maëlle',
    'Lemoine',
    '2008-02-03',
    'Female',
    'maelle.lemoine@email.com',
    '0901234567',
    '69 Avenue des Tilleuls, Orléans'
  ),
  (
    2,
    'Ethan',
    'Aubry',
    '2008-08-1',
    'Male',
    'ethan.aubry@email.com',
    '0912345678',
    '24 Place des Arts, Mulhouse'
  ),
  (
    2,
    'Alice',
    'Dupont',
    '2008-04-27',
    'Female',
    'alice.dupont@email.com',
    '0923456789',
    '58 Rue de la Fontaine, Rouen'
  ),
  (
    2,
    'Noah',
    'Roy',
    '2008-06-09',
    'Male',
    'noah.roy@email.com',
    '0934567890',
    '1 Boulevard des Platanes, Caen'
  ),
  (
    2,
    'Lilou',
    'Hubert',
    '2008-1-31',
    'Female',
    'lilou.hubert@email.com',
    '0945678901',
    '47 Avenue des Acacias, Nancy'
  ),
  (
    2,
    'Tom',
    'Henry',
    '2008-01-26',
    'Male',
    'tom.henry@email.com',
    '0956789012',
    '82 Rue Victor Hugo, Argenteuil'
  ),
  (
    2,
    'Louise',
    'Vasseur',
    '2008-3-08',
    'Female',
    'louise.vasseur@email.com',
    '0967890123',
    '19 Place du Théâtre, Saint-Denis'
  ),
  (
    2,
    'Nolan',
    'Mathieu',
    '2008-05-05',
    'Male',
    'nolan.mathieu@email.com',
    '0978901234',
    '36 Rue des Saules, Montreuil'
  ),
  (
    2,
    'Romane',
    'Michel',
    '2008-07-17',
    'Female',
    'romane.michel@email.com',
    '0989012345',
    '65 Boulevard Voltaire, Roubaix'
  ),
  (
    2,
    'Sacha',
    'Marty',
    '2008-03-04',
    'Male',
    'sacha.marty@email.com',
    '0990123456',
    '28 Avenue de la Libération, Tourcoing'
  ),
  (
    2,
    'Louna',
    'Masson',
    '2008-09-25',
    'Female',
    'louna.masson@email.com',
    '0101234567',
    '51 Rue des Cerisiers, Avignon'
  ),
  (
    2,
    'Yanis',
    'Guerin',
    '2008-2-2',
    'Male',
    'yanis.guerin@email.com',
    '0112345678',
    '2 Place de l\'Église, Dunkerque'
  ),
  (
    2,
    'Anna',
    'Lopez',
    '2008-02-28',
    'Female',
    'anna.lopez@email.com',
    '0123456789',
    '74 Boulevard Gambetta, Créteil'
  ),
  (
    2,
    'Liam',
    'Collet',
    '2008-08-07',
    'Male',
    'liam.collet@email.com',
    '0134567890',
    '32 Rue de la Loire, Versailles'
  ),
  (
    2,
    'Sofia',
    'Duval',
    '2008-04-19',
    'Female',
    'sofia.duval@email.com',
    '0145678901',
    '57 Avenue des Sports, Aulnay-sous-Bois'
  ),
  (
    2,
    'Ryan',
    'Brunet',
    '2008-06-01',
    'Male',
    'ryan.brunet@email.com',
    '0156789012',
    '21 Rue des Vignes, Colombes'
  ),
  (
    2,
    'Nina',
    'Legrand',
    '2008-1-3',
    'Female',
    'nina.legrand@email.com',
    '0167890123',
    '43 Place du 1 Mai, Vitry-sur-Seine'
  ),
  (
    2,
    'Axel',
    'Roger',
    '2008-01-31',
    'Male',
    'axel.roger@email.com',
    '0178901234',
    '79 Boulevard des Marronniers, Pau'
  ),
  (
    2,
    'Rose',
    'Vincent',
    '2008-3-1',
    'Female',
    'rose.vincent@email.com',
    '0189012345',
    '26 Avenue Jean Moulin, Asnières-sur-Seine'
  ),
  (
    2,
    'Leo',
    'Rossi',
    '2008-05-22',
    'Male',
    'leo.rossi@email.com',
    '0190123456',
    '54 Rue des Bleuets, Bourges'
  ),
  (
    3,
    'Mila',
    'Jacquet',
    '2009-07-29',
    'Female',
    'mila.jacquet@email.com',
    '0201234567',
    '18 Place Bellecour, La Rochelle'
  ),
  (
    3,
    'Victor',
    'Caron',
    '2009-03-1',
    'Male',
    'victor.caron@email.com',
    '0212345678',
    '62 Rue des Lilas, Champigny-sur-Marne'
  ),
  (
    3,
    'Agathe',
    'Marchal',
    '2009-09-06',
    'Female',
    'agathe.marchal@email.com',
    '0223456789',
    '37 Boulevard des Cèdres, Antibes'
  ),
  (
    3,
    'Arthur',
    'Brun',
    '2009-2-17',
    'Male',
    'arthur.brun@email.com',
    '0234567890',
    '83 Avenue Foch, La Roche-sur-Yon'
  ),
  (
    3,
    'Jeanne',
    'Giraud',
    '2009-02-24',
    'Female',
    'jeanne.giraud@email.com',
    '0245678901',
    '1 Rue des Charmes, Calais'
  ),
  (
    3,
    'Mathéo',
    'Barbier',
    '2009-08-19',
    'Male',
    'matheo.barbier@email.com',
    '0256789012',
    '49 Place de la Madeleine, Béziers'
  ),
  (
    3,
    'Éléna',
    'Arnaud',
    '2009-04-05',
    'Female',
    'elena.arnaud@email.com',
    '0267890123',
    '2 Boulevard des Peupliers, Saint-Maur-des-Fossés'
  ),
  (
    3,
    'Gabin',
    'Rolland',
    '2009-06-2',
    'Male',
    'gabin.rolland@email.com',
    '0278901234',
    '75 Rue du Château, Chambéry'
  ),
  (
    3,
    'Victoria',
    'Charpentier',
    '2009-1-27',
    'Female',
    'victoria.charpentier@email.com',
    '0289012345',
    '23 Avenue de la République, Lorient'
  ),
  (
    3,
    'Timéo',
    'Klein',
    '2009-01-08',
    'Male',
    'timeo.klein@email.com',
    '0290123456',
    '68 Rue de la Plage, Troyes'
  ),
  (
    3,
    'Ambre',
    'Cousin',
    '2009-3-22',
    'Female',
    'ambre.cousin@email.com',
    '0301234567',
    '34 Place du Général de Gaulle, Saint-Quentin'
  ),
  (
    3,
    'Robin',
    'Fernandez',
    '2009-05-1',
    'Male',
    'robin.fernandez@email.com',
    '0312345678',
    '59 Boulevard Victor Hugo, Levallois-Perret'
  ),
  (
    3,
    'Charlie',
    'Germain',
    '2009-07-02',
    'Female',
    'charlie.germain@email.com',
    '0323456789',
    '27 Rue Émile Zola, Neuilly-sur-Seine'
  ),
  (
    3,
    'Noé',
    'Schneider',
    '2009-03-18',
    'Male',
    'noe.schneider@email.com',
    '0334567890',
    '52 Avenue des Jardins, Issy-les-Moulineaux'
  ),
  (
    3,
    'Charlotte',
    'Millet',
    '2009-09-01',
    'Female',
    'charlotte.millet@email.com',
    '0345678901',
    '2 Rue des Érables, Valence'
  ),
  (
    3,
    'Esteban',
    'Langlois',
    '2009-2-23',
    'Male',
    'esteban.langlois@email.com',
    '0356789012',
    '45 Place des Lices, Vannes'
  ),
  (
    3,
    'Clémence',
    'Renaud',
    '2009-02-2',
    'Female',
    'clemence.renaud@email.com',
    '0367890123',
    '81 Boulevard des Orangers, Montauban'
  ),
  (
    3,
    'Samuel',
    'Guyot',
    '2009-08-26',
    'Male',
    'samuel.guyot@email.com',
    '0378901234',
    '38 Rue de la Liberté, Courbevoie'
  ),
  (
    3,
    'Margaux',
    'Pelletier',
    '2009-04-2',
    'Female',
    'margaux.pelletier@email.com',
    '0389012345',
    '66 Avenue Pasteur, Noisy-le-Grand'
  ),
  (
    3,
    'Tristan',
    'Lacroix',
    '2009-06-20',
    'Male',
    'tristan.lacroix@email.com',
    '0390123456',
    '29 Rue des Mimosas, La Seyne-sur-Mer'
  ),
  (
    3,
    'Marine',
    'Benoit',
    '2009-1-09',
    'Female',
    'marine.benoit@email.com',
    '0401234567',
    '73 Place du Forum, Quimper'
  ),
  (
    3,
    'Valentin',
    'Lemaire',
    '2009-01-18',
    'Male',
    'valentin.lemaire@email.com',
    '0412345678',
    '25 Boulevard des Cyprès, Villeneuve-d\'Ascq'
  ),
  (
    3,
    'Margot',
    'Humbert',
    '2009-3-04',
    'Female',
    'margot.humbert@email.com',
    '0423456789',
    '56 Rue Bonaparte, Antony'
  ),
  (
    3,
    'Mohamed',
    'Boucher',
    '2009-05-28',
    'Male',
    'mohamed.boucher@email.com',
    '0434567890',
    '17 Avenue Jean-Jaurès, Cergy'
  ),
  (
    3,
    'Olivia',
    'Renault',
    '2009-07-2',
    'Female',
    'olivia.renault@email.com',
    '0445678901',
    '42 Rue des Glycines, Colmar'
  ),
  (
    3,
    'Kylian',
    'Schmitt',
    '2009-03-30',
    'Male',
    'kylian.schmitt@email.com',
    '0456789012',
    '89 Place du Maréchal Foch, Châteauroux'
  ),
  (
    3,
    'Juliette',
    'Deschamps',
    '2009-09-17',
    'Female',
    'juliette.deschamps@email.com',
    '0467890123',
    '31 Boulevard Haussmann, Marseille'
  ),
  (
    3,
    'Noa',
    'Delaunay',
    '2009-2-06',
    'Male',
    'noa.delaunay@email.com',
    '0478901234',
    '55 Rue de la Station, Hyères'
  ),
  (
    3,
    'Anaïs',
    'Bruneau',
    '2009-02-21',
    'Female',
    'anais.bruneau@email.com',
    '0489012345',
    '19 Avenue des Champs-Élysées, Paris'
  ),
  (
    3,
    'Mathieu',
    'Leconte',
    '2009-08-05',
    'Male',
    'mathieu.leconte@email.com',
    '0490123456',
    '64 Rue du Port, Saint-Nazaire'
  ),
  (
    3,
    'Lucie',
    'Diallo',
    '2009-04-23',
    'Female',
    'lucie.diallo@email.com',
    '0501234567',
    '22 Place de la Bastille, Lyon'
  ),
  (
    3,
    'Rayan',
    'Poulain',
    '2009-06-07',
    'Male',
    'rayan.poulain@email.com',
    '0512345678',
    '46 Boulevard des Hirondelles, Annecy'
  ),
  (
    3,
    'Laura',
    'Weber',
    '2009-1-19',
    'Female',
    'laura.weber@email.com',
    '0523456789',
    '78 Rue de la Mare, Évry'
  ),
  (
    3,
    'Evan',
    'Masse',
    '2009-01-01',
    'Male',
    'evan.masse@email.com',
    '0534567890',
    '33 Avenue des Frênes, Bayonne'
  ),
  (
    3,
    'Éléonore',
    'Tanguy',
    '2009-3-31',
    'Female',
    'eleonore.tanguy@email.com',
    '0545678901',
    '61 Rue Saint-Antoine, Carcassonne'
  ),
  (
    3,
    'Baptiste',
    'Andre',
    '2009-05-08',
    'Male',
    'baptiste.andre@email.com',
    '0556789012',
    '27 Place des Terreaux, Lille'
  ),
  (
    3,
    'Célia',
    'Marechal',
    '2009-07-20',
    'Female',
    'celia.marechal@email.com',
    '0567890123',
    '53 Boulevard des Dunes, Le Mans'
  ),
  (
    3,
    'Quentin',
    'Baron',
    '2009-03-1',
    'Male',
    'quentin.baron@email.com',
    '0578901234',
    '16 Rue des Iris, Nanterre'
  ),
  (
    3,
    'Louane',
    'Berthelot',
    '2009-09-29',
    'Female',
    'louane.berthelot@email.com',
    '0589012345',
    '72 Avenue des Tulipes, Ivry-sur-Seine'
  ),
  (
    3,
    'Alexandre',
    'Lejeune',
    '2009-2-2',
    'Male',
    'alexandre.lejeune@email.com',
    '0590123456',
    '47 Rue de la Victoire, Arles'
  ),
  (
    3,
    'Julia',
    'Royer',
    '2009-02-07',
    'Female',
    'julia.royer@email.com',
    '0601234567',
    '85 Place du Capitole, Toulouse'
  ),
  (
    3,
    'Nicolas',
    'Lebrun',
    '2009-08-2',
    'Male',
    'nicolas.lebrun@email.com',
    '0612345678',
    '39 Boulevard des Lys, Clermont-Ferrand'
  ),
  (
    3,
    'Salomé',
    'Lesage',
    '2009-04-30',
    'Female',
    'salome.lesage@email.com',
    '0623456789',
    '1 Rue de la Seine, Bordeaux'
  ),
  (
    3,
    'Diego',
    'Gilbert',
    '2009-06-16',
    'Male',
    'diego.gilbert@email.com',
    '0634567890',
    '58 Avenue Gambetta, Montreuil'
  ),
  (
    3,
    'Adèle',
    'Bouvier',
    '2009-1-02',
    'Female',
    'adele.bouvier@email.com',
    '0645678901',
    '24 Rue des Myrtilles, Boulogne-Billancourt'
  ),
  (
    3,
    'Oscar',
    'Bertin',
    '2009-01-24',
    'Male',
    'oscar.bertin@email.com',
    '0656789012',
    '69 Place du Théâtre, Grenoble'
  ),
  (
    3,
    'Léna',
    'Charles',
    '2009-3-1',
    'Female',
    'lena.charles@email.com',
    '0667890123',
    '32 Boulevard des Hêtres, Nice'
  ),
  (
    3,
    'Gaspard',
    'Herve',
    '2009-05-03',
    'Male',
    'gaspard.herve@email.com',
    '0678901234',
    '77 Rue Nationale, Reims'
  ),
  (
    2,
    'Alicia',
    'Guillot',
    '2010-07-2',
    'Female',
    'alicia.guillot@email.com',
    '0689012345',
    '44 Avenue de la Mer, Perpignan'
  ),
  (
    2,
    'Justin',
    'Martinez',
    '2010-03-22',
    'Male',
    'justin.martinez@email.com',
    '0690123456',
    '18 Rue des Pins, Strasbourg'
  ),
  (
    2,
    'Léonie',
    'Rodrigues',
    '2010-09-08',
    'Female',
    'leonie.rodrigues@email.com',
    '0701234567',
    '63 Place de la Comédie, Montpellier'
  ),
  (
    2,
    'Augustin',
    'Meunier',
    '2010-2-25',
    'Male',
    'augustin.meunier@email.com',
    '0712345678',
    '25 Boulevard des Magnolias, Dijon'
  ),
  (
    2,
    'Capucine',
    'Noel',
    '2010-02-2',
    'Female',
    'capucine.noel@email.com',
    '0723456789',
    '51 Rue du Paradis, Saint-Étienne'
  ),
  (
    2,
    'Tiago',
    'Bailly',
    '2010-08-29',
    'Male',
    'tiago.bailly@email.com',
    '0734567890',
    '37 Avenue des Roses, Toulon'
  ),
  (
    2,
    'Lise',
    'Aubert',
    '2010-04-1',
    'Female',
    'lise.aubert@email.com',
    '0745678901',
    '82 Rue des Jonquilles, Brest'
  ),
  (
    2,
    'Luka',
    'Marchand',
    '2010-06-27',
    'Male',
    'luka.marchand@email.com',
    '0756789012',
    '29 Place des Vosges, Nancy'
  ),
  (
    2,
    'Iris',
    'Courtois',
    '2010-1-2',
    'Female',
    'iris.courtois@email.com',
    '0767890123',
    '67 Boulevard des Violettes, Rennes'
  ),
  (
    2,
    'Maël',
    'Rey',
    '2010-01-29',
    'Male',
    'mael.rey@email.com',
    '0778901234',
    '1 Rue du Muguet, Aix-en-Provence'
  ),
  (
    2,
    'Pauline',
    'Gillet',
    '2010-3-17',
    'Female',
    'pauline.gillet@email.com',
    '0789012345',
    '48 Avenue Victor Hugo, Angers'
  ),
  (
    2,
    'Edgar',
    'Menard',
    '2010-05-31',
    'Male',
    'edgar.menard@email.com',
    '0790123456',
    '71 Rue de la Paix, Nîmes'
  ),
  (
    2,
    'Roxane',
    'Huet',
    '2010-07-05',
    'Female',
    'roxane.huet@email.com',
    '0801234567',
    '23 Place de la République, Villeurbanne'
  ),
  (
    2,
    'Malo',
    'Rousset',
    '2010-03-28',
    'Male',
    'malo.rousset@email.com',
    '0812345678',
    '59 Boulevard des Platanes, Amiens'
  ),
  (
    2,
    'Lili',
    'Guillou',
    '2010-09-1',
    'Female',
    'lili.guillou@email.com',
    '0823456789',
    '36 Rue des Coquelicots, Metz'
  ),
  (
    2,
    'Rafael',
    'Blanchard',
    '2010-2-01',
    'Male',
    'rafael.blanchard@email.com',
    '0834567890',
    '74 Avenue des Pommiers, Besançon'
  ),
  (
    2,
    'Naomi',
    'Lucas',
    '2010-02-18',
    'Female',
    'naomi.lucas@email.com',
    '0845678901',
    '22 Rue des Saules, Mulhouse'
  ),
  (
    2,
    'Thibault',
    'Lacombe',
    '2010-08-03',
    'Male',
    'thibault.lacombe@email.com',
    '0856789012',
    '65 Place du Marché, Rouen'
  ),
  (
    2,
    'Mélina',
    'Santos',
    '2010-04-20',
    'Female',
    'melina.santos@email.com',
    '0867890123',
    '31 Boulevard des Ormes, Caen'
  ),
  (
    2,
    'Martin',
    'Tessier',
    '2010-06-08',
    'Male',
    'martin.tessier@email.com',
    '0878901234',
    '57 Rue Molière, Argenteuil'
  ),
  (
    2,
    'Angèle',
    'Nguyen',
    '2010-1-24',
    'Female',
    'angele.nguyen@email.com',
    '0889012345',
    '19 Avenue des Sorbiers, Tours'
  ),
  (
    2,
    'Isaac',
    'Breton',
    '2010-01-04',
    'Male',
    'isaac.breton@email.com',
    '0890123456',
    '43 Rue du Moulin, Avignon'
  ),
  (
    2,
    'Elisa',
    'Cordier',
    '2010-3-26',
    'Female',
    'elisa.cordier@email.com',
    '0901234567',
    '84 Place de l\'Hôtel de Ville, Nanterre'
  ),
  (
    2,
    'Soan',
    'Leclercq',
    '2010-05-3',
    'Male',
    'soan.leclercq@email.com',
    '0912345678',
    '26 Boulevard des Aulnes, Créteil'
  ),
  (
    2,
    'Faustine',
    'Ollivier',
    '2010-07-25',
    'Female',
    'faustine.ollivier@email.com',
    '0923456789',
    '62 Rue des Bouleaux, Versailles'
  ),
  (
    1,
    'Milan',
    'Jacques',
    '2010-03-07',
    'Male',
    'milan.jacques@email.com',
    '0934567890',
    '47 Avenue des Glycines, Saint-Denis'
  ),
  (
    1,
    'Amandine',
    'Payet',
    '2010-09-21',
    'Female',
    'amandine.payet@email.com',
    '0945678901',
    '85 Rue des Tilleuls, Issy-les-Moulineaux'
  ),
  (
    1,
    'Sandro',
    'Collin',
    '2010-2-18',
    'Male',
    'sandro.collin@email.com',
    '0956789012',
    '3 Place des Peupliers, Montreuil'
  ),
  (
    1,
    'Ana',
    'Richard',
    '2010-02-05',
    'Female',
    'ana.richard@email.com',
    '0967890123',
    '54 Boulevard des Lilas, Roubaix'
  ),
  (
    1,
    'Dorian',
    'David',
    '2010-08-3',
    'Male',
    'dorian.david@email.com',
    '0978901234',
    '38 Rue des Chênes, Tourcoing'
  ),
  (
    1,
    'Amélie',
    'Morel',
    '2010-04-29',
    'Female',
    'amelie.morel@email.com',
    '0989012345',
    '79 Avenue des Acacias, Avignon'
  ),
  (
    1,
    'Alessio',
    'Chevalier',
    '2010-06-2',
    'Male',
    'alessio.chevalier@email.com',
    '0990123456',
    '27 Place des Arts, Dunkerque'
  ),
  (
    1,
    'Jade',
    'Robert',
    '2010-1-26',
    'Female',
    'jade.robert@email.com',
    '0101234567',
    '66 Boulevard des Marronniers, Créteil'
  ),
  (
    1,
    'Tiago',
    'Vincent',
    '2010-01-16',
    'Male',
    'tiago.vincent@email.com',
    '0112345678',
    '41 Rue de la Fontaine, Versailles'
  ),
  (
    1,
    'Eva',
    'Garcia',
    '2010-3-01',
    'Female',
    'eva.garcia@email.com',
    '0123456789',
    '82 Avenue des Sports, Aulnay-sous-Bois'
  ),
  (
    1,
    'Diego',
    'Roux',
    '2010-05-25',
    'Male',
    'diego.roux@email.com',
    '0134567890',
    '35 Rue des Vignes, Colombes'
  ),
  (
    1,
    'Elsa',
    'Petit',
    '2010-07-18',
    'Female',
    'elsa.petit@email.com',
    '0145678901',
    '71 Place du 1 Mai, Vitry-sur-Seine'
  ),
  (
    1,
    'Mathis',
    'Bertin',
    '2010-03-02',
    'Male',
    'mathis.bertin@email.com',
    '0156789012',
    '52 Boulevard Voltaire, Pau'
  ),
  (
    1,
    'Clara',
    'Leblanc',
    '2010-09-1',
    'Female',
    'clara.leblanc@email.com',
    '0167890123',
    '19 Avenue Jean Moulin, Asnières-sur-Seine'
  ),
  (
    1,
    'Enzo',
    'Francois',
    '2010-2-28',
    'Male',
    'enzo.francois@email.com',
    '0178901234',
    '63 Rue des Bleuets, Bourges'
  ),
  (
    1,
    'Lina',
    'Henry',
    '2010-02-3',
    'Female',
    'lina.henry@email.com',
    '0189012345',
    '26 Place Bellecour, La Rochelle'
  ),
  (
    1,
    'Tom',
    'Nicolas',
    '2010-08-25',
    'Male',
    'tom.nicolas@email.com',
    '0190123456',
    '47 Rue des Lilas, Champigny-sur-Marne'
  ),
  (
    1,
    'Thomas',
    'Martinos',
    '2007-04-1',
    'Male',
    'thomas.martin23@email.com',
    '0712345678',
    '1 Rue de la Paix, Paris'
  ),
  (
    1,
    'Julieos',
    'Dubois',
    '2007-06-22',
    'Female',
    'julie.duboisos@email.com',
    '0723456789',
    '1 Avenue Victor Hugo, Lyon'
  ),
  (
    1,
    'Lucas',
    'Bernard',
    '2007-01-30',
    'Male',
    'lucas.bernard@email.com',
    '0734567890',
    '22 Boulevard Saint-Michel, Marseille'
  ),
  (
    1,
    'Emma',
    'Petit',
    '2007-08-3',
    'Female',
    'emma.petit@email.com',
    '0745678901',
    '2 Rue Gambetta, Bordeaux'
  ),
  (
    1,
    'Hugo',
    'Moreau',
    '2007-03-05',
    'Male',
    'hugo.moreau@email.com',
    '0756789012',
    '17 Avenue Jean Jaurès, Toulouse'
  ),
  (
    1,
    'Chloé',
    'Lambert',
    '2007-2-18',
    'Female',
    'chloe.lambert@email.com',
    '0767890123',
    '3 Rue Émile Zola, Nantes'
  ),
  (
    1,
    'Nathan',
    'Girard',
    '2007-02-25',
    'Male',
    'nathan.girard@email.com',
    '0778901234',
    '1 Place de la République, Strasbourg'
  ),
  (
    1,
    'Léa',
    'Fontaine',
    '2007-09-07',
    'Female',
    'lea.fontaine@email.com',
    '0789012345',
    '29 Rue du Commerce, Lille'
  ),
  (
    1,
    'Enzo',
    'Rousseau',
    '2007-05-19',
    'Male',
    'enzo.rousseau@email.com',
    '0790123456',
    '2 Avenue Foch, Rennes'
  ),
  (
    1,
    'Jade',
    'Vincent',
    '2007-3-01',
    'Female',
    'jade.vincent@email.com',
    '0712345987',
    '1 Boulevard Pasteur, Montpellier'
  ),
  (
    1,
    'Louis',
    'Richard',
    '2007-04-28',
    'Male',
    'louis.richard@email.com',
    '0723459876',
    '21 Rue Victor Hugo, Nice'
  ),
  (
    1,
    'Manon',
    'Leroy',
    '2007-1-2',
    'Female',
    'manon.leroy@email.com',
    '0734569870',
    '2 Avenue de la Liberté, Reims'
  ),
  (
    1,
    'Timéo',
    'Durand',
    '2007-07-23',
    'Male',
    'timeo.durand@email.com',
    '0745698701',
    '2 Place des Vosges, Grenoble'
  ),
  (
    1,
    'Sarah',
    'Lefevre',
    '2007-02-09',
    'Female',
    'sarah.lefevre@email.com',
    '0756987012',
    '25 Rue Bonaparte, Dijon'
  ),
  (
    1,
    'Raphaël',
    'Boyer',
    '2007-08-31',
    'Male',
    'raphael.boyer@email.com',
    '0769870123',
    '1 Boulevard des Alpes, Angers'
  ),
  (
    1,
    'Camille',
    'Mercier',
    '2007-05-03',
    'Female',
    'camille.mercier@email.com',
    '0789701234',
    '18 Rue des Lilas, Le Havre'
  ),
  (
    1,
    'Théo',
    'Blanc',
    '2007-01-17',
    'Male',
    'theo.blanc@email.com',
    '0701234567',
    '33 Avenue Clemenceau, Tours'
  ),
  (
    1,
    'Lina',
    'Guerin',
    '2007-02-25',
    'Female',
    'lina.guerin@email.com',
    '0712346789',
    '3 Place Bellecour, Caen'
  ),
  (
    1,
    'Mathis',
    'Legrand',
    '2007-06-05',
    'Male',
    'mathis.legrand@email.com',
    '0723467890',
    '3 Rue Molière, Saint-Étienne'
  ),
  (
    1,
    'Inès',
    'Perrin',
    '2007-09-26',
    'Female',
    'ines.perrin@email.com',
    '0734678901',
    '19 Boulevard Voltaire, Amiens'
  ),
  (
    1,
    'Noah',
    'Morin',
    '2007-03-2',
    'Male',
    'noah.morin@email.com',
    '0746789012',
    '27 Rue du Faubourg, Metz'
  ),
  (
    1,
    'Alice',
    'Gauthier',
    '2007-07-08',
    'Female',
    'alice.gauthier@email.com',
    '0767890234',
    '16 Avenue Georges Pompidou, Besançon'
  ),
  (
    1,
    'Gabriel',
    'Simon',
    '2007-3-20',
    'Male',
    'gabriel.simon@email.com',
    '0778902345',
    '31 Rue de la Gare, Perpignan'
  ),
  (
    1,
    'Eva',
    'Faure',
    '2007-04-01',
    'Female',
    'eva.faure@email.com',
    '0789023456',
    '1 Place de la Mairie, Orléans'
  ),
  (
    1,
    'Adam',
    'Fournier',
    '2007-1-1',
    'Male',
    'adam.fournier@email.com',
    '0790234567',
    '1 Avenue des Champs, Mulhouse'
  ),
  (
    1,
    'Lola',
    'Bonnet',
    '2007-02-27',
    'Female',
    'lola.bonnet@email.com',
    '0712347890',
    '24 Boulevard Haussmann, Rouen'
  ),
  (
    1,
    'Ethan',
    'Giraud',
    '2006-05-3',
    'Male',
    'ethan.giraud@email.com',
    '0723451234',
    '2 Rue des Roses, Paris'
  ),
  (
    1,
    'Léna',
    'Dupuy',
    '2006-07-28',
    'Female',
    'lena.dupuy@email.com',
    '0734512345',
    '17 Avenue Montaigne, Lyon'
  ),
  (
    1,
    'Mathéo',
    'Roux',
    '2006-02-2',
    'Male',
    'matheo.roux@email.com',
    '0745123456',
    '23 Boulevard Magenta, Marseille'
  ),
  (
    1,
    'Clara',
    'Andre',
    '2006-09-03',
    'Female',
    'clara.andre@email.com',
    '0751234567',
    '1 Rue Sainte-Catherine, Bordeaux'
  ),
  (
    1,
    'Jules',
    'Lemaire',
    '2006-04-19',
    'Male',
    'jules.lemaire@email.com',
    '0761234567',
    '2 Avenue de la République, Toulouse'
  ),
  (
    1,
    'Zoé',
    'Bertrand',
    '2006-2-22',
    'Female',
    'zoe.bertrand@email.com',
    '0771234567',
    '28 Rue du Marché, Nantes'
  ),
  (
    1,
    'Arthur',
    'David',
    '2006-03-08',
    'Male',
    'arthur.david@email.com',
    '0781234567',
    '2 Place Kléber, Strasbourg'
  ),
  (
    1,
    'Louise',
    'Chevalier',
    '2006-08-17',
    'Female',
    'louise.chevalier@email.com',
    '0791234567',
    '30 Rue Nationale, Lille'
  ),
  (
    1,
    'Maxime',
    'Roy',
    '2006-06-25',
    'Male',
    'maxime.roy@email.com',
    '0712341234',
    '19 Avenue Carnot, Rennes'
  ),
  (
    1,
    'Louna',
    'Morel',
    '2006-01-2',
    'Female',
    'louna.morel@email.com',
    '0723412345',
    '2 Boulevard Wilson, Montpellier'
  ),
  (
    1,
    'Paul',
    'Marchand',
    '2006-1-30',
    'Male',
    'paul.marchand@email.com',
    '0734123456',
    '22 Rue Matisse, Nice'
  ),
  (
    1,
    'Nina',
    'Muller',
    '2006-05-07',
    'Female',
    'nina.muller@email.com',
    '0741234567',
    '1 Avenue de Paris, Reims'
  ),
  (
    1,
    'Antoine',
    'Masson',
    '2006-3-1',
    'Male',
    'antoine.masson@email.com',
    '0751234678',
    '1 Place de l\'Opéra, Grenoble'
  ),
  (
    1,
    'Ambre',
    'Dufour',
    '2006-07-02',
    'Female',
    'ambre.dufour@email.com',
    '0761234678',
    '25 Rue Gambetta, Dijon'
  ),
  (
    1,
    'Samuel',
    'Meunier',
    '2006-02-23',
    'Male',
    'samuel.meunier@email.com',
    '0771234678',
    '16 Boulevard Saint-Germain, Angers'
  ),
  (
    1,
    'Rose',
    'Brun',
    '2006-09-2',
    'Female',
    'rose.brun@email.com',
    '0781234678',
    '3 Rue des Capucines, Le Havre'
  ),
  (
    1,
    'Tom',
    'Blanchard',
    '2006-04-26',
    'Male',
    'tom.blanchard@email.com',
    '0791234678',
    '20 Avenue Galliéni, Tours'
  ),
  (
    1,
    'Anna',
    'Joly',
    '2006-2-08',
    'Female',
    'anna.joly@email.com',
    '0712342345',
    '1 Place de l\'Église, Caen'
  ),
  (
    1,
    'Nolan',
    'Gaillard',
    '2006-06-19',
    'Male',
    'nolan.gaillard@email.com',
    '0723423456',
    '27 Rue de la Paix, Saint-Étienne'
  ),
  (
    1,
    'Maëlys',
    'Roussel',
    '2006-01-31',
    'Female',
    'maelys.roussel@email.com',
    '0734234567',
    '1 Boulevard des Lices, Amiens'
  ),
  (
    1,
    'Sacha',
    'Philippe',
    '2006-08-1',
    'Male',
    'sacha.philippe@email.com',
    '0742345678',
    '1 Avenue Leclerc, Metz'
  ),
  (
    1,
    'Juliette',
    'Renard',
    '2006-03-22',
    'Female',
    'juliette.renard@email.com',
    '0752345678',
    '32 Rue Stanislas, Besançon'
  ),
  (
    1,
    'Axel',
    'Leclerc',
    '2006-1-05',
    'Male',
    'axel.leclerc@email.com',
    '0762345678',
    '3 Place Arago, Perpignan'
  ),
  (
    1,
    'Romane',
    'Fleury',
    '2006-05-29',
    'Female',
    'romane.fleury@email.com',
    '0772345678',
    '21 Avenue de la Gare, Orléans'
  ),
  (
    1,
    'Noa',
    'Hubert',
    '2006-3-1',
    'Male',
    'noa.hubert@email.com',
    '0782345678',
    '18 Rue des Carmes, Mulhouse'
  ),
  (
    1,
    'Agathe',
    'Henry',
    '2006-07-24',
    'Female',
    'agathe.henry@email.com',
    '0792345678',
    '29 Boulevard des Belges, Rouen'
  ),
  (
    2,
    'Yanis',
    'Robin',
    '2005-03-18',
    'Male',
    'yanis.robin@email.com',
    '0712343456',
    '1 Rue Saint-Antoine, Paris'
  ),
  (
    2,
    'Élise',
    'Vidal',
    '2005-08-26',
    'Female',
    'elise.vidal@email.com',
    '0723434567',
    '19 Avenue Mozart, Lyon'
  ),
  (
    2,
    'Rayan',
    'Caron',
    '2005-01-09',
    'Male',
    'rayan.caron@email.com',
    '0734345678',
    '31 Boulevard Longchamp, Marseille'
  ),
  (
    2,
    'Lucie',
    'Barbier',
    '2005-1-21',
    'Female',
    'lucie.barbier@email.com',
    '0743456789',
    '2 Rue Sainte, Bordeaux'
  ),
  (
    2,
    'Clément',
    'Perrot',
    '2005-06-04',
    'Male',
    'clement.perrot@email.com',
    '0753456789',
    '26 Avenue Jean Médecin, Toulouse'
  ),
  (
    2,
    'Maëlle',
    'Baron',
    '2005-3-1',
    'Female',
    'maelle.baron@email.com',
    '0763456789',
    '3 Rue Crébillon, Nantes'
  ),
  (
    2,
    'Alexis',
    'Dubois',
    '2005-04-29',
    'Male',
    'alexis.dubois@email.com',
    '0773456789',
    '22 Place Gutenberg, Strasbourg'
  ),
  (
    2,
    'Éléna',
    'Navarre',
    '2005-09-2',
    'Female',
    'elena.navarre@email.com',
    '0783456789',
    '1 Rue Nationale, Lille'
  ),
  (
    2,
    'Maxence',
    'Martel',
    '2005-02-23',
    'Male',
    'maxence.martel@email.com',
    '0793456789',
    '27 Avenue Charles de Gaulle, Rennes'
  ),
  (
    2,
    'Charlotte',
    'Picard',
    '2005-07-08',
    'Female',
    'charlotte.picard@email.com',
    '0712345699',
    '1 Boulevard du Jeu de Paume, Montpellier'
  ),
  (
    2,
    'Victor',
    'Duval',
    '2005-2-4',
    'Male',
    'victor.duval@email.com',
    '0723456998',
    '2 Rue de France, Nice'
  ),
  (
    2,
    'Margaux',
    'Lemoine',
    '2005-05-17',
    'Female',
    'margaux.lemoine@email.com',
    '0734569987',
    '18 Avenue de Champagne, Reims'
  ),
  (
    2,
    'Robin',
    'Guyot',
    '2005-01-03',
    'Male',
    'robin.guyot@email.com',
    '0745699876',
    '2 Place Grenette, Grenoble'
  ),
  (
    2,
    'Anaïs',
    'Schmitt',
    '2005-08-22',
    'Female',
    'anais.schmitt@email.com',
    '0756998765',
    '24 Rue de la Liberté, Dijon'
  ),
  (
    2,
    'Evan',
    'Rolland',
    '2005-03-2',
    'Male',
    'evan.rolland@email.com',
    '0769987654',
    '3 Boulevard Foch, Angers'
  ),
  (
    2,
    'Lilou',
    'Maillard',
    '2005-06-27',
    'Female',
    'lilou.maillard@email.com',
    '0779876543',
    '16 Rue Thiers, Le Havre'
  ),
  (
    2,
    'Aaron',
    'Benoit',
    '2005-3-1',
    'Male',
    'aaron.benoit@email.com',
    '0798765432',
    '30 Avenue Grammont, Tours'
  ),
  (
    2,
    'Océane',
    'Germain',
    '2005-04-02',
    'Female',
    'oceane.germain@email.com',
    '0712346666',
    '3 Place Saint-Pierre, Caen'
  ),
  (
    2,
    'Nathan',
    'Lesage',
    '2005-09-25',
    'Male',
    'nathan.lesage@email.com',
    '0723466665',
    '21 Rue de la République, Saint-Étienne'
  ),
  (
    2,
    'Pauline',
    'Guillou',
    '2005-02-18',
    'Female',
    'pauline.guillou@email.com',
    '0734666654',
    '1 Boulevard Jules Ferry, Amiens'
  ),
  (
    2,
    'Quentin',
    'Gilbert',
    '2005-07-31',
    'Male',
    'quentin.gilbert@email.com',
    '0746666543',
    '28 Avenue Robert Schuman, Metz'
  ),
  (
    2,
    'Mathilde',
    'Boucher',
    '2005-2-06',
    'Female',
    'mathilde.boucher@email.com',
    '0766665432',
    '2 Rue Battant, Besançon'
  ),
  (
    2,
    'Bastien',
    'Lejeune',
    '2005-05-20',
    'Male',
    'bastien.lejeune@email.com',
    '0776665432',
    '19 Place de Catalogne, Perpignan'
  ),
  (
    2,
    'Héloïse',
    'Royer',
    '2005-1-2',
    'Female',
    'heloise.royer@email.com',
    '0786665432',
    '25 Avenue Dauphine, Orléans'
  ),
  (
    2,
    'Kylian',
    'Bourgeois',
    '2005-03-28',
    'Male',
    'kylian.bourgeois@email.com',
    '0796665432',
    '1 Rue du Sauvage, Mulhouse'
  ),
  (
    2,
    'Jeanne',
    'Daniel',
    '2005-08-09',
    'Female',
    'jeanne.daniel@email.com',
    '0712347777',
    '32 Boulevard des Belges, Rouen'
  ),
  (
    1,
    'Esteban',
    'Bernier',
    '2004-07-16',
    'Male',
    'esteban.bernier@email.com',
    '0723477776',
    '2 Rue Montorgueil, Paris'
  ),
  (
    1,
    'Léonie',
    'Michel',
    '2004-01-29',
    'Female',
    'leonie.michel@email.com',
    '0734777765',
    '26 Avenue Berthelot, Lyon'
  ),
  (
    1,
    'Mattéo',
    'Dumont',
    '2004-2-07',
    'Male',
    'matteo.dumont@email.com',
    '0747777654',
    '2 Boulevard Baille, Marseille'
  ),
  (
    1,
    'Mélissa',
    'Bouchet',
    '2004-04-23',
    'Female',
    'melissa.bouchet@email.com',
    '0757776543',
    '17 Rue Esprit des Lois, Bordeaux'
  ),
  (
    1,
    'Dylan',
    'Gall',
    '2004-08-3',
    'Male',
    'dylan.gall@email.com',
    '0767776543',
    '3 Avenue des Minimes, Toulouse'
  ),
  (
    1,
    'Marine',
    'Denis',
    '2004-02-05',
    'Female',
    'marine.denis@email.com',
    '0777765432',
    '20 Rue de Strasbourg, Nantes'
  ),
  (
    1,
    'Lorenzo',
    'Guichard',
    '2004-3-18',
    'Male',
    'lorenzo.guichard@email.com',
    '0787765432',
    '1 Place Broglie, Strasbourg'
  ),
  (
    1,
    'Salomé',
    'Brunet',
    '2004-05-31',
    'Female',
    'salome.brunet@email.com',
    '0797765432',
    '1 Rue Faidherbe, Lille'
  ),
  (
    1,
    'Diego',
    'Collet',
    '2004-09-24',
    'Male',
    'diego.collet@email.com',
    '0712348888',
    '23 Avenue Henri Fréville, Rennes'
  ),
  (
    1,
    'Lisa',
    'Lefevre',
    '2004-03-08',
    'Female',
    'lisa.lefevre@email.com',
    '0723488887',
    '1 Boulevard du Peyrou, Montpellier'
  ),
  (
    1,
    'Kenzo',
    'Rey',
    '2004-1-20',
    'Male',
    'kenzo.rey@email.com',
    '0734888876',
    '28 Rue Gioffredo, Nice'
  ),
  (
    1,
    'Anaëlle',
    'Brun',
    '2004-04-2',
    'Female',
    'anaelle.brun@email.com',
    '0748888765',
    '3 Avenue Jean Jaurès, Reims'
  ),
  (
    1,
    'Liam',
    'Colin',
    '2004-07-27',
    'Male',
    'liam.colin@email.com',
    '0758888765',
    '19 Place Victor Hugo, Grenoble'
  ),
  (
    1,
    'Maëva',
    'Menard',
    '2004-01-16',
    'Female',
    'maeva.menard@email.com',
    '0768888765',
    '1 Rue des Godrans, Dijon'
  ),
  (
    1,
    'Noé',
    'Pierre',
    '2004-06-02',
    'Male',
    'noe.pierre@email.com',
    '0778888765',
    '22 Boulevard du Roi René, Angers'
  ),
  (
    1,
    'Clémence',
    'Joubert',
    '2004-2-1',
    'Female',
    'clemence.joubert@email.com',
    '0788888765',
    '2 Rue de Paris, Le Havre'
  ),
  (
    1,
    'Rafael',
    'Barre',
    '2004-05-25',
    'Male',
    'rafael.barre@email.com',
    '0798888765',
    '27 Avenue Maginot, Tours'
  ),
  (
    1,
    'Célia',
    'Herve',
    '2004-02-08',
    'Female',
    'celia.herve@email.com',
    '0712349999',
    '16 Place Saint-Sauveur, Caen'
  ),
  (
    1,
    'Ruben',
    'Monnier',
    '2004-09-19',
    'Male',
    'ruben.monnier@email.com',
    '0723499998',
    '1 Rue Michelet, Saint-Étienne'
  ),
  (
    1,
    'Valentine',
    'Guillet',
    '2004-03-04',
    'Female',
    'valentine.guillet@email.com',
    '0734999987',
    '24 Boulevard du Mail, Amiens'
  ),
  (
    1,
    'Marin',
    'Garnier',
    '2004-08-1',
    'Male',
    'marin.garnier@email.com',
    '0749999876',
    '2 Avenue Serpenoise, Metz'
  ),
  (
    1,
    'Marie',
    'Charpentier',
    '2004-3-28',
    'Female',
    'marie.charpentier@email.com',
    '0759999876',
    '29 Rue des Granges, Besançon'
  ),
  (
    1,
    'Charles',
    'Lebrun',
    '2004-06-09',
    'Male',
    'charles.lebrun@email.com',
    '0769999876',
    '2 Place de la Loge, Perpignan'
  ),
  (
    1,
    'Elsa',
    'Hamon',
    '2004-01-22',
    'Female',
    'elsa.hamon@email.com',
    '0779999876',
    '2 Avenue Dauphine, Orléans'
  ),
  (
    1,
    'Mohamed',
    'Tessier',
    '2004-1-03',
    'Male',
    'mohamed.tessier@email.com',
    '0789999876',
    '18 Rue du Mittelbach, Mulhouse'
  ),
  (
    1,
    'Margot',
    'Hoarau',
    '2004-04-18',
    'Female',
    'margot.hoarau@email.com',
    '0799999876',
    '25 Boulevard de l\'Europe, Rouen'
  ),
  (
    2,
    'Alexandre',
    'Klein',
    '2003-02-1',
    'Male',
    'alexandre.klein@email.com',
    '0712341122',
    '2 Rue du Louvre, Paris'
  ),
  (
    2,
    'Candice',
    'Rodriguez',
    '2003-09-04',
    'Female',
    'candice.rodriguez@email.com',
    '0723411223',
    '2 Avenue Jean Mermoz, Lyon'
  ),
  (
    2,
    'Vadim',
    'Cousin',
    '2003-05-22',
    'Male',
    'vadim.cousin@email.com',
    '0734112234',
    '28 Boulevard Michelet, Marseille'
  ),
  (
    2,
    'Sofia',
    'Bonnet',
    '2003-2-1',
    'Female',
    'sofia.bonnet@email.com',
    '0741122345',
    '2 Rue Fondaudège, Bordeaux'
  ),
  (
    2,
    'William',
    'Aubert',
    '2003-04-01',
    'Male',
    'william.aubert@email.com',
    '0751122345',
    '21 Avenue des Minimes, Toulouse'
  ),
  (
    2,
    'Yasmine',
    'Lacroix',
    '2003-08-27',
    'Female',
    'yasmine.lacroix@email.com',
    '0761122345',
    '3 Rue Kervégan, Nantes'
  ),
  (
    2,
    'Zacharie',
    'Fabre',
    '2003-01-2',
    'Male',
    'zacharie.fabre@email.com',
    '0771122345',
    '1 Place de la République, Strasbourg'
  ),
  (
    2,
    'Thaïs',
    'Jean',
    '2003-06-30',
    'Female',
    'thais.jean@email.com',
    '0781122345',
    '19 Rue de la Monnaie, Lille'
  ),
  (
    2,
    'Ulysse',
    'Bourdon',
    '2003-3-09',
    'Male',
    'ulysse.bourdon@email.com',
    '0791122345',
    '3 Avenue Janvier, Rennes'
  ),
  (
    2,
    'Rebecca',
    'Carpentier',
    '2003-05-17',
    'Female',
    'rebecca.carpentier@email.com',
    '0712342233',
    '25 Boulevard Ledru-Rollin, Montpellier'
  ),
  (
    2,
    'Simon',
    'Huet',
    '2003-1-06',
    'Male',
    'simon.huet@email.com',
    '0723422334',
    '16 Rue de la Buffa, Nice'
  ),
  (
    2,
    'Olivia',
    'Henry',
    '2003-03-21',
    'Female',
    'olivia.henry@email.com',
    '0734223345',
    '31 Avenue de Laon, Reims'
  ),
  (
    2,
    'Quentin',
    'Remy',
    '2003-07-1',
    'Male',
    'quentin.remy@email.com',
    '0742233456',
    '1 Place Grenette, Grenoble'
  ),
  (
    2,
    'Prune',
    'Vasseur',
    '2003-01-28',
    'Female',
    'prune.vasseur@email.com',
    '0752233456',
    '22 Rue de la Liberté, Dijon'
  ),
  (
    2,
    'Nino',
    'Gerard',
    '2003-09-2',
    'Male',
    'nino.gerard@email.com',
    '0762233456',
    '1 Boulevard Carnot, Angers'
  ),
  (
    2,
    'Maïwenn',
    'Schneider',
    '2003-04-23',
    'Female',
    'maiwenn.schneider@email.com',
    '0772233456',
    '27 Rue Thiers, Le Havre'
  ),
  (
    2,
    'Loris',
    'Carre',
    '2003-08-09',
    'Male',
    'loris.carre@email.com',
    '0782233456',
    '3 Avenue de Grammont, Tours'
  ),
  (
    2,
    'Kim',
    'Breton',
    '2003-02-27',
    'Female',
    'kim.breton@email.com',
    '0792233456',
    '1 Place Saint-Jean, Caen'
  ),
  (
    2,
    'Johan',
    'Charles',
    '2003-2-19',
    'Male',
    'johan.charles@email.com',
    '0712343344',
    '17 Rue de la République, Saint-Étienne'
  ),
  (
    2,
    'Inaya',
    'Jacob',
    '2003-06-05',
    'Female',
    'inaya.jacob@email.com',
    '0723433445',
    '30 Boulevard Victor Hugo, Amiens'
  ),
  (
    2,
    'Gabin',
    'Guilbert',
    '2003-3-23',
    'Male',
    'gabin.guilbert@email.com',
    '0734334456',
    '1 Avenue Foch, Metz'
  ),
  (
    2,
    'Flora',
    'Leclercq',
    '2003-07-18',
    'Female',
    'flora.leclercq@email.com',
    '0743344567',
    '2 Rue Battant, Besançon'
  ),
  (
    2,
    'Edgar',
    'Delaunay',
    '2003-03-02',
    'Male',
    'edgar.delaunay@email.com',
    '0753344567',
    '20 Place République, Perpignan'
  ),
  (
    2,
    'Daphné',
    'Mallet',
    '2003-1-2',
    'Female',
    'daphne.mallet@email.com',
    '0763344567',
    '2 Avenue Dauphine, Orléans'
  ),
  (
    2,
    'Corentin',
    'Mendes',
    '2003-04-28',
    'Male',
    'corentin.mendes@email.com',
    '0773344567',
    '28 Rue Franklin, Mulhouse'
  ),
  (
    2,
    'Bianca',
    'Boulay',
    '2003-09-08',
    'Female',
    'bianca.boulay@email.com',
    '0783344567',
    '1 Boulevard de l\'Yser, Rouen'
  ),
(
  3,
  'Alice',
  'Smith',
  '2005-01-01',
  'Female',
  'alice.smith@email.com',
  '0611111111',
  '1 Rue Alpha, City A'
),
(
  3,
  'Bob',
  'Johnson',
  '2005-01-02',
  'Male',
  'bob.johnson@email.com',
  '0611111112',
  '2 Rue Beta, City B'
),
(
  3,
  'Charlie',
  'Williams',
  '2005-01-03',
  'Male',
  'charlie.williams@email.com',
  '0611111113',
  '3 Rue Gamma, City C'
),
(
  3,
  'David',
  'Brown',
  '2005-01-04',
  'Male',
  'david.brown@email.com',
  '0611111114',
  '3 Rue Delta, City D'
),
(
  3,
  'Eve',
  'Davis',
  '2005-01-05',
  'Female',
  'eve.davis@email.com',
  '0611111115',
  '2 Rue Epsilon, City E'
),
(
  3,
  'Frank',
  'Miller',
  '2005-01-06',
  'Male',
  'frank.miller@email.com',
  '0611111116',
  '1 Rue Zeta, City F'
),
(
  3,
  'Grace',
  'Wilson',
  '2005-01-07',
  'Female',
  'grace.wilson@email.com',
  '0611111117',
  '1 Rue Eta, City G'
),
(
  3,
  'Henry',
  'Moore',
  '2005-01-08',
  'Male',
  'henry.moore@email.com',
  '0611111118',
  '1 Rue Theta, City H'
),
(
  3,
  'Ivy',
  'Taylor',
  '2005-01-09',
  'Female',
  'ivy.taylor@email.com',
  '0611111119',
  '2 Rue Iota, City I'
),
(
  3,
  'Jack',
  'Anderson',
  '2005-01-1',
  'Male',
  'jack.anderson@email.com',
  '0611111120',
  '1 Rue Kappa, City J'
),
(
  3,
  'Kate',
  'Thomas',
  '2005-01-2',
  'Female',
  'kate.thomas@email.com',
  '0611111121',
  '2 Rue Lambda, City K'
),
(
  3,
  'Liam',
  'Jackson',
  '2005-01-3',
  'Male',
  'liam.jackson@email.com',
  '0611111122',
  '3 Rue Mu, City L'
),
(
  3,
  'Mia',
  'White',
  '2005-01-1',
  'Female',
  'mia.white@email.com',
  '0611111123',
  '1 Rue Nu, City M'
),
(
  3,
  'Noah',
  'Harris',
  '2005-01-2',
  'Male',
  'noah.harris@email.com',
  '0611111124',
  '2 Rue Xi, City N'
),
(
  3,
  'Olivia',
  'Martin',
  '2005-01-1',
  'Female',
  'olivia.martin@email.com',
  '0611111125',
  '1 Rue Omicron, City O'
),
(
  3,
  'Peter',
  'Thompson',
  '2005-01-16',
  'Male',
  'peter.thompson@email.com',
  '0611111126',
  '16 Rue Pi, City P'
),
(
  3,
  'Quinn',
  'Garcia',
  '2005-01-17',
  'Female',
  'quinn.garcia@email.com',
  '0611111127',
  '17 Rue Rho, City Q'
),
(
  3,
  'Ryan',
  'Martinez',
  '2005-01-18',
  'Male',
  'ryan.martinez@email.com',
  '0611111128',
  '18 Rue Sigma, City R'
),
(
  3,
  'Sophia',
  'Robinson',
  '2005-01-19',
  'Female',
  'sophia.robinson@email.com',
  '0611111129',
  '19 Rue Tau, City S'
),
(
  3,
  'Tyler',
  'Clark',
  '2005-01-20',
  'Male',
  'tyler.clark@email.com',
  '0611111130',
  '20 Rue Upsilon, City T'
),
(
  3,
  'Uma',
  'Rodriguez',
  '2005-01-21',
  'Female',
  'uma.rodriguez@email.com',
  '0611111131',
  '21 Rue Phi, City U'
),
(
  3,
  'Victor',
  'Lewis',
  '2005-01-22',
  'Male',
  'victor.lewis@email.com',
  '0611111132',
  '22 Rue Chi, City V'
),
(
  3,
  'Wendy',
  'Lee',
  '2005-01-23',
  'Female',
  'wendy.lee@email.com',
  '0611111133',
  '23 Rue Psi, City W'
),
(
  3,
  'Xavier',
  'Walker',
  '2005-01-24',
  'Male',
  'xavier.walker@email.com',
  '0611111134',
  '24 Rue Omega, City X'
),
(
  3,
  'Yara',
  'Hall',
  '2005-01-25',
  'Female',
  'yara.hall@email.com',
  '0611111135',
  '25 Rue AlphaPrime, City Y'
),
(
  3,
  'Zane',
  'Allen',
  '2005-01-26',
  'Male',
  'zane.allen@email.com',
  '0611111136',
  '26 Rue BetaPrime, City Z'
),
(
  3,
  'Aria',
  'Young',
  '2005-01-27',
  'Female',
  'aria.young@email.com',
  '0611111137',
  '27 Rue GammaPrime, City A'
),
(
  3,
  'Ben',
  'Hernandez',
  '2005-01-28',
  'Male',
  'ben.hernandez@email.com',
  '0611111138',
  '28 Rue DeltaPrime, City B'
),
(
  3,
  'Chloe',
  'King',
  '2005-01-29',
  'Female',
  'chloe.king@email.com',
  '0611111139',
  '29 Rue EpsilonPrime, City C'
),
(
  3,
  'Daniel',
  'Wright',
  '2005-01-30',
  'Male',
  'daniel.wright@email.com',
  '0611111140',
  '30 Rue ZetaPrime, City D'
),
(
  3,
  'Ella',
  'Lopez',
  '2005-01-31',
  'Female',
  'ella.lopez@email.com',
  '0611111141',
  '31 Rue EtaPrime, City E'
),
(
  3,
  'Finn',
  'Hill',
  '2005-02-01',
  'Male',
  'finn.hill@email.com',
  '0611111142',
  '32 Rue ThetaPrime, City F'
),
(
  3,
  'Gemma',
  'Scott',
  '2005-02-02',
  'Female',
  'gemma.scott@email.com',
  '0611111143',
  '33 Rue IotaPrime, City G'
),
(
  3,
  'Hugo',
  'Green',
  '2005-02-03',
  'Male',
  'hugo.green@email.com',
  '0611111144',
  '34 Rue KappaPrime, City H'
),
(
  3,
  'Isla',
  'Adams',
  '2005-02-04',
  'Female',
  'isla.adams@email.com',
  '0611111145',
  '35 Rue LambdaPrime, City I'
),
(
  3,
  'Jasper',
  'Baker',
  '2005-02-05',
  'Male',
  'jasper.baker@email.com',
  '0611111146',
  '36 Rue MuPrime, City J'
),
(
  3,
  'Kira',
  'Gonzalez',
  '2005-02-06',
  'Female',
  'kira.gonzalez@email.com',
  '0611111147',
  '37 Rue NuPrime, City K'
),
(
  3,
  'Leo',
  'Nelson',
  '2005-02-07',
  'Male',
  'leo.nelson@email.com',
  '0611111148',
  '38 Rue XiPrime, City L'
),
(
  3,
  'Luna',
  'Carter',
  '2005-02-08',
  'Female',
  'luna.carter@email.com',
  '0611111149',
  '39 Rue OmicronPrime, City M'
),
(
  3,
  'Milo',
  'Mitchell',
  '2005-02-09',
  'Male',
  'milo.mitchell@email.com',
  '0611111150',
  '40 Rue PiPrime, City N'
),
(
  3,
  'Nora',
  'Perez',
  '2005-02-1',
  'Female',
  'nora.perez@email.com',
  '0611111151',
  '41 Rue RhoPrime, City O'
),
(
  3,
  'Owen',
  'Roberts',
  '2005-02-2',
  'Male',
  'owen.roberts@email.com',
  '0611111152',
  '42 Rue SigmaPrime, City P'
),
(
  3,
  'Penelope',
  'Turner',
  '2005-02-3',
  'Female',
  'penelope.turner@email.com',
  '0611111153',
  '43 Rue TauPrime, City Q'
),
(
  3,
  'Quentin',
  'Phillips',
  '2005-02-1',
  'Male',
  'quentin.phillips@email.com',
  '0611111154',
  '44 Rue UpsilonPrime, City R'
),
(
  3,
  'Riley',
  'Campbell',
  '2005-02-2',
  'Female',
  'riley.campbell@email.com',
  '0611111155',
  '45 Rue PhiPrime, City S'
),
(
  3,
  'Sebastian',
  'Parker',
  '2005-02-1',
  'Male',
  'sebastian.parker@email.com',
  '0611111156',
  '46 Rue ChiPrime, City T'
),
(
  3,
  'Stella',
  'Evans',
  '2005-02-16',
  'Female',
  'stella.evans@email.com',
  '0611111157',
  '47 Rue PsiPrime, City U'
),
(
  3,
  'Theodore',
  'Edwards',
  '2005-02-17',
  'Male',
  'theodore.edwards@email.com',
  '0611111158',
  '48 Rue OmegaPrime, City V'
),
(
  3,
  'Violet',
  'Collins',
  '2005-02-18',
  'Female',
  'violet.collins@email.com',
  '0611111159',
  '49 Rue AlphaDouble, City W'
),
(
  3,
  'William',
  'Stewart',
  '2005-02-19',
  'Male',
  'william.stewart@email.com',
  '0611111160',
  '50 Rue BetaDouble, City X'
),
(
  3,
  'Willow',
  'Sanchez',
  '2005-02-20',
  'Female',
  'willow.sanchez@email.com',
  '0611111161',
  '51 Rue GammaDouble, City Y'
),
(
  3,
  'Xander',
  'Morris',
  '2005-02-21',
  'Male',
  'xander.morris@email.com',
  '0611111162',
  '52 Rue DeltaDouble, City Z'
),
(
  3,
  'Yasmine',
  'Rogers',
  '2005-02-22',
  'Female',
  'yasmine.rogers@email.com',
  '0611111163',
  '53 Rue EpsilonDouble, City A'
),
(
  3,
  'Zachary',
  'Reed',
  '2005-02-23',
  'Male',
  'zachary.reed@email.com',
  '0611111164',
  '54 Rue ZetaDouble, City B'
),
(
  3,
  'Zara',
  'Cook',
  '2005-02-24',
  'Female',
  'zara.cook@email.com',
  '0611111165',
  '55 Rue EtaDouble, City C'
),
(
  3,
  'Abel',
  'Morgan',
  '2005-02-25',
  'Male',
  'abel.morgan@email.com',
  '0611111166',
  '56 Rue ThetaDouble, City D'
),
(
  3,
  'Brianna',
  'Bell',
  '2005-02-26',
  'Female',
  'brianna.bell@email.com',
  '0611111167',
  '57 Rue IotaDouble, City E'
),
(
  3,
  'Caleb',
  'Murphy',
  '2005-02-27',
  'Male',
  'caleb.murphy@email.com',
  '0611111168',
  '58 Rue KappaDouble, City F'
),
(
  3,
  'Daisy',
  'Bailey',
  '2005-02-28',
  'Female',
  'daisy.bailey@email.com',
  '0611111169',
  '59 Rue LambdaDouble, City G'
),
(
  3,
  'Elijah',
  'Rivera',
  '2005-03-01',
  'Male',
  'elijah.rivera@email.com',
  '0611111170',
  '60 Rue MuDouble, City H'
),
(
  3,
  'Freya',
  'Cooper',
  '2005-03-02',
  'Female',
  'freya.cooper@email.com',
  '0611111171',
  '61 Rue NuDouble, City I'
),
(
  3,
  'Gideon',
  'Richardson',
  '2005-03-03',
  'Male',
  'gideon.richardson@email.com',
  '0611111172',
  '62 Rue XiDouble, City J'
),
(
  3,
  'Hazel',
  'Howard',
  '2005-03-04',
  'Female',
  'hazel.howard@email.com',
  '0611111173',
  '63 Rue OmicronDouble, City K'
),
(
  3,
  'Ian',
  'Ward',
  '2005-03-05',
  'Male',
  'ian.ward@email.com',
  '0611111174',
  '64 Rue PiDouble, City L'
),
(
  3,
  'Jocelyn',
  'Cox',
  '2005-03-06',
  'Female',
  'jocelyn.cox@email.com',
  '0611111175',
  '65 Rue RhoDouble, City M'
),
(
  3,
  'Kellan',
  'Gray',
  '2005-03-07',
  'Male',
  'kellan.gray@email.com',
  '0611111176',
  '66 Rue SigmaDouble, City N'
),
(
  3,
  'Kiana',
  'James',
  '2005-03-08',
  'Female',
  'kiana.james@email.com',
  '0611111177',
  '67 Rue TauDouble, City O'
),
(
  3,
  'Landen',
  'Bennett',
  '2005-03-09',
  'Male',
  'landen.bennett@email.com',
  '0611111178',
  '68 Rue UpsilonDouble, City P'
),
(
  3,
  'Liana',
  'Wood',
  '2005-03-1',
  'Female',
  'liana.wood@email.com',
  '0611111179',
  '68 Rue UpsilonDouble Saint-Michel, Paris'
),
(
  1,
  'Emma',
  'Martin',
  '2007-05-21',
  'Female',
  'emma.martin@email.com',
  '06 23 45 67 89',
  '27 Avenue des Champs-Élysées, Paris'
),
(
  1,
  'Lucas',
  'Bernardsd',
  '2007-02-1',
  'Male',
  'lucas.bernardds@email.com',
  '06 34 56 78 90',
  '1 Boulevard Saint-Michel, Paris'
),
(
  1,
  'Chloé',
  'Petit',
  '2007-08-03',
  'Female',
  'chloe.petit@email.com',
  '06 45 67 89 01',
  '42 Rue de Rivoli, Paris'
),
(
  1,
  'Jules',
  'Moreau',
  '2007-04-27',
  'Male',
  'jules.moreau@email.com',
  '06 56 78 90 3',
  '16 Rue de la Paix, Paris'
),
(
  1,
  'Léa',
  'Durand',
  '2007-2-09',
  'Female',
  'lea.durand@email.com',
  '06 67 89 01 23',
  '33 Avenue Montaigne, Paris'
),
(
  1,
  'Hugo',
  'Leroy',
  '2007-07-2',
  'Male',
  'hugo.leroy@email.com',
  '06 78 90 3 34',
  '2 Rue du Faubourg Saint-Honoré, Paris'
),
(
  1,
  'Manon',
  'Roux',
  '2007-09-22',
  'Female',
  'manon.roux@email.com',
  '06 89 01 23 45',
  '19 Quai de la Tournelle, Paris'
),
(
  1,
  'Gabriel',
  'Vincent',
  '2007-06-18',
  'Male',
  'gabriel.vincent@email.com',
  '06 90 3 34 56',
  '28 Avenue de l\'Opéra, Paris'
),
(
  1,
  'Camille',
  'Simon',
  '2007-01-30',
  'Female',
  'camille.simon@email.com',
  '06 01 23 45 67',
  '2 Boulevard Haussmann, Paris'
),
(
  1,
  'Louis',
  'Girard',
  '2007-1-3',
  'Male',
  'louis.girard@email.com',
  '06 3 35 47 68',
  '1 Rue Mouffetard, Paris'
),
(
  1,
  'Zoé',
  'Lefèvre',
  '2007-3-05',
  'Female',
  'zoe.lefevre@email.com',
  '06 23 45 68 79',
  '31 Avenue Georges V, Paris'
),
(
  1,
  'Adam',
  'Mercier',
  '2007-02-28',
  'Male',
  'adam.mercier@email.com',
  '06 34 56 79 80',
  '2 Rue de Buci, Paris'
),
(
  1,
  'Inès',
  'Blanc',
  '2007-07-31',
  'Female',
  'ines.blanc@email.com',
  '06 45 67 80 91',
  '25 Rue de Sèvres, Paris'
),
(
  1,
  'Raphaël',
  'Rousseau',
  '2007-05-09',
  'Male',
  'raphael.rousseau@email.com',
  '06 56 78 91 02',
  '2 Boulevard Saint-Germain, Paris'
),
(
  1,
  'Louise',
  'Legrand',
  '2007-08-24',
  'Female',
  'louise.legrand@email.com',
  '06 67 89 02 1',
  '37 Avenue Victor Hugo, Paris'
),
(
  1,
  'Théo',
  'Fontaine',
  '2007-04-16',
  'Male',
  'theo.fontaine@email.com',
  '06 78 90 1 24',
  '22 Rue Cler, Paris'
),
(
  1,
  'Jade',
  'Bertrand',
  '2007-2-26',
  'Female',
  'jade.bertrand@email.com',
  '06 89 01 24 35',
  '41 Rue Saint-Honoré, Paris'
),
(
  1,
  'Nathan',
  'Morel',
  '2007-01-07',
  'Male',
  'nathan.morel@email.com',
  '06 90 3 35 46',
  '1 Avenue Foch, Paris'
),
(
  1,
  'Sarah',
  'Garnier',
  '2007-06-29',
  'Female',
  'sarah.garnier@email.com',
  '06 01 23 46 57',
  '29 Boulevard Raspail, Paris'
),
(
  1,
  'Ethan',
  'Faure',
  '2007-1-03',
  'Male',
  'ethan.faure@email.com',
  '06 3 35 58 69',
  '1 Rue du Bac, Paris'
),
(
  1,
  'Charlotte',
  'André',
  '2007-03-25',
  'Female',
  'charlotte.andre@email.com',
  '06 23 46 59 70',
  '35 Place des Vosges, Paris'
),
(
  1,
  'Mathis',
  'Bonnet',
  '2007-09-2',
  'Male',
  'mathis.bonnet@email.com',
  '06 34 57 60 81',
  '18 Rue de l\'Université, Paris'
),
(
  1,
  'Lina',
  'Chevalier',
  '2007-3-18',
  'Female',
  'lina.chevalier@email.com',
  '06 45 68 71 92',
  '24 Avenue Matignon, Paris'
),
(
  1,
  'Antoine',
  'Perrin',
  '2007-05-31',
  'Male',
  'antoine.perrin@email.com',
  '06 56 79 82 03',
  '1 Rue des Rosiers, Paris'
),
(
  1,
  'Juliette',
  'Clément',
  '2007-02-22',
  'Female',
  'juliette.clement@email.com',
  '06 67 80 93 2',
  '39 Boulevard de la Madeleine, Paris'
),
(
  2,
  'Maxime',
  'Gauthier',
  '2006-04-2',
  'Male',
  'maxime.gauthier@email.com',
  '06 23 58 47 69',
  '3 Rue Oberkampf, Lyon'
),
(
  2,
  'Alice',
  'Duval',
  '2006-07-25',
  'Female',
  'alice.duval@email.com',
  '06 34 69 58 70',
  '23 Avenue Jean Jaurès, Lyon'
),
(
  2,
  'Victor',
  'Richard',
  '2006-01-19',
  'Male',
  'victor.richard@email.com',
  '06 45 70 69 81',
  '2 Rue Mercière, Lyon'
),
(
  2,
  'Clara',
  'Robert',
  '2006-09-08',
  'Female',
  'clara.robert@email.com',
  '06 56 81 70 92',
  '34 Cours Lafayette, Lyon'
),
(
  2,
  'Arthur',
  'Laurent',
  '2006-06-03',
  'Male',
  'arthur.laurent@email.com',
  '06 67 92 81 03',
  '17 Rue de la République, Lyon'
),
(
  2,
  'Léna',
  'Michel',
  '2006-2-1',
  'Female',
  'lena.michel@email.com',
  '06 78 03 92 2',
  '29 Place Bellecour, Lyon'
),
(
  2,
  'Paul',
  'David',
  '2006-03-29',
  'Male',
  'paul.david@email.com',
  '06 89 2 03 25',
  '1 Rue Victor Hugo, Lyon'
),
(
  2,
  'Eva',
  'Bertrand',
  '2006-08-17',
  'Female',
  'eva.bertrand@email.com',
  '06 90 25 2 36',
  '41 Avenue du Maréchal de Saxe, Lyon'
),
(
  2,
  'Quentin',
  'Lambert',
  '2006-05-22',
  'Male',
  'quentin.lambert@email.com',
  '06 01 36 25 47',
  '2 Rue des Capucins, Lyon'
),
(
  2,
  'Lucie',
  'Giraud',
  '2006-02-09',
  'Female',
  'lucie.giraud@email.com',
  '06 3 47 36 58',
  '26 Rue Auguste Comte, Lyon'
),
(
  2,
  'Alexandre',
  'Bonnet',
  '2006-1-31',
  'Male',
  'alexandre.bonnet@email.com',
  '06 23 58 47 69',
  '1 Place des Terreaux, Lyon'
),
(
  2,
  'Margaux',
  'Roussel',
  '2006-3-2',
  'Female',
  'margaux.roussel@email.com',
  '06 34 69 58 70',
  '32 Rue Sala, Lyon'
),
(
  2,
  'Romain',
  'Dufour',
  '2006-04-06',
  'Male',
  'romain.dufour@email.com',
  '06 45 70 69 81',
  '19 Avenue Berthelot, Lyon'
),
(
  2,
  'Mathilde',
  'Guerin',
  '2006-07-18',
  'Female',
  'mathilde.guerin@email.com',
  '06 56 81 70 92',
  '33 Cours Gambetta, Lyon'
),
(
  2,
  'Tom',
  'Dupuis',
  '2006-01-28',
  'Male',
  'tom.dupuis@email.com',
  '06 67 92 81 03',
  '1 Rue Édouard Herriot, Lyon'
),
(
  2,
  'Romane',
  'Lemaire',
  '2006-09-1',
  'Female',
  'romane.lemaire@email.com',
  '06 78 03 92 2',
  '25 Rue Tupin, Lyon'
),
(
  2,
  'Nolan',
  'Henry',
  '2006-06-27',
  'Male',
  'nolan.henry@email.com',
  '06 89 2 03 25',
  '1 Quai Saint-Antoine, Lyon'
),
(
  2,
  'Océane',
  'Morin',
  '2006-2-04',
  'Female',
  'oceane.morin@email.com',
  '06 90 25 2 36',
  '38 Avenue des Frères Lumière, Lyon'
),
(
  2,
  'Enzo',
  'Nicolas',
  '2006-03-19',
  'Male',
  'enzo.nicolas@email.com',
  '06 01 36 25 47',
  '21 Rue Hippolyte Flandrin, Lyon'
),
(
  2,
  'Ambre',
  'Mercier',
  '2006-08-06',
  'Female',
  'ambre.mercier@email.com',
  '06 3 47 36 58',
  '36 Place Carnot, Lyon'
),
(
  2,
  'Valentin',
  'Perrot',
  '2006-05-3',
  'Male',
  'valentin.perrot@email.com',
  '06 23 58 47 69',
  '1 Rue Grenette, Lyon'
),
(
  2,
  'Lola',
  'Rey',
  '2006-02-25',
  'Female',
  'lola.rey@email.com',
  '06 34 69 58 70',
  '27 Rue de Marseille, Lyon'
),
(
  2,
  'Julien',
  'Fournier',
  '2006-1-21',
  'Male',
  'julien.fournier@email.com',
  '06 45 70 69 81',
  '2 Avenue Jean Mermoz, Lyon'
),
(
  2,
  'Maëlys',
  'Colin',
  '2006-3-07',
  'Female',
  'maelys.colin@email.com',
  '06 56 81 70 92',
  '44 Cours Charlemagne, Lyon'
),
(
  2,
  'Sacha',
  'Vidal',
  '2006-04-30',
  'Male',
  'sacha.vidal@email.com',
  '06 67 92 81 03',
  '18 Rue Gasparin, Lyon'
),
(
  2,
  'Lilou',
  'Caron',
  '2006-07-23',
  'Female',
  'lilou.caron@email.com',
  '06 78 03 92 2',
  '31 Rue Garibaldi, Lyon'
),
(
  1,
  'Alexis',
  'Fabre',
  '2005-02-2',
  'Male',
  'alexis.fabre@email.com',
  '06 34 76 59 81',
  '22 Boulevard Carnot, Marseille'
),
(
  1,
  'Chloé',
  'Faure',
  '2005-05-08',
  'Female',
  'chloe.faure@email.com',
  '06 45 87 60 92',
  '1 Rue Paradis, Marseille'
),
(
  1,
  'Mathéo',
  'Lecomte',
  '2005-1-27',
  'Male',
  'matheo.lecomte@email.com',
  '06 56 98 71 03',
  '35 Cours Julien, Marseille'
),
(
  1,
  'Louna',
  'Philippe',
  '2005-03-19',
  'Female',
  'louna.philippe@email.com',
  '06 67 09 82 2',
  '2 Boulevard de la Liberté, Marseille'
),
(
  1,
  'Evan',
  'Aubert',
  '2005-08-01',
  'Male',
  'evan.aubert@email.com',
  '06 78 1 93 25',
  '26 Rue Longue des Capucins, Marseille'
),
(
  1,
  'Anaïs',
  'Boyer',
  '2005-2-23',
  'Female',
  'anais.boyer@email.com',
  '06 89 21 04 36',
  '2 Quai des Belges, Marseille'
),
(
  1,
  'Noah',
  'Marchand',
  '2005-04-1',
  'Male',
  'noah.marchand@email.com',
  '06 90 32 1 47',
  '33 Rue de Rome, Marseille'
),
(
  1,
  'Maëlle',
  'Blanc',
  '2005-01-29',
  'Female',
  'maelle.blanc@email.com',
  '06 01 43 26 58',
  '18 Avenue du Prado, Marseille'
),
(
  1,
  'Axel',
  'Hubert',
  '2005-07-3',
  'Male',
  'axel.hubert@email.com',
  '06 3 54 37 69',
  '27 Boulevard Baille, Marseille'
),
(
  1,
  'Léonie',
  'Rousseau',
  '2005-09-04',
  'Female',
  'leonie.rousseau@email.com',
  '06 23 65 48 70',
  '2 Rue Sainte, Marseille'
),
(
  1,
  'Nodsé',
  'Pierre',
  '2005-3-18',
  'Male',
  'noe.pierrdse@email.com',
  '06 34 76 59 81',
  '40 Rue de la République, Marseille'
),
(
  1,
  'Lou',
  'Leclerc',
  '2005-06-06',
  'Female',
  'lou.leclerc@email.com',
  '06 45 87 60 92',
  '23 Cours Pierre Puget, Marseille'
),
(
  1,
  'Esteban',
  'Rolland',
  '2005-02-24',
  'Male',
  'esteban.rolland@email.com',
  '06 56 98 71 03',
  '1 Rue Saint-Ferréol, Marseille'
),
(
  1,
  'Mia',
  'Legros',
  '2005-05-16',
  'Female',
  'mia.legros@email.com',
  '06 67 09 82 2',
  '28 Rue Breteuil, Marseille'
),
(
  1,
  'Timéo',
  'Gaillard',
  '2005-1-09',
  'Male',
  'timeo.gaillard@email.com',
  '06 78 1 93 25',
  '1 Boulevard Garibaldi, Marseille'
),
(
  1,
  'Anna',
  'Leclercq',
  '2005-03-31',
  'Female',
  'anna.leclercq@email.com',
  '06 89 21 04 36',
  '36 Rue d\'Endoume, Marseille'
),
(
  1,
  'Noa',
  'Brun',
  '2005-08-22',
  'Male',
  'noa.brun@email.com',
  '06 90 32 1 47',
  '19 Place aux Huiles, Marseille'
),
(
  1,
  'Louane',
  'Picard',
  '2005-2-2',
  'Female',
  'louane.picard@email.com',
  '06 01 43 26 58',
  '31 Boulevard Longchamp, Marseille'
),
(
  1,
  'Clément',
  'Dubois',
  '2005-04-03',
  'Male',
  'clement.dubois@email.com',
  '06 3 54 37 69',
  '1 Rue de la Canebière, Marseille'
),
(
  1,
  'Éloïse',
  'Lemoine',
  '2005-01-17',
  'Female',
  'eloise.lemoine@email.com',
  '06 23 65 48 70',
  '25 Cours Lieutaud, Marseille'
),
(
  1,
  'Robin',
  'Maréchal',
  '2005-07-28',
  'Male',
  'robin.marechal@email.com',
  '06 34 76 59 81',
  '1 Rue Fort Notre-Dame, Marseille'
),
(
  1,
  'Agathe',
  'Renard',
  '2005-09-20',
  'Female',
  'agathe.renard@email.com',
  '06 45 87 60 92',
  '42 Boulevard des Dames, Marseille'
),
(
  1,
  'Samuel',
  'Cousin',
  '2005-3-02',
  'Male',
  'samuel.cousin@email.com',
  '06 56 98 71 03',
  '17 Rue Grignan, Marseille'
),
(
  1,
  'Jeanne',
  'Schneider',
  '2005-06-18',
  'Female',
  'jeanne.schneider@email.com',
  '06 67 09 82 2',
  '29 Place Jean Jaurès, Marseille'
),
(
  1,
  'Tristan',
  'Collet',
  '2005-02-08',
  'Male',
  'tristan.collet@email.com',
  '06 78 1 93 25',
  '21 Rue Montgrand, Marseille'
),
(
  1,
  'Éva',
  'Lefevre',
  '2005-05-25',
  'Female',
  'eva.lefevre@email.com',
  '06 89 21 04 36',
  '38 Boulevard Notre-Dame, Marseille'
);
