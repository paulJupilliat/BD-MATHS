-- Active: 1678109077661@@127.0.0.1@3306@SAE_BD
-- Donner les villes que nous pouvons atteindre par vols directs qui partent de Paris.
select * from VOL_GENERIQUE where esclale is NULL aeroport_depart = (select id_aeroport from `AEROPORT` where ville = 'Paris'); 

