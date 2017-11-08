-- Titre :             Création base cabinet recrutement version élèves.sql
-- Version :           2.0
-- Date modification : 2 octobre 2017
-- Auteur :            Aboubacar BARRY & Yohann LE GALL
-- Description :       Script de création de la base de données pour le SI "gestion de cabinet de
--                     recrutement"
--                     Note : script pour PostgreSQL 8.4

-- +----------------------------------------------------------------------------------------------+
-- | Suppression des tables                                                                       |
-- +----------------------------------------------------------------------------------------------+

drop table if exists assoc_secteur_offre, assoc_secteur_candidature,  candidature,  secteur_activite, offre_emploi,   niveau_qualification, entreprise;

-- +----------------------------------------------------------------------------------------------+
-- | Création des tables                                                                          |
-- +----------------------------------------------------------------------------------------------+

create table entreprise
(
  id_entreprise   serial primary key,
  nom             varchar(50) not null,
  descriptif      text,
  adresse_postale varchar(30)
);


create table secteur_activite
(
  id_secteur_activite     serial primary key,
  intitule                varchar(50) not null
);


create table niveau_qualification
(
  id_niveau_qualification serial primary key,
  intitule                varchar(50) not null
);


create table offre_emploi
(
  id_offre_emploi          serial primary key,
  titre                    varchar(70) not null,
  descriptif_mission       text,
  profil_recherche    	   text,  
  date_depot	           date,
  entreprise_id            integer references entreprise(id_entreprise) ON DELETE CASCADE ON UPDATE CASCADE,
  niveau_qualification_id  integer references niveau_qualification(id_niveau_qualification) ON DELETE CASCADE ON UPDATE CASCADE
);


create table candidature
(
  id_candidature	  serial primary key,
  nom                	  varchar(50) not null,
  prenom	     	  varchar(50) not null,
  date_naissance	  date,
  adresse_postale	  varchar(30), -- Pour simplifier, adresse_postale = ville.
  adresse_email		  varchar(70),
  cv			  text,
  date_depot		  date not null,
  niveau_qualification_id integer references niveau_qualification(id_niveau_qualification)
);


create table assoc_secteur_offre
(
  offre_emploi_id 	integer references offre_emploi(id_offre_emploi) ON DELETE CASCADE ON UPDATE CASCADE,
  secteur_activite_id   integer references secteur_activite(id_secteur_activite) ON DELETE CASCADE ON UPDATE CASCADE,
  primary key (offre_emploi_id, secteur_activite_id)
);


create table assoc_secteur_candidature
(
  secteur_activite_id        integer references secteur_activite(id_secteur_activite) ON DELETE CASCADE ON UPDATE CASCADE,
  candidature_id             integer references candidature(id_candidature) ON DELETE CASCADE ON UPDATE CASCADE,
  primary key (secteur_activite_id, candidature_id)
);

-- +----------------------------------------------------------------------------------------------+
-- | Insertion de quelques données de pour les tests                                              |
-- +----------------------------------------------------------------------------------------------+

-- Insertion des entreprises

insert into entreprise values (nextval('entreprise_id_entreprise_seq'),'Télécom Bretagne','Télécom Bretagne est une grande école pionnière en formation, en recherche et en entrepreneuriat.','Plouzané');
insert into entreprise values (nextval('entreprise_id_entreprise_seq'),'ENIB','Une école d''ingénieur juste à côté...','Plouzané');

-- Insertion des secteurs d'activité

insert into secteur_activite values (nextval('secteur_activite_id_secteur_activite_seq'), 'Informatique');
insert into secteur_activite values (nextval('secteur_activite_id_secteur_activite_seq'), 'Finance');
insert into secteur_activite values (nextval('secteur_activite_id_secteur_activite_seq'), 'Mecanique');

-- Insertion des niveaux de qualification 

insert into niveau_qualification values (nextval('niveau_qualification_id_niveau_qualification_seq'), 'Bac');
insert into niveau_qualification values (nextval('niveau_qualification_id_niveau_qualification_seq'), 'Bac+2');
insert into niveau_qualification values (nextval('niveau_qualification_id_niveau_qualification_seq'), 'Bac+3');
insert into niveau_qualification values (nextval('niveau_qualification_id_niveau_qualification_seq'), 'Bac+5');
insert into niveau_qualification values (nextval('niveau_qualification_id_niveau_qualification_seq'), 'CAP');

-- Insertion des offres d'emploi

insert into offre_emploi values (nextval('offre_emploi_id_offre_emploi_seq'), 'ingenieur systemes dinformations', 'mettre en place une nouvelle archi SI', 'avec 3 ans dexperience', '2017-06-12',(SELECT id_entreprise from entreprise where nom = 'ENIB'), (SELECT id_niveau_qualification from niveau_qualification where intitule = 'Bac+5'));

-- Insertion des candidatures

insert into candidature values (nextval('candidature_id_candidature_seq'), 'Doe','John','1984-10-24','Plouzane', 'john.doe@gmail.com','winter is coming','2017-10-01',(SELECT id_niveau_qualification from niveau_qualification where intitule = 'Bac+3'));
 
-- Insertion des assoc_secteur_offre 

insert into assoc_secteur_offre values((SELECT id_offre_emploi from offre_emploi where titre = 'ingenieur systemes dinformations'),(SELECT id_secteur_activite from secteur_activite where intitule = 'Informatique'));

-- Insertion des assoc_secteur_candidature 

insert into assoc_secteur_candidature values((SELECT id_secteur_activite from secteur_activite where intitule = 'Informatique'),(SELECT id_candidature from candidature where niveau_qualification_id = (SELECT id_niveau_qualification from niveau_qualification where intitule = 'Bac+3')));
