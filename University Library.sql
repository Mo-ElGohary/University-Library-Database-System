CREATE TABLE Authors
(
  Author_Name VARCHAR(100) NOT NULL,
  Author_ID NUMERIC(8) NOT NULL,
  PRIMARY KEY (Author_ID)
);

CREATE TABLE Knowledge_Bank
(
  Content_ID NUMERIC(10) NOT NULL,
  Title VARCHAR(300) NOT NULL,
  Topic VARCHAR(100) NOT NULL,
  Author_ID NUMERIC(8) NOT NULL,
  PRIMARY KEY (Content_ID),
  FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);

CREATE TABLE Patrons
(
  Student_Name VARCHAR(100) NOT NULL,
  Gender Male OR Female NOT NULL,
  Books NUMERIC(9) NOT NULL,
  Dates DATE NOT NULL,
  ID_No NUMERIC(9) NOT NULL,
  Patron_No NUMERIC(10) NOT NULL,
  PRIMARY KEY (Patron_No)
);

CREATE TABLE Authors_Genre
(
  Genre VARCHAR(100) NOT NULL,
  Author_ID NUMERIC(8) NOT NULL,
  PRIMARY KEY (Genre, Author_ID),
  FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);

CREATE TABLE Patrons_Phone_No
(
  Phone_No NUMERIC(12) NOT NULL,
  Patron_No NUMERIC(10) NOT NULL,
  PRIMARY KEY (Phone_No, Patron_No),
  FOREIGN KEY (Patron_No) REFERENCES Patrons(Patron_No)
);

CREATE TABLE Students
(
  ID_No NUMERIC(9) NOT NULL,
  Student_Name VARCHAR(100) NOT NULL,
  Content_ID NUMERIC(10) NOT NULL,
  PRIMARY KEY (ID_No),
  FOREIGN KEY (Content_ID) REFERENCES Knowledge_Bank(Content_ID)
);


CREATE TABLE Books
(
  Barcode INT NOT NULL,
  Title VARCHAR(300) NOT NULL,
  Topic VARCHAR(100) NOT NULL,
  ID_No NUMERIC(9),
  BorrowID_No NUMERIC(9),
  PRIMARY KEY (Barcode),
  FOREIGN KEY (ID_No) REFERENCES Students(ID_No),
  FOREIGN KEY (BorrowID_No) REFERENCES Students(ID_No)
);

CREATE TABLE Wrote
(
  Publisher VARCHAR(100) NOT NULL,
  Barcode INT NOT NULL,
  Author_ID NUMERIC(8) NOT NULL,
  PRIMARY KEY (Barcode, Author_ID),
  FOREIGN KEY (Barcode) REFERENCES Books(Barcode),
  FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);

