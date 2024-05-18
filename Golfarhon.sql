- --------------------------------------------------------------------------------
-- Name: Antipas Zemba
-- Abstract: Golfathon Database 
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbSQL1;   -- Get out of the master database
SET NOCOUNT ON;		-- Report only errors

-- uspCleanDatabase

-- --------------------------------------------------------------------------------
-- Drop Tables
-- --------------------------------------------------------------------------------
IF OBJECT_ID( 'TEventCorporateSponsorshipTypeCorporateSponsors' )	IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypeCorporateSponsors
IF OBJECT_ID( 'TEventCorporateSponsorshipTypeBenefits' )		IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypeBenefits
IF OBJECT_ID( 'TEventCorporateSponsorshipTypes' )			IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypes
IF OBJECT_ID( 'TCorporateSponsors' )					IS NOT NULL DROP TABLE TCorporateSponsors
IF OBJECT_ID( 'TCorporateSponsorshipTypes' )				IS NOT NULL DROP TABLE TCorporateSponsorshipTypes

IF OBJECT_ID( 'TBenefits' )						IS NOT NULL DROP TABLE TBenefits
IF OBJECT_ID( 'TEventGolferTeamandClubs')				IS NOT NULL DROP TABLE TEventGolferTeamandClubs
IF OBJECT_ID( 'TEventGolferTeams' )					IS NOT NULL DROP TABLE TEventGolferTeams
IF OBJECT_ID( 'TEventGolferSponsors' )					IS NOT NULL DROP TABLE TEventGolferSponsors
IF OBJECT_ID( 'TEventGolfers' )						IS NOT NULL DROP TABLE TEventGolfers

IF OBJECT_ID( 'TSponsors' )						IS NOT NULL DROP TABLE TSponsors
IF OBJECT_ID( 'TEvents' )						IS NOT NULL DROP TABLE TEvents
IF OBJECT_ID( 'TGolfers' )						IS NOT NULL DROP TABLE TGolfers		
IF OBJECT_ID( 'TTeamandClubs' )						IS NOT NULL DROP TABLE TTeamandClubs
IF OBJECT_ID( 'TLevelofTeams' )						IS NOT NULL DROP TABLE TLevelofTeams

IF OBJECT_ID( 'TGenders' )						IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID( 'TTypeofTeams' )						IS NOT NULL DROP TABLE TTypeofTeams
IF OBJECT_ID( 'TShirtSizes' )						IS NOT NULL DROP TABLE TShirtSizes
IF OBJECT_ID( 'TStates' )						IS NOT NULL DROP TABLE TStates
IF OBJECT_ID( 'TPaymentStatuses' )					IS NOT NULL DROP TABLE TPaymentStatuses

IF OBJECT_ID( 'TPaymentTypes' )						IS NOT NULL DROP TABLE TPaymentTypes 

-- --------------------------------------------------------------------------------
-- Step #1.1: Create Tables
-- --------------------------------------------------------------------------------
CREATE TABLE TEvents
(
	 intEventID			INTEGER		NOT NULL
	,dtmEventDate			Date		NOT NULL
	,CONSTRAINT TEvents_PK PRIMARY KEY ( intEventID )
)

CREATE TABLE TGolfers
(
	 intGolferID			INTEGER		NOT NULL
	,strFirstName			VARCHAR(255)	NOT NULL
	,strLastName			VARCHAR(255)	NOT NULL
	,strAddress			VARCHAR(255)	NOT NULL
	,strCity			VARCHAR(255)	NOT NULL
	,intStateID			INTEGER		NOT NULL
	,strZip				ARCHAR(255)	NOT NULL
	,strPhoneNumber			VARCHAR(255)	NOT NULL
	,strEmail			VARCHAR(255)	NOT NULL
	,intShirtSizeID			Integer		NOT NULL
	,intGenderID			Integer		NOT NULL
	,CONSTRAINT TGolfers_PK PRIMARY KEY ( intGolferID )
)

CREATE TABLE TShirtSizes
(
	 intShirtSizeID						INTEGER			NOT NULL
	,strShirtSizeDesc					VARCHAR(255)	NOT NULL
	,CONSTRAINT TShirtSizes_PK PRIMARY KEY ( intShirtSizeID )
)

CREATE TABLE TEventGolfers
(						
	 intEventGolferID					INTEGER			NOT NULL
	,intEventID							INTEGER			NOT NULL
	,intGolferID						INTEGER			NOT NULL
	,strReasonforPlaying				VARCHAR(8000)	NOT NULL
	,CONSTRAINT TEventGolfers_PK PRIMARY KEY ( intEventGolferID )
)

