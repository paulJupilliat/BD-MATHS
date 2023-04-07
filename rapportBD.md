# SAE BD MATHS
## Date: 2019-10-10 10:00:00
## participants:
- Paul JUPILLIAT
- Benjamain GUERRE
- Antoine SAADAH

# Partie 1
## 1) script de création de tables
```sql 
DROP TABLE IF EXISTS Vol;
DROP TABLE IF EXISTS Aéroport;
DROP TABLE IF EXISTS CompagnieAérienne;

CREATE TABLE CompagnieAérienne (
  compagnie_id INT PRIMARY KEY,
  nom VARCHAR(255) NOT NULL
);

CREATE TABLE Aéroport (
  aeroport_id INT PRIMARY KEY,
  nom VARCHAR(255) NOT NULL UNIQUE,
  ville VARCHAR(255) NOT NULL,
  pays VARCHAR(255) NOT NULL,
  terminal VARCHAR(255) NOT NULL
);

CREATE TABLE Vol (
  vol_id INT PRIMARY KEY,
  compagnie_id INT,
  numero INT NOT NULL,
  date_depart DATE NOT NULL,
  heure_depart TIME NOT NULL,
  aeroport_depart_id INT,
  date_arrivee DATE NOT NULL,
  heure_arrivee TIME NOT NULL,
  aeroport_arrivee_id INT,
  FOREIGN KEY (compagnie_id) REFERENCES CompagnieAérienne(compagnie_id),
  FOREIGN KEY (aeroport_depart_id) REFERENCES Aéroport(aeroport_id),
  FOREIGN KEY (aeroport_arrivee_id) REFERENCES Aéroport(aeroport_id)
);
```
## insertion des données
```sql
-- Insertion de compagnies aériennes
INSERT INTO CompagnieAérienne (compagnie_id, nom)
VALUES
(1, 'Air France'),
(2, 'British Airways'),
(3, 'Lufthansa'),
(4, 'Emirates'),
(5, 'American Airlines');

-- Insertion d'aéroports
INSERT INTO Aéroport (aeroport_id, nom, ville, pays, terminal)
VALUES
(1, 'Aéroport Charles de Gaulle', 'Paris', 'France', 'Terminal 2E'),
(2, 'Aéroport de Londres Heathrow', 'Londres', 'Royaume-Uni', 'Terminal 5'),
(3, 'Aéroport de Francfort', 'Francfort', 'Allemagne', 'Terminal 1'),
(4, 'Aéroport international de Dubaï', 'Dubaï', 'Émirats arabes unis', 'Terminal 3'),
(5, 'Aéroport international de Los Angeles', 'Los Angeles', 'États-Unis', 'Terminal 4'),
(6, 'Aéroport international de New York-JFK', 'New York', 'États-Unis', 'Terminal 8'),
(7, 'Aéroport international de Séoul-Incheon', 'Séoul', 'Corée du Sud', 'Terminal 2'),
(8, 'Aéroport international de Tokyo-Haneda', 'Tokyo', 'Japon', 'Terminal 3');

-- Insertion de vols
INSERT INTO Vol (vol_id, compagnie_id, numero, date_depart, heure_depart, aeroport_depart_id, date_arrivee, heure_arrivee, aeroport_arrivee_id)
VALUES
(1, 1, 1234, '2023-04-01', '10:00:00', 1, '2023-04-01', '12:30:00', 2),
(2, 1, 5678, '2023-04-02', '14:00:00', 1, '2023-04-02', '16:30:00', 3),
(3, 2, 9012, '2023-04-03', '08:00:00', 1, '2023-04-03', '11:30:00', 4),
(4, 3, 3456, '2023-04-04', '16:00:00', 1, '2023-04-04', '21:30:00', 5),
(5, 5, 7890, '2023-04-05', '12:00:00', 1, '2023-04-05', '18:30:00', 8);
```

