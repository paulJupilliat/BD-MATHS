INSERT INTO
    CompagnieAerienneTable
VALUES (
        CompagnieAerienne(
            1,
            'Air France',
            AdresseArray(
                Adresse(
                    '1 rue de la Paix',
                    'Paris',
                    'France'
                ),
                Adresse(
                    '10 Downing Street',
                    'Londres',
                    'Royaume-Uni'
                )
            )
        )
    );

INSERT INTO
    CompagnieAerienneTable
VALUES (
        CompagnieAerienne(
            2,
            'British Airways',
            AdresseArray(
                Adresse(
                    '10 Downing Street',
                    'Londres',
                    'Royaume-Uni'
                ),
                Adresse(
                    '1 rue de la Paix',
                    'Paris',
                    'France'
                )
            )
        )
    );

INSERT INTO AeroportTable
VALUES (
        Aeroport(
            1,
            'Charles de Gaulle',
            AdresseArray(
                Adresse(
                    '95700 Roissy-en-France',
                    'Roissy',
                    'France'
                ),
                Adresse(
                    'Rue du Luxembourg',
                    'Bruxelles',
                    'Belgique'
                )
            ),
            'Terminal 2E'
        )
    );

INSERT INTO AeroportTable
VALUES (
        Aeroport(
            2,
            'Heathrow',
            AdresseArray(
                Adresse(
                    'Longford, Hounslow TW6',
                    'Londres',
                    'Royaume-Uni'
                ),
                Adresse(
                    '95700 Roissy-en-France',
                    'Roissy',
                    'France'
                )
            ),
            'Terminal 5'
        )
    );

INSERT INTO PassagerTable
VALUES (
        Passager(
            'Doe',
            'John',
            AdresseArray(
                Adresse(
                    '10 Downing Street',
                    'Londres',
                    'Royaume-Uni'
                ),
                Adresse(
                    '1 rue de la Paix',
                    'Paris',
                    'France'
                )
            )
        )
    );

INSERT INTO PassagerTable
VALUES (
        Passager(
            'Smith',
            'Jane',
            AdresseArray(
                Adresse(
                    'Rue du Luxembourg',
                    'Bruxelles',
                    'Belgique'
                ),
                Adresse(
                    'Longford, Hounslow TW6',
                    'Londres',
                    'Royaume-Uni'
                )
            )
        )
    );

INSERT INTO ReservationTable
VALUES (
        Reservation(
            1,
            TO_DATE('2022-01-01', 'YYYY-MM-DD'),
            PassagerArray(
                Passager(
                    'Doe',
                    'John',
                    AdresseArray(
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        )
                    )
                ),
                Passager(
                    'Smith',
                    'Jane',
                    AdresseArray(
                        Adresse(
                            'Rue du Luxembourg',
                            'Bruxelles',
                            'Belgique'
                        ),
                        Adresse(
                            'Longford, Hounslow TW6',
                            'Londres',
                            'Royaume-Uni'
                        )
                    )
                )
            )
        )
    );

INSERT INTO ReservationTable
VALUES (
        Reservation(
            2,
            TO_DATE('2022-02-01', 'YYYY-MM-DD'),
            PassagerArray(
                Passager(
                    'Doe',
                    'John',
                    AdresseArray(
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        )
                    )
                ),
                Passager(
                    'Brown',
                    'Emily',
                    AdresseArray(
                        Adresse(
                            '123 Main St',
                            'New York',
                            'États-Unis'
                        ),
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        )
                    )
                )
            )
        )
    );