CREATE TABLE TEventGolferTeamandClubs
(						
	 intEventGolferTeamandClubID		INTEGER			NOT NULL
	,intEventGolferID					INTEGER			NOT NULL
	,intTeamandClubID					INTEGER			NOT NULL
	,CONSTRAINT TEventGolferTeams_PK PRIMARY KEY ( intEventGolferTeamandClubID )
)

CREATE TABLE TTeamandClubs
(						
	 intTeamandClubID					INTEGER			NOT NULL
	,intTypeofTeamID					INTEGER			NOT NULL
	,intLevelofTeamID					INTEGER			NOT NULL
	,intGenderID						INTEGER			NOT NULL
	,CONSTRAINT TTeamandClubs_PK PRIMARY KEY ( intTeamandClubID )
)

CREATE TABLE TTypeofTeams
(
	 intTypeofTeamID					INTEGER			NOT NULL
	,strTypeofTeamDesc					Varchar(255)	NOT NULL
	,CONSTRAINT TTypeofTeams_PK PRIMARY KEY ( intTypeofTeamID )
)

CREATE TABLE TLevelofTeams
(
	 intLevelofTeamID					INTEGER			NOT NULL
	,strLevelDesc						Varchar(255)	NOT NULL
	,CONSTRAINT TLevelofTeams_PK PRIMARY KEY ( intLevelofTeamID )
)

CREATE TABLE TGenders
(
	 intGenderID						INTEGER			NOT NULL
	,strGenderDesc						Varchar(255)	NOT NULL
	,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)

CREATE TABLE TEventGolferSponsors 
(
	 intEventGolferSponsorID			INTEGER			NOT NULL
	,intEventGolferID					INTEGER			NOT NULL
	,intSponsorID						INTEGER			NOT NULL
	,monPledgeAmount					MONEY			NOT NULL
	,dteDateofPledge					DATE			NOT NULL
	,intPaymentStatusID					INTEGER			NOT NULL
	,intPaymentTypeID					INTEGER			NOT NULL
	,CONSTRAINT TEventGolferSponsors_PK PRIMARY KEY ( intEventGolferSponsorID )
)

CREATE TABLE TSponsors
(
	 intSponsorID						INTEGER			NOT NULL
	,strFirstName						VARCHAR(255)	NOT NULL
	,strLastName						VARCHAR(255)	NOT NULL
	,strAddress							VARCHAR(255)	NOT NULL
	,strCity							VARCHAR(255)	NOT NULL
	,intStateID							INTEGER			NOT NULL
	,strZip								VARCHAR(255)	NOT NULL
	,strPhoneNumber						VARCHAR(255)	NOT NULL
	,strEmail							VARCHAR(255)	NOT NULL
	,CONSTRAINT TSponsors_PK PRIMARY KEY ( intSponsorID )
)

CREATE TABLE TPaymentTypes
(
	 intPaymentTypeID					INTEGER			NOT NULL
	,strPaymentTypeDesc					Varchar(255)	NOT NULL
	,CONSTRAINT TPaymentTypes_PK PRIMARY KEY ( intPaymentTypeID )
)

CREATE TABLE TPaymentStatuses
(
	 intPaymentStatusID					INTEGER			NOT NULL
	,strPaymentStatuseDesc				Varchar(255)	NOT NULL
	,CONSTRAINT TPaymentStatuses_PK PRIMARY KEY ( intPaymentStatusID )

)

CREATE TABLE TStates
(
	 intStateID							INTEGER			NOT NULL
	,strStateDesc						Varchar(255)	NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)

CREATE TABLE TEventCorporateSponsorshipTypes
(
	 intEventCorporateSponsorshipTypeID	INTEGER			NOT NULL
	,intEventID							INTEGER			NOT NULL
	,intCorporateSponsorshipTypeID		INTEGER			NOT NULL
	,monTypeCost						MONEY			NOT NULL
	,intAvailable						INTEGER			NOT NULL
	,CONSTRAINT EventCorporateSponsorshipTypes_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeID )
)

CREATE TABLE TCorporateSponsorshipTypes
(
	 intCorporateSponsorshipTypeID		INTEGER			NOT NULL
	,strTypeDescription					VARCHAR(255)	NOT NULL
	,CONSTRAINT TCorporateSponsorshipTypes_PK PRIMARY KEY (  intCorporateSponsorshipTypeID )
)