## 2) les requetes :
- a) Donner les villes que nous pouvons atteindre par vols directs qui partent de Paris
```sql
SELECT a2.ville
FROM Vol v
JOIN Aéroport a1 ON v.aeroport_depart_id = a1.aeroport_id
JOIN Aéroport a2 ON v.aeroport_arrivee_id = a2.aeroport_id
WHERE a1.ville = 'Paris';
```
- b) En consid ́erant les horaires des vols, veuillez fournir la liste des villes accessibles
depuis Paris avec un vol comprenant UNE correspondance. L’objectif est de per-
mettre aux passagers de r ́ealiser leur correspondance.
```sql
SELECT a4.ville
FROM Vol v1
JOIN Vol v2 ON v1.aeroport_arrivee_id = v2.aeroport_depart_id
JOIN Aéroport a1 ON v1.aeroport_depart_id = a1.aeroport_id
JOIN Aéroport a3 ON v1.aeroport_arrivee_id = a3.aeroport_id
JOIN Aéroport a4 ON v2.aeroport_arrivee_id = a4.aeroport_id
WHERE a1.ville = 'Paris'
AND v1.date_arrivee = v2.date_depart
AND v1.heure_arrivee <= v2.heure_depart;
```
- c) En consid ́erant les horaires des vols, veuillez fournir la liste des villes accessibles
depuis Paris avec un vol comprenant DEUX correspondances.
```sql
SELECT a6.ville
FROM Vol v1
JOIN Vol v2 ON v1.aeroport_arrivee_id = v2.aeroport_depart_id
JOIN Vol v3 ON v2.aeroport_arrivee_id = v3.aeroport_depart_id
JOIN Aéroport a1 ON v1.aeroport_depart_id = a1.aeroport_id
JOIN Aéroport a3 ON v1.aeroport_arrivee_id = a3.aeroport_id
JOIN Aéroport a4 ON v2.aeroport_arrivee_id = a4.aeroport_id
JOIN Aéroport a6 ON v3.aeroport_arrivee_id = a6.aeroport_id
WHERE a1.ville = 'Paris'
AND v1.date_arrivee = v2.date_depart
AND v1.heure_arrivee <= v2.heure_depart
AND v2.date_arrivee = v3.date_depart
AND v2.heure_arrivee <= v3.heure_depart;
```
- d) Veuillez fournir la liste des villes accessibles depuis Paris, en tenant compte des
horaires de vol, avec des vols directs ou un nombre quelconque de correspondances.
```sql
WITH RECURSIVE Routes (depart_id, arrivee_id, nb_correspondances) AS (
SELECT a1.aeroport_id, a2.aeroport_id, 0
FROM Vol v
JOIN Aéroport a1 ON v.aeroport_depart_id = a1.aeroport_id
JOIN Aéroport a2 ON v.aeroport_arrivee_id = a2.aeroport_id
WHERE a1.ville = 'Paris'
UNION ALL
SELECT r.depart_id, a2.aeroport_id, r.nb_correspondances+1
FROM Routes r
JOIN Vol v ON r.arrivee_id = v.aeroport_depart_id
JOIN Aéroport a1 ON v.aeroport_depart_id = a1.aeroport_id
JOIN Aéroport a2 ON v.aeroport_arrivee_id = a2.aeroport_id
WHERE r.nb_correspondances < 3
)

SELECT DISTINCT ville
FROM Aéroport
WHERE aeroport_id IN (SELECT arrivee_id FROM Routes)
ORDER BY ville;
```

# Partie 2

## création de la base de données :

