DROP DATABASE IF EXISTS geopardy;

CREATE DATABASE geopardy;

CREATE TABLE Answers (
    answerID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    answerText VAR_CHAR(500) NOT NULL,
    country VAR_CHAR(2) NOT NULL,
    difficulty INT NOT NULL,
    totalCount INT NOT NULL,
    correctCount INT NOT NULL
);

INSERT INTO Answers VALUES( null, 'I have the longest wall.', 'CN', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I am the home to the worlds largest building.', 'AX', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I produce the most oil.', 'SA', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the most time zones.', 'FR', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the most billionaires.', 'US', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the best econnomy.', 'CH', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the longest wall.', 'CN', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the longest wall.', 'CN', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the longest wall.', 'CN', 1, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the longest wall.', 'CN', 1, 0, 0);