CREATE TABLE CUSTOMER (
CustomerID int NOT NULL,
FName varchar(16) NOT NULL,
LName varchar(32) NOT NULL,
PhoneNr varchar(16) NOT NULL,
PRIMARY KEY (CustomerID)
);

INSERT INTO CUSTOMER VALUES
(1, 'Robert', 'Smith', '035-444673'),
(2, 'Maria', 'Gimenez', '044778901'),
(3, 'Markku', 'Nieminen', '+3582298976'),
(4, 'Patrick', 'Johansson', '09120987');


CREATE TABLE EMPLOYEE (
EmployeeID int NOT NULL,
FName varchar(16) NOT NULL,
LName varchar(32) NOT NULL,
PhoneNr varchar(16) NOT NULL,
JobTitle varchar (32) NOT NULL,
PRIMARY KEY (EmployeeID)
);

INSERT INTO EMPLOYEE VALUES
(101, 'Julia', 'Fernandez', '0987465534', 'Nurse'),
(102, 'Tommi', 'Mäkinen', '0357787653', 'Driver'),
(103, 'Ella', 'Jokinen', '+3589876223', 'Driver'),
(104, 'Hoang', 'Nguyen' , '0976353423', 'Doctor'),
(105, 'Julius' , 'Nyqvist', '045-98764524', 'Nurse'),
(106, 'Eveliina', 'Järvinen' , '035-998567', 'Doctor');

CREATE TABLE AMBULANCE (
PlateNr VARCHAR(10) NOT NULL,
Type VARCHAR(20) NOT NULL,
PRIMARY KEY (PlateNr)
);

INSERT INTO AMBULANCE VALUES
('IXC-233', 'Basic'),
('KJM-001', 'Emergency'),
('FCE-873', 'Emergency');

CREATE TABLE RESERVATION (
ReservationID INT NOT NULL,
CustomerID INT NOT NULL,
ReservationDate DATE NOT NULL,
StartTime TIME NOT NULL,
EndTime TIME NOT NULL,
PlateNr VARCHAR(10) NOT NULL,
PRIMARY KEY (ReservationID),
FOREIGN KEY (PlateNr) REFERENCES AMBULANCE (PlateNr)
);


INSERT INTO RESERVATION (ReservationID, CustomerID, ReservationDate, 
StartTime, EndTime, PlateNr)
VALUES
(2334, 4, '2024-02-20', '08:00:00', '09:00:00', 'IXC-233'),
(3442, 4, '2024-02-21', '14:00:00', '15:00:00', 'IXC-233'),
(1101, 1, '2024-03-02', '13:15:00', '14:00:00', 'KJM-001'),
(4565, 3, '2024-03-01', '21:40:00', '22:30:00', 'FCE-873');

CREATE TABLE CREW_RIDE (
ReservationID INT NOT NULL,
EmployeeID INT NOT NULL,
PRIMARY KEY (ReservationID, EmployeeID),
FOREIGN KEY (ReservationID) REFERENCES RESERVATION 
(ReservationID)
);

INSERT INTO CREW_RIDE (ReservationID, EmployeeID)
VALUES
(2334, 102),
(3442, 102),
(1101, 103),
(1101, 104),
(1101, 105),
(4565, 102),
(4565, 105);