INSERT INTO VolTable
VALUES (
        Vol(
            1,
            CompagnieAerienneArray(
                CompagnieAerienne(
                    1,
                    'Air France',
                    AdresseArray(
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        ),
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        )
                    )
                )
            ),
            1234,
            TO_DATE('2022-01-01', 'YYYY-MM-DD'),
            TO_DATE('14:00', 'HH24:MI'),
            AeroportArray(
                Aeroport(
                    1,
                    'Charles de Gaulle',
                    AdresseArray(
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        ),
                        Adresse(
                            'Rue du Luxembourg',
                            'Bruxelles',
                            'Belgique'
                        )
                    ),
                    'Terminal 2E'
                )
            ),
            TO_DATE('2022-01-01', 'YYYY-MM-DD'),
            TO_DATE('16:00', 'HH24:MI'),
            AeroportArray(
                Aeroport(
                    2,
                    'Heathrow',
                    AdresseArray(
                        Adresse(
                            'Longford, Hounslow TW6',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        )
                    ),
                    'Terminal 5'
                )
            ),
            ReservationArray(
                Reservation(
                    1,
                    TO_DATE('2022-01-01', 'YYYY-MM-DD'),
                    PassagerArray(
                        Passager(
                            'Doe',
                            'John',
                            AdresseArray(
                                Adresse(
                                    '10 Downing Street',
                                    'Londres',
                                    'Royaume-Uni'
                                ),
                                Adresse(
                                    '1 rue de la Paix',
                                    'Paris',
                                    'France'
                                )
                            )
                        ),
                        Passager(
                            'Smith',
                            'Jane',
                            AdresseArray(
                                Adresse(
                                    'Rue du Luxembourg',
                                    'Bruxelles',
                                    'Belgique'
                                ),
                                Adresse(
                                    'Longford, Hounslow TW6',
                                    'Londres',
                                    'Royaume-Uni'
                                )
                            )
                        )
                    )
                )
            )
        )
    );

INSERT INTO VolTable
VALUES (
        Vol(
            2,
            CompagnieAerienneArray(
                CompagnieAerienne(
                    2,
                    'British Airways',
                    AdresseArray(
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        )
                    )
                )
            ),
            5678,
            TO_DATE('2022-02-01', 'YYYY-MM-DD'),
            TO_DATE('10:00', 'HH24:MI'),
            AeroportArray(
                Aeroport(
                    2,
                    'Heathrow',
                    AdresseArray(
                        Adresse(
                            'Longford, Hounslow TW6',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        )
                    ),
                    'Terminal 5'
                )
            ),
            TO_DATE('2022-02-01', 'YYYY-MM-DD'),
            TO_DATE('12:00', 'HH24:MI'),
            AeroportArray(
                Aeroport(
                    1,
                    'Charles de Gaulle',
                    AdresseArray(
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        ),
                        Adresse(
                            'Rue du Luxembourg',
                            'Bruxelles',
                            'Belgique'
                        )
                    ),
                    'Terminal 2E'
                )
            ),
            ReservationArray(
                Reservation(
                    2,
                    TO_DATE('2022-02-01', 'YYYY-MM-DD'),
                    PassagerArray(
                        Passager(
                            'Doe',
                            'John',
                            AdresseArray(
                                Adresse(
                                    '10 Downing Street',
                                    'Londres',
                                    'Royaume-Uni'
                                ),
                                Adresse(
                                    '1 rue de la Paix',
                                    'Paris',
                                    'France'
                                )
                            )
                        ),
                        Passager(
                            'Brown',
                            'Emily',
                            AdresseArray(
                                Adresse(
                                    '123 Main St',
                                    'New York',
                                    'États-Unis'
                                ),
                                Adresse(
                                    '10 Downing Street',
                                    'Londres',
                                    'Royaume-Uni'
                                )
                            )
                        )
                    )
                )
            )
        )
    );

--a

INSERT INTO VolTable
VALUES (
        Vol(
            1,
            CompagnieAerienneArray(
                CompagnieAerienne(
                    1,
                    'Air France',
                    AdresseArray(
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        ),
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        )
                    )
                )
            ),
            123,
            TO_DATE('2023/04/15', 'YYYY/MM/DD'),
            TO_DATE('08:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    1,
                    'Charles de Gaulle',
                    AdresseArray(
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        ),
                        Adresse(
                            'Rue du Luxembourg',
                            'Bruxelles',
                            'Belgique'
                        )
                    ),
                    'Terminal 2E'
                )
            ),
            TO_DATE('2023/04/15', 'YYYY/MM/DD'),
            TO_DATE('11:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    2,
                    'Heathrow',
                    AdresseArray(
                        Adresse(
                            'Longford, Hounslow TW6',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        )
                    ),
                    'Terminal 5'
                )
            ),
            ReservationArray(
                Reservation(
                    1,
                    TO_DATE('2023/04/12', 'YYYY/MM/DD'),
                    PassagerArray(
                        Passager(
                            'Doe',
                            'John',
                            AdresseArray(
                                Adresse(
                                    '10 Downing Street',
                                    'Londres',
                                    'Royaume-Uni'
                                ),
                                Adresse(
                                    '1 rue de la Paix',
                                    'Paris',
                                    'France'
                                )
                            )
                        )
                    )
                )
            ),
            AdresseArray(
                Adresse(
                    '10 Downing Street',
                    'Londres',
                    'Royaume-Uni'
                ),
                Adresse(
                    '1 rue de la Paix',
                    'Paris',
                    'France'
                )
            ),
            VolArray()
        )
    );

