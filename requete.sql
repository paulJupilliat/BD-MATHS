-- Requete a
SELECT a2.ville
FROM Vol v
JOIN Aéroport a1 ON v.aeroport_depart_id = a1.aeroport_id
JOIN Aéroport a2 ON v.aeroport_arrivee_id = a2.aeroport_id
WHERE a1.ville = 'Paris';


-- Requete b
SELECT a4.ville
FROM Vol v1
JOIN Vol v2 ON v1.aeroport_arrivee_id = v2.aeroport_depart_id
JOIN Aéroport a1 ON v1.aeroport_depart_id = a1.aeroport_id
JOIN Aéroport a3 ON v1.aeroport_arrivee_id = a3.aeroport_id
JOIN Aéroport a4 ON v2.aeroport_arrivee_id = a4.aeroport_id
WHERE a1.ville = 'Paris'
AND v1.date_arrivee = v2.date_depart
AND v1.heure_arrivee <= v2.heure_depart;


-- Requete c
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



-- Requete d
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