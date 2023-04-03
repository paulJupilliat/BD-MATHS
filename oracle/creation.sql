    DROP TABLE VolTable;

    DROP TABLE ReservationTable;

    DROP TABLE AeroportTable;

    DROP TABLE CompagnieAerienneTable;

    DROP TABLE AdresseTable;

    DROP TABLE PassagerTable;

    DROP TYPE VolArray;

    DROP TYPE CompagnieAerienneArray;

    DROP TYPE AeroportArray;

    DROP TYPE ReservationArray;

    DROP TYPE PassagerArray;

    DROP TYPE Vol;

    DROP TYPE Reservation;

    DROP TYPE Aeroport;

    DROP TYPE CompagnieAerienne;

    DROP TYPE Adresse;

    DROP TYPE Passager;

    CREATE
    or replace TYPE Adresse AS OBJECT (
        rue VARCHAR2(50),
        ville VARCHAR2(50),
        pays VARCHAR2(50)
    );

    /

    CREATE OR REPLACE TYPE AdresseArray AS Varray(10) OF Adresse;

    /

    CREATE
    OR REPLACE TYPE Passager AS OBJECT (
        nom VARCHAR2(50),
        prenom VARCHAR2(50),
        adresse AdresseArray
    );

    /

    CREATE OR REPLACE TYPE PassagerArray as Varray(10) OF Passager;

    /

    CREATE
    OR REPLACE TYPE Reservation AS OBJECT (
        id_reservation NUMBER,
        date_reservation DATE,
        passagers PassagerArray
    );

    /

    CREATE OR REPLACE TYPE ReservationArray as Varray(10) OF Reservation;

    /

    CREATE
    OR REPLACE TYPE Aeroport AS OBJECT (
        id_aeroport NUMBER,
        nom_aeroport VARCHAR2(50),
        adresse AdresseArray,
        terminal VARCHAR2(50)
    );

    /

    CREATE OR REPLACE TYPE AeroportArray as Varray(10) OF Aeroport;

    /

    CREATE
    OR REPLACE TYPE CompagnieAerienne AS OBJECT (
        id_compagnie NUMBER,
        nom_compagnie VARCHAR2(50),
        adresse AdresseArray
    );

    /

    CREATE
    OR REPLACE TYPE CompagnieAerienneArray as Varray(10) OF CompagnieAerienne;

    /

    CREATE
    OR REPLACE TYPE Vol AS OBJECT (
        id_vol NUMBER,
        compagnie CompagnieAerienneArray,
        numero NUMBER,
        date_depart DATE,
        heure_depart DATE,
        aeroport_depart AeroportArray,
        date_arrivee DATE,
        heure_arrivee DATE,
        aeroport_arrivee AeroportArray,
        reservations ReservationArray
    );

    /

    CREATE OR REPLACE TYPE VolArray as Varray(10) OF Vol;

    /

    CREATE TABLE CompagnieAerienneTable of CompagnieAerienne;

    CREATE TABLE AeroportTable of Aeroport;

    CREATE TABLE AdresseTable of Adresse;

    CREATE TABLE PassagerTable of Passager;

    CREATE TABLE ReservationTable of Reservation;

    CREATE TABLE VolTable of Vol;