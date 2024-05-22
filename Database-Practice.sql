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

