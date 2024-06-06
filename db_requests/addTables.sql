-- Create the Cyclists table


-- Create the Teams table
CREATE TABLE Teams (
    registration_number INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE Cyclists (
    registration_number INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    team_registration_number INT,
    FOREIGN KEY (team_registration_number) REFERENCES Teams(registration_number)
);


-- Create the Stages table
CREATE TABLE Stages (
    number INT PRIMARY KEY,
    date DATE NOT NULL,
    start_point VARCHAR(100) NOT NULL,
    end_point VARCHAR(100) NOT NULL,
    length DECIMAL(5,2) NOT NULL
);

-- Create the Results table
CREATE TABLE Results (
    cyclist_registration_number INT,
    stage_number INT,
    stage_time TIME NOT NULL,
    total_time TIME NOT NULL,
    stage_ranking INT NOT NULL,
    PRIMARY KEY (cyclist_registration_number, stage_number),
    FOREIGN KEY (cyclist_registration_number) REFERENCES Cyclists(registration_number),
    FOREIGN KEY (stage_number) REFERENCES Stages(number)
);

-- Create the Participates table to represent the many-to-many relationship between Cyclists and Stages
CREATE TABLE Participates (
    cyclist_registration_number INT,
    stage_number INT,
    PRIMARY KEY (cyclist_registration_number, stage_number),
    FOREIGN KEY (cyclist_registration_number) REFERENCES Cyclists(registration_number),
    FOREIGN KEY (stage_number) REFERENCES Stages(number)
);

