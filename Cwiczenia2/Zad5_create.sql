-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 15:32:49.337

-- tables
-- Table: Dim_Grade
CREATE TABLE Dim_Grade (
    Worker_PESEL nchar(11)  NOT NULL,
    Grade int  NOT NULL,
    Effective_start_date date  NOT NULL,
    "Current" bit  NOT NULL,
    CONSTRAINT Dim_Grade_pk PRIMARY KEY  (Worker_PESEL)
);

-- Table: Fact_Table
CREATE TABLE Fact_Table (
    PESEL nchar(11)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Salary money  NOT NULL,
    Grade int  NOT NULL,
    CONSTRAINT Fact_Table_pk PRIMARY KEY  (PESEL)
);

-- foreign keys
-- Reference: Dim_Grade_Fact_Table (table: Dim_Grade)
ALTER TABLE Dim_Grade ADD CONSTRAINT Dim_Grade_Fact_Table
    FOREIGN KEY (Worker_PESEL)
    REFERENCES Fact_Table (PESEL);

-- End of file.