```sql
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
```
## 2 les requêtes :
- a) Pour chaque vol, donner le nombre de personnes de l’ ́equipage, par fonction.
```sql
SELECT
    v.id_vol,
    COUNT(DISTINCT p) AS nb_pilotes,
    COUNT(DISTINCT c) AS nb_co_pilotes,
    COUNT(DISTINCT a) AS nb_autres
FROM VolTable v
    JOIN ReservationTable r ON v.id_vol = r.reservations.id_reservation
    JOIN PassagerTable p ON r.passagers = p AND p.nom = 'Pilote'
    JOIN PassagerTable c ON r.passagers = c AND c.nom = 'Co-Pilote'
    JOIN PassagerTable a ON r.passagers = a AND a.nom NOT IN ('Pilote', 'Co-Pilote')
GROUP BY v.id_vol;
```
- b) Pour chaque pilote, indiquer combien des vols lui sont associes.
```sql
SELECT
    p.nom,
    p.prenom,
    COUNT(*) AS nombre_vols
FROM PassagerTable pt
    JOIN ReservationTable rt ON pt.id_reservation = rt.id_reservation
    JOIN VolTable vt ON rt.reservation.id_vol = vt.id_vol
    JOIN TABLE(vt.equipage) e ON e.id_personne = pt.id_passager
    JOIN PiloteTable p ON e.id_personne = p.id_pilote
GROUP BY p.nom, p.prenom;
```
- c) L’impact d’un indice de qualit ́e est donn ́e par le produit de sa valeur et du poids
que lui est attribu ́e. Pour chaque vol, indiquer l’impact de chaque indice de qualite.
```sql
SELECT
    v.id_vol,
    q.nom_indice,
    SUM(q.valeur * iq.poids) AS impact
FROM VolTable v
    CROSS JOIN IndiceQualite iq
    JOIN Qualite q ON q.id_qualite = iq.id_qualite
    JOIN TableIndiceQualite tiq ON tiq.id_indice = iq.id_indice
    JOIN TableVolIndiceQualite tviq ON tviq.id_table_indice = tiq.id_table_indice
    JOIN IndiceQualiteVol iqv ON iqv.id_indice = iq.id_indice AND iqv.id_vol = v.id_vol
GROUP BY
    v.id_vol,
    q.nom_indice;
```
- d) Pour chaque indice de qualit ́e, calculer son impact moyen
```sql
SELECT
    i.nom_indice,
    AVG(vq.valeur * i.poids) AS impact_moyen
FROM VolTable v
    JOIN Vol_Indice_Qualite_Table vq ON vq.id_vol = v.id_vol
    JOIN Indice_Qualite_Table i ON i.id_indice = vq.id_indice
GROUP BY i.nom_indice;
```

