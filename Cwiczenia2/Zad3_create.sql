-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 15:27:54.469

-- tables
-- Table: DIM_Client
CREATE TABLE DIM_Client (
    NIP nchar(10)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Name varchar(50)  NOT NULL,
    CONSTRAINT DIM_Client_pk PRIMARY KEY  (NIP)
);

-- Table: DIM_Date
CREATE TABLE DIM_Date (
    Date_ID int  NOT NULL,
    Day int  NOT NULL,
    Month int  NOT NULL,
    Hour time  NOT NULL,
    CONSTRAINT DIM_Date_pk PRIMARY KEY  (Date_ID)
);

-- Table: DIM_Product
CREATE TABLE DIM_Product (
    Product_ID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Category varchar(50)  NOT NULL,
    Price money  NOT NULL,
    CONSTRAINT DIM_Product_pk PRIMARY KEY  (Product_ID)
);

-- Table: DIM_Transaction
CREATE TABLE DIM_Transaction (
    Transaction_ID int  NOT NULL,
    Quantity int  NOT NULL,
    Place varchar(50)  NOT NULL,
    Order_amount money  NOT NULL,
    CONSTRAINT DIM_Transaction_pk PRIMARY KEY  (Transaction_ID)
);

-- Table: Fact_Table
CREATE TABLE Fact_Table (
    ID int  NOT NULL,
    Client_ID nchar(10)  NOT NULL,
    Product_ID int  NOT NULL,
    Transaction_ID int  NOT NULL,
    Date_ID int  NOT NULL,
    CONSTRAINT Fact_Table_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: Fact_Table_DIM_Client (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_DIM_Client
    FOREIGN KEY (Client_ID)
    REFERENCES DIM_Client (NIP);

-- Reference: Fact_Table_DIM_Date (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_DIM_Date
    FOREIGN KEY (Date_ID)
    REFERENCES DIM_Date (Date_ID);

-- Reference: Fact_Table_DIM_Product (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_DIM_Product
    FOREIGN KEY (Product_ID)
    REFERENCES DIM_Product (Product_ID);

-- Reference: Fact_Table_DIM_Transaction (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_DIM_Transaction
    FOREIGN KEY (Transaction_ID)
    REFERENCES DIM_Transaction (Transaction_ID);

-- sequences
-- Sequence: DIM_Client_seq
CREATE SEQUENCE DIM_Client_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIM_Date_seq
CREATE SEQUENCE DIM_Date_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIM_Product_seq
CREATE SEQUENCE DIM_Product_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIM_Transaction_seq
CREATE SEQUENCE DIM_Transaction_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Fact_Table_seq
CREATE SEQUENCE Fact_Table_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

