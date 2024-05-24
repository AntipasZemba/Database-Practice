-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbSQL1;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

-- --------------------------------------------------------------------------------
--						 
-- --------------------------------------------------------------------------------

-- Drop Table Statements

IF OBJECT_ID ('TorderProducts')        IS NOT NULL    DROP TABLE TorderProducts
IF OBJECT_ID ('Torders')               IS NOT NULL    DROP TABLE Torders
IF OBJECT_ID ('TStatuses')             IS NOT NULL    DROP TABLE TStatuses
IF OBJECT_ID ('TCustomers')            IS NOT NULL    DROP TABLE TCustomers
IF OBJECT_ID ('TRaces')                IS NOT NULL    DROP TABLE TRaces
IF OBJECT_ID ('TGenders')              IS NOT NULL    DROP TABLE TGenders
IF OBJECT_ID ('TProducts')             IS NOT NULL    DROP TABLE TProducts
IF OBJECT_ID ('TProductCategories')    IS NOT NULL    DROP TABLE TorderProducts
IF OBJECT_ID ('TVendors')              IS NOT NULL    DROP TABLE TVendors
IF OBJECT_ID ('TCities')               IS NOT NULL    DROP TABLE TCities
IF OBJECT_ID ('TStates')               IS NOT NULL    DROP TABLE TStates

-- --------------------------------------------------------------------------------
--	Step #1 : Create table 
-- --------------------------------------------------------------------------------

CREATE TABLE TCustomers
(
  intCustomerID      INTEGER          NOT NULL
  ,strFirstName      VARCHAR(255)     NOT NULL
  ,strLastName       VARCHAR(255)     NOT NULL
  ,strAddress        VARCHAR(255)     NOT NULL
  ,intCityID         INTEGER          NOT NULL
  ,intStateID        INTEGER          NOT NULL
  ,strZip            VARCHAR(255)     NOT NULL
  ,dtmDateOfBirth    DATETIME         NOT NULL
  ,intRaceID         INTEGER          NOT NULL
  ,intGenderID       INTEGER          NOT NULL
  ,CONSTRAINT TCustomers_PK PRIMARY KEY (intCustomerID)
)

CREATE TABLE TCities
(
  intCityID			INTEGER		NOT NULL
 ,strCity			VARCHAR(255)	NOT NULL
 ,CONSTRAINT TCities_PK PRIMARY KEY ( intCityID )
)

CREATE TABLE TStates
(
 intStateID			INTEGER		NOT NULL
 ,strState			VARCHAR(255)	NOT NULL
 ,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)

CREATE TABLE TRaces
(
 intRaceID			INTEGER		NOT NULL
,strRace			VARCHAR(255)	NOT NULL
,CONSTRAINT TRaces_PK PRIMARY KEY ( intRaceID )
)

CREATE TABLE TGenders
(
 intGenderID		INTEGER			NOT NULL
,strGender		VARCHAR(255)		NOT NULL
,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)

CREATE TABLE TOrders
(
 intOrderID			INTEGER			NOT NULL
,intCustomerID			INTEGER			NOT NULL
,strOrderNumber			VARCHAR(255)		NOT NULL
,intStatusID			INTEGER			NOT NULL
,dtmOrderDate			DATETIME		NOT NULL
,CONSTRAINT TOrders_PK PRIMARY KEY ( intOrderID )
)

CREATE TABLE TStatuses
(
 intStatusID			INTEGER			NOT NULL
,strStatus			VARCHAR(255)		NOT NULL
,CONSTRAINT TStatuses_PK PRIMARY KEY ( intStatusID )
)

CREATE TABLE TProducts
(
 intProductID			INTEGER			NOT NULL
,intVendorID			INTEGER			NOT NULL
,strProductName			VARCHAR(255)		NOT NULL
,monCostofProduct		MONEY			NOT NULL
,monRetailCost			MONEY			NOT NULL
,intProductCategoryID		INTEGER			NOT NULL
,intInventory			INTEGER			NOT NULL
,CONSTRAINT TProducts_PK PRIMARY KEY ( intProductID )
)

