CREATE TABLE accessoire_levage (
  IDequipement int(11) NOT NULL,
  Lieux varchar(50) NOT NULL,
  Caracteristique varchar(50) NOT NULL,
  Longueur_Utile double DEFAULT NULL,
  Sortie_sur_Dossier varchar(50) NOT NULL,
  Repere_Fournisseur varchar(25) NOT NULL,
  Nom_Fournisseur varchar(50) NOT NULL,
  Nom_Fabricant varchar(50) NOT NULL,
  Poids_en_Kg int(11) DEFAULT NULL,
  Date_Fabrication datetime DEFAULT NULL,
  Date_Achat datetime DEFAULT NULL,
  Date_Rebus datetime DEFAULT NULL
) ;

INSERT INTO accessoire_levage (IDequipement, Lieux, Caracteristique, Longueur_Utile, Sortie_sur_Dossier, Repere_Fournisseur, Nom_Fournisseur, Nom_Fabricant, Poids_en_Kg, Date_Fabrication, Date_Achat, Date_Rebus) VALUES
(9, 'Héricourt', 'Estrope', NULL, 'Héricourt', '3104093755', 'LIFTAL', 'UTX', 0, '2014-10-01', '2014-10-01', NULL),
(10, 'Bagneux', 'Estrope', NULL, '', '77830007', 'LIFTAL', 'LIFTAL', 0, '2016-10-01', '2016-10-01', NULL),
(11, 'Bagneux', '4 brins avec crochets sécurité', NULL, '', '90529', 'CHAPALAIN', 'CHAPALAIN', 0, '2009-05-01', '2009-05-01', NULL);

CREATE TABLE clients (
  ID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Nom varchar(50) NOT NULL,
  Adresse varchar(50) NOT NULL,
  Code_Postal varchar(5) DEFAULT NULL,
  Ville varchar(50) NOT NULL,
  Telephone varchar(10) NOT NULL,
  Commentaire varchar(250) DEFAULT NULL
) ;

INSERT INTO clients (Nom, Adresse, Code_Postal, Ville, Telephone, Commentaire) VALUES
('ACTEMIUM', 'ZAC les Guinottes II 16 rue du chene SEC', NULL, 'HERICOURT', '0606060606', ''),
('Leclerc', '25 rue des allées', '14000', 'Caen', '0602020202', 'Fictif');

CREATE TABLE contenant (
  ID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NomContenant varchar(50) NOT NULL,
  Puce varchar(50) DEFAULT NULL
) ;

INSERT INTO contenant (NomContenant, Puce) VALUES
('Palette', NULL),
('Conteneur', NULL),
('Boîte', NULL),
('Entrepôt n°1', NULL);

CREATE TABLE dynamometre (
  IDequipement int(11) NOT NULL,
  DateEtalonnage datetime DEFAULT NULL
) ;

INSERT INTO dynamometre (IDequipement, DateEtalonnage) VALUES
(5, '2021-04-23'),
(6, '2021-05-02'),
(7, '2021-05-23'),
(8, '2020-09-19');

CREATE TABLE equipement (
  ID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Designation varchar(50) NOT NULL,
  CMU_en_T double DEFAULT NULL,
  Repere_Fonctionnel varchar(25) NOT NULL,
  Puce varchar(50) DEFAULT NULL,
  IDcontenantStockage int(11) DEFAULT NULL,
  VGP_Derniere datetime DEFAULT NULL,
  VGP_Prochaine datetime DEFAULT NULL,
  FOREIGN KEY (IDcontenantStockage) REFERENCES contenant (ID)
) ;

