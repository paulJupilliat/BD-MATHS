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
