ALTER TABLE festival
ADD CONSTRAINT chk_festival_dates CHECK (fes_date_fin >= fes_date_debut);

ALTER TABLE creneau
ADD CONSTRAINT chk_creneau_dates CHECK (crn_date_heure_fin > crn_date_heure_debut);

ALTER TABLE scene
ADD CONSTRAINT chk_scene_capacite CHECK (scn_capacite > 0);

ALTER TABLE billet
ADD CONSTRAINT chk_billet_prix CHECK (blt_prix >= 0);

ALTER TABLE commande
ADD CONSTRAINT chk_commande_montant CHECK (cmd_montant_total >= 0);

ALTER TABLE festivalier
ADD CONSTRAINT chk_festivalier_email CHECK (fesv_email LIKE '%@%');

ALTER TABLE billet
ADD CONSTRAINT chk_billet_type CHECK (blt_type IN ('1 Jour', 'Pass 2 Jours', 'Pass 3 Jours', 'VIP'));

ALTER TABLE staff
ADD CONSTRAINT chk_staff_role CHECK (stff_role IN ('Sécurité', 'Technique', 'Accueil', 'Buvette', 'Direction'));