--b

INSERT INTO VolTable
VALUES (
        Vol(
            2,
            CompagnieAerienneArray(
                CompagnieAerienne(
                    2,
                    'British Airways',
                    AdresseArray(
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        )
                    )
                )
            ),
            456,
            TO_DATE('2023/04/20', 'YYYY/MM/DD'),
            TO_DATE('13:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    3,
                    'JFK',
                    AdresseArray(
                        Adresse(
                            'Queens, New York',
                            'New York',
                            'USA'
                        ),
                        Adresse(
                            'Hounslow, Middlesex',
                            'Londres',
                            'Royaume-Uni'
                        )
                    ),
                    'Terminal 7'
                )
            ),
            TO_DATE('2023/04/20', 'YYYY/MM/DD'),
            TO_DATE('16:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    4,
                    'CDG',
                    AdresseArray(
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        ),
                        Adresse(
                            'JFK Airport, Queens',
                            'New York',
                            'USA'
                        )
                    ),
                    'Terminal 2D'
                )
            ),
            ReservationArray(),
            AdresseArray(
                Adresse(
                    'Hounslow, Middlesex',
                    'Londres',
                    'Royaume-Uni'
                ),
                Adresse(
                    '1 rue de la Paix',
                    'Paris',
                    'France'
                )
            ),
            VolArray(
                Vol(
                    1,
                    CompagnieAerienneArray(
                        CompagnieAerienne(
                            1,
                            'Air France',
                            AdresseArray(
                                Adresse(
                                    '1 rue de la Paix',
                                    'Paris',
                                    'France'
                                ),
                                Adresse(
                                    '10 Downing Street',
                                    'Londres',
                                    'Royaume-Uni'
                                )
                            )
                        )
                    ),
                    123,
                    TO_DATE('2023/04/15', 'YYYY/MM/DD'),
                    TO_DATE('08:00:00', 'HH24:MI:SS'),
                    AeroportArray(
                        Aeroport(
                            1,
                            'Charles de Gaulle',
                            AdresseArray(
                                Adresse(
                                    '95700 Roissy-en-France',
                                    'Roissy',
                                    'France'
                                ),
                                Adresse(
                                    'Rue du Luxembourg',
                                    'Bruxelles',
                                    'Belgique'
                                )
                            ),
                            'Terminal 2E'
                        )
                    ),
                    TO_DATE('2023/04/15', 'YYYY/MM/DD'),
                    TO_DATE('11:00:00', 'HH24:MI:SS'),
                    AeroportArray(
                        Aeroport(
                            2,
                            'Heathrow',
                            AdresseArray(
                                Adresse(
                                    'Longford, Hounslow TW6',
                                    'Londres',
                                    'Royaume-Uni'
                                ),
                                Adresse(
                                    '95700 Roissy-en-France',
                                    'Roissy',
                                    'France'
                                )
                            ),
                            'Terminal 5'
                        )
                    ),
                    ReservationArray(
                        Reservation(
                            1,
                            TO_DATE('2023/04/12', 'YYYY/MM/DD'),
                            PassagerArray(
                                Passager(
                                    'Doe',
                                    'John',
                                    AdresseArray(
                                        Adresse(
                                            '10 Downing Street',
                                            'Londres',
                                            'Royaume-Uni'
                                        ),
                                        Adresse(
                                            '1 rue de la Paix',
                                            'Paris',
                                            'France'
                                        )
                                    )
                                )
                            )
                        )
                    ),
                    AdresseArray(
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        )
                    ),
                    VolArray()
                )
            )
        )
    );

--c

