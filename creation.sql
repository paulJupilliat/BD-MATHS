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
