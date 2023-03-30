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


