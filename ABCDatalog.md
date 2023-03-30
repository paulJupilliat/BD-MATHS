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