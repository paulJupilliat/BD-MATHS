Ecrivez un programme Datalog qui permet de lister toutes les villes connectées par desvols (directs ou avec connexions) possibles à partir de d’une instance de la base VOL
donnée. Les horaires de depart et d’arrivée du trajet complet doivent être indiqués

```datalog
// Définition des faits
Vol(V, C, N, Dp, Hp, Ad, Ha, Aa) :- vol(V, C, N, Dp, Hp, Ad, Ha, Aa).

// Règle pour les vols directs
TrajetDirect(D, A, Dp, Hp, Aa, Ha) :-
  Vol(V, _, _, Dp, Hp, D, _, A),
  Vol(_, _, _, _, _, A, Ha, Aa),
  A = Aa,
  D = Dp,
  A != D.

// Règle pour les vols avec une connexion
TrajetAvecConnexion(D, A, Dp, Hp, Aa, Ha) :-
  TrajetDirect(D, X, Dp, Hp, Da, Ha),
  TrajetDirect(X, A, Da, Ha, Aa, _).

// Exécution de la requête
? TrajetDirect(D, A, Dp, Hp, Aa, Ha).
? TrajetAvecConnexion(D, A, Dp, Hp, Aa, Ha).
```
Ecrivez un programme Datalog qui permet de lister toutes les villes connectées par
des vols avec un nombre impair de connexions. Les horaires de départ et d’arrivee du
trajet complet doivent etre indiques

```datalog
// Définition des faits
Vol(V, C, N, Dp, Hp, Ad, Ha, Aa) :- vol(V, C, N, Dp, Hp, Ad, Ha, Aa).

// Règle pour les vols directs
TrajetDirect(D, A, Dp, Hp, Aa, Ha, 1) :-
  Vol(V, _, _, Dp, Hp, D, _, A),
  Vol(_, _, _, _, _, A, Ha, Aa),
  A = Aa,
  D = Dp,
  A != D.

// Règle pour les vols avec une connexion
TrajetAvecConnexion(D, A, Dp, Hp, Aa, Ha, N+1) :-
  Trajet(D, X, Dp, Hp, Da, Ha, N),
  Trajet(X, A, Da, Ha, Aa, _ , N),
  A != D.

// Exécution de la requête
? Trajet(D, A, Dp, Hp, Aa, Ha, N) :- Trajet(D, A, Dp, Hp, Aa, Ha, N), N mod 2 = 1.
```



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
Pour cet exercice, vous pouvez utiliser AbcDatalog, une impl ́ementation de Datalog dispo-
nible `a l’adresse suivante : https://abcdatalog.seas.harvard.edu/. Cette implementation
est simple a utiliser, mais certaines fonctionnalités ne sont pas disponibles, comme les
operations de comparaison telles que ≥ ou ≤. Toutefois, vous pouvez toujours definir un
prédicat, par exemple plusPetit(1, 2) pour dire que 1 est plus petit que 2. Vous pouvez
telecharger le fichier .jar correspondant depuis CELENE, sur le site de notre SAE. Avant de
commencer, nous vous recommandons de lire attentivement les instructions sur la syntaxe
de cette implémentation sur le site web d’AbcDatalog.
Considérons la base de donnees VOL qui contient des informations sur les vols directs.
1. Identifiez quels sont les prédicats extensionnels de votre base de données déductive.
2. Ecrivez un programme Datalog qui permet de lister toutes les villes connectées par des
vols (directs ou avec connexions) possibles a partir de d’une instance de la base VOL
donnée. Les horaires de départ et d’arrivée du trajet complet doivent etre indiqués.
3.  Ecrivez un programme Datalog qui permet de lister toutes les villes connectées par
des vols avec un nombre impair de connexions. Les horaires de départ et d’arrivée du trajet complet doivent être indiqués





AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
Les prédicats extensionnels sont les prédicats de base qui décrivent les faits dans une base de données déductive. Pour identifier les prédicats extensionnels dans la base de données VOL, on se réfère aux tables créées. Voici les prédicats extensionnels correspondant à ces tables :

    adresse(ID, Rue, Ville, Pays) : Représente l'objet Adresse avec un identifiant unique ID, une rue, une ville et un pays.
    passager(ID, Nom, Prenom, AdresseID) : Représente l'objet Passager avec un identifiant unique ID, un nom, un prénom et l'identifiant de l'adresse du passager.
    reservation(ID, DateReservation, PassagerID) : Représente l'objet Reservation avec un identifiant unique ID, une date de réservation et l'identifiant du passager concerné.
    aeroport(ID, NomAeroport, AdresseID, Terminal) : Représente l'objet Aeroport avec un identifiant unique ID, un nom d'aéroport, l'identifiant de l'adresse de l'aéroport et un terminal.
    compagnieAerienne(ID, NomCompagnie, AdresseID) : Représente l'objet CompagnieAerienne avec un identifiant unique ID, un nom de compagnie aérienne et l'identifiant de l'adresse de la compagnie.
    vol(ID, CompagnieID, Numero, DateDepart, HeureDepart, AeroportDepartID, DateArrivee, HeureArrivee, AeroportArriveeID, ReservationID) : Représente l'objet Vol avec un identifiant unique ID, l'identifiant de la compagnie aérienne, un numéro de vol, les dates et heures de départ et d'arrivée, les identifiants des aéroports de départ et d'arrivée, et l'identifiant de la réservation associée.

Ces prédicats extensionnels servent de base pour définir les prédicats intensionnels (règles déductives) dans le système Datalog.

```
% Les faits de base (prédicats extensionnels) sont supposés remplis.

