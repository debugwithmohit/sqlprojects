/*Lets create a  database named carbon emission*/

create database carbon_emission;

/*Lets create a users table and insert data*/

create table carbon_emission.users(
uid int primary key,
name varchar(100),
email varchar(100),
password varchar(100)
);
insert into carbon_emission.users values(1,'JAI','jaishankar001@gmail.com','jais123'),(2,'VIJAY','vijayyadav024@gmail.com','vijayji786');
select* from carbon_emission.users;

/*Lets create a Transportation table and insert Data*/
create table carbon_emission.transportation(
TID INT PRIMARY KEY,
UID INT NOT NULL,
MODEL VARCHAR(50) NOT NULL,
METHOD VARCHAR(50) NOT NULL,
TRANS_CE DEC(3,2)
);
insert into carbon_emission.transportation values(1,1,'TRUCK','ROAD',1.98),(2,2,'VAN','ROAD',4.55);
select* from carbon_emission.transportation;

/*Lets create energy table and insert data*/
create table carbon_emission.energy(
EID INT PRIMARY KEY,
UID INT NOT NULL,
ENERGY_CON int NOT NULL,
ENERGY_CE DEC(3,2)
);
insert into carbon_emission.energy values(1,1,150,1.98),(2,2,250,4.55);
select* from carbon_emission.energy;

/*Lets create food table and insert data*/
create table carbon_emission.Food(
FID INT PRIMARY KEY,
UID INT NOT NULL,
CHOICE varchar(50) NOT NULL,
FOOD_CE DEC(3,2)
);
INSERT INTO carbon_emission.Food values(1,1,'FRUITS',4.32),(2,2,'VEGETABLES',9.86);
SELECT*FROM CARBON_EMISSION.FOOD;

/*Lets create carbon emission table and insert data*/
create table carbon_emission.ce(
CID INT PRIMARY KEY,
UID INT NOT NULL
);
INSERT INTO CARBON_EMISSION.CE VALUES(11,1),(12,2);
SELECT*FROM CARBON_EMISSION.CE;

/*Lets JOIN THE TWO TABLES USERS AND TRANSPORTATION*/

CREATE TABLE CARBON_EMISSION.USERS_TRANS(
SELECT U.UID AS'USER_ID',U.NAME,U.EMAIL,U.PASSWORD,T.UID AS 'TRANSPORT_USER_ID',T.TID
,T.MODEL,T.TRANS_CE
FROM CARBON_EMISSION.USERS U
LEFT JOIN CARBON_EMISSION.TRANSPORTATION T
ON U.UID=T.UID
);
select*FROM CARBON_EMISSION.USERS_TRANS;
CREATE TABLE CARBON_EMISSION.ENERGY_FOOD(
SELECT E.EID,E.UID AS'ENERGY_USER_ID',E.ENERGY_CON,E.ENERGY_CE,F.UID AS 'FOOD_USER_ID',F.FID
,F.CHOICE,F.FOOD_CE
FROM CARBON_EMISSION.ENERGY E
LEFT JOIN CARBON_EMISSION.FOOD F
ON E.UID=F.UID
);
select*FROM CARBON_EMISSION.ENERGY_FOOD;

CREATE TABLE CARBON_EMISSION.USER_TRANS_ENERGY_FOOD(
SELECT UT.USER_ID,UT.NAME,UT.EMAIL,UT.PASSWORD,UT.TRANSPORT_USER_ID,UT.TID
,UT.MODEL,UT.TRANS_CE,EF.EID,EF.ENERGY_USER_ID,EF.ENERGY_CON,EF.FOOD_USER_ID,EF.FID,EF.CHOICE,EF.FOOD_CE
FROM CARBON_EMISSION.USERS_TRANS UT
LEFT JOIN CARBON_EMISSION.ENERGY_FOOD EF
ON UT.USER_ID=EF.ENERGY_USER_ID
);
SELECT*FROM CARBON_EMISSION.USER_TRANS_ENERGY_FOOD;