# Partie 3
```sql
% La base de données VOL contient des informations sur les vols directs.
% Les faits dans la base de données sont des vols directs avec les heures de départ et d arrivée.

vol(newyork, paris, 8, 11).
vol(newyork, paris, 12, 15).
vol(newyork, paris, 16, 19).
vol(newyork, paris, 20, 23).
vol(newyork, paris, 0, 3).
vol(newyork, paris, 4, 7).
vol(newyork, paris, 8, 11).
vol(newyork, paris, 12, 15).
vol(newyork, paris, 16, 19).
vol(newyork, paris, 20, 23).
vol(paris, newyork, 8, 11).
vol(paris, newyork, 12, 15).
vol(paris, sydney, 16, 19).
vol(paris, sydney, 20, 23).
vol(paris, sydney, 0, 3).
vol(paris, sydney, 4, 7).
vol(londres, paris, 18, 21).
vol(newyork, londres, 8, 11).
vol(newyork, londres, 12, 15).
vol(newyork, londres, 16, 19).
vol(newyork, londres, 20, 23).
vol(newyork, londres, 0, 3).
vol(newyork, londres, 4, 7).
vol(newyork, londres, 8, 11).
vol(newyork, londres, 12, 15).
vol(newyork, londres, 16, 19).
vol(newyork, londres, 20, 23).
vol(londres, newyork, 8, 11).
vol(londres, newyork, 12, 15).
vol(londres, tokyo, 16, 19).
vol(londres, tokyo, 20, 23).
vol(londres, tokyo, 0, 3).
vol(paris,sydney, 11, 15).
vol(sydney, tokyo, 15, 19).
vol(tokyo, londres, 19, 23).
vol(paris, newyork, 14, 18).
vol(londres, sydney, 22, 7).
vol(newyork, tokyo, 11, 17).
vol(tokyo, paris, 19, 23).
vol(sydney, newyork, 6, 13).
vol(londres, rome, 9, 12).
vol(rome, paris, 15, 18).
vol(paris, tokyo, 8, 13).
vol(newyork, londres, 16, 19).
vol(tokyo, newyork, 20, 8).
vol(londres, newyork, 23, 3).
vol(londres, tokyo, 4, 7).
vol(paris, tokyo, 8, 11).
vol(paris, tokyo, 12, 15).
vol(paris, tokyo, 16, 19).
vol(paris, tokyo, 20, 23).
vol(paris, tokyo, 0, 3).
vol(newyork, tokyo, 8, 11).
vol(newyork, tokyo, 12, 15).
vol(newyork, tokyo, 16, 19).
vol(newyork, tokyo, 20, 23).
vol(newyork, tokyo, 0, 3).
vol(newyork, tokyo, 4, 7).
vol(newyork, tokyo, 8, 11).
vol(newyork, tokyo, 12, 15).
vol(newyork, tokyo, 16, 19).
vol(newyork, tokyo, 20, 23).
vol(tokyo, newyork, 8, 11).
vol(tokyo, newyork, 12, 15).
vol(tokyo, londres, 16, 19).
vol(tokyo, londres, 20, 23).
vol(tokyo, londres, 0, 3).
vol(tokyo, londres, 4, 7).

vol(sydney, tokyo, 12, 15).
vol(sydney, tokyo, 16, 19).
vol(sydney, tokyo, 20, 23).
vol(sydney, tokyo, 0, 3).

% Le prédicat vol_direct représente un vol direct entre deux villes.
vol_direct(Depart, Arrivee, HeureDepart, HeureArrivee) :- 
    vol(Depart, Arrivee, HeureDepart, HeureArrivee).


% Le prédicat vol_connecte représente un vol qui connecte deux villes via une escale à une autre ville.
vol_connecte(Depart, Arrivee, HeureDepart, HeureArrivee) :- 
    vol_direct(Depart, Escale, HeureDepart, HeureEscale), 
    vol_direct(Escale, Arrivee, HeureEscale, HeureArrivee).

% Le prédicat ville_connectee représente une ville connectée à une autre ville via un vol direct ou un vol avec escale.
ville_connectee(Depart, Arrivee, HeureDepart, HeureArrivee) :- 
    vol_direct(Depart, Arrivee, HeureDepart, HeureArrivee).
ville_connectee(Depart, Arrivee, HeureDepart, HeureArrivee) :- 
    vol_connecte(Depart, Arrivee, HeureDepart, HeureArrivee).

% Le prédicat trajet_complet représente un trajet complet entre deux villes via un vol direct ou un vol avec escale.
trajet_complet(Depart, Arrivee, HeureDepart, HeureArrivee) :- 
    ville_connectee(Depart, Arrivee, HeureDepart, HeureArrivee).
trajet_complet(Depart, Arrivee, HeureDepart, HeureArrivee) :- 
    ville_connectee(Depart, Escale, HeureDepart, HeureEscale),
    trajet_complet(Escale, Arrivee, HeureEscale, HeureArrivee).
% La base de données VOL contient des informations sur les vols directs.
% Les faits dans la base de données sont des vols directs avec les heures de départet d arrivée.

% Le prédicat vol_direct représente un vol direct entre deux villes.
vol_direct(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol(Depart, Arrivee, HeureDepart, HeureArrivee).

% Le prédicat vol_connecte représente un vol qui connecte deux villes via une escale à une autre ville.
vol_connecte(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_direct(Depart, Escale, HeureDepart, HeureEscale),
vol_direct(Escale, Arrivee, HeureEscale, HeureArrivee).

% Le prédicat vol_impair représente un vol qui connecte deux villes avec un nombre impair de connexions.
vol_impair(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_connecte(Depart, Escale, HeureDepart, HeureEscale),
vol_connecte(Escale, Arrivee, HeureEscale, HeureArrivee),
Depart = Arrivee.

% Le prédicat trajet_complet_impair représente un trajet complet entre deux villes avec un nombre impair de connexions.
trajet_complet_impair(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_impair(Depart, Arrivee, HeureDepart, HeureArrivee).
trajet_complet_impair(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_impair(Depart, Escale, HeureDepart, HeureEscale),
trajet_complet_impair(Escale, Arrivee, HeureEscale, HeureArrivee),
Depart = Arrivee.

% Le prédicat ville_impair représente une ville connectée à une autre ville avec un nombre impair de connexions.
ville_impair(Depart, Arrivee, HeureDepart, HeureArrivee) :-
trajet_complet_impair(Depart, Arrivee, HeureDepart, HeureArrivee).

% Le prédicat trajet_complet représente un trajet complet entre deux villes via un vol direct ou un vol avec escale.
trajet_complet(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_direct(Depart, Arrivee, HeureDepart, HeureArrivee).
trajet_complet(Depart, Arrivee, HeureDepart, HeureArrivee) :-
ville_connectee(Depart, Escale, HeureDepart, HeureEscale),
trajet_complet(Escale, Arrivee, HeureEscale, HeureArrivee).

% Le prédicat ville_connectee représente une ville connectée à une autre ville via un vol direct ou un vol avec escale.
ville_connectee(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_direct(Depart, Arrivee, HeureDepart, HeureArrivee).
ville_connectee(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_connecte(Depart, Arrivee, HeureDepart, HeureArrivee).

% Le prédicat trajet_complet_impair représente un trajet complet entre deux villes avec un nombre impair de connexions.
trajet_complet_impair(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_impair(Depart, Arrivee, HeureDepart, HeureArrivee).
trajet_complet_impair(Depart, Arrivee, HeureDepart, HeureArrivee) :-
vol_impair(Depart, Escale, HeureDepart, HeureEscale),
trajet_complet_impair(Escale, Arrivee, HeureEscale, HeureArrivee),
Depart = Arrivee.
```
- 2.  Ecrivez un programme Datalog qui permet de lister toutes les villes connect ́ees par des
vols (directs ou avec connexions) possibles `a partir de d’une instance de la base VOL
donn ́ee. Les horaires de d ́epart et d’arriv ́ee du trajet complet doivent ˆetre indiqu ́es.
```
ville_directe(Ville1, Ville2) :- 
    vol_direct(Ville1, Ville2, _, _).

