-- credits: André Restivo https://web.fe.up.pt/~arestivo

CREATE TABLE airport (
  airportcod integer PRIMARY KEY,
  name varchar,
  city varchar,
  country varchar
);
 
CREATE TABLE model (
        modelcod integer PRIMARY KEY,
        make varchar,
        version varchar,
        engines integer
);
 
CREATE TABLE plane (
        planecod integer PRIMARY KEY,
        name character varying(30),
        modelcod integer REFERENCES model
);
 
CREATE TABLE flight (
        flightcod integer PRIMARY KEY,
        fromairportcod integer REFERENCES airport,
        toairportcod integer REFERENCES airport,
        company character varying(10),
        duration integer,
        planecod integer REFERENCES plane
);
 
INSERT INTO airport  VALUES  (1,'Sa Carneiro','Porto','Portugal');
INSERT INTO airport  VALUES  (3,'Portela','Lisboa','Portugal');
INSERT INTO airport  VALUES  (5,'Faro','Faro','Portugal');
INSERT INTO airport  VALUES  (2,'Madeira','Funchal','Portugal');
INSERT INTO airport  VALUES  (4,'Ponta Delgada','S. Miguel','Portugal');
INSERT INTO airport  VALUES  (9,'Orly','Paris','France');
INSERT INTO airport  VALUES  (8,'Charles de Gaule','Paris','France');
INSERT INTO airport  VALUES  (11,'Heathrow','Londres','United Kingdom');
INSERT INTO airport  VALUES  (12,'Gatwick','Londres','United Kingdom');
INSERT INTO model  VALUES  (1,'Douglas','DC-10','3');
INSERT INTO model  VALUES  (2,'Boeing','737','2');
INSERT INTO model  VALUES  (3,'Boeing','747','4');
INSERT INTO model  VALUES  (4,'Airbus','A300','2');
INSERT INTO model  VALUES  (5,'Airbus','A340','4');
INSERT INTO plane  VALUES  (1,'Scott Adams',1);
INSERT INTO plane  VALUES  (2,'Milo Manara',1);
INSERT INTO plane  VALUES  (4,'Henki Bilal',3);
INSERT INTO plane  VALUES  (5,'Gary Larson',4);
INSERT INTO plane  VALUES  (6,'Bill Waterson',4);
INSERT INTO plane  VALUES  (7,'J R R Tolkien',3);
INSERT INTO plane  VALUES  (8,'Franquin',3);
INSERT INTO plane  VALUES  (9,'Douglas Adams',1);
INSERT INTO plane  VALUES  (3,'Serpieri',5);
INSERT INTO flight VALUES  (1001,1,2,'TAP',2,1);
INSERT INTO flight VALUES  (1002,2,3,'TAP',1,2);
INSERT INTO flight VALUES  (1010,12,4,'BA',3,3);
INSERT INTO flight VALUES  (1008,3,12,'Portugalia',3,4);
INSERT INTO flight VALUES  (1007,5,1,'TAP',1,5);
INSERT INTO flight VALUES  (1009,1,3,'Portugalia',1,2);
INSERT INTO flight VALUES  (1005,9,2,'AirFrance',2,3);
INSERT INTO flight VALUES  (1003,2,12,'BA',2,5);
INSERT INTO flight VALUES  (1006,8,11,'BA',1,5);
INSERT INTO flight VALUES  (1004,4,3,'SATA',3,6);
INSERT INTO flight VALUES  (1111,1,3,'TAP',2,3);