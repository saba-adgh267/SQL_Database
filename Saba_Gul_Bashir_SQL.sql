/*
Student name: SABA GUL BASHIR             
Student username: adgh267            
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE adgh267Pilot_crew_member
(
personal_id integer(10) NOT NULL PRIMARY KEY,
name varchar(255) NOT NULL,
surname varchar(255) NOT NULL,
phone_number integer(10) NOT NULL UNIQUE,
email_address varchar(255) NOT NULL UNIQUE,
nationality varchar(255) NOT NULL,
date_of_birth integer(6) NOT NULL,
address varchar(255) NOT NULL 
);

CREATE TABLE adgh267Uniform
(
uni_pur_id integer(10) NOT NULL,
gender varchar(255) NOT NULL,
uniform_size integer(10) NOT NULL,
pilot_id integer(10) NOT NULL,

PRIMARY KEY(uni_pur_id, pilot_id),
FOREIGN KEY(pilot_id) REFERENCES adgh267Pilot_crew_member(personal_id)
);

CREATE TABLE adgh267Crew_assignment
(
assignment_id integer(10) NOT NULL,
duty_hours integer(10) NOT NULL,
pilot_id integer(10) NOT NULL,

PRIMARY KEY(assignment_id, pilot_id),
FOREIGN KEY(pilot_id) REFERENCES adgh267Pilot_crew_member(personal_id) 
);

CREATE TABLE adgh267Aircraft
(
aircraft_serial_number integer(10),
aircraft_type varchar(255) NOT NULL,
model varchar(255) NOT NULL UNIQUE,
registration_date integer(6) NOT NULL,
manufacturer_name varchar(255) NOT NULL,
manufature_date integer(6) NOT NULL,
pilot_id integer(10) NOT NULL,

PRIMARY KEY(aircraft_serial_number, pilot_id),
FOREIGN KEY(pilot_id) REFERENCES adgh267Pilot_crew_member(personal_id)
);

CREATE TABLE adgh267Flight
(
flight_number integer(10) NOT NULL,
departure_airport varchar(255) NOT NULL,
arrival_airport varchar(255) NOT NULL,
date_of_flight integer(6) NOT NULL,
departure_time time NOT NULL,
arrival_time time NOT NULL,
aircraft_serial_number integer(10) NOT NULL,
crew_assignment_id integer(10) NOT NULL,

PRIMARY KEY(flight_number, aircraft_serial_number, crew_assignment_id),
FOREIGN KEY(aircraft_serial_number) REFERENCES adgh267Aircraft(aircraft_serial_number),
FOREIGN KEY(crew_assignment_id) REFERENCES adgh267Crew_assignment(assignment_id)
);

CREATE TABLE adgh267Emergency_contact
(
contact_id integer(10) NOT NULL,
first_name varchar(255) NOT NULL,
surname varchar(255) NOT NULL,
phone_number integer(10) NOT NULL UNIQUE,
email_address varchar(255) NOT NULL,
address varchar(255),
pilot_id integer(10) NOT NULL,

PRIMARY KEY(contact_id, pilot_id),
FOREIGN KEY(pilot_id) REFERENCES adgh267Pilot_crew_member(personal_id)
);

/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO adgh267Pilot_crew_member VALUES 
(1000,'Mark','Sky',71589320,'mark.s@gmail.com','English',890503,'16 Roman Road'),
(1001,'John','Mason',42345923,'john.m@gmail.com','Dutch',930701,'18 Elizabeth Road'),
(1002,'Sara','Hussain',93256945,'sarah.h@gmail.com','Bengali',950820,'525 Mason Road'),
(1003,'Fatima','Shah',94053321,'fatima.s@gmail.com','Pakistani',900914,'99 Brown Street'),
(1004,'Michael','Jordan',49340957,'michael.j@gmail.com','Canadian',930307,'309 Flower Close'),
(1005,'Habib','Sorela',34505617,'habib.s@gmail.com','Egyptian',970212,'55 Marshall Street'),
(1006,'Alejandro','Craig',95678157,'alejandro.c@gmail.com','Argentinian',880202,'172 Wayne Avenue'),
(1007,'Chad','Best',34349258,'chad.b@gmail.com','Canadian',901110,'45 Teller Avenue'),
(1008,'Dayton','Ayers',51823221,'dayton.a@gmail.com','Argentinian',921107,'32 Ashland Road'),
(1009,'Serena','Shannon',53125521,'serena.s@gmail.com','Bulgarian',941228,'34 Marshfield Street'),
(1010,'Hassan','Faisal',45315678,'hassan.f@gmail.com','Egyptian',901223,'13 Tappan Street'),
(1011,'Riccardo','Sanchez',71992453,'riccardo.s@gmail.com','French',880905,'276 Corey Road');

INSERT INTO adgh267Uniform VALUES 
(46000,'Male',44,1000),
(46001,'Male',42,1001),
(46002,'Male',46,1002),
(46003,'Female',38,1003),
(46004,'Female',36,1004),
(46005,'Male',40,1005),
(46006,'Male',42,1006),
(46007,'Male',44,1007),
(46008,'Male',46,1008),
(46009,'Female',38,1009),
(46010,'Male',42,1010),
(46011,'Male',40,1011);

INSERT INTO adgh267Crew_assignment VALUES
(23000,40,1000),
(23100,40,1001),
(23200,35,1002),
(23300,20,1003),
(23400,40,1004),
(23500,38,1005),
(23600,30,1006),
(23700,38,1007),
(23800,30,1008),
(23900,38,1009),
(24000,40,1010),
(24100,40,1011);

INSERT INTO adgh267Aircraft VALUES
(1030020,'Airbus','A300',130520,'Airbus Group',130518,1009),
(1030030,'Airbus','A400',120416,'Airbus Group',120414,1010),
(1030040,'Airbus','300B4',180819,'Airbus Group',180817,1005),
(1030050,'Antonov','An_140',201113,'Antonov State Company',201110,1007),
(1030060,'Airbus','A318',191014,'Airbus Group',191012,1002),
(1030070,'Airbus','A380',181014,'Airbus Group',181010,1004),
(1030080,'Boeing','737',171120,'The Boeing Co',171119,1011),
(1030090,'Boeing','707',220913,'The Boeing Co',220911,1008),
(1030100,'Boeing','400M',130114,'The Boeing Co',130112,1001),
(1030110,'Douglas','DC-3',110313,'Douglas Aircraft Company',110311,1006),
(1030120,'Boeing','710',140427,'The Boeing Co',140425,1003),
(1030130,'Antonov','An_158',140613,'Antonov State Company',140611,1000);

INSERT INTO adgh267Flight VALUES
(100010,'Heathrow','Dubai Intl',231222,003000,070000,1030090,23400),
(100020,'Heathrow','Istanbul',231222,054000,085500,1030120,23300),
(100030,'Heathrow','Melbourne',231222,112000,220500,1030040,23500),
(100040,'Heathrow','Charles de Gaulle',231223,010000,043000,1030130,23000),
(100050,'Heathrow','Mexico City',231223,070500,142000,1030110,23600),
(100060,'Heathrow','Shangai Pudong Intl',231223,072500,181500,1030100,23100),
(100070,'Heathrow','Dubai Intl',231223,145000,210000,1030060,23200),
(100080,'Heathrow','Incheon Intl',231224,010500,084500,1030020,23900),
(100090,'Heathrow','Jeju Intl',231224,061000,154000,1030030,24000),
(100100,'Heathrow','Charles de Gaulle',231225,062000,095000,1030050,23700),
(100110,'Heathrow','Istanbul',231225,070000,101000,1030080,24100),
(100120,'Heathrow','Istanbul',231225,190000,221000,1030070,23800);

INSERT INTO adgh267Emergency_contact VALUES
(12340,'Adam','Jenkins',63421358,'adam.j@gmail.com','54 Albert Road',1000),
(12341,'Vagn','Kimiko',73201239,'vagn.k@gmail.com','17 King Street',1001),
(12342,'Amal','Karim',34120028,'amal.k@gmail.com',null,1002),
(12343,'Naseem','Tariq',43971228,'naseem.t@gmail.com','233 Chester Road',1003),
(12344,'Jake','Adams',27173992,'jake.a@gmail.com','96 The Crescent',1004),
(12345,'Hassan','Zahran',19332870,'hassan.z@gmail.com',null,1005),
(12346,'Aurela','Lean',17510329,'aurela.l@gmail.com','78 Green Lane',1006),
(12347,'Jake','Hall',63312074,'jaden.h@gmail.com','35 Newham Road',1007),
(12348,'Raquel','Agrippa',16516392,'raquel.a@gmail.com','73 Highfield Road',1008),
(12349,'Alicia','Draza',10093281,'alicia.d@gmail.com','2 The Grove',1009),
(12350,'Ahmed','Nabil',39225871,'ahmed.n@gmail.com','76 West Street',1010),
(12351,'Jemma','Mattia',32007284,'jemma.m@gmail.com',null,1011);
                     
/* SECTION 3 - UPDATE STATEMENTS */