INSERT INTO equipement (Designation, CMU_en_T, Repere_Fonctionnel, Puce, IDcontenantStockage, VGP_Derniere, VGP_Prochaine) VALUES
('Harnais', 3.5, 1353894, NULL, NULL, '2020-10-25', '2021-10-25'),
('Harnais', 9.5, 6518181, NULL, NULL, '2020-08-14', '2021-08-14'),
('Harnais', 6.4, 5418156, NULL, NULL, '2021-02-23', '2022-02-23'),
('Harnais', 5.6, 1811915,NULL, NULL, '2020-12-10', '2021-12-10'),
('Dynamomètre', 3.2, 51818515, NULL, NULL, '2021-01-13', '2022-01-13'),
('Dynamomètre', 7.5, 188918811, NULL, NULL, '2020-07-30', '2021-07-30'),
('Dynamomètre', 5, 1818181969, NULL, NULL, '2020-10-07', '2021-10-07'),
('Dynamomètre', 4.5, 918918191, NULL, NULL, '2021-05-25', '2022-05-25'),
('Accessoire de levage', 1.3, 51189819, NULL, NULL, '2021-03-10', '2022-03-10'),
('Accessoire de levage', 8.5, 1984474, NULL, NULL, '2020-06-30', '2021-06-30'),
('Accessoire de levage', 1.4, 3654848, NULL, NULL, '2021-04-01', '2022-04-01');

CREATE TABLE harnais (
  IDequipement int(11) NOT NULL,
  Marque varchar(50) NOT NULL,
  Longueur_Utile double DEFAULT NULL,
  Annee_semaineDeFabrication varchar(5) NOT NULL,
  FOREIGN KEY (IDequipement) REFERENCES equipement (ID)
) ;

INSERT INTO harnais (IDequipement, Marque, Longueur_Utile, Annee_semaineDeFabrication) VALUES
(1, 'Tractel', NULL, '18/35'),
(2, 'Harnais', NULL, ''),
(3, 'Tra_Harn', NULL, '18/31'),
(4, 'Tractel', NULL, '17/45');

CREATE TABLE equipement_liste (
  ID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NumeroCommande int(11) NOT NULL,
  IDclients int(11) NOT NULL,
  IDpreparateur int(11) DEFAULT NULL,
  IDequipement int(11) NOT NULL,
  IDcontenant int(11) DEFAULT NULL,
  Date_Debut datetime NOT NULL,
  Date_Fin datetime NOT NULL,
  FOREIGN KEY (IDequipement) REFERENCES equipement (ID),
  FOREIGN KEY (IDcontenant) REFERENCES contenant (ID),
  FOREIGN KEY (IDclients) REFERENCES clients (ID)
) ;

INSERT INTO equipement_liste (NumeroCommande, IDclients, IDpreparateur, IDequipement, IDcontenant, Date_Debut, Date_Fin) VALUES
(5165184, 1, NULL, 5, NULL, '2021-08-25', '2021-11-25'),
(5165184, 1, 1, 2, NULL, '2021-08-25', '2021-11-25'),
(5988489, 2, NULL, 3, NULL, '2021-12-25', '2022-05-25'),
(5988489, 2, 2, 8, NULL, '2021-12-25', '2022-05-25');

CREATE TABLE personnel (
  ID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Nom_Utilisateur varchar(50) NOT NULL,
  Mot_de_Passe varchar(20) NOT NULL,
  Roles varchar(20) NOT NULL,
  Nom varchar(20) NOT NULL,
  Prenom varchar(20) NOT NULL
) ;

INSERT INTO personnel (Nom_Utilisateur, Mot_de_Passe, Roles, Nom, Prenom) VALUES
('RocherQuentin', 'Alicia', 'Administrateur', 'Rocher', 'Quentin'),
('Personnel1', 'MdpPersonnel1', 'Administrateur', 'Jean', 'David');

ALTER TABLE accessoire_levage
ADD FOREIGN KEY (IDequipement) REFERENCES equipement (ID);

ALTER TABLE dynamometre
ADD FOREIGN KEY (IDequipement) REFERENCES equipement (ID);

ALTER TABLE equipement_liste
ADD FOREIGN KEY (IDpreparateur) REFERENCES personnel (ID);