ville_escale(Ville1, Ville2) :-
    vol_connecte(Ville1, Escale, _, _),
    vol_direct(Escale, Ville2, _, _).

ville_connectee(Ville1, Ville2) :-
    ville_directe(Ville1, Ville2).
ville_connectee(Ville1, Ville2) :-
    ville_escale(Ville1, Ville2).

ville_connectee(Depart, Arrivee) :- 
    ville_directe(Depart, Arrivee).
ville_connectee(Depart, Arrivee) :- 
    ville_escale(Depart, Escale),
    ville_connectee(Escale, Arrivee).
```


- 3.  Ecrivez un programme Datalog qui permet de lister toutes les villes connect ́ees par
des vols avec un nombre impair de connexions. Les horaires de d ́epart et d’arriv ́ee du
trajet complet doivent ˆetre indiqu ́es.

```
ville_directe(Ville1, Ville2) :- vol_direct(Ville1, Ville2, _, _).
ville_escale(Ville1, Ville2) :- vol_connecte(Ville1, Ville2, _, _).
ville_impair(Ville1, Ville2) :- vol_direct(Ville1, Ville2, _, _).
ville_impair(Ville1, Ville2) :- vol_direct(Ville1, Ville3, _, _), ville_impair(Ville3, Ville2), Ville1 != Ville2.
```