CREATE TABLE TProductCategories	
(
 intProductCategoryID		INTEGER			NOT NULL
,strProductCategory		VARCHAR(255)		NOT NULL
,CONSTRAINT TProductCategories_PK PRIMARY KEY ( intProductCategoryID )
)

CREATE TABLE TVendors
(
 intVendorID			INTEGER			NOT NULL
,strVendorName			VARCHAR(255)		NOT NULL
,strAddress			VARCHAR(255)		NOT NULL
,intCityID			INTEGER			NOT NULL
,intStateID			INTEGER			NOT NULL
,strZip				VARCHAR(255)		NOT NULL
,strContactFirstName		VARCHAR(255)		NOT NULL
,strContactLastName		VARCHAR(255)		NOT NULL
,strContactPhone		VARCHAR(255)		NOT NULL
,strContactEmail		VARCHAR(255)		NOT NULL
,CONSTRAINT TVendors_PK PRIMARY KEY ( intVendorID )
)

CREATE TABLE TOrderProducts
(
 intOrderProductID		INTEGER			NOT NULL
,intOrderID			INTEGER			NOT NULL
,intProductID			INTEGER			NOT NULL
,CONSTRAINT TTOrderProducts_PK PRIMARY KEY ( intOrderProductID )
)

-- --------------------------------------------------------------------------------
--	Step #2 : Establish Referential Integrity 
-- --------------------------------------------------------------------------------
--
-- #	Child				Parent				Column
-- -	-----				------				---------
-- 1	TOrders				TCustomers			intCustomerID	
-- 2	TProducts			TVendors			intVendorID
-- 3	TOrderProducts			TOrders				intOrderID
-- 4	TOrderProducts			TProducts			intProductID
-- 5	TCustomers			TStates				intStateID
-- 6	TCustomers			TCities				intCityID
-- 7	TCustomers			TGenders			intGenderID
-- 8	TCustomers			TRaces				intRaceID
-- 9	TOrders				TStatuses			intStatusID
-- 10	TProducts			TProductCategories		intProductCategoryID
-- 11	TVendors			TStates				intStateID
-- 12	TVendors			TCities				intCityID

--1
ALTER TABLE TOrders ADD CONSTRAINT TOrders_TCustomers_FK 
FOREIGN KEY ( intCustomerID ) REFERENCES TCustomers ( intCustomerID )

--2
ALTER TABLE TProducts ADD CONSTRAINT TProducts_TVendors_FK 
FOREIGN KEY ( intVendorID ) REFERENCES TVendors ( intVendorID )

--3
ALTER TABLE TOrderProducts ADD CONSTRAINT TOrderProducts_TOrders_FK 
FOREIGN KEY ( intOrderID ) REFERENCES TOrders ( intOrderID )

--4
ALTER TABLE TOrderProducts ADD CONSTRAINT TOrderProducts_TProducts_FK 
FOREIGN KEY ( intProductID ) REFERENCES TProducts ( intProductID )

--5
ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TStates_FK 
FOREIGN KEY ( intStateID ) REFERENCES TStates (intStateID ) ON DELETE CASCADE

--6
ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TCities_FK 
FOREIGN KEY ( intCityID ) REFERENCES TCities (intCityID ) ON DELETE CASCADE

--7
ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TRaces_FK 
FOREIGN KEY ( intRaceID ) REFERENCES TRaces (intRaceID ) ON DELETE CASCADE

--8
ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TGenders_FK 
FOREIGN KEY ( intGenderID ) REFERENCES TGenders (intGenderID ) ON DELETE CASCADE

--9
ALTER TABLE TOrders ADD CONSTRAINT TOrders_TStatuses_FK 
FOREIGN KEY ( intStatusID ) REFERENCES TStatuses (intStatusID ) ON DELETE CASCADE

--10
ALTER TABLE TProducts ADD CONSTRAINT TProducts_TProductCategories_FK 
FOREIGN KEY ( intProductCategoryID ) REFERENCES TProductCategories (intProductCategoryID ) ON DELETE CASCADE

--11
ALTER TABLE TVendors ADD CONSTRAINT TVendors_TStates_FK 
FOREIGN KEY ( intStateID ) REFERENCES TStates (intStateID ) ON DELETE CASCADE

