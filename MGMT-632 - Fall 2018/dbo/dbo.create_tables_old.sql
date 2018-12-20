﻿CREATE PROCEDURE [dbo].[create_tables] AS

IF NOT EXISTS (SELECT * FROM sys.Tables WHERE name='customer') CREATE TABLE [dbo].[customer] (
[custID] INT	NOT NULL, [email]  VARCHAR(50)  NOT NULL,
[fName] VARCHAR(20) NOT NULL, [lName] VARCHAR(20) NOT NULL, [phone] VARCHAR(10) NOT NULL, [dob]	DATE	NOT NULL, [gender] VARCHAR(1) NOT NULL, [pword] VARCHAR(15) NOT NULL
CONSTRAINT [PK_custID] PRIMARY KEY CLUSTERED ([custID] ASC)
);

CREATE TABLE [dbo].[shippingAddress] (
[sID]		INT	NOT NULL, [custID]			INT		NOT NULL, [address1] VARCHAR(30) NULL, [address2] VARCHAR(30) NULL, [city]	VARCHAR(50) NULL, [state]	VARCHAR(2) NULL, [zip]	VARCHAR(10) NULL,
[primaryYN] bit	NULL,
CONSTRAINT [PK_SID] PRIMARY KEY CLUSTERED ([SID] ASC),
CONSTRAINT [FK_shipCustID] FOREIGN KEY (custID) REFERENCES customer(custID) ON DELETE CASCADE
);

CREATE TABLE [dbo].[paymentInfo] (
[custID]	INT NOT NULL,
[pName]		VARCHAR(10) NOT NULL, [ccType]	VARCHAR(20) NULL, [ccNum]		VARCHAR(16) NULL,
[ccExpire]	DATE	NULL, [billAddress] VARCHAR(30) NULL, [city]	VARCHAR(50) NULL, [state]	VARCHAR(2) NULL, [zip]	VARCHAR(10) NULL,
CONSTRAINT [PK_custIDpName] PRIMARY KEY CLUSTERED ([custID],[pName] ASC),

CONSTRAINT [FK_custID] FOREIGN KEY (custID) REFERENCES customer(custID) ON DELETE CASCADE
);

CREATE TABLE [dbo].[department] (
[deptID] INT	NOT NULL, [name] VARCHAR(25) NULL, [desc] VARCHAR(100) NULL
CONSTRAINT [PK_deptID] PRIMARY KEY CLUSTERED ([deptID] ASC)
);

CREATE TABLE [dbo].[category] (
[catID] INT	NOT NULL, [deptID] INT		NOT NULL, [name] VARCHAR(25) NULL, [desc] VARCHAR(100) NULL,
CONSTRAINT [PK_catID] PRIMARY KEY CLUSTERED ([catID] ASC),
CONSTRAINT [FK_deptID] FOREIGN KEY (deptID) REFERENCES department(deptID) ON DELETE CASCADE
);

CREATE TABLE [dbo].[product] (
[prodID]	INT	NOT NULL, [prodName]		VARCHAR(100) NOT NULL,
[prodHeadline] VARCHAR(200) NOT NULL, [desc]	VARCHAR(1000) NOT NULL, [tImage]			VARCHAR(200) NOT NULL, [nImage]				VARCHAR(200) NOT NULL, [rPrice]	NUMERIC(6,2) NOT NULL, [sPrice]		NUMERIC(6,2) NOT NULL, [catID]		INT	NOT NULL, [keywords]					VARCHAR(100) NULL ,
CONSTRAINT [PK_prodID] PRIMARY KEY CLUSTERED ([prodID] ASC), CONSTRAINT [FK_catID] FOREIGN KEY (catID) REFERENCES category(catID) ON
DELETE CASCADE
);

CREATE TABLE [dbo].[orders] (
[OID]	INT	NOT NULL, [custID]  INT		NOT NULL, [orderDt] DATE			NOT NULL, [shipID]  INT		NOT NULL,

[shipCost] NUMERIC(5,2) NULL,
CONSTRAINT [PK_OID] PRIMARY KEY CLUSTERED ([OID] ASC),
CONSTRAINT [FK_orderCustID] FOREIGN KEY (custID) REFERENCES
customer(custID) ON DELETE CASCADE
);

CREATE TABLE [dbo].[shippingMethods] (
[shipID]			INT	NOT NULL, [company]				VARCHAR(30) NULL, [method]				VARCHAR(25) NULL, [fRate]	NUMERIC(5,2) NULL, [vRate]		NUMERIC(5,2) NULL,
[baseWeight] NUMERIC(6,2) NULL,
CONSTRAINT [PK_shipID] PRIMARY KEY CLUSTERED ([shipID] ASC)
);

CREATE TABLE [dbo].[orderItems] (
[OID]	INT	NOT NULL,
[prodID] INT		NOT NULL, [qty]	INT	NOT NULL, [price] NUMERIC(6, 2) NULL,
CONSTRAINT [PK_OIDprodID] PRIMARY KEY CLUSTERED ([OID],[prodID] ASC),
CONSTRAINT [FK_prodID] FOREIGN KEY (prodID) REFERENCES product(prodID) ON DELETE CASCADE,
CONSTRAINT [FK_orderID] FOREIGN KEY (OID) REFERENCES orders(OID) ON DELETE CASCADE
);

CREATE TABLE [dbo].[upSells] (
[custID]	INT	NOT NULL, [prodID]		INT		NOT NULL,
[percentage] NUMERIC(3,2) NOT NULL,
CONSTRAINT [FK_upSellcustID] FOREIGN KEY (custID) REFERENCES
customer(custID) ON DELETE CASCADE,
CONSTRAINT [FK_upSellprodID] FOREIGN KEY (prodID) REFERENCES
product(prodID) ON DELETE CASCADE
);

CREATE TABLE [dbo].[crossSells] (
[prodID1]	INT	NOT NULL, [prodID2]	INT	NOT NULL,
[percentage] NUMERIC(3,2) NOT NULL,

CONSTRAINT [FK_prodID1] FOREIGN KEY (prodID1) REFERENCES product(prodID) ON UPDATE NO ACTION,
CONSTRAINT [FK_prodID2] FOREIGN KEY (prodID2) REFERENCES product(prodID) ON UPDATE NO ACTION ,
CONSTRAINT [PK_crossSells] PRIMARY KEY ([prodID1], [prodID2])
);

RETURN 0