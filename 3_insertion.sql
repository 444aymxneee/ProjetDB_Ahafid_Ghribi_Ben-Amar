INSERT INTO artist (art_id, art_pseudo, art_pays, art_date_creation) VALUES
(5, 'Bad Bunny', 'Puerto Rico', '2016-01-01'),
(6, 'ElGrandeToto', 'Maroc', '2017-01-01'),
(7, 'Samara', 'Tunisie', '2018-01-01'),
(8, 'Travis Scott', 'USA', '2012-01-01'),
(9, 'Maes', 'France', '2017-01-01'),
(10, 'PNL', 'France', '2014-01-01'),
(11, 'Niska', 'France', '2015-10-02'),
(12, 'Ninho', 'France', '2013-01-01');

INSERT INTO groupe (grp_id, grp_nom, grp_date_creation) VALUES
(1, 'Daft Punk', '1993-01-01'),
(2, 'Justice', '2003-01-01');
(3, 'No Group', '2000-01-01');

INSERT INTO style (sty_id, sty_libelle) VALUES
(1, 'Electro'),
(2, 'Pop'),
(3, 'House'),
(4, 'Rap');

INSERT INTO festival (fes_id, fes_nom, fes_date_debut, fes_date_fin, fes_lieu) VALUES
(1, 'ElectroBeach', '2026-07-10', '2026-07-12', 'Port-Barcarès'),
(2, 'Pop in Paris', '2026-08-15', '2026-08-16', 'Paris');

INSERT INTO creneau (crn_id, crn_date_heure_debut, crn_date_heure_fin) VALUES
(1, '2026-07-10 18:00:00', '2026-07-10 19:00:00'),
(2, '2026-07-10 19:30:00', '2026-07-10 20:30:00'),
(3, '2026-07-10 21:00:00', '2026-07-10 22:00:00'),
(4, '2026-07-10 22:30:00', '2026-07-10 23:30:00'),
(5, '2026-08-15 19:00:00', '2026-08-15 20:00:00'),
(6, '2026-08-15 20:30:00', '2026-08-15 21:30:00');

INSERT INTO festivalier (fesv_id, fesv_nom, fesv_prenom, fesv_email) VALUES
(1, 'Lefevre', 'Marie', 'marie.lefevre@email.com'),
(2, 'Bernard', 'Luc', 'luc.bernard@email.com'),
(3, 'Dupont', 'Alice', 'alice.d@email.com');

INSERT INTO scene (scn_id, scn_nom, scn_capacite, fes_id) VALUES
(1, 'Main Stage', 50000, 1),
(2, 'Club Stage', 10000, 1),
(3, 'Les Planches Scène', 30000, 2);

INSERT INTO staff (stff_id, stff_nom, stff_prenom, stff_role, stff_sup_id) VALUES
(1, 'Martin', 'Sophie', 'Direction', NULL),
(2, 'Dubois', 'Jean', 'Sécurité', 1),
(3, 'Leroy', 'Marc', 'Technique', 1),
(4, 'Moreau', 'Julie', 'Buvette', 1);

INSERT INTO commande (cmd_id, cmd_date, cmd_montant_total, fesv_id) VALUES
(1, '2026-05-01 10:00:00', 150.00, 1),
(2, '2026-05-02 14:30:00', 300.00, 2),
(3, '2026-06-15 09:00:00', 80.00, 3);

INSERT INTO billet (cmd_id, blt_num, blt_prix, blt_type) VALUES
(1, 1, 150.00, 'Pass 3 Jours'),
(2, 1, 150.00, 'Pass 3 Jours'),
(2, 2, 150.00, 'Pass 3 Jours'),
(3, 1, 80.00, '1 Jour');

INSERT INTO possede (art_id, sty_id) VALUES
(5, 2),
(6, 4),
(7, 2),
(8, 3),
(9, 4),
(10, 4);

INSERT INTO appartient (art_id, grp_id) VALUES
(1, 1),
(3, 2);

INSERT INTO programmation (art_id, scn_id, crn_id) VALUES
(5, 1, 1),
(6, 2, 2),
(7, 2, 3),
(8, 1, 4),
(9, 3, 5),
(10, 3, 6);