--12
ALTER TABLE TVendors ADD CONSTRAINT TVendors_TCities_FK 
FOREIGN KEY ( intCityID ) REFERENCES TCities (intCityID ) ON DELETE CASCADE

-- --------------------------------------------------------------------------------
--	Step #3 : Add Data - INSERTS
-- --------------------------------------------------------------------------------
INSERT INTO TStates( intStateID, strState)
VALUES			(1, 'Ohio')
				   ,(2, 'Kentucky')
				   ,(3, 'Indiana')

INSERT INTO TCities( intCityID, strCity)
VALUES			(1, 'Cincinnati')
				   ,(2, 'Florence')
				   ,(3, 'Norwood')
				   ,(4, 'Milford')
				   ,(5, 'West Chester')

INSERT INTO TRaces( intRaceID, strRace)
VALUES			(1, 'Hispanic')
				   ,(2, 'African American')
				   ,(3, 'Cuacasion')
				   ,(4, 'Asian')

INSERT INTO TGenders( intGenderID, strGender)
VALUES			(1, 'Male')
				   ,(2, 'Female')
				   ,(3, 'Other')

INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, intCityID, intStateID, strZip, dtmDateOfBirth, intRaceID, intGenderID)
VALUES			(1, 'James', 'Jones', '321 Elm St.', 1, 1, '45201', '1/1/1997', 1, 1)
					 ,(2, 'Sally', 'Smith', '987 Main St.', 3, 1, '45218', '12/1/1999', 2, 2)
					 ,(3, 'Jose', 'Hernandez', '1569 Windisch Rd.', 5, 1, '45069', '9/23/1998', 1, 1)
					 ,(4, 'Lan', 'Kim', '44561 Oak Ave.', 4, 1, '45246', '6/11/1999', 4, 1)
					 ,(5, 'Bob', 'Nields', '44561 Oak Ave.', 4, 1, '45246', '6/11/1999', 4, 1)

INSERT INTO TStatuses( intStatusID, strStatus)
VALUES			(1, 'Ordered')
				   ,(2, 'Shipped')
				   ,(3, 'Delivered')


INSERT INTO TOrders ( intOrderID, intCustomerID, strOrderNumber, intStatusID, dtmOrderDate)
VALUES		 ( 1, 1, '10101010', 2, '8/28/2017')
					,( 2, 1, '20202020', 1, '8/28/2007')
					,( 3, 2, '30303030', 3, '6/28/2017')
					,( 4, 4, '40404040', 3, '5/28/2007')

INSERT INTO TVendors ( intVendorID, strVendorName, strAddress, intCityID, intStateID, strZip, strContactFirstName, strContactLastName, strContactPhone, strContactEmail)
VALUES				 (1, 'TreesRUs', '321 Elm St.', 1, 1, '45201', 'Iwana', 'Cleantooth', '555-555-5555', 'Icleantooth@treesrus.com')
						  ,(2, 'ShirtsRUs', '987 Main St.', 3, 1, '45218', 'Eilene', 'Totheright' , '666-666-6666', 'etotheright@shirtsrus.com')
						  ,(3, 'ToysRUs', '1569 Windisch Rd.', 5, 1, '45069', 'Mike', 'Metosing', '888-888-8888', 'mmetosing@toysrus.com')					  

INSERT INTO TProductCategories( intProductCategoryID, strProductCategory)
VALUES			(1, 'Every Day')
				   ,(2, 'Apparel')
				   ,(3, 'Electronics')


INSERT INTO TProducts( intProductID, intVendorID, strProductName, monCostofProduct, monRetailCost, intProductCategoryID, intInventory)
VALUES			   (1, 1,'Toothpicks', .10, .40, 1, 100000)
						  ,(2, 2,'T-Shirts', 5.10, 15.40, 2, 2000)
						  ,(3, 3,'uPlay', 44.10, 85.40, 3, 3)

