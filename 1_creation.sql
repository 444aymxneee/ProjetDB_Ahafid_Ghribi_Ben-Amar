CREATE TABLE artist(
   art_id INT,
   art_pseudo VARCHAR(100),
   art_pays VARCHAR(100),
   art_date_creation DATE,
   PRIMARY KEY(art_id)
);

CREATE TABLE groupe(
   grp_id INT,
   grp_nom VARCHAR(100),
   grp_date_creation DATE,
   PRIMARY KEY(grp_id)
);

CREATE TABLE style(
   sty_id INT,
   sty_libelle VARCHAR(100),
   PRIMARY KEY(sty_id)
);

CREATE TABLE festival(
   fes_id INT,
   fes_nom VARCHAR(150),
   fes_date_debut DATE,
   fes_date_fin DATE,
   fes_lieu VARCHAR(150),
   PRIMARY KEY(fes_id)
);

CREATE TABLE scene(
   scn_id INT,
   scn_nom VARCHAR(100),
   scn_capacite INT,
   fes_id INT NOT NULL,
   PRIMARY KEY(scn_id),
   FOREIGN KEY(fes_id) REFERENCES festival(fes_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE creneau(
   crn_id INT,
   crn_date_heure_debut DATETIME,
   crn_date_heure_fin DATETIME,
   PRIMARY KEY(crn_id)
);

CREATE TABLE staff(
   stff_id INT,
   stff_nom VARCHAR(100),
   stff_prenom VARCHAR(100),
   stff_role VARCHAR(100),
   stff_sup_id INT,
   PRIMARY KEY(stff_id),
   FOREIGN KEY(stff_sup_id) REFERENCES staff(stff_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE festivalier(
   fesv_id INT,
   fesv_nom VARCHAR(100),
   fesv_prenom VARCHAR(100),
   fesv_email VARCHAR(150),
   PRIMARY KEY(fesv_id)
);

CREATE TABLE commande(
   cmd_id INT,
   cmd_date DATETIME,
   cmd_montant_total DECIMAL(10,2),
   fesv_id INT NOT NULL,
   PRIMARY KEY(cmd_id),
   FOREIGN KEY(fesv_id) REFERENCES festivalier(fesv_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE billet(
   cmd_id INT,
   blt_num INT,
   blt_prix DECIMAL(10,2),
   blt_type VARCHAR(50),
   PRIMARY KEY(cmd_id, blt_num),
   FOREIGN KEY(cmd_id) REFERENCES commande(cmd_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE possede(
   art_id INT,
   sty_id INT,
   PRIMARY KEY(art_id, sty_id),
   FOREIGN KEY(art_id) REFERENCES artist(art_id) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(sty_id) REFERENCES style(sty_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE appartient(
   art_id INT,
   grp_id INT,
   PRIMARY KEY(art_id, grp_id),
   FOREIGN KEY(art_id) REFERENCES artist(art_id) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(grp_id) REFERENCES groupe(grp_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE programmation(
   art_id INT,
   scn_id INT,
   crn_id INT,
   PRIMARY KEY(art_id, scn_id, crn_id),
   FOREIGN KEY(art_id) REFERENCES artist(art_id) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(scn_id) REFERENCES scene(scn_id) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(crn_id) REFERENCES creneau(crn_id) ON DELETE CASCADE ON UPDATE CASCADE
);