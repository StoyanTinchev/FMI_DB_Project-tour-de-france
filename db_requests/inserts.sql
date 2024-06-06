-- Use the TourDeFrance database

-- Insert data into the Teams table
INSERT INTO team (registration_number, name, country)
VALUES (1, 'Team Sky', 'UK'),
       (2, 'Movistar Team', 'Spain'),
       (3, 'Bora-Hansgrohe', 'Germany');

-- Insert data into the Cyclists table
INSERT INTO cyclist (registration_number, name, birth_date, nationality, team_registration_number)
VALUES (101, 'Chris Froome', '1985-05-20', 'British', 1),
       (102, 'Alejandro Valverde', '1980-04-25', 'Spanish', 2),
       (103, 'Peter Sagan', '1990-01-26', 'Slovak', 3);

-- Insert data into the Stages table
INSERT INTO stage (number, date, start_point, end_point, length)
VALUES (1, '2024-07-01', 'Nice', 'Nice', 156.5),
       (2, '2024-07-02', 'Nice', 'Sisteron', 186.0),
       (3, '2024-07-03', 'Sisteron', 'Orcieres-Merlette', 157.0);

-- Insert data into the Results table
INSERT INTO result (cyclist_registration_number, stage_number, stage_time, total_time, stage_ranking)
VALUES (101, 1, '04:00:00', '04:00:00', 1),
       (102, 1, '04:10:00', '04:10:00', 2),
       (103, 1, '04:20:00', '04:20:00', 3),
       (101, 2, '05:00:00', '09:00:00', 2),
       (102, 2, '04:50:00', '09:00:00', 1),
       (103, 2, '05:10:00', '09:30:00', 3),
       (101, 3, '03:30:00', '12:30:00', 1),
       (102, 3, '03:40:00', '12:40:00', 2),
       (103, 3, '03:50:00', '13:20:00', 3);

-- Insert data into the Participates table
INSERT INTO participates (cyclist_registration_number, stage_number)
VALUES (101, 1),
       (102, 1),
       (103, 1),
       (101, 2),
       (102, 2),
       (103, 2),
       (101, 3),
       (102, 3),
       (103, 3);

INSERT INTO cyclist (registration_number, name, birth_date, nationality, team_registration_number)
VALUES (104, 'Christian Vassikov', '2003-12-21', 'Bulgarian', 2);