/* 1) */
UPDATE adgh267Aircraft
SET aircraft_type = 'Boeing', model = '618', manufacturer_name = 'The Boeing Co'
WHERE aircraft_serial_number = 1030020;

/* 2) */
UPDATE adgh267Crew_assignment
SET duty_hours = 40
WHERE assignment_id = 23800;

/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 
1) List how many flights have travelled between the same departure and arrival airports.

*/

SELECT departure_airport, arrival_airport, COUNT(*)
FROM adgh267Flight
GROUP BY departure_airport, arrival_airport 
HAVING COUNT(*) >= 1;

/* 
2) List the personal ID alongwith the gender of the crew member/s with the smallest uniform size.

*/

SELECT pilot_id, gender
FROM adgh267Uniform
WHERE uniform_size = (
SELECT MIN(uniform_size)
FROM adgh267Uniform
);

/* 
3) List all the aircraft types and models that are not manufactured by The Boeing Co or Antonov State Company. 

*/

SELECT aircraft_type,model
FROM adgh267Aircraft
WHERE manufacturer_name NOT IN ('The Boeing Co','Antonov State Company');

/* 
4) List the number of flights as 'Num of Flights' that took off before the 231225. 

*/

SELECT COUNT(flight_number) AS 'Num of Flights'
FROM adgh267Flight 
WHERE date_of_flight < 231225;

