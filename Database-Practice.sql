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
	 intCityID			INTEGER			NOT NULL
	,strCity			VARCHAR(255)	NOT NULL
	,CONSTRAINT TCities_PK PRIMARY KEY ( intCityID )
)

CREATE TABLE TStates
(
	 intStateID			INTEGER			NOT NULL
	,strState			VARCHAR(255)	NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)

CREATE TABLE TRaces
(
	 intRaceID			INTEGER			NOT NULL
	,strRace			VARCHAR(255)	NOT NULL
	,CONSTRAINT TRaces_PK PRIMARY KEY ( intRaceID )
)

CREATE TABLE TGenders
(
	 intGenderID		INTEGER			NOT NULL
	,strGender			VARCHAR(255)	NOT NULL
	,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)

CREATE TABLE TOrders
(
	 intOrderID				INTEGER			NOT NULL
	,intCustomerID			INTEGER			NOT NULL
	,strOrderNumber			VARCHAR(255)	NOT NULL
	,intStatusID			INTEGER			NOT NULL
	,dtmOrderDate			DATETIME		NOT NULL
	,CONSTRAINT TOrders_PK PRIMARY KEY ( intOrderID )
)

CREATE TABLE TStatuses
(
	 intStatusID			INTEGER			NOT NULL
	,strStatus				VARCHAR(255)	NOT NULL
	,CONSTRAINT TStatuses_PK PRIMARY KEY ( intStatusID )
)

CREATE TABLE TProducts
(
	 intProductID			INTEGER			NOT NULL
	,intVendorID			INTEGER			NOT NULL
	,strProductName			VARCHAR(255)	NOT NULL
	,monCostofProduct		MONEY			NOT NULL
	,monRetailCost			MONEY			NOT NULL
	,intProductCategoryID	INTEGER			NOT NULL
	,intInventory			INTEGER			NOT NULL
	,CONSTRAINT TProducts_PK PRIMARY KEY ( intProductID )
)

CREATE TABLE TProductCategories	
(
	 intProductCategoryID	INTEGER			NOT NULL
	,strProductCategory		VARCHAR(255)	NOT NULL
	,CONSTRAINT TProductCategories_PK PRIMARY KEY ( intProductCategoryID )
)

CREATE TABLE TVendors
(
	 intVendorID			INTEGER			NOT NULL
	,strVendorName			VARCHAR(255)	NOT NULL
	,strAddress				VARCHAR(255)	NOT NULL
	,intCityID				INTEGER			NOT NULL
	,intStateID				INTEGER			NOT NULL
	,strZip					VARCHAR(255)	NOT NULL
	,strContactFirstName	VARCHAR(255)	NOT NULL
	,strContactLastName		VARCHAR(255)	NOT NULL
	,strContactPhone		VARCHAR(255)	NOT NULL
	,strContactEmail		VARCHAR(255)	NOT NULL
	,CONSTRAINT TVendors_PK PRIMARY KEY ( intVendorID )
)

CREATE TABLE TOrderProducts
(
	 intOrderProductID		INTEGER			NOT NULL
	,intOrderID				INTEGER			NOT NULL
	,intProductID			INTEGER			NOT NULL
	,CONSTRAINT TTOrderProducts_PK PRIMARY KEY ( intOrderProductID )
)
