-- Active: 1678109077661@@127.0.0.1@3306@SAE_BD
-- Insert data into COMPAGNIE table
INSERT INTO COMPAGNIE (nom_compagnie) VALUES ('Air France');
INSERT INTO COMPAGNIE (nom_compagnie) VALUES ('Delta Airlines');
INSERT INTO COMPAGNIE (nom_compagnie) VALUES ('British Airways');

-- Insert data into VILLES table
INSERT INTO VILLES (nom_ville, pays_ville) VALUES ('Paris', 'France');
INSERT INTO VILLES (nom_ville, pays_ville) VALUES ('New York', 'United States');
INSERT INTO VILLES (nom_ville, pays_ville) VALUES ('London', 'United Kingdom');

-- Insert data into AEROPORT table
INSERT INTO AEROPORT (nom_aeroport, ville) VALUES ('Charles de Gaulle', 'Paris');
INSERT INTO AEROPORT (nom_aeroport, ville) VALUES ('JFK', 'New York');
INSERT INTO AEROPORT (nom_aeroport, ville) VALUES ('Heathrow', 'London');

-- Insert data into ESCALE table
INSERT INTO ESCALE (id_aeroport, date_arrivee, date_depart) VALUES (1, '2023-03-20 10:00:00', '2023-03-20 12:00:00');
INSERT INTO ESCALE (id_aeroport, date_arrivee, date_depart) VALUES (2, '2023-03-20 14:00:00', '2023-03-20 16:00:00');

-- Insert data into VOL_GENERIQUE table
INSERT INTO VOL_GENERIQUE (aeroport_depart, esclale, aeroport_arrivee, jour, heure_depart, heure_arrivee, duree)
VALUES (1, 1, 2, '2023-03-20', '08:00:00', '18:00:00', '10:00:00');
INSERT INTO VOL_GENERIQUE (aeroport_depart, esclale, aeroport_arrivee, jour, heure_depart, heure_arrivee, duree)
VALUES (2, NULL, 3, '2023-03-21', '10:00:00', '17:00:00', '07:00:00');
INSERT INTO VOL_GENERIQUE(aeroport_depart, esclale, aeroport_arrivee, jour, heure_depart, heure_arrivee, duree)
VALUES(3,NULL,1,'2023-03-21', '10:30:00', '12:30:00', '02:00:00');

INSERT INTO VOL_GENERIQUE(aeroport_depart, esclale, aeroport_arrivee, jour, heure_depart, heure_arrivee, duree)
VALUES(1,NULL,3,'2023-03-21', '10:30:00', '12:30:00', '02:00:00');

-- Insert data into TERMINAUX table
INSERT INTO TERMINAUX (id_aeroport, nom_terminal) VALUES (1, 'Terminal 1');
INSERT INTO TERMINAUX (id_aeroport, nom_terminal) VALUES (2, 'Terminal 4');
INSERT INTO TERMINAUX (id_aeroport, nom_terminal) VALUES (3, 'Terminal 2');

-- Insert data into VOLS table
INSERT INTO VOLS (date_arrivee, date_depart, id_vol_generique, id_compagnie, terminal_depart, terminal_arrivee)
VALUES ('2023-03-20 18:00:00', '2023-03-20 08:00:00', 1, 1, 1, 2);
INSERT INTO VOLS (date_arrivee, date_depart, id_vol_generique, id_compagnie, terminal_depart, terminal_arrivee)
VALUES ('2023-03-21 17:00:00', '2023-03-21 10:00:00', 2, 2, 2, 3);