% Direct flight connection
directConnection(OriginCity, DestinationCity, DepartureTime, ArrivalTime) :-
    vol(VolID, _, _, DepartureTime, _, OriginAeroportID, ArrivalTime, _, DestinationAeroportID, _),
    aeroport(OriginAeroportID, _, OriginAddressID, _),
    adresse(OriginAddressID, _, OriginCity, _),
    aeroport(DestinationAeroportID, _, DestinationAddressID, _),
    adresse(DestinationAddressID, _, DestinationCity, _).

% Recursive rule to find connected flights (direct or with connections)
connectedCities(OriginCity, DestinationCity, DepartureTime, ArrivalTime) :-
    directConnection(OriginCity, DestinationCity, DepartureTime, ArrivalTime).
connectedCities(OriginCity, DestinationCity, DepartureTime, FinalArrivalTime) :-
    directConnection(OriginCity, IntermediateCity, DepartureTime, ArrivalTime),
    connectedCities(IntermediateCity, DestinationCity, NextDepartureTime, FinalArrivalTime),
    ArrivalTime < NextDepartureTime.

% Query to list all connected cities
% connectedCities(OriginCity, DestinationCity, DepartureTime, ArrivalTime).
```


```
% Les faits de base (prédicats extensionnels) sont supposés remplis.

% Direct flight connection
directConnection(OriginCity, DestinationCity, DepartureTime, ArrivalTime) :-
    vol(VolID, _, _, DepartureTime, _, OriginAeroportID, ArrivalTime, _, DestinationAeroportID, _),
    aeroport(OriginAeroportID, _, OriginAddressID, _),
    adresse(OriginAddressID, _, OriginCity, _),
    aeroport(DestinationAeroportID, _, DestinationAddressID, _),
    adresse(DestinationAddressID, _, DestinationCity, _).

% Recursive rule to find connected flights (direct or with connections)
connectedCities(OriginCity, DestinationCity, DepartureTime, ArrivalTime, Connections) :-
    directConnection(OriginCity, DestinationCity, DepartureTime, ArrivalTime),
    Connections = 1.
connectedCities(OriginCity, DestinationCity, DepartureTime, FinalArrivalTime, Connections) :-
    directConnection(OriginCity, IntermediateCity, DepartureTime, ArrivalTime),
    connectedCities(IntermediateCity, DestinationCity, NextDepartureTime, FinalArrivalTime, NextConnections),
    ArrivalTime < NextDepartureTime,
    Connections = NextConnections + 1.

% Rule to find connected cities with an odd number of connections
oddConnections(OriginCity, DestinationCity, DepartureTime, ArrivalTime) :-
    connectedCities(OriginCity, DestinationCity, DepartureTime, ArrivalTime, Connections),
    Connections mod 2 = 1.

% Query to list all connected cities with an odd number of connections
% oddConnections(OriginCity, DestinationCity, DepartureTime, ArrivalTime).
```