INSERT INTO VolTable
VALUES (
        Vol(
            3,
            CompagnieAerienneArray(
                CompagnieAerienne(
                    3,
                    'Lufthansa',
                    AdresseArray(
                        Adresse(
                            'Wilhelmshaven',
                            'Allemagne',
                            'Allemagne'
                        ),
                        Adresse(
                            'Leipziger Platz',
                            'Berlin',
                            'Allemagne'
                        )
                    )
                )
            ),
            789,
            TO_DATE('2023/04/30', 'YYYY/MM/DD'),
            TO_DATE('10:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    3,
                    'Munich Airport',
                    AdresseArray(
                        Adresse(
                            'Nordallee 25',
                            '85356 München-Flughafen',
                            'Allemagne'
                        ),
                        Adresse(
                            'Kapellenstraße',
                            '80333 Munich',
                            'Allemagne'
                        )
                    ),
                    'Terminal 1'
                )
            ),
            TO_DATE('2023/04/30', 'YYYY/MM/DD'),
            TO_DATE('14:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    4,
                    'JFK',
                    AdresseArray(
                        Adresse(
                            'JFK Airport, Queens',
                            'New York',
                            'USA'
                        ),
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        )
                    ),
                    'Terminal 1'
                )
            ),
            ReservationArray(
                Reservation(
                    2,
                    TO_DATE('2023/04/12', 'YYYY/MM/DD'),
                    PassagerArray(
                        Passager(
                            'Doe',
                            'Jane',
                            AdresseArray(
                                Adresse(
                                    '10 Downing Street',
                                    'Londres',
                                    'Royaume-Uni'
                                ),
                                Adresse(
                                    '1 rue de la Paix',
                                    'Paris',
                                    'France'
                                )
                            )
                        ),
                        Passager(
                            'Smith',
                            'Adam',
                            AdresseArray(
                                Adresse(
                                    '1600 Pennsylvania Avenue NW',
                                    'Washington, DC',
                                    'USA'
                                ),
                                Adresse(
                                    '10 Downing Street',
                                    'Londres',
                                    'Royaume-Uni'
                                )
                            )
                        )
                    )
                )
            ),
            AdresseArray(
                Adresse(
                    'Leipziger Platz',
                    'Berlin',
                    'Allemagne'
                ),
                Adresse(
                    '1600 Pennsylvania Avenue NW',
                    'Washington, DC',
                    'USA'
                )
            ),
            VolArray(),
            IndiceQualiteArray(
                IndiceQualite('Ponctualité', 5, 0.5),
                IndiceQualite('Confort', 4, 0.2),
                IndiceQualite('Service', 3, 0.3)
            )
        )
    );

--d

INSERT INTO IndiceQualiteTable VALUES ('Ponctualité', 0.5);

INSERT INTO IndiceQualiteTable VALUES ('Confort', 0.2);

INSERT INTO IndiceQualiteTable VALUES ('Service', 0.3);

INSERT INTO VolTable
VALUES (
        Vol(
            4,
            CompagnieAerienneArray(
                CompagnieAerienne(
                    4,
                    'Air Canada',
                    AdresseArray(
                        Adresse(
                            '1100 Boulevard René-Lévesque O',
                            'Montréal',
                            'Canada'
                        ),
                        Adresse(
                            'Ottawa International Airport',
                            'Ottawa',
                            'Canada'
                        )
                    )
                )
            ),
            567,
            TO_DATE('2023/05/15', 'YYYY/MM/DD'),
            TO_DATE('14:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    5,
                    'YUL',
                    AdresseArray(
                        Adresse(
                            '1100 Boulevard René-Lévesque O',
                            'Montréal',
                            'Canada'
                        ),
                        Adresse(
                            'Rue Saint-Antoine O',
                            'Montréal',
                            'Canada'
                        )
                    ),
                    'Terminal 1'
                )
            ),
            TO_DATE('2023/05/15', 'YYYY/MM/DD'),
            TO_DATE('16:30:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    6,
                    'YOW',
                    AdresseArray(
                        Adresse(
                            '1000 Airport Parkway Private',
                            'Ottawa',
                            'Canada'
                        ),
                        Adresse(
                            'Downtown Ottawa',
                            'Ottawa',
                            'Canada'
                        )
                    ),
                    'Terminal'
                )
            ),
            ReservationArray(
                Reservation(
                    3,
                    TO_DATE('2023/04/12', 'YYYY/MM/DD'),
                    PassagerArray(
                        Passager(
                            'Johnson',
                            'Mary',
                            AdresseArray(
                                Adresse(
                                    '1 Wall Street',
                                    'New York',
                                    'USA'
                                ),
                                Adresse(
                                    '1100 Boulevard René-Lévesque O',
                                    'Montréal',
                                    'Canada'
                                )
                            )
                        ),
                        Passager(
                            'Brown',
                            'David',
                            AdresseArray(
                                Adresse(
                                    '1600 Pennsylvania Avenue NW',
                                    'Washington, DC',
                                    'USA'
                                ),
                                Adresse(
                                    '1 Wall Street',
                                    'New York',
                                    'USA'
                                )
                            )
                        )
                    )
                )
            ),
            AdresseArray(
                Adresse(
                    'Ottawa International Airport',
                    'Ottawa',
                    'Canada'
                ),
                Adresse(
                    'Rue Saint-Antoine O',
                    'Montréal',
                    'Canada'
                )
            ),
            VolArray(),
            IndiceQualiteArray(
                IndiceQualite('Ponctualité', 4, 0.5),
                IndiceQualite('Confort', 3, 0.2),
                IndiceQualite('Service', 5, 0.3)
            )
        )
    );

