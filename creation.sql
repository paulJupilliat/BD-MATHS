-- Active: 1678109077661@@127.0.0.1@3306@SAE_BD

drop table VOLS;

drop table TERMINAUX;

DROP TABLE ESCALE;

drop table VOL_GENERIQUE;


drop table AEROPORT;

drop table VILLES;

drop table COMPAGNIE;

create table
    COMPAGNIE(
        id_compagnie int not null auto_increment,
        nom_compagnie varchar(50) not null,
        PRIMARY KEY (id_compagnie)
    );

create table
    VILLES(
        nom_ville varchar(50) not null,
        pays_ville varchar(50) not null,
        PRIMARY KEY (nom_ville, pays_ville)
    );

create table
    AEROPORT(
        id_aeroport int not null auto_increment,
        nom_aeroport varchar(50) not null,
        ville VARCHAR(50) not null,
        PRIMARY KEY (id_aeroport),
        FOREIGN KEY (ville) REFERENCES VILLES(nom_ville)
    );
create table
    ESCALE(
        id_aeroport int not null,
        date_arrivee varchar(50) not null,
        date_depart varchar(50) not null,
        PRIMARY KEY (id_aeroport),
        FOREIGN KEY (id_aeroport) REFERENCES AEROPORT(id_aeroport)
    );

CREATE table
    VOL_GENERIQUE(
        id_vol_generique int not null auto_increment,
        aeroport_depart int not null,
        esclale int DEFAULT nullnot nul,
        aeroport_arrivee int not null,
        jour varchar(50) not null,
        heure_depart varchar(50) not null,
        heure_arrivee varchar(50) not null,
        duree varchar(50) not null,
        PRIMARY KEY (id_vol_generique),
        FOREIGN KEY (aeroport_depart) REFERENCES AEROPORT(id_aeroport),
        FOREIGN KEY (aeroport_arrivee) REFERENCES AEROPORT(id_aeroport),
        FOREIGN KEY (esclale) REFERENCES ESCALE(id_aeroport)
    );



create table
    TERMINAUX(
        id_terminal int not null auto_increment,
        id_aeroport int not null,
        nom_terminal varchar(50) not null,
        PRIMARY KEY (id_terminal, id_aeroport),
        FOREIGN KEY (id_aeroport) REFERENCES AEROPORT(id_aeroport)
    );

create table
    VOLS(
        id_vols int not null auto_increment,
        date_arrivee varchar(50) not null,
        date_depart varchar(50) not null,
        id_vol_generique int not null,
        id_compagnie int not null,
        terminal_depart int not null,
        terminal_arrivee int not null,
        PRIMARY KEY (id_vols),
        FOREIGN KEY (id_vol_generique) REFERENCES VOL_GENERIQUE(id_vol_generique),
        FOREIGN KEY (id_compagnie) REFERENCES COMPAGNIE(id_compagnie),
        FOREIGN KEY (terminal_depart) REFERENCES TERMINAUX(id_terminal),
        FOREIGN KEY (terminal_arrivee) REFERENCES TERMINAUX(id_terminal)
    );