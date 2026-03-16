# ProjetDB_Ahafid_Ghribi_Ben-Amar
# README – Projet Base de Données : Festival de musique

# Étudiants

* Aziz Ben Amar
* Aymane Ahafid
* Adam Ghribi
  
Présentation: Ce projet consiste à concevoir une base de données permettant de gérer l’organisation d’un **festival de musique**.
La base permet de stocker les informations sur les artistes, les scènes, la programmation des concerts, le personnel du festival, ainsi que les festivaliers et l’achat de billets.

Le projet suit les étapes classiques de modélisation d’une base de données :

MCD (Modèle Conceptuel de Données)--> MLD (Modèle Logique de Données) --> Implémentation SQL

Organisation de la base :

La base de données permet de gérer :
* les **artistes**, leurs **styles musicaux** et leurs **groupes**
* les **festivals**, les **scènes** et les **créneaux horaires**
* la **programmation des concerts**
* le **staff** avec une relation de supervision
* les **festivaliers**, les **commandes** et les **billets**

Un concert est défini par la combinaison :

* d’un **artiste**
* d’une **scène**
* d’un **créneau horaire**

Les billets sont liés à une commande et utilisent une clé primaire composée.



Remarque : Initialement, les groupes devaient être composés de deux étudiants.
Cependant, à cause d’une **mauvaise gestion de la répartition des groupes**, nous avons finalement réalisé ce projet **à trois**.


Technologies utilisées : Modélisation MERISE, SQL, Système de gestion de base de données relationnel
