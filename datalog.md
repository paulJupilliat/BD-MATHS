les prédicats : 

```
% La base de données VOL contient des informations sur les vols directs.
% Les faits dans la base de données sont des vols directs avec les heures de départ et d'arrivée.

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
% Les faits dans la base de données sont des vols directs avec les heures de départet d'arrivée.

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



```
% Villes directement connectées
ville_directe(Ville1, Ville2) :-
    vol_direct(Ville1, Ville2, _, _).

% Villes connectées via une escale
ville_escale(Ville1, Ville2) :-
    vol_connecte(Ville1, Ville2, _, _).

% Toutes les villes connectées (directement ou via une escale)
ville_connectee(Ville1, Ville2) :-
    ville_directe(Ville1, Ville2).
ville_connectee(Ville1, Ville2) :-
    ville_escale(Ville1, Ville2).

% Requête pour obtenir la liste de toutes les villes connectées
?- ville_connectee(Depart, Arrivee).





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

```
% Villes directement connectées
ville_directe(Ville1, Ville2) :-
    vol_direct(Ville1, Ville2, _, _).

% Villes connectées via une escale
ville_escale(Ville1, Ville2) :-
    vol_connecte(Ville1, Ville2, _, _).

% Villes connectées avec un nombre impair de connexions
ville_impair(Ville1, Ville2) :-
    vol_impair(Ville1, Ville2, _, _).

% Requête pour obtenir la liste de toutes les villes connectées avec un nombre impair de connexions
?- ville_impair(Depart, Arrivee).
```
ville_directe(Ville1, Ville2) :- vol_direct(Ville1, Ville2, _, _).
ville_escale(Ville1, Ville2) :- vol_connecte(Ville1, Ville2, _, _).
ville_impair(Ville1, Ville2) :- vol_direct(Ville1, Ville2, _, _).
ville_impair(Ville1, Ville2) :- vol_direct(Ville1, Ville3, _, _), ville_impair(Ville3, Ville2), Ville1 != Ville2.