/* 
5) List the names and surnames of the emergency contacts that haven't provided their address.

*/

SELECT first_name,surname 
FROM adgh267Emergency_contact
WHERE address IS null;

/* 
6) List the contact ID's of the emergency contacts whose names start with a 'J'. 

*/

SELECT DISTINCT(contact_id) 
FROM adgh267Emergency_contact
WHERE first_name LIKE '%J%';

/* SECTION 5 - MULTIPLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */


/* 
1) List the flight number and the date of flight of all planes that have planes associated with 'Airbus Group'.

*/

SELECT flight_number, date_of_flight
FROM adgh267Flight
WHERE aircraft_serial_number IN  ( SELECT DISTINCT aircraft_serial_number
FROM adgh267Aircraft
WHERE manufacturer_name = 'Airbus Group');

/* 
2) List the name, surname, duty hours, flight number and the aircraft serial number for each of the crew members in an alphabetical order.

*/

SELECT T1.name, T1.surname, T2.duty_hours, T3.flight_number, T4.aircraft_serial_number
FROM adgh267Pilot_crew_member T1
INNER JOIN adgh267Crew_assignment T2
ON T1.personal_id = T2.pilot_id
INNER JOIN adgh267Flight T3
ON T2.assignment_id = crew_assignment_id
INNER JOIN adgh267Aircraft T4
ON T4.aircraft_serial_number = T3.aircraft_serial_number
ORDER BY name;

/* 
3)  List the phone number, email address, nationality, duty hours and uniform size of the crew member named Alejandro Craig.

*/

SELECT pc.phone_number, pc.email_address, pc.nationality, ca.duty_hours, u.uniform_size
FROM adgh267Pilot_crew_member pc
JOIN adgh267Crew_assignment ca ON pc.personal_id = ca.pilot_id
JOIN adgh267Uniform u ON pc.personal_id = u.pilot_id
WHERE pc.name = 'Alejandro' AND pc.surname = 'Craig';

/* 
4) List the name and surname of the crew members that have duty hours > 35 and flies an 'Airbus' and order their surnames in an alphabetical order.

*/

SELECT DISTINCT pc.name, pc.surname
FROM adgh267Pilot_crew_member pc
JOIN adgh267Crew_assignment ca ON pc.personal_id = ca.pilot_id
WHERE ca.duty_hours > 35
AND EXISTS (
SELECT 1
FROM adgh267Aircraft a
JOIN adgh267Flight f ON a.aircraft_serial_number = f.aircraft_serial_number
WHERE f.crew_assignment_id = ca.assignment_id
AND a.aircraft_type = 'Airbus'
)
ORDER BY surname;

/* 
5) List the flight number, departure time, and arrival time for all flights opearting Boeing planes on the 23-12-22 and order them from the earliest flight to the latest.

*/

SELECT DISTINCT f.flight_number, f.departure_time, f.arrival_time
FROM adgh267Flight f
WHERE f.aircraft_serial_number IN (
SELECT DISTINCT a.aircraft_serial_number
FROM adgh267Aircraft a
WHERE a.aircraft_type = 'Boeing')
AND f.date_of_flight = 231222
ORDER BY departure_time;

/* 
6) List the flight number, date of flight, departure time, arrival time, departure airport, arrival airport, airplane's manufacturer name and model of the flight flown by the crew member Fatima Shah. Also include her duty hours and uniform size.

*/

SELECT f.flight_number, f.date_of_flight, f.departure_time, f.arrival_time, f.departure_airport, f.arrival_airport, a.manufacturer_name, a.model, 
ca.duty_hours, u.uniform_size
FROM adgh267Pilot_crew_member pc
JOIN adgh267Crew_assignment ca ON pc.personal_id = ca.pilot_id
JOIN adgh267Flight f ON ca.assignment_id = f.crew_assignment_id
JOIN adgh267Aircraft a ON f.aircraft_serial_number = a.aircraft_serial_number
JOIN adgh267Uniform u ON pc.personal_id = u.pilot_id
WHERE pc.name = 'Fatima' AND pc.surname = 'Shah';

/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)


DELETE FROM adgh267Uniform
WHERE uniform_size = 36;


DELETE FROM adgh267Flight
WHERE arrival_airport = 'Istanbul' AND departure_time = 070000;

*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)

DROP TABLE adgh267Emergency_contact;
DROP TABLE adgh267Flight;
DROP TABLE adgh267Uniform;
DROP TABLE adgh267Crew_assignment;
DROP TABLE adgh267Aircraft;
DROP TABLE adgh267Pilot_crew_member;

*/


