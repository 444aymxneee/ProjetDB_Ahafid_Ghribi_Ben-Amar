-- Afficher la liste unique des pays d'origine de tous les artistes, triée par ordre alphabétique.
SELECT DISTINCT art_pays 
FROM artist 
ORDER BY art_pays ASC;

-- Afficher la liste des artistes par scène
SELECT a.art_pseudo AS Nom_Artiste, s.scn_nom AS Nom_Scene
FROM artist a
JOIN programmation p ON a.art_id = p.art_id
JOIN scene s ON p.scn_id = s.scn_id;

-- Trouver tous les festivals qui se déroulent pendant la saison estivale 2026.
SELECT fes_nom, fes_date_debut, fes_date_fin, fes_lieu 
FROM festival 
WHERE fes_date_debut BETWEEN '2026-06-01' AND '2026-08-31';

-- Lister les membres du staff qui sont assignés à des postes critiques nécessitant une présence sur le terrain.
SELECT stff_nom, stff_prenom, stff_role 
FROM staff 
WHERE stff_role IN ('Sécurité', 'Technique');

-- Rechercher les artistes dont le pseudonyme commence par 'P' ou contient 'Toto'.
SELECT art_id, art_pseudo 
FROM artist 
WHERE art_pseudo LIKE 'P%' OR art_pseudo LIKE '%Toto%';

-- Afficher l'historique des commandes triées par montant décroissant pour identifier les plus gros achats.
SELECT cmd_id, cmd_date, cmd_montant_total 
FROM commande 
ORDER BY cmd_montant_total DESC;

-- Calculer le nombre total de billets vendus par type de billet (pour les types ayant vendu plus d'un billet).
SELECT blt_type, COUNT(*) AS nombre_de_billets 
FROM billet 
GROUP BY blt_type 
HAVING COUNT(*) > 1;

-- Calculer la somme totale générée par chaque festivalier (pour ceux ayant dépensé plus de 100€).
SELECT fesv_id, SUM(cmd_montant_total) AS total_depense 
FROM commande 
GROUP BY fesv_id 
HAVING SUM(cmd_montant_total) > 100.00;


-- Affiche le nombre total de billets vendus en les séparant par catégorie (ex: Pass 3 Jours, Pass 1 Jour).
SELECT blt_type AS Type_De_Pass, COUNT(*) AS Nombre_Total_Vendus
FROM billet
GROUP BY blt_type;

-- Obtenir la capacité totale des scènes pour chaque festival (seulement pour les festivals de plus de 20 000 places).
SELECT fes_id, SUM(scn_capacite) AS capacite_globale 
FROM scene 
GROUP BY fes_id 
HAVING SUM(scn_capacite) > 20000;

-- Compter le nombre d'artistes par pays d'origine (en excluant les pays n'ayant qu'un seul représentant).
SELECT art_pays, COUNT(art_id) AS nombre_artistes 
FROM artist 
GROUP BY art_pays 
HAVING COUNT(art_id) > 1;

-- Trouver le prix moyen des billets par type (uniquement les types dont le prix moyen dépasse 50€).
SELECT blt_type, AVG(blt_prix) AS prix_moyen 
FROM billet 
GROUP BY blt_type 
HAVING AVG(blt_prix) > 50.00;

-- Lister tous les artistes avec les styles musicaux qui leur sont associés.
SELECT a.art_pseudo, s.sty_libelle 
FROM artist a 
JOIN possede p ON a.art_id = p.art_id 
JOIN style s ON p.sty_id = s.sty_id;

-- Afficher la liste des artistes du catalogue dont l'identifiant n'est assigné à aucune programmation (artistes non bookés).
SELECT art_pseudo AS Artiste_Dispo, art_pays AS Pays
FROM artist
WHERE art_id NOT IN (SELECT art_id FROM programmation);

-- Afficher les noms des scènes avec le nom du festival auquel elles appartiennent.
SELECT f.fes_nom, sc.scn_nom, sc.scn_capacite 
FROM festival f 
JOIN scene sc ON f.fes_id = sc.fes_id;

-- Afficher la hiérarchie du staff en associant chaque membre à son superviseur direct.
SELECT employe.stff_nom AS Nom_Employe, employe.stff_role AS Role, chef.stff_nom AS Nom_Superviseur 
FROM staff employe 
LEFT JOIN staff chef ON employe.stff_sup_id = chef.stff_id;

-- Lister tous les festivaliers inscrits et le numéro de leurs commandes s'ils en ont passé.
SELECT fv.fesv_nom, fv.fesv_prenom, c.cmd_id, c.cmd_montant_total 
FROM festivalier fv 
LEFT JOIN commande c ON fv.fesv_id = c.fesv_id;

-- Obtenir la programmation complète détaillant le nom de l'artiste, la scène et les horaires.
SELECT a.art_pseudo, sc.scn_nom, cr.crn_date_heure_debut, cr.crn_date_heure_fin 
FROM programmation p 
JOIN artist a ON p.art_id = a.art_id 
JOIN scene sc ON p.scn_id = sc.scn_id 
JOIN creneau cr ON p.crn_id = cr.crn_id;

-- Trouver la ou les scènes qui ont la plus grande capacité d'accueil de la base de données.
SELECT scn_nom, scn_capacite 
FROM scene 
WHERE scn_capacite >= ALL (SELECT scn_capacite FROM scene);

-- Trouver les artistes qui ne sont actuellement affectés à aucune programmation de festival.
SELECT art_pseudo, art_pays 
FROM artist 
WHERE art_id NOT IN (SELECT art_id FROM programmation);

-- Lister les festivaliers qui ont effectué au moins une commande supérieure à 200€.
SELECT fesv_nom, fesv_prenom 
FROM festivalier f 
WHERE EXISTS (
    SELECT 1 FROM commande c 
    WHERE c.fesv_id = f.fesv_id 
    AND c.cmd_montant_total > 200.00
);

-- Identifier les styles musicaux qui n'ont aucun artiste qui leur est rattaché dans la base.
SELECT sty_libelle 
FROM style s 
WHERE NOT EXISTS (
    SELECT 1 FROM possede p 
    WHERE p.sty_id = s.sty_id
);

-- Trouver les commandes dont le montant total est supérieur à n'importe quel prix d'un billet "Pass 3 Jours".
SELECT cmd_id, cmd_montant_total 
FROM commande 
WHERE cmd_montant_total > ANY (
    SELECT blt_prix FROM billet WHERE blt_type = 'Pass 3 Jours'
);