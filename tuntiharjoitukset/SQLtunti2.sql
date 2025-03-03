Yksinkertaisten SELECT-kyselyjen kirjoittaminen:

1. Kaikkien tietokantaan tällä hetkellä tallennettujen 
asiakkaiden etu- ja sukunimi
SELECT FName, LName FROM CUSTOMER;

2. Eveliina Järvinen -nimisen työntekijän puhelinnumero
SELECT PhoneNr FROM EMPLOYEE WHERE FName = 'Eveliina' AND LName = 'Järvinen';

3. Kaikkien 02.3.2024 varauksen tehneiden asiakkaiden asiakastunnukset
SELECT CustomerID FROM RESERVATION WHERE ReservationDate = '2024-03-02';

4. Varauksen alkamis- ja päättymisaika tunnuksella 4565
SELECT StartTime, EndTime FROM RESERVATION WHERE ReservationID = 4565;

5. Kaikkien yrityksessä tällä hetkellä työskentelevien 
sairaanhoitajien työntekijätunnukset
SELECT EmployeeID FROM EMPLOYEE WHERE JobTitle = 'Nurse';

6. Kaikkien sellaisten varausten tunnukset, 
joiden alkamisaika on klo 10.00–14.00
SELECT ReservationID FROM RESERVATION WHERE StartTime BETWEEN '10:00:00' AND '14:00:00';

7. Kaikkien varaukseen kohdistettujen työntekijöiden tunnukset, 
joiden tunnus on 1101
SELECT EmployeeID FROM CREW_RIDE WHERE ReservationID = 1101;

... käytä AND/OR alla olevissa kyselyissä:


1. Kaikkien sellaisten varausten tunnukset, joiden alkamisaika on aikaisemmin kuin klo 9.00 tai
myöhemmin kuin klo 16.00
SELECT ReservationID FROM RESERVATION WHERE StartTime < '09:00:00' OR StartTime > '16:00:00';

2. Kaikkien ambulanssille IXC-233 varattujen varausten tunnukset,
jotka asiakas on tehnyt tunnuksella 4
SELECT ReservationID FROM RESERVATION WHERE PlateNr = 'IXC-233' AND CustomerID = 4;

3. Kaikkien lääkäreiden ja kuljettajien etu- ja sukunimi
SELECT FName, LName FROM EMPLOYEE WHERE JobTitle = 'Doctor' OR JobTitle = 'Driver';

4. Kaikkien helmikuun 2024 aamuille (alkamisaika klo 6.00–12.00) 
tehtyjen varausten tunnukset
SELECT ReservationID FROM RESERVATION 
WHERE ReservationDate BETWEEN '2024-02-01' AND '2024-02-29' 
AND StartTime BETWEEN '06:00:00' AND '12:00:00';

UPDATE-kyselyt: Kirjoita jokaiselle alla olevalle kohdalle kysely, joka muuttaa ...


1. Asiakkaan Markku Niemisen puhelinnumeroksi "0452234165"
UPDATE CUSTOMER SET PhoneNr = '0452234165' WHERE FName = 'Markku' AND LName = 'Nieminen';

2. Varauksen päättymisaika tunnuksella 4565 muuttuu 23:00
UPDATE RESERVATION SET EndTime = '23:00:00' WHERE ReservationID = 4565;

DELETE-kyselyt: Kirjoita jokaiselle alla olevalle kohteelle kysely, joka poistaa ...


1. Kaikki varaukset, jotka on suunniteltu aikaisempiin tai samoihin päiviin kuin 21. helmikuuta 2024

ALTER TABLE crew_ride DROP FOREIGN KEY crew_ride_ibfk_1;
SELECT CONSTRAINT_NAME 
FROM information_schema.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'crew_ride' AND CONSTRAINT_TYPE = 'FOREIGN KEY';
DESC crew_ride;
DESC reservation;
ALTER TABLE crew_ride 
ADD CONSTRAINT crew_ride_ibfk_1 
FOREIGN KEY (ReservationID) 
REFERENCES reservation (ReservationID) 
ON DELETE CASCADE;
DELETE FROM RESERVATION WHERE ReservationDate <= '2024-02-21';