CREATE TABLE TEventCorporateSponsorshipTypeBenefits
(
	 intEventCorporateSponsorshipTypeBenefitID	INTEGER			NOT NULL
	,intEventCorporateSponsorshipTypeID			INTEGER			NOT NULL
	,intBenefitID								INTEGER			NOT NULL  
	,CONSTRAINT TEventCorporateSponsorshipTypeBenefits_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeBenefitID )
)

CREATE TABLE TBenefits
(
	 intBenefitID						INTEGER			NOT NULL
	,strBenefitDescription				VARCHAR(255)	NOT NULL  
	,CONSTRAINT TBenefits_PK PRIMARY KEY ( intBenefitID )
)


CREATE TABLE TEventCorporateSponsorshipTypeCorporateSponsors
(
	 intEventCorporateSponsorshipTypeCorporateSponsorID		INTEGER			NOT NULL
	,intEventCorporateSponsorshipTypeID						INTEGER			NOT NULL
	,intCorporateSponsorID									INTEGER			NOT NULL
	,CONSTRAINT TCorporateSponsorshipsCorporateSponsors_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeCorporateSponsorID )	 
)

CREATE TABLE TCorporateSponsors
(
	 intCorporateSponsorID				INTEGER			NOT NULL
	,strCompanyName						VARCHAR(255)	NOT NULL
	,strFirstName						VARCHAR(255)	NOT NULL
	,strLastName						VARCHAR(255)	NOT NULL
	,strAddress							VARCHAR(255)	NOT NULL
	,strCity							VARCHAR(255)	NOT NULL
	,intStateID							INTEGER			NOT NULL
	,strZip								VARCHAR(255)	NOT NULL
	,strPhoneNumber						VARCHAR(255)	NOT NULL
	,strEmail							VARCHAR(255)	NOT NULL
	,CONSTRAINT TCorporateSponsors_PK PRIMARY KEY ( intCorporateSponsorID )
)

-- --------------------------------------------------------------------------------
-- Step #1.2: Identify and Create Foreign Keys
-- --------------------------------------------------------------------------------
--
-- #	Child										Parent							Column(s)
-- -	-----										------							---------
-- 1	TGolfer										TShirtSizes						intShirtSizeID   --
-- 2	TEventGolfers								TEvents							intEventID --
-- 3	TEventGolfers								TGolfers						intGolferID --

-- 4	TEventGolferTeamandClubs					TEventGolfers					intEventGolferID --

-- 5	TEventGolferTeamandClubs					TTeamandClubs					intTeamandClubID --
-- 6	TTeamandClubs								TTypeofTeams					intTypeofTeamID --
-- 7	TTeamandClubs								TLevelofTeams					intLevelofTeamID --
-- 8	TTeamandClubs								TGenders						intGenderID --

-- 9	TEventGolferSponsorships					TEventGolfers					intEventGolferID --
-- 10	TEventGolferSponsorships					TSponsors						intSponsorID --
-- 11	TEventGolferSponsorships					TPaymentTypes					intPaymentTypeID  --
-- 12	TEventGolferSponsorships					TPaymentStatuses				TPaymentStatusID --
	
-- 13	TEventCorporateSponsorshipTypes				TEvents							intEventID --
-- 14	TEventCorporateSponsorshipTypes				TCorporateSponsorshipTypes		intCorporateSponsorshipTypeID --

-- 15	TEventCorporateSponsorshipTypeBenefits			TEventCorporateSponsorshipsTypes	intEventCorporateSponsorshipsTypeID
-- 16	TEventCorporateSponsorshipTypeBenefits			TBenefits							intBenefitID 
-- 17	TEventCorporateSponsorshipTypeCorporateSponsors	TEventCorporateSponsorTypes			intEventCorporateSponsorshipsTypeID
-- 18	TEventCorporateSponsorshipTypeCorporateSponsors	TCorporateSponsors					intCorporateSponsorID

-- 19	TGolfer										TStates							intStateID
-- 20	TSponsors									TStates							intStateID
-- 21	TCorporateSponsors							TStates							intStateID
			


-- 1
ALTER TABLE TGolfers ADD CONSTRAINT TGolfer_TShirtSizes_FK
FOREIGN KEY ( intShirtSizeID ) REFERENCES TShirtSizes ( intShirtSizeID )

-- 2
ALTER TABLE TEventGolfers ADD CONSTRAINT TEventGolfers_TEvents_FK
FOREIGN KEY ( intEventID ) REFERENCES TEvents ( intEventID )

-- 3
ALTER TABLE TEventGolfers ADD CONSTRAINT TEventGolfers_TGolfers_FK
FOREIGN KEY ( intGolferID ) REFERENCES TGolfers ( intGolferID )

-- 4
ALTER TABLE TEventGolferTeamandClubs ADD CONSTRAINT TEventGolferTeamandClubs_TEventGolfers_FK
FOREIGN KEY ( intEventGolferID ) REFERENCES TEventGolfers ( intEventGolferID )

-- 5
ALTER TABLE TEventGolferTeamandClubs ADD CONSTRAINT TEventGolferTeamandClubs_TTeamandClubs_FK
FOREIGN KEY ( intTeamandClubID ) REFERENCES TTeamandClubs ( intTeamandClubID )

-- 6
ALTER TABLE TTeamandClubs ADD CONSTRAINT TTeamandClubs_TTypeofTeams_FK
FOREIGN KEY ( intTypeofTeamID ) REFERENCES TTypeofTeams( intTypeofTeamID )

-- 7
ALTER TABLE TTeamandClubs ADD CONSTRAINT TTeamandClubs_TLevelofTeams_FK
FOREIGN KEY ( intLevelofTeamID ) REFERENCES TLevelofTeams ( intLevelofTeamID )

-- 8
ALTER TABLE TTeamandClubs ADD CONSTRAINT TTeamandClubs_TGenders_FK
FOREIGN KEY ( intGenderID ) REFERENCES TGenders ( intGenderID )

-- 9
ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_TEventGolfers_FK
FOREIGN KEY ( intEventGolferID ) REFERENCES TEventGolfers (intEventGolferID )

-- 10
ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_TSponsor_FK
FOREIGN KEY ( intSponsorID ) REFERENCES TSponsors ( intSponsorID )

-- 11
ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_TPaymentType_FK
FOREIGN KEY ( intPaymentTypeID ) REFERENCES TPaymentTypes ( intPaymentTypeID )

-- 12
ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_TPaymentStatuses_FK
FOREIGN KEY ( intPaymentStatusID ) REFERENCES TPaymentStatuses ( intPaymentStatusID )

-- 13
ALTER TABLE TEventCorporateSponsorshipTypes ADD CONSTRAINT TEventCorporateSponsorshipTypes_TEvents_FK
FOREIGN KEY ( intEventID ) REFERENCES TEvents ( intEventID )

-- 14
ALTER TABLE TEventCorporateSponsorshipTypes ADD CONSTRAINT TEventCorporateSponsorshipTypes_TCorporateSponsorshipTypes_FK
FOREIGN KEY ( intCorporateSponsorshipTypeID ) REFERENCES TCorporateSponsorshipTypes ( intCorporateSponsorshipTypeID )

-- 15
ALTER TABLE TEventCorporateSponsorshipTypeBenefits	 ADD CONSTRAINT TEventCorporateSponsorshipTypeBenefits_TEventCorporateSponsorshipTypes_FK
FOREIGN KEY ( intEventCorporateSponsorshipTypeID ) REFERENCES TEventCorporateSponsorshipTypes ( intEventCorporateSponsorshipTypeID )

-- 16
ALTER TABLE TEventCorporateSponsorshipTypeBenefits ADD CONSTRAINT TEventCorporateSponsorshipTypeBenefits_TBenefits_FK
FOREIGN KEY ( intBenefitID  ) REFERENCES TBenefits( intBenefitID  )

-- 17
ALTER TABLE TEventCorporateSponsorshipTypeCorporateSponsors ADD CONSTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_TEventCorporateSponsorshipTypes_FK
FOREIGN KEY ( intEventCorporateSponsorshipTypeID ) REFERENCES TEventCorporateSponsorshipTypes ( intEventCorporateSponsorshipTypeID )

-- 18
ALTER TABLE TEventCorporateSponsorshipTypeCorporateSponsors ADD CONSTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_TCorporateSponsors_FK
FOREIGN KEY ( intCorporateSponsorID ) REFERENCES TCorporateSponsors( intCorporateSponsorID )

-- 19
ALTER TABLE TGolfers ADD CONSTRAINT TGolfers_TStates_FK
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

-- 20
ALTER TABLE TSponsors ADD CONSTRAINT TSponsors_TStates_FK
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

-- 21
ALTER TABLE TCorporateSponsors ADD CONSTRAINT TCorporateSponsors_TStates_FK
FOREIGN KEY ( intStateID ) REFERENCES TStates (intStateID )

-- --------------------------------------------------------------------------------
-- Add Records into Shirt Sizes
-- --------------------------------------------------------------------------------
INSERT INTO TShirtSizes ( intShirtSizeID, strShirtSizeDesc )
VALUES	 ( 1, 'Mens Small' )
		,( 2, 'Mens Medium' )
		,( 3, 'Mens Large' )
		,( 4, 'Mens XLarge' )
		,( 5, 'Womens Small' )
		,( 6, 'Womens Medium' )
		,( 7, 'Womens Large' )
		,( 8, 'Womens XLarge' )


-- --------------------------------------------------------------------------------
-- Add Records into States
-- --------------------------------------------------------------------------------

INSERT INTO TStates ( intStateID, strStateDesc )
VALUES	 ( 1, 'Ohio' )
		,( 2, 'Kentucky' )
		,( 3, 'Indiana' )

-- --------------------------------------------------------------------------------
-- Add Records into Golfers
-- --------------------------------------------------------------------------------
INSERT INTO TGolfers( intGolferID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhoneNumber, strEmail, intShirtSizeID, intGenderID )
VALUES	 ( 1, 'Bob', 'Nields', '8741 Rosebrook Drive', 'Florence', 2, '41042', '8597602063', 'bnields@gmail.com', 4, 1)
		,( 2, 'Jay', 'Graue', '1111 SHDHS Drive', 'Florence', 2, '41042', '8597602222', 'jgraue@gmail.com', 4, 1)
		,( 3, 'Mary', 'Beimesch', '4444 Tobertge Drive', 'Hebron', 2, '41012', '8597603333', 'mb@gmail.com', 4, 2)
		,( 4, 'Tony', 'Hardan', '2222 Track', 'Ft. Thomas', 2, '41018', '8592222063', 'thardon@gmail.com', 4, 1)
		,( 5, 'Iwana', 'Bucks', '2222 Track', 'Ft. Thomas', 2, '41018', '8592222063', 'thardon@gmail.com', 4, 1)
		
-- --------------------------------------------------------------------------------
-- Add Records into Event Years
-- --------------------------------------------------------------------------------

INSERT INTO TEvents ( intEventID, dtmEventdate )
VALUES	 ( 1, '2015' )
		,( 2, '2016' )
		,( 3, '2017' )
		,( 4, '2018' )

-- --------------------------------------------------------------------------------
-- Add Records into Genders
-- --------------------------------------------------------------------------------

INSERT INTO TGenders ( intGenderID, strGenderDesc )
VALUES	 ( 1, 'Male' )
		,( 2, 'Female' )	
 

-- --------------------------------------------------------------------------------
-- Add Records into Levels
-- --------------------------------------------------------------------------------

INSERT INTO TLevelofTeams ( intLevelofTeamID, strLevelDesc )
VALUES	 ( 1, 'Freshman' )
		,( 2, 'Junior Varsity' )
		,( 3, 'Varsity' )
	
-- --------------------------------------------------------------------------------
-- Add Records into Type of Teams
-- --------------------------------------------------------------------------------

INSERT INTO TTypeofTeams ( intTypeofTeamID, strTypeofTeamDesc )
VALUES	 ( 1, 'Basketball' )
		,( 2, 'Baseball' )
		,( 3, 'Football' )
		,( 4, 'Volleyball' )
		,( 5, 'Soccer' )
		,( 6, 'Cross Country' )
		,( 7, 'Track' )
		,( 8, 'Softball' )
		,( 9, 'Golf' )
		,( 10, 'Swimming' )


-- --------------------------------------------------------------------------------
-- Add Records into EventGolfers
-- --------------------------------------------------------------------------------

INSERT INTO TEventGolfers ( intEventGolferID, intEventID, intGolferID, strReasonforPlaying ) 
VALUES	 (1, 1, 1, 'Love Golf')
		,(2, 1, 2, 'Love Playing Golf')
		,(3, 2, 1, 'Love Playing A lot of Golf')
		,(4, 2, 2, 'Love Raising Money')
		,(5, 1, 3, 'Love Money')
		,(6, 2, 3, 'Love Raising A lot of Money')
		,(7, 3, 4, 'Love Golf')


-- --------------------------------------------------------------------------------
-- Add Records into TeamandClubs xx
-- --------------------------------------------------------------------------------

INSERT INTO TTeamandClubs ( intTeamandClubID, intGenderID, intLevelofTeamID, intTypeofTeamID ) 
VALUES	 ( 1, 1, 1, 9 )
		,( 2, 1, 2, 9 )
		,( 3, 2, 3, 3 )
		,( 4, 1, 3, 9 )
		,( 5, 2, 3, 9 )
		,( 6, 2, 3, 4 )
		,( 7, 1, 3, 3 )
		,( 8, 1, 3, 4 )


-- --------------------------------------------------------------------------------
-- Add Records into EventGolferTeamandClubs 
-- --------------------------------------------------------------------------------

INSERT INTO TEventGolferTeamandClubs ( intEventGolferTeamandClubID, intEventGolferID, intTeamandClubID ) 
VALUES	 ( 1, 1, 1 )
		,( 2, 1, 2 )
		,( 3, 2, 3 )
		,( 4, 1, 4 )
		,( 5, 2, 5 )
		,( 6, 3, 6 )
		,( 7, 3, 7 )
		,( 8, 4, 8 )


-- --------------------------------------------------------------------------------
-- Add Records into Sponsors
-- --------------------------------------------------------------------------------

INSERT INTO TSponsors( intSponsorID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhoneNumber, strEmail )
VALUES	 ( 1, 'Bob', 'Nields', '8741 Rosebrook Drive', 'Florence', 2, '41042', '8597602063', 'bnields@gmail.com')
		,( 2, 'Jay', 'Graue', '1111 SHDHS Drive', 'Florence', 2, '41042', '8597602222', 'jgraue@gmail.com')
		,( 3, 'Mary', 'Beimesch', '4444 Tobertge Drive', 'Hebron', 2, '41012', '8597603333', 'mb@gmail.com')
		,( 4, 'Casi', 'Nields', '1111 Track', 'Ft. Thomas', 2, '41018', '8592222063', 'cinields@gmail.com')
		,( 5, 'Rosanne', 'Nields', '3333 Track', 'Ft. Thomas', 2, '41018', '8592222063', 'rnields@gmail.com')
		,( 6, 'Bob', 'Hardan', '2222 Track', 'Ft. Thomas', 2, '41018', '8592222063', 'bharden@gmail.com')
		,( 7, 'Liz', 'Beimesch', '2222 Track', 'Ft. Thomas', 2, '41018', '8592222063', 'lbeimesch@gmail.com')
		,( 8, 'Betty', 'Graue', '2222 Track', 'Ft. Thomas', 2, '41018', '8592222063', 'thardon@gmail.com')
		,( 9, 'Sue', 'Graue', '2222 SHDHS Drive', 'Florence', 2, '41042', '8597602222', 'sgraue@gmail.com')
		,( 10, 'Dave', 'Otte', '3333 SHDHS Drive', 'Florence', 2, '41042', '8597602222', 'dotte@gmail.com')
		,( 11, 'Taylor', 'Potts', '9999 SHDHS Drive', 'Florence', 2, '41042', '8597602222', 'tpotts@gmail.com')
		,( 12, 'Dan', 'Tobergte', '7777 SHDHS Drive', 'Florence', 2, '41042', '8597602222', 'dtobergte@gmail.com')


-- --------------------------------------------------------------------------------
-- Add Records into Payment Type
-- --------------------------------------------------------------------------------

INSERT INTO TPaymentTypes ( intPaymentTypeID, strPaymentTypeDesc )
VALUES	 ( 1, 'Check' )
		,( 2, 'Cash' )
		,( 3, 'Credit Card' )
		
-- --------------------------------------------------------------------------------
-- Add Records into Sponsor Type
-- --------------------------------------------------------------------------------

INSERT INTO TPaymentStatuses ( intPaymentStatusID, strPaymentStatuseDesc)
VALUES	 ( 1, 'Unpaid' )
		,( 2, 'Paid' )
	
-- --------------------------------------------------------------------------------
-- Add Records into EventGolferSponsors
-- --------------------------------------------------------------------------------

INSERT INTO TEventGolferSponsors( intEventGolferSponsorID, intEventGolferID, intSponsorID, monPledgeAmount, dteDateofPledge, intPaymentStatusID, intPaymentTypeID ) 
VALUES	 (1, 1, 1, 1.00,'1/1/2016', 2, 3 )
		,(2, 1, 1, .50, '1/1/2016', 2, 3 )
		,(3, 1, 2, .25, '1/1/2016', 1, 1 )
		,(4, 2, 3, 2.00,'1/1/2016',2, 1 )
		,(5, 2, 4, 25.00, '1/1/2016', 2, 1 )
		,(6, 3, 5, .20, '1/1/2016', 2, 1 )
		,(7, 3, 6, 1.00, '1/1/2016', 1, 1 )
		,(8, 4, 7, 25.00, '1/1/2016', 2, 3 )

-- --------------------------------------------------------------------------------
-- Add Records into CorporateSponsorshipTypes
-- --------------------------------------------------------------------------------

INSERT INTO TCorporateSponsorshipTypes(  intCorporateSponsorshipTypeID, strTypeDescription )
VALUES	 (1, 'Cart Sponsor' )
		,(2, 'Lunch Sponsor' )
		,(3, 'Shirt Sponsor' )

-- --------------------------------------------------------------------------------
-- Add Records into EventCorporateSponsorshipTypes
-- --------------------------------------------------------------------------------

INSERT INTO TEventCorporateSponsorshipTypes( intEventCorporateSponsorshipTypeID, intEventID, intCorporateSponsorshipTypeID, monTypeCost ,intAvailable)
VALUES	 (1, 1, 1, 500.00, 3 )
		,(2, 1, 2, 200.00, 3 )
		,(3, 2, 2, 100.00, 1 )
		,(4, 1, 3, 2000.00, 1 )

-- --------------------------------------------------------------------------------
-- Add Records into   CorporateSponsors 
-- --------------------------------------------------------------------------------
									
INSERT INTO TCorporateSponsors( intCorporateSponsorID, strCompanyName, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhoneNumber, strEmail ) 
VALUES	 (1, 'ABC Company', 'Bob', 'Nields', '8741 Rosebrook Drive', 'Florence',  2, '41042', '8597602063', 'bnields@gmail.com' )
		,(2, 'CCBS Company', 'Jay', 'Graue', '1111 SHDHS Drive',  'Erlanger',  2, '41042', '8597602222', 'jgraue@gmail.com')
		,(3, 'TRES Company', 'Mary', 'Beimesch', '4444 Tobertge Drive',  'Hebron', 2, '41012', '8597603333', 'mb@gmail.com')
		,(4, 'Getta Company','Betty', 'Graue', '2222 Track', 'Walton', 2, '41018', '8592222063', 'thardon@gmail.com')
		 

-- --------------------------------------------------------------------------------
-- Add Records into  EventCorporateSponsorshipTypeCorporateSponsors
-- --------------------------------------------------------------------------------
									
INSERT INTO TEventCorporateSponsorshipTypeCorporateSponsors( intEventCorporateSponsorshipTypeCorporateSponsorID, intEventCorporateSponsorshipTypeID, intCorporateSponsorID ) 
VALUES	 (1, 1, 1 )
		,(2, 1, 2 )
		,(3, 2, 3 )
		,(4, 3, 1 )
		,(5, 4, 4 )
		 
-- --------------------------------------------------------------------------------
-- Aggregate #1
-- --------------------------------------------------------------------------------
SELECT COUNT(TE.intEventID) AS TotalEvents
FROM TEvents AS TE

-- --------------------------------------------------------------------------------
-- Aggregate #2  -- only pulling donations
-- --------------------------------------------------------------------------------
SELECT TE.dtmEventDate
	   ,COUNT(TEGS.intSponsorID) AS TotalSponsors
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	JOIN TSponsors AS TS
		ON TS.intSponsorID = TEGS.intSponsorID								
Group By TE.dtmEventDate

-- --------------------------------------------------------------------------------
-- Aggregate #3
-- --------------------------------------------------------------------------------
SELECT	TE.dtmEventDate 
	   ,SUM(TEGS.monPledgeAmount * 100) AS TotalPledged
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID						
Group By TE.dtmEventDate

-- --------------------------------------------------------------------------------
-- Aggregate #4
-- --------------------------------------------------------------------------------
SELECT	TE.dtmEventDate 
	   ,SUM(TEGS.monPledgeAmount * 100) AS TotalCollected
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID

Where TEGS.intPaymentStatusID = 2								
Group By TE.dtmEventDate

-- --------------------------------------------------------------------------------
-- Aggregate #5
-- --------------------------------------------------------------------------------
SELECT	 TE.dtmEventDate
		,TG.strFirstName
		,TG.strLastName
	   ,SUM(TEGS.monPledgeAmount * 100) AS TotalPledges
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	JOIN TGolfers AS TG
		ON TG.intGolferID = TEG.intGolferID
WHERE TEGS.intPaymentStatusID = 2
      AND TE.dtmEventDate = '2015'							
GROUP BY TE.dtmEventDate
		,TG.strFirstName
		,TG.strLastName
HAVING SUM(TEGS.monPledgeAmount * 100) > 2500

-- --------------------------------------------------------------------------------
-- Aggregate #6
-- --------------------------------------------------------------------------------
SELECT	 TE.dtmEventDate
		,TG.strFirstName
		,TG.strLastName
	   ,SUM(TEGS.monPledgeAmount * 100) AS TotalPledges
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	JOIN TGolfers AS TG
		ON TG.intGolferID = TEG.intGolferID
WHERE TE.dtmEventDate = '2015'							
GROUP BY TE.dtmEventDate
		,TG.strFirstName
		,TG.strLastName
Order By TotalPledges DESC

-- --------------------------------------------------------------------------------
-- Aggregate #7
-- --------------------------------------------------------------------------------
SELECT	TE.dtmEventDate
	   ,AVG(TEGS.monPledgeAmount * 100) AS AvgSponsors
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	
Group By TE.dtmEventDate

-- --------------------------------------------------------------------------------
-- Aggregate #8  -- In this answer...we can not pull back the name of the person 
-- who had the highest pledge. This is due to the fact that if we add the First name 
-- and last name to the select list, it has to be in the GROUP BY Clause.  And by adding 
-- the GROUP BY clause, we will get all Golfers.  
-- However, by sorting the result set descending (highest first), you can then just pull 
-- off the TOP 1 row from the result set.  NOTE:  TOP 1 does not pull off 
-- the highest...just the TOP from the result set.  
-- --------------------------------------------------------------------------------
SELECT	TOP 1
        TS.strFirstName
       ,TS.strLastName
	   ,MAX(TEGS.monPledgeAmount) AS HighestPledge
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	JOIN TSponsors AS TS
		ON TS.intSponsorID = TEGS.intSponsorID			
GROUP BY TS.strFirstName
		,TS.strLastName
ORDER BY HighestPledge DESC

-- --------------------------------------------------------------------------------
-- Aggregate #8.1 --->  What happens if there is a tie or need to consider a tie?
--                      ANSWER:  you can add WITH TIES to the TOP Clause!!
-- --------------------------------------------------------------------------------
SELECT	TOP 1 With TIES
        TS.strFirstName
       ,TS.strLastName
	   ,MAX(TEGS.monPledgeAmount) AS HighestPledge
FROM	 TEvents AS TE
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	JOIN TSponsors AS TS
		ON TS.intSponsorID = TEGS.intSponsorID			
GROUP BY TS.strFirstName
		,TS.strLastName
ORDER BY HighestPledge DESC

-- --------------------------------------------------------------------------------
-- Aggregate #9
-- --------------------------------------------------------------------------------
SELECT	TOP 1
        TS.strFirstName
       ,TS.strLastName
	   ,MIN(TEGS.monPledgeAmount) AS LowestPledge
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	JOIN TSponsors AS TS
		ON TS.intSponsorID = TEGS.intSponsorID			
GROUP BY TS.strFirstName
		,TS.strLastName
ORDER BY LowestPledge  

-- --------------------------------------------------------------------------------
-- Aggregate #10
-- --------------------------------------------------------------------------------
SELECT	Top 1
		(TG.strGenderDesc + ' ' + TLT.strLevelDesc + ' ' + TTT.strTypeofTeamDesc) as TheTeam
	   ,SUM(TEGS.monPledgeAmount * 100) AS TopTeam
FROM	 TEvents AS TE 
	JOIN TEventGolfers AS TEG
		ON TE.intEventID = TEG.intEventID
	JOIN TEventGolferSponsors AS TEGS
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	JOIN TSponsors AS TS
		ON TS.intSponsorID = TEGS.intSponsorID	
	JOIN TEventGolferTeamandClubs AS TEGTC
		ON TEGTC.intEventGolferID = TEG.intEventGolferID
	JOIN TTeamandClubs AS TTC
		ON TTC.intTeamandClubID = TEGTC.intTeamandClubID
	JOIN TGenders AS TG 
		ON TG.intGenderID = TTC.intGenderID
	JOIN TLevelofTeams AS TLT 
		ON TLT.intLevelofTeamID = TTC.intLevelofTeamID
	JOIN TTypeofTeams AS TTT
		ON TTT.intTypeofTeamID = TTC.intTypeofTeamID
WHERE TE.dtmEventDate = '2015'
GROUP BY TG.strGenderDesc
		,TLT.strLevelDesc
		,TTT.strTypeofTeamDesc
ORDER BY TopTeam DESC
 
-- --------------------------------------------------------------------------------
-- Aggregate #11
-- --------------------------------------------------------------------------------
SELECT	 SUM(TECS.monTypeCost) TotalSponsors
FROM	 TEvents as TE 
	JOIN TEventCorporateSponsorshipTypes as TECS
		ON TE.intEventID = TECS.intEventID
	JOIN TEventCorporateSponsorshipTypeCorporateSponsors as TECSTCS
		ON TECSTCS.intEventCorporateSponsorshipTypeID = TECS.intEventCorporateSponsorshipTypeID	
WHERE TE.dtmEventDate = '2015' 
