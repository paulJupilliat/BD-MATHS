--a 
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

--b
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

--c
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

--d
SELECT
    i.nom_indice,
    AVG(vq.valeur * i.poids) AS impact_moyen
FROM VolTable v
    JOIN Vol_Indice_Qualite_Table vq ON vq.id_vol = v.id_vol
    JOIN Indice_Qualite_Table i ON i.id_indice = vq.id_indice
GROUP BY i.nom_indice;