DROP DATABASE IF EXISTS geopardy;

CREATE DATABASE geopardy;

USE geopardy;

CREATE TABLE Answers (
    answerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    answerText VARCHAR(500) NOT NULL,
    country VARCHAR(2) NOT NULL,
    difficulty INT NOT NULL,
    totalCount INT NOT NULL,
    correctCount INT NOT NULL
);

CREATE TABLE Users (
    userID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(500) NOT NULL,
    password VARCHAR(500) NOT NULL
);

CREATE TABLE Scores (
    name VARCHAR(10) NOT NULL DEFAULT 'Anonymous' PRIMARY KEY,
    score INT(5) UNSIGNED NOT NULL DEFAULT '0',
    ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO Answers VALUES( null, 'I have the longest wall.', 'CN', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I am the home to the worlds largest building.', 'AE', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I produce the most oil.', 'SA', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the most time zones.', 'FR', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the most billionaires.', 'US', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the best economy.', 'CH', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the longest street.', 'CA', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have invented french fries.', 'BE', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I am the only country to be named after a tree.', 'BR', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I consume more coca-cola than any other country.', 'IS', 1, 0, 0);
