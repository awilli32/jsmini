CREATE TABLE student (
  ID_Student SERIAL PRIMARY KEY,
  StudentID varchar(16) NOT NULL,
  LastName varchar(24) NOT NULL,
  FirstName varchar(24) NOT NULL,
  MiddleName varchar(24) DEFAULT NULL,
  BirthDate date DEFAULT NULL
);