INSERT INTO TOrderProducts ( intOrderProductID, intOrderID, intProductID)
VALUES		 ( 1, 1, 1 )
					,( 2, 1, 2 )
					,( 3, 2, 3 )
					,( 4, 3, 2 )
					,( 5, 3, 3 )
					,( 6, 4, 3 )

-- --------------------------------------------------------------------------------
--	Step #4 : Explicit Joins
-- --------------------------------------------------------------------------------
--Write an explicit join that shows each customers names, order dates, 
--and the products on the order.  Order the list based on customer and order date. 

Select	 TC.intCustomerID
		,TC.strFirstName
		,TC.strLastName
		,TOR.intOrderID
	    ,TOR.dtmOrderDate
		,TP.intProductID
		,TP.strProductName
From TCustomers AS TC 
	JOIN TOrders AS TOR
	   ON TC.intCustomerID = TOR.intCustomerID
	JOIN TOrderProducts AS TORP
	   ON TORP.intOrderID = TOR.intOrderID
	JOIN TProducts AS TP
	   ON TP.intProductID = TORP.intProductID
Order By 
	    TC.strLastName ASC
	   ,TC.strFirstName ASC
	   ,TOR.dtmOrderDate DESC

--Write and explicit join that shows all products. 
--Show and order the list by vendor name and product category and 
--retail price (highest price first - lowest price last). 

Select   TP.intProductID
		,TP.strProductName
		,TP.monRetailCost
		,TV.intVendorID
		,TV.strVendorName
		,TPC.intProductCategoryID
		,TPC.strProductCategory		
From TProducts AS TP 
	JOIN TProductCategories AS TPC
	   ON TP.intProductCategoryID = TPC.intProductCategoryID
	JOIN TVendors AS TV
	   ON TV.intVendorID = TP.intVendorID
Order By 
	    TV.strVendorName
	   ,TPC.strProductCategory
	   ,TP.monRetailCost DESC

--Write an explicit join that shows all products and 
--their inventory and their vendors name and contact information 
--for products who inventory is less than 10. 

Select   TP.intProductID
		,TP.strProductName
		,TP.intInventory
		,TV.intVendorID
		,TV.strVendorName
		,TV.strContactFirstName
		,TV.strContactLastName		
From TProducts AS TP 
	JOIN TVendors AS TV
	   ON TV.intVendorID = TP.intVendorID
Where 
	   TP.intInventory < 10	  
Order By 
	   TP.strProductName

--Write an explicit join that shows all products order by males older than 21.  
--Show and order the list based on the customer's race. 

Select	 TC.intCustomerID
		,TC.strFirstName
		,TC.strLastName
		,TOR.intOrderID
		,TOR.dtmOrderDate
		,TP.intProductID
	    ,TP.strProductName
From TCustomers AS TC 
	JOIN TOrders AS TOR
		ON TC.intCustomerID = TOR.intCustomerID
	JOIN TOrderProducts AS TORP
		ON TORP.intOrderID = TOR.intOrderID
	JOIN TProducts AS TP
		ON TP.intProductID = TORP.intProductID
	JOIN TGenders AS TG 
		ON TG.intGenderID = TC.intGenderID
	JOIN TRaces AS TR
		ON TR.intRaceID = TC.intRaceID
Where 
	TC.dtmDateOfBirth < '1/1/1997'
	and TG.strGender = 'Male'
Order By 
	   TR.intRaceID 

--Write an explicit join that shows the list of vendors of which 
--products were ordered based on the customer's state.  
--Order the result set by state. 

Select Distinct  TV.strVendorName
				,TV.intVendorID
				,TP.intProductID
				,TP.strProductName
				,TS.intStateID
				,TS.strState
From TCustomers AS TC 
	JOIN TOrders AS TOR
		ON TC.intCustomerID = TOR.intCustomerID
	JOIN TOrderProducts AS TORP
		ON TORP.intOrderID = TOR.intOrderID
	JOIN TProducts AS TP
		ON TP.intProductID = TORP.intProductID
	JOIN TStates AS TS 
		ON TS.intStateID = TC.intStateID
	JOIN TVendors AS TV
		ON TV.intVendorID = TP.intVendorID
Order By 
	   TS.strState, TV.strVendorName
