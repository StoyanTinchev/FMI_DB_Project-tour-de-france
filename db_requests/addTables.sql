-- Create the team table
CREATE TABLE team (
    registration_number INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Create the cyclist table
CREATE TABLE cyclist (
    registration_number INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    team_registration_number INT,
    FOREIGN KEY (team_registration_number) REFERENCES team(registration_number)
);


-- Create the stage table
CREATE TABLE stage (
    number INT PRIMARY KEY,
    date DATE NOT NULL,
    start_point VARCHAR(100) NOT NULL,
    end_point VARCHAR(100) NOT NULL,
    length DECIMAL(5,2) NOT NULL
);

-- Create the result table
CREATE TABLE result (
    cyclist_registration_number INT,
    stage_number INT,
    stage_time TIME NOT NULL,
    total_time TIME NOT NULL,
    stage_ranking INT NOT NULL,
    PRIMARY KEY (cyclist_registration_number, stage_number),
    FOREIGN KEY (cyclist_registration_number) REFERENCES cyclist(registration_number),
    FOREIGN KEY (stage_number) REFERENCES stage(number)
);

-- Create the participates table to represent the many-to-many relationship between cyclist and stage
CREATE TABLE participates (
    cyclist_registration_number INT,
    stage_number INT,
    PRIMARY KEY (cyclist_registration_number, stage_number),
    FOREIGN KEY (cyclist_registration_number) REFERENCES cyclist(registration_number),
    FOREIGN KEY (stage_number) REFERENCES stage(number)
);

