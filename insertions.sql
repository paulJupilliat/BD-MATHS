-- Active: 1678109077661@@127.0.0.1@3306@SAE_BD

INSERT INTO
    COMPAGNIE(nom_compagnie)
VALUES ('Air France'), ('British Airways'), ('Lufthansa');

INSERT INTO
    VILLES(nom_ville, pays_ville)
VALUES ('Paris', 'France'), ('Londres', 'Royaume-Uni'), ('Francfort', 'Allemagne'), ('New York', 'États-Unis');

INSERT INTO
    AEROPORT(nom_aeroport, ville)
VALUES ('Charles de Gaulle', 'Paris'), ('Heathrow', 'Londres'), (
        'Francfort International',
        'Francfort'
    );

INSERT INTO
    VOL_GENERIQUE(
        aeroport_depart,
        aeroport_arrivee,
        jour,
        heure_depart,
        heure_arrivee,
        duree
    )
VALUES (
        1,
        2,
        'lundi',
        '10:00',
        '11:30',
        '1h30'
    ), (
        1,
        2,
        'mardi',
        '11:00',
        '12:30',
        '1h30'
    ), (
        2,
        3,
        'mercredi',
        '12:00',
        '14:00',
        '2h00'
    );

INSERT INTO
    TERMINAUX(id_aeroport, nom_terminal)
VALUES (1, 'Terminal 1'), (1, 'Terminal 2'), (2, 'Terminal 3');

INSERT INTO
    VOLS(
        date_arrivee,
        date_depart,
        id_vol_generique,
        id_compagnie,
        terminal_arrivee,
        terminal_depart
    )
VALUES (
        '2023-03-15',
        '2023-03-15',
        1,
        1,
        1,
        3
    ), (
        '2023-03-16',
        '2023-03-16',
        1,
        2,
        3,
        3
    ), (
        '2023-03-17',
        '2023-03-17',
        2,
        3,
        3,
        2
    ), (
        '2023-03-18',
        '2023-03-18',
        3,
        1,
        3,
        1
    );