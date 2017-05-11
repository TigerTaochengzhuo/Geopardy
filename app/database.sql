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
INSERT INTO Answers VALUES( null, 'The first ever church was built here.', 'AM', 2, 0, 0);
INSERT INTO Answers VALUES( null, 'Most of our population are made up of farmers.', 'BD', 2, 0, 0);
INSERT INTO Answers VALUES( null, 'I am the largest coffee producer.', 'BR', 2, 0, 0);
INSERT INTO Answers VALUES( null, 'We consume the most mac and cheese than any other country.', 'CA', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'I have the largest desert in the world.', 'AQ', 2, 0, 0);
INSERT INTO Answers VALUES( null, 'I do not have different seasons at all.', 'CO', 3, 0, 0;
INSERT INTO Answers VALUES( null, 'We (in Ancient Times), used to shave our eyebrows to mourn our beloved cats.', 'EG', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'The oldest skeleton was found here.', 'ET', 4, 0, 0);
INSERT INTO Answers VALUES( null, 'We have more saunas than cars.', 'FI', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'You can marry a dead person here.', 'FR', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'It is illegal to run out fuel on a highway', 'DE', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'Marble is mainly produced here.', 'GR', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'The first ever chocolate bar was made here.', 'GT', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'We have the largest dog cementery.', 'IL', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'We are the largest wine producers in the world.' 3, 0, 0);
INSERT INTO Answers VALUES( null, 'We have more pets than children.', 'JP', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'Artists can pay their taxes with their artwork here.', 'MX', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'We have the highest gasoline price in the world.', 'NO', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'We produced the most amount of coconuts.', 'PH', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'It has only snowed once here.', 'CU', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'We have taxes for owning a dog', 'CH', 4, 0, 0);
INSERT INTO Answers VALUES( null, 'Our old name was Santo Domingo', 'DO', 2, 0, 0);
INSERT INTO Answers VALUES( null, 'We are the only Latin country that has troops in Iraq.', 'SV', 4, 0, 0);
INSERT INTO Answers VALUES( null, 'Salutations are important etiquette for us.', 'GD', 4, 0, 0);
INSERT INTO Answers VALUES( null, '80% of our land mass is mostly glaciers and ice caps.' , 'GL', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'Home of heavy metal.' , 'FI', 3, 0 , 0);
INSERT INTO Answers VALUES( null, 'We have a spa just for elephants.' , 'IN', 3, 0, 0);
INSERT INTO Answers VALUES( null, 'Rum is our national drink.', 'JM', 2, 0, 0);
INSERT INTO Answers VALUES( null, 'We are landlocked, we do not have full access to the sea.' , 'MK' , 4, 0, 0);
INSERT INTO Answers VALUES( null, 'The border between U.S.A. and me is the second largest bored in the world' , 'MX' , 2, 0, 0);
INSERT INTO Answers VALUES( null, 'If you own a television here, you must pay annual licensing fee.' , 'NO' , 3, 0, 0);
INSERT INTO Answers VALUES( null, 'Our streets are paved with gold' , 'PR' , 2, 0 , 0);
INSERT INTO Answers VALUES( null,)