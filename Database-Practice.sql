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