INSERT INTO VolTable
VALUES (
        Vol(
            5,
            CompagnieAerienneArray(
                CompagnieAerienne(
                    1,
                    'Air France',
                    AdresseArray(
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        ),
                        Adresse(
                            '10 Downing Street',
                            'Londres',
                            'Royaume-Uni'
                        )
                    )
                )
            ),
            234,
            TO_DATE('2023/05/25', 'YYYY/MM/DD'),
            TO_DATE('10:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    7,
                    'Charles de Gaulle',
                    AdresseArray(
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        ),
                        Adresse(
                            '1 rue de la Paix',
                            'Paris',
                            'France'
                        )
                    ),
                    'Terminal 2'
                )
            ),
            TO_DATE('2023/05/25', 'YYYY/MM/DD'),
            TO_DATE('16:00:00', 'HH24:MI:SS'),
            AeroportArray(
                Aeroport(
                    8,
                    'Heathrow',
                    AdresseArray(
                        Adresse(
                            'Longford, Hounslow',
                            'Londres',
                            'Royaume-Uni'
                        ),
                        Adresse(
                            '95700 Roissy-en-France',
                            'Roissy',
                            'France'
                        )
                    ),
                    'Terminal 5'
                )
            ),
            ReservationArray(
                Reservation(
                    4,
                    TO_DATE('2023/04/18', 'YYYY/MM/DD'),
                    PassagerArray(
                        Passager(
                            'Garcia',
                            'Juan',
                            AdresseArray(
                                Adresse(
                                    'Gran Via, 123',
                                    'Madrid',
                                    'Espagne'
                                ),
                                Adresse(
                                    '27 rue Saint Guillaume',
                                    'Paris',
                                    'France'
                                )
                            )
                        ),
                        Passager(
                            'Silva',
                            'Maria',
                            AdresseArray(
                                Adresse(
                                    'Rua das Flores, 50',
                                    'Lisbonne',
                                    'Portugal'
                                ),
                                Adresse(
                                    'Gran Via, 123',
                                    'Madrid',
                                    'Espagne'
                                )
                            )
                        ),
                        Passager(
                            'Rossi',
                            'Giovanni',
                            AdresseArray(
                                Adresse(
                                    'Via del Corso, 60',
                                    'Rome',
                                    'Italie'
                                ),
                                Adresse(
                                    'Gran Via, 123',
                                    'Madrid',
                                    'Espagne'
                                )
                            )
                        )
                    )
                )
            ),
            AdresseArray(
                Adresse(
                    '10 Downing Street',
                    'Londres',
                    'Royaume-Uni'
                ),
                Adresse(
                    'Longford, Hounslow',
                    'Londres',
                    'Royaume-Uni'
                )
            ),
            VolArray(),
            IndiceQualiteArray(
                IndiceQualite('Ponctualité', 3, 0.5),
                IndiceQualite('Confort', 4, 0.2),
                IndiceQualite('Service', 5, 0.3)
            )
        )
    );