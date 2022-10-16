-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 15:22:33.802

-- tables
-- Table: DIM_Client
CREATE TABLE DIM_Client (
    ID int  NOT NULL,
    First_name varchar(100)  NOT NULL,
    Surrname varchar(100)  NOT NULL,
    Phone_number nchar(9)  NOT NULL,
    Address varchar(100)  NOT NULL,
    CONSTRAINT DIM_Client_pk PRIMARY KEY  (ID)
);

-- Table: DIM_Courier
CREATE TABLE DIM_Courier (
    NIP nchar(10)  NOT NULL,
    Name varchar(100)  NOT NULL,
    Address varchar(100)  NOT NULL,
    CONSTRAINT DIM_Courier_pk PRIMARY KEY  (NIP)
);

-- Table: DIM_Product
CREATE TABLE DIM_Product (
    ISBN nchar(13)  NOT NULL,
    Author varchar(100)  NOT NULL,
    Title varchar(100)  NOT NULL,
    Publisher varchar(100)  NOT NULL,
    Pages_amount int  NOT NULL,
    CONSTRAINT DIM_Product_pk PRIMARY KEY  (ISBN)
);

-- Table: Fact_Sales
CREATE TABLE Fact_Sales (
    Transaction_ID int  NOT NULL,
    Client_ID int  NOT NULL,
    Courier_NIP nchar(10)  NOT NULL,
    Product_ID nchar(13)  NOT NULL,
    Date date  NOT NULL,
    CONSTRAINT Fact_Sales_pk PRIMARY KEY  (Transaction_ID)
);

-- foreign keys
-- Reference: Fact_Sales_DIM_Client (table: Fact_Sales)
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_DIM_Client
    FOREIGN KEY (Client_ID)
    REFERENCES DIM_Client (ID);

-- Reference: Fact_Sales_DIM_Courier (table: Fact_Sales)
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_DIM_Courier
    FOREIGN KEY (Courier_NIP)
    REFERENCES DIM_Courier (NIP);

-- Reference: Fact_Sales_DIM_Product (table: Fact_Sales)
ALTER TABLE Fact_Sales ADD CONSTRAINT Fact_Sales_DIM_Product
    FOREIGN KEY (Product_ID)
    REFERENCES DIM_Product (ISBN);

-- End of file.

