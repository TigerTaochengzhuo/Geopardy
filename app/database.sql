DROP DATABASE IF EXISTS geopardy;

CREATE DATABASE geopardy;

USE geopardy;

CREATE TABLE Answers (
    answerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    answerText VARCHAR(500) NOT NULL,
    country VARCHAR(2) NOT NULL,
    difficulty INT NOT NULL
);

CREATE TABLE Users (
    userID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(10) NOT NULL,
    password VARCHAR(10) NOT NULL
);

CREATE TABLE Games (
    gameID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    score INT NOT NULL,
    startTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    endTime TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE GameAnswers (
    gameID INT NOT NULL,
    answerID INT NOT NULL,
    country VARCHAR(2) DEFAULT NULL,
    isCorrect INT NOT NULL DEFAULT 0,
    FOREIGN KEY (gameID) REFERENCES Games(gameID),
    FOREIGN KEY (answerID) REFERENCES Answers(answerID)
);


INSERT INTO Answers VALUES( null, 'I have the longest wall.', 'CN', 1);
INSERT INTO Answers VALUES( null, 'I am the home to the worlds largest building.', 'AE', 1);
INSERT INTO Answers VALUES( null, 'I produce the most oil.', 'SA', 1);
INSERT INTO Answers VALUES( null, 'I have the most time zones.', 'FR', 1);
INSERT INTO Answers VALUES( null, 'I have the most billionaires.', 'US', 1);
INSERT INTO Answers VALUES( null, 'I have the best economy.', 'CH', 1);
INSERT INTO Answers VALUES( null, 'I have the longest street.', 'CA', 1);
INSERT INTO Answers VALUES( null, 'I have invented french fries.', 'BE', 1);
INSERT INTO Answers VALUES( null, 'I am the only country to be named after a tree.', 'BR', 1);
INSERT INTO Answers VALUES( null, 'I consume more coca-cola than any other country.', 'IS', 1);
