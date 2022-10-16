-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 15:15:53.091

-- tables
-- Table: DIM_Product
CREATE TABLE DIM_Product (
    Product_ID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Brand varchar(50)  NOT NULL,
    Effective_start_date date  NOT NULL,
    "Current" bit  NOT NULL,
    CONSTRAINT DIM_Product_pk PRIMARY KEY  (Product_ID)
);

-- Table: DIM_Warehouse
CREATE TABLE DIM_Warehouse (
    Warehouse_ID int  NOT NULL,
    Address varchar(50)  NOT NULL,
    Country varchar(50)  NOT NULL,
    CONSTRAINT DIM_Warehouse_pk PRIMARY KEY  (Warehouse_ID)
);

-- Table: Fact_Table
CREATE TABLE Fact_Table (
    ID int  NOT NULL,
    Warehouse_ID int  NOT NULL,
    Product_ID int  NOT NULL,
    Date date  NOT NULL,
    CONSTRAINT Fact_Table_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: Fact_Table_DIM_Product (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_DIM_Product
    FOREIGN KEY (Product_ID)
    REFERENCES DIM_Product (Product_ID);

-- Reference: Fact_Table_DIM_Warehouse (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_DIM_Warehouse
    FOREIGN KEY (Warehouse_ID)
    REFERENCES DIM_Warehouse (Warehouse_ID);

-- End of file.

