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
INSERT INTO Answers VALUES( null, 'I am the home to the worlds largest building.', 'AE', 3);
INSERT INTO Answers VALUES( null, 'I produce the most oil.', 'SA', 2);
INSERT INTO Answers VALUES( null, 'I have the most time zones.', 'FR', 3);
INSERT INTO Answers VALUES( null, 'I have the most billionaires.', 'US', 1);
INSERT INTO Answers VALUES( null, 'I have the best economy.', 'CH', 3);
INSERT INTO Answers VALUES( null, 'I have the longest street.', 'CA', 3);
INSERT INTO Answers VALUES( null, 'I have invented french fries.', 'BE', 1);
INSERT INTO Answers VALUES( null, 'I am the only country to be named after a tree.', 'BR', 2);
INSERT INTO Answers VALUES( null, 'I consume more coca-cola than any other country.', 'IS', 2);
INSERT INTO Answers VALUES( null, 'I am the home to the worlds largest building.', 'AE', 1);
INSERT INTO Answers VALUES( null, 'I produce the most oil.', 'SA', 1);
INSERT INTO Answers VALUES( null, 'I have the most time zones.', 'FR', 1);
INSERT INTO Answers VALUES( null, 'I have the most billionaires.', 'US', 1);
INSERT INTO Answers VALUES( null, 'I have the best econnomy.', 'CH', 1);
INSERT INTO Answers VALUES( null, 'The first ever church was built here.', 'AM', 2);
INSERT INTO Answers VALUES( null, 'Most of our population are made up of farmers.', 'BD', 2);
INSERT INTO Answers VALUES( null, 'I am the largest coffee producer.', 'BR', 20);
INSERT INTO Answers VALUES( null, 'We consume the most mac and cheese than any other country.', 'CA', 3);
INSERT INTO Answers VALUES( null, 'I have the largest desert in the world.', 'AQ', 2);
INSERT INTO Answers VALUES( null, 'I do not have different seasons at all.', 'CO', 3);
INSERT INTO Answers VALUES( null, 'We (in Ancient Times), used to shave our eyebrows to mourn our beloved cats.', 'EG', 3);
INSERT INTO Answers VALUES( null, 'The oldest skeleton was found here.', 'ET', 4);
INSERT INTO Answers VALUES( null, 'We have more saunas than cars.', 'FI', 3);
INSERT INTO Answers VALUES( null, 'You can marry a dead person here.', 'FR', 3);
INSERT INTO Answers VALUES( null, 'It is illegal to run out fuel on a highway', 'DE', 3);
INSERT INTO Answers VALUES( null, 'Marble is mainly produced here.', 'GR', 3);
INSERT INTO Answers VALUES( null, 'The first ever chocolate bar was made here.', 'GT', 3);
INSERT INTO Answers VALUES( null, 'We have the largest dog cementery.', 'IL', 3);
INSERT INTO Answers VALUES( null, 'We are the largest wine producers in the world.', 'FR', 1);
INSERT INTO Answers VALUES( null, 'We have more pets than children.', 'JP', 3);
INSERT INTO Answers VALUES( null, 'Artists can pay their taxes with their artwork here.', 'MX', 3);
INSERT INTO Answers VALUES( null, 'We have the highest gasoline price in the world.', 'NO', 3);
INSERT INTO Answers VALUES( null, 'We produced the most amount of coconuts.', 'PH', 3);
INSERT INTO Answers VALUES( null, 'It has only snowed once here.', 'CU', 3);
INSERT INTO Answers VALUES( null, 'We have taxes for owning a dog', 'CH', 4);
INSERT INTO Answers VALUES( null, 'Our old name was Santo Domingo', 'DO', 2);
INSERT INTO Answers VALUES( null, 'We are the only Latin country that has troops in Iraq.', 'SV', 4);
INSERT INTO Answers VALUES( null, 'Salutations are important etiquette for us.', 'GD', 4);
INSERT INTO Answers VALUES( null, '80% of our land mass is mostly glaciers and ice caps.' , 'GL', 3);
INSERT INTO Answers VALUES( null, 'Home of heavy metal.' , 'FI', 3);
INSERT INTO Answers VALUES( null, 'We have a spa just for elephants.' , 'IN', 3);
INSERT INTO Answers VALUES( null, 'Rum is our national drink.', 'JM', 2);
INSERT INTO Answers VALUES( null, 'The border between U.S.A. and I is the second largest boarder in the world', 'MX' , 2);
INSERT INTO Answers VALUES( null, 'If you own a television here, you must pay annual licensing fee.', 'NO' , 3);
INSERT INTO Answers VALUES( null, 'Our streets are paved with gold', 'PR' , 2);
INSERT INTO Answers VALUES( null, 'I have the longest street.', 'CA', 1);

