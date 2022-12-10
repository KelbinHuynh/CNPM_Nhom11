-----------------------------------------------------------------------------------------------------------------
-- AUTH: GIDEON
-- DATE: 29TH OCT 2022
---------------------------------
-- DESCRIPTION: 
-----------------------------------------------------------------------------------------------------------------




--START DATABASE--
CREATE DATABASE FINALPROJECT
GO
/*
USE master
GO
DROP DATABASE FINALPROJECT
GO
*/
-----------------------------------------------------------------------------------------------------------------

USE FINALPROJECT
GO

-----------------------------------------------------------------------------------------------------------------

--CREATE TABLES--
CREATE TABLE ADMIN(
	ID			NVARCHAR(20) PRIMARY KEY
	,NAME		NVARCHAR(255)
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE STUDENT(
	ID				NVARCHAR(20)	PRIMARY KEY
	,FULLNAME		NVARCHAR(255)
	,MALE			BIT
	,DATEOFBIRTH	DATE
	,PHONENUMBER	NVARCHAR(10)
	,TEAM			NVARCHAR(20)
	,MAJOR			NVARCHAR(20)
	,GRADUATE_PRJ	BIT			DEFAULT 0
	,MAJOR_PRJ		BIT			DEFAULT 0
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE LECTURER(
	ID				NVARCHAR(20)	PRIMARY KEY
	,FULLNAME		NVARCHAR(255)
	,MALE			BIT
	,MAJOR			NVARCHAR(20)
	,LEVEL			NVARCHAR(255)			
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE ACCOUNT(
	ID				NVARCHAR(20)	PRIMARY KEY
	,USERNAME		NVARCHAR(225)	UNIQUE
	,PASSWORD		NVARCHAR(255)
	,ROLE			INT	--0:ADMIN, 1:LECTURE, 2: STUDENT
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE MAJOR(
	ID				NVARCHAR(20)	PRIMARY KEY
	,NAME			NVARCHAR(225)
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE PROJECT(
	ID					NVARCHAR(20)	PRIMARY KEY
	,NAME				NVARCHAR(225)
	,DETAILS			NVARCHAR(4000)
	,COMPLETION_TIME	DATE
	,IS_GRADUATE		BIT
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE TEAM(
	ID			NVARCHAR(20)	PRIMARY KEY
	,LEADER		NVARCHAR(20)
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE TKB(
	ID			NVARCHAR(20)	PRIMARY KEY,
	ROOM		NVARCHAR(20),
	DAY			DATE,
	TIMEOFDAY	BIT
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE AD_ACC(
	ID			NVARCHAR(20)	PRIMARY KEY,
	ACCOUNT		NVARCHAR(20)	FOREIGN KEY REFERENCES ACCOUNT(ID),
	ADMIN		NVARCHAR(20)	FOREIGN KEY REFERENCES ADMIN(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE STD_ACC(
	ID			NVARCHAR(20)	PRIMARY KEY,
	ACCOUNT		NVARCHAR(20)	FOREIGN KEY REFERENCES ACCOUNT(ID),
	STUDENT		NVARCHAR(20)	FOREIGN KEY REFERENCES STUDENT(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE LEC_ACC(
	ID			NVARCHAR(20)	PRIMARY KEY,
	ACCOUNT		NVARCHAR(20)	FOREIGN KEY REFERENCES ACCOUNT(ID),
	LECTURER	NVARCHAR(20)	FOREIGN KEY REFERENCES LECTURER(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE STD_MAJ(
	ID			NVARCHAR(20)	PRIMARY KEY,
	STUDENT		NVARCHAR(20)	FOREIGN KEY REFERENCES STUDENT(ID),
	MAJOR		NVARCHAR(20)	FOREIGN KEY REFERENCES MAJOR(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE LEC_MAJ(
	ID			NVARCHAR(20)	PRIMARY KEY,
	LECTURER	NVARCHAR(20)	FOREIGN KEY REFERENCES LECTURER(ID),
	MAJOR		NVARCHAR(20)	FOREIGN KEY REFERENCES MAJOR(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE PRJ_MAJ(
	ID			NVARCHAR(20)	PRIMARY KEY,
	PROJECT		NVARCHAR(20)	FOREIGN KEY REFERENCES PROJECT(ID),
	MAJOR		NVARCHAR(20)	FOREIGN KEY REFERENCES MAJOR(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE TEAM_PRJ(
	ID			NVARCHAR(20)	PRIMARY KEY,
	TEAM		NVARCHAR(20)	FOREIGN KEY REFERENCES TEAM(ID),
	PROJECT		NVARCHAR(20)	FOREIGN KEY REFERENCES PROJECT(ID),
	SCORE		INT,
	PROTECTED	BIT,	--TRẠNG THÁI ĐÃ ĐƯỢC BỎA VỆ HAY CHƯA CỦA PROJECT, 0; CHƯA BẢO VỆ, 1: ĐÃ BẢO VỆ 
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE STD_PRJ(
	ID			NVARCHAR(20)	PRIMARY KEY,
	STUDENT		NVARCHAR(20)	FOREIGN KEY REFERENCES STUDENT(ID),
	PROJECT		NVARCHAR(20)	FOREIGN KEY REFERENCES PROJECT(ID),

	UNIQUE(STUDENT, PROJECT),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE LEC_PRJ(
	ID			NVARCHAR(20)	PRIMARY KEY,
	LECTURER	NVARCHAR(20)	FOREIGN KEY REFERENCES LECTURER(ID),
	PROJECT		NVARCHAR(20)	FOREIGN KEY REFERENCES PROJECT(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE STD_TEAM(
	ID			NVARCHAR(20)	PRIMARY KEY,
	STUDENT		NVARCHAR(20)	FOREIGN KEY REFERENCES STUDENT(ID),
	TEAM		NVARCHAR(20)	FOREIGN KEY REFERENCES TEAM(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE LEC_TEAM(
	ID			NVARCHAR(20)	PRIMARY KEY,
	LECTURER	NVARCHAR(20)	FOREIGN KEY REFERENCES LECTURER(ID),
	TEAM		NVARCHAR(20)	FOREIGN KEY REFERENCES TEAM(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE TKB_LEC(
	ID				NVARCHAR(20)	PRIMARY KEY,
	TKB				NVARCHAR(20)	FOREIGN KEY REFERENCES TKB(ID),
	LECTURER		NVARCHAR(20)	FOREIGN KEY REFERENCES LECTURER(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
CREATE TABLE TEAM_TKB(
	ID			NVARCHAR(20)	PRIMARY KEY,
	TEAM		NVARCHAR(20)	FOREIGN KEY REFERENCES TEAM(ID),
	TKB			NVARCHAR(20)	FOREIGN KEY REFERENCES TKB(ID),
);
GO
-----------------------------------------------------------------------------------------------------------------
--CREATE SUB TABLE

--***************************************************************************************************************

--CREATE SEQUENCE--
CREATE SEQUENCE SEQ_ADMIN
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_STUDENT
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_LECTURER
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_ACCOUNT
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_MAJOR
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_PROJECT
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_TEAM
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_TKB
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_AD_ACC
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_STD_ACC
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_LEC_ACC
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_STD_MAJ
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_LEC_MAJ
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_PRJ_MAJ
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_TEAM_PRJ
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_STD_PRJ
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_LEC_PRJ
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_STD_TEAM
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_LEC_TEAM
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_TKB_LEC
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE SEQ_TEAM_TKB
AS BIGINT
	START WITH 0
	INCREMENT BY 1
	MAXVALUE 9223372036854775807
GO
-----------------------------------------------------------------------------------------------------------------
--MORE SEQUENCES--
--***************************************************************************************************************

--<ADMIN> FUNCTIONS AND PROCEDURE*******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_ADMIN(
	@ID		NVARCHAR(20)
)
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_ADMIN()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_ADMIN()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <TABLEBNAME>
CREATE OR ALTER PROCEDURE INS_ADMIN
	@NAME		NVARCHAR(255)
	,@USERNAME	NVARCHAR(255)
	,@PASSWORD	NVARCHAR(255)
AS
DECLARE 
	@ID			NVARCHAR(20)
	,@IDACC		NVARCHAR(20)
	--GET ID--
SET @ID			= CAST(NEXT VALUE FOR SEQ_ADMIN AS NVARCHAR(20))
	--INSERT--
	INSERT INTO 
		ADMIN(
			ID
			,NAME
		)
		VALUES(
			@ID
			,@NAME
		)

	EXEC INS_ACCOUNT	@USERNAME, @PASSWORD, 0
	SELECT 
		@IDACC = CAST(current_value AS NVARCHAR(20))
	FROM sys.sequences
	WHERE NAME = 'SEQ_ACCOUNT';
	EXEC INS_AD_ACC		@IDACC, @ID
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <ADMIN>
CREATE OR ALTER PROCEDURE UPD_ADMIN
	@ID			NVARCHAR(20)
	,@NAME		NVARCHAR(255)
AS
	--UPDATE--
	UPDATE 
		ADMIN
	SET 
		NAME = @NAME
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_ADMIN
	@ID			NVARCHAR(20)
AS
DECLARE 
	@CHECK		INT
	,@IDACC		NVARCHAR(20)
	,@IDADACC	NVARCHAR(20)
SELECT @CHECK = dbo.CHK_DEL_ADMIN()
SELECT 
	@IDACC = ACCOUNT.ID
	,@IDADACC = AD_ACC.ID
FROM 
	ADMIN 
	LEFT OUTER JOIN AD_ACC		ON	AD_ACC.ADMIN	= ADMIN.ID
	LEFT OUTER JOIN ACCOUNT		ON  ACCOUNT.ID		= AD_ACC.ACCOUNT
WHERE
	ADMIN.ID = @ID
	--DELETE--
	EXEC DEL_AD_ACC		@IDADACC
	EXEC DEL_ACCOUNT	@IDACC
	DELETE FROM
		ADMIN
	WHERE 
		ID = @ID;
		
GO
--END <ADMIN> FUNCTIONS AND PROCEDURE***************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<STUDENT> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_STUDENT(
	@ID		NVARCHAR(20)
)
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_STUDENT()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_STUDENT()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <STUDENT>
CREATE OR ALTER PROCEDURE INS_STUDENT
	@FULLNAME		NVARCHAR(255)
	,@MALE			BIT
	,@DATEOFBIRTH	DATE
	,@PHONENUMBER	NVARCHAR(10)
	,@MAJOR			NVARCHAR(20)
	,@USERNAME		NVARCHAR(255)
	,@PASSWORD		NVARCHAR(255)
AS
DECLARE		
	@ID			NVARCHAR(20)
	,@IDACC		NVARCHAR(20)

	--GET ID--
SET @ID			= CAST(NEXT VALUE FOR SEQ_STUDENT AS NVARCHAR(20))

	--INSERT--
	INSERT INTO 
		STUDENT(
			ID
			,FULLNAME
			,MALE
			,DATEOFBIRTH
			,PHONENUMBER
			,TEAM
			,MAJOR
			,GRADUATE_PRJ
			,MAJOR_PRJ
		)
		VALUES(
			@ID
			,@FULLNAME
			,@MALE
			,@DATEOFBIRTH
			,@PHONENUMBER
			,NULL
			,@MAJOR
			,0
			,0
		)
		
	EXEC INS_ACCOUNT	@USERNAME, @PASSWORD, 2 
	SELECT 
		@IDACC = CAST(current_value AS NVARCHAR(20))
	FROM sys.sequences
	WHERE NAME = 'SEQ_ACCOUNT';
	EXEC INS_STD_ACC		@IDACC, @ID
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <STUDENT>
CREATE OR ALTER PROCEDURE UPD_STUDENT
	@ID				NVARCHAR(20)
	,@FULLNAME		NVARCHAR(255)
	,@MALE			BIT
	,@DATEOFBIRTH	DATE
	,@PHONENUMBER	NVARCHAR(10)
	,@TEAM			NVARCHAR(20)
	,@MAJOR			NVARCHAR(20)
	,@GRADUATE_PRJ	BIT
	,@MAJOR_PRJ		BIT
AS
	--UPDATE--
	UPDATE 
		STUDENT
	SET 
		FULLNAME		= @FULLNAME
		,MALE			= @MALE
		,DATEOFBIRTH	= @DATEOFBIRTH
		,PHONENUMBER	= @PHONENUMBER
		,TEAM			= @TEAM
		,MAJOR			= @MAJOR
		,GRADUATE_PRJ	= @GRADUATE_PRJ
		,MAJOR_PRJ		= @MAJOR_PRJ
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_STUDENT
	@ID			NVARCHAR(20)
AS
DECLARE 
	@CHECK		INT
	,@IDACC		NVARCHAR(20)
	,@IDSTDACC	NVARCHAR(20)
SELECT @CHECK = dbo.CHK_DEL_STUDENT()
SELECT 
	@IDACC		= ACCOUNT.ID
	,@IDSTDACC	= STD_ACC.ID
FROM 
	STUDENT
	LEFT OUTER JOIN STD_ACC		ON	STD_ACC.STUDENT	= STUDENT.ID
	LEFT OUTER JOIN ACCOUNT		ON  ACCOUNT.ID		= STD_ACC.ACCOUNT
WHERE
	STUDENT.ID = @ID
	--DELETE--
	DELETE FROM
		STUDENT
	WHERE 
		ID = @ID;

	EXEC DEL_ACCOUNT	@IDACC
	EXEC DEL_AD_ACC		@IDSTDACC
GO
--END <STUDENT> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<LECTURER> FUNCTIONS AND PROCEDURE*****************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_LECTURER(
	@ID		NVARCHAR(20)
)
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_LECTURER()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_LECTURER()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <LECTURER>
CREATE OR ALTER PROCEDURE INS_LECTURER
	@FULLNAME		NVARCHAR(255)
	,@MALE			BIT
	,@MAJOR			NVARCHAR(20)
	,@LEVEL			NVARCHAR(255)
	,@USERNAME		NVARCHAR(255)
	,@PASSWORD		NVARCHAR(255)
AS
DECLARE 
	@ID			NVARCHAR(20)
	,@IDACC		NVARCHAR(20)

--GET ID--
SET @ID			= CAST(NEXT VALUE FOR SEQ_LECTURER AS NVARCHAR(20))

	--INSERT--
	INSERT INTO 
		LECTURER(
			ID
			,FULLNAME		
			,MALE	
			,MAJOR		
			,LEVEL		
		)
		VALUES(
			@ID
			,@FULLNAME
			,@MALE
			,@MAJOR
			,@LEVEL
		)
			
	
	EXEC INS_ACCOUNT	@USERNAME, @PASSWORD, 1
	SELECT 
		@IDACC = CAST(current_value AS NVARCHAR(20))
	FROM sys.sequences
	WHERE NAME = 'SEQ_ACCOUNT';
	EXEC INS_LEC_ACC		@IDACC, @ID
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <LECTURER>
CREATE OR ALTER PROCEDURE UPD_LECTURER
	@ID			NVARCHAR(20)
	,@FULLNAME		NVARCHAR(255)
	,@MALE			BIT
	,@MAJOR			NVARCHAR(20)
	,@LEVEL			NVARCHAR(255)
AS
	--UPDATE--
	UPDATE 
		LECTURER
	SET 
		FULLNAME		= @FULLNAME
		,MALE			= @MALE
		,MAJOR			= @MAJOR
		,LEVEL			= @LEVEL
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_LECTURER
	@ID			NVARCHAR(20)
AS
DECLARE 
	@CHECK		INT
	,@IDACC		NVARCHAR(20)
	,@IDLECACC	NVARCHAR(20)
SELECT @CHECK = dbo.CHK_DEL_LECTURER()
SELECT 
	@IDACC		= ACCOUNT.ID
	,@IDLECACC	= LEC_ACC.ID
FROM 
	LECTURER
	LEFT OUTER JOIN LEC_ACC		ON	LEC_ACC.LECTURER	= LECTURER.ID
	LEFT OUTER JOIN ACCOUNT		ON  ACCOUNT.ID			= LEC_ACC.ACCOUNT
WHERE
	LECTURER.ID = @ID

	EXEC DEL_AD_ACC		@IDLECACC
	EXEC DEL_ACCOUNT	@IDACC
	--DELETE--
	DELETE FROM
		LECTURER
	WHERE 
		ID = @ID;
		

GO
--END <LECTURER> FUNCTIONS AND PROCEDURE*************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<ACCOUNT> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_ACCOUNT(
	@USERNAME	NVARCHAR(255)
)
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_ACCOUNT()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_ACCOUNT()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <ACCOUNT>
CREATE OR ALTER PROCEDURE INS_ACCOUNT
	@USERNAME			NVARCHAR(255)
	,@PASSWORD			NVARCHAR(255)
	,@ROLE				INT
AS
DECLARE 
	@ID			NVARCHAR(20)
	,@IS_INS		INT
SET @IS_INS = dbo.CHK_INS_ACCOUNT(@USERNAME);

	IF @IS_INS <> 0
	BEGIN
		--GET ID--
		SELECT @ID = CAST(NEXT VALUE FOR SEQ_ACCOUNT AS NVARCHAR(20))

		--INSERT--
		INSERT INTO 
			ACCOUNT(
				ID
				,USERNAME
				,PASSWORD
				,ROLE
			)
			VALUES(
				@ID
				,@USERNAME
				,@PASSWORD
				,@ROLE
			)
	END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <ACCOUNT>
CREATE OR ALTER PROCEDURE UPD_ACCOUNT
	@ID				NVARCHAR(20)
	,@USERNAME		NVARCHAR(255)
	,@PASSWORD		NVARCHAR(255)
	,@ROLE			INT
AS
	--UPDATE--
	UPDATE 
		ACCOUNT 
	SET 
		USERNAME		= @USERNAME
		,PASSWORD		= @PASSWORD
		,ROLE			= @ROLE
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_ACCOUNT
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_ACCOUNT()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		ACCOUNT
	WHERE 
		ID = @ID;
GO
--END <ACCOUNT> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<MAJOR> FUNCTIONS AND PROCEDURE********************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_MAJOR()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_MAJOR()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_MAJOR()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <MAJOR>
CREATE OR ALTER PROCEDURE INS_MAJOR
	@NAME				NVARCHAR(255)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_MAJOR AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		MAJOR(
			ID
			,NAME
		)
		VALUES(
			@ID
			,@NAME
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <MAJOR>
CREATE OR ALTER PROCEDURE UPD_MAJOR
	@ID			NVARCHAR(20)
	,@NAME		NVARCHAR(255)
AS
	--UPDATE--
	UPDATE 
		MAJOR 
	SET 
		NAME			= @NAME
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_MAJOR
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_MAJOR()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		MAJOR
	WHERE 
		ID = @ID;
GO
--END <MAJOR> FUNCTIONS AND PROCEDURE****************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<PROJECT> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_PROJECT()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_PROJECT()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_PROJECT()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <PROJECT>
CREATE OR ALTER PROCEDURE INS_PROJECT
	@NAME				NVARCHAR(225)
	,@DETAILS			NVARCHAR(4000)
	,@COMPLETION_TIME	DATE
	,@IS_GRADUATE		BIT
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_PROJECT AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		PROJECT(
			ID
			,NAME				
			,DETAILS		
			,COMPLETION_TIME
			,IS_GRADUATE		
		)
		VALUES(
			@ID
			,@NAME				
			,@DETAILS		
			,@COMPLETION_TIME
			,@IS_GRADUATE
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <PROJECT>
CREATE OR ALTER PROCEDURE UPD_PROJECT
	@ID			NVARCHAR(20)
	,@NAME				NVARCHAR(225)
	,@DETAILS			NVARCHAR(4000)
	,@COMPLETION_TIME	DATE
	,@IS_GRADUATE		BIT
AS
	--UPDATE--
	UPDATE 
		PROJECT 
	SET 
		NAME				= @NAME
		,DETAILS			= @DETAILS
		,COMPLETION_TIME	= @COMPLETION_TIME
		,IS_GRADUATE		= @IS_GRADUATE
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_PROJECT
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_PROJECT()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		PROJECT
	WHERE 
		ID = @ID;
GO
--END <PROJECT> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<TEAM> FUNCTIONS AND PROCEDURE*********************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <TEAM>
CREATE OR ALTER PROCEDURE INS_TEAM
	@LEADER				NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_TEAM AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		TEAM(
			ID
			,LEADER		
		)
		VALUES(
			@ID
			,@LEADER
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <TEAM>
CREATE OR ALTER PROCEDURE UPD_TEAM
	@ID			NVARCHAR(20)
	,@LEADER	NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		TEAM 
	SET 
		LEADER	= @LEADER
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_TEAM
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_TEAM()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		TEAM
	WHERE 
		ID = @ID;
GO
--END <TEAM> FUNCTIONS AND PROCEDURE*****************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<TKB> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_TKB()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_TKB()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_TKB()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <TKB>
CREATE OR ALTER PROCEDURE INS_TKB
	@ROOM			NVARCHAR(20)
	,@DAY			DATE
	,@TIMEOFDAY		BIT
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_TKB AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		TKB(
			ID
			,ROOM		
			,DAY			
			,TIMEOFDAY	
		)
		VALUES(
			@ID
			,@ROOM
			,@DAY
			,@TIMEOFDAY
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <TKB>
CREATE OR ALTER PROCEDURE UPD_TKB
	@ID			NVARCHAR(20)
	,@ROOM			NVARCHAR(20)
	,@DAY			DATE
	,@TIMEOFDAY		BIT
AS
	--UPDATE--
	UPDATE 
		TKB 
	SET 
		ROOM			= @ROOM
		,DAY			= @DAY
		,TIMEOFDAY		= @TIMEOFDAY
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_TKB
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_TKB()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		TKB
	WHERE 
		ID = @ID;
GO
--END <TKB> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--<AD_ACC> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_AD_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_AD_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_AD_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <AD_ACC>
CREATE OR ALTER PROCEDURE INS_AD_ACC
	@ACCOUNT		NVARCHAR(20)
	,@ADMIN			NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_AD_ACC AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		AD_ACC(
			ID
			,ACCOUNT
			,ADMIN
		)
		VALUES(
			@ID
			,@ACCOUNT
			,@ADMIN
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <AD_ACC>
CREATE OR ALTER PROCEDURE UPD_AD_ACC
	@ID			NVARCHAR(20)
	,@ACCOUNT		NVARCHAR(20)
	,@ADMIN			NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		AD_ACC 
	SET 
			ACCOUNT = @ACCOUNT
			,ADMIN	 =@ADMIN
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_AD_ACC
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_AD_ACC()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		AD_ACC
	WHERE 
		ID = @ID;
GO
--END <AD_ACC> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************-----------------------------------------------------------------------------------------------------------------
--<STD_ACC> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_STD_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_STD_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_STD_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <STD_ACC>
CREATE OR ALTER PROCEDURE INS_STD_ACC
	@ACCOUNT		NVARCHAR(20)
	,@STUDENT		NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_STD_ACC AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		STD_ACC(
			ID
			,ACCOUNT
			,STUDENT
		)
		VALUES(
			@ID
			,@ACCOUNT
			,@STUDENT
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <STD_ACC>
CREATE OR ALTER PROCEDURE UPD_STD_ACC
	@ID				NVARCHAR(20)
	,@ACCOUNT		NVARCHAR(20)
	,@STUDENT		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		STD_ACC 
	SET 
			ACCOUNT		= @ACCOUNT
			,STUDENT	= @STUDENT
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_STD_ACC
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_STD_ACC()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		STD_ACC
	WHERE 
		ID = @ID;
GO
--END <STD_ACC> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<LEC_ACC> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_LEC_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_LEC_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_LEC_ACC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <LEC_ACC>
CREATE OR ALTER PROCEDURE INS_LEC_ACC
	@ACCOUNT		NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_LEC_ACC AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		LEC_ACC(
			ID
			,ACCOUNT
			,LECTURER
		)
		VALUES(
			@ID
			,@ACCOUNT
			,@LECTURER
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <LEC_ACC>
CREATE OR ALTER PROCEDURE UPD_LEC_ACC
	@ID				NVARCHAR(20)
	,@ACCOUNT		NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		LEC_ACC 
	SET 
			ACCOUNT		= @ACCOUNT
			,LECTURER	= @LECTURER
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_LEC_ACC
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_LEC_ACC()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		LEC_ACC
	WHERE 
		ID = @ID;
GO
--END <LEC_ACC> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<STD_MAJ> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_STD_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_STD_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_STD_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <STD_MAJ>
CREATE OR ALTER PROCEDURE INS_STD_MAJ
	@STUDENT		NVARCHAR(20)
	,@MAJOR			NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_STD_MAJ AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		STD_MAJ(
			ID
			,STUDENT
			,MAJOR
		)
		VALUES(
			@ID
			,@STUDENT
			,@MAJOR
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <STD_MAJ>
CREATE OR ALTER PROCEDURE UPD_STD_MAJ
	@ID				NVARCHAR(20)
	,@STUDENT		NVARCHAR(20)
	,@MAJOR			NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		STD_MAJ 
	SET 
			STUDENT		= @STUDENT
			,MAJOR		= @MAJOR
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_STD_MAJ
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_STD_MAJ()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		STD_MAJ
	WHERE 
		ID = @ID;
GO
--END <STD_MAJ> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<LEC_MAJ> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_LEC_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_LEC_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_LEC_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <LEC_MAJ>
CREATE OR ALTER PROCEDURE INS_LEC_MAJ
	@LECTURER		NVARCHAR(20)
	,@MAJOR			NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_LEC_MAJ AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		LEC_MAJ(
			ID
			,LECTURER
			,MAJOR
		)
		VALUES(
			@ID
			,@LECTURER
			,@MAJOR
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <LEC_MAJ>
CREATE OR ALTER PROCEDURE UPD_LEC_MAJ
	@ID				NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
	,@MAJOR			NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		LEC_MAJ 
	SET 
			LECTURER		= @LECTURER
			,MAJOR			= @MAJOR
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_LEC_MAJ
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_LEC_MAJ()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		LEC_MAJ
	WHERE 
		ID = @ID;
GO
--END <LEC_MAJ> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<PRJ_MAJ> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_PRJ_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_PRJ_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_PRJ_MAJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <PRJ_MAJ>
CREATE OR ALTER PROCEDURE INS_PRJ_MAJ
	@PROJECT		NVARCHAR(20)
	,@MAJOR			NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_PRJ_MAJ AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		PRJ_MAJ(
			ID
			,PROJECT
			,MAJOR
		)
		VALUES(
			@ID
			,@PROJECT
			,@MAJOR
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <PRJ_MAJ>
CREATE OR ALTER PROCEDURE UPD_PRJ_MAJ
	@ID				NVARCHAR(20)
	,@PROJECT		NVARCHAR(20)
	,@MAJOR			NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		PRJ_MAJ 
	SET 
			PROJECT		= @PROJECT
			,MAJOR	= @MAJOR
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_PRJ_MAJ
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_PRJ_MAJ()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		PRJ_MAJ
	WHERE 
		ID = @ID;
GO
--END <PRJ_MAJ> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<TEAM_PRJ> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_TEAM_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_TEAM_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_TEAM_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <TEAM_PRJ>
CREATE OR ALTER PROCEDURE INS_TEAM_PRJ
	@PROJECT		NVARCHAR(20)
	,@TEAM			NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_TEAM_PRJ AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		TEAM_PRJ(
			ID
			,PROJECT
			,TEAM
			,SCORE
			,PROTECTED
		)
		VALUES(
			@ID
			,@PROJECT
			,@TEAM
			,0
			,0
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <TEAM_PRJ>
CREATE OR ALTER PROCEDURE UPD_TEAM_PRJ
	@ID				NVARCHAR(20)
	,@PROJECT		NVARCHAR(20)
	,@TEAM			NVARCHAR(20)
	,@SCORE			INT
	,@PROTECTED		BIT
AS
	--UPDATE--
	UPDATE 
		TEAM_PRJ 
	SET 
			PROJECT		= @PROJECT
			,TEAM		= @TEAM
			,SCORE		= @SCORE
			,PROTECTED	= @PROTECTED
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_TEAM_PRJ
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_TEAM_PRJ()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		TEAM_PRJ
	WHERE 
		ID = @ID;
GO
--END <TEAM_PRJ> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-------------------------------------------------------------------------------------------------------------------<STD_PRJ> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_STD_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_STD_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_STD_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <STD_PRJ>
CREATE OR ALTER PROCEDURE INS_STD_PRJ
AS
DECLARE 
	@ID			NVARCHAR(20)
	,@STUDENT		NVARCHAR(20)
	,@PROJECT		NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_STD_PRJ AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		STD_PRJ(
			STUDENT
			,PROJECT
		)
		VALUES(
			@STUDENT
			,@PROJECT
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <STD_PRJ>
CREATE OR ALTER PROCEDURE UPD_STD_PRJ
	@ID				NVARCHAR(20)
	,@STUDENT		NVARCHAR(20)
	,@PROJECT		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		STD_PRJ 
	SET 
			STUDENT		= @STUDENT
			,PROJECT	= @PROJECT
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_STD_PRJ
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_STD_PRJ()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		STD_PRJ
	WHERE 
		ID = @ID;
GO
--END <STD_PRJ> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<LEC_PRJ> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_LEC_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_LEC_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_LEC_PRJ()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <LEC_PRJ>
CREATE OR ALTER PROCEDURE INS_LEC_PRJ
	@PROJECT		NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_LEC_PRJ AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		LEC_PRJ(
			ID
			,PROJECT
			,LECTURER
		)
		VALUES(
			@ID
			,@PROJECT
			,@LECTURER
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <LEC_PRJ>
CREATE OR ALTER PROCEDURE UPD_LEC_PRJ
	@ID				NVARCHAR(20)
	,@PROJECT		NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		LEC_PRJ 
	SET 
			PROJECT		= @PROJECT
			,LECTURER	= @LECTURER
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_LEC_PRJ
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_LEC_PRJ()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		LEC_PRJ
	WHERE 
		ID = @ID;
GO
--END <LEC_PRJ> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<STD_TEAM> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_STD_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_STD_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_STD_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <STD_TEAM>
CREATE OR ALTER PROCEDURE INS_STD_TEAM
	@STUDENT		NVARCHAR(20)
	,@TEAM		NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_STD_TEAM AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		STD_TEAM(
			ID
			,STUDENT
			,TEAM
		)
		VALUES(
			@ID
			,@STUDENT
			,@TEAM
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <STD_TEAM>
CREATE OR ALTER PROCEDURE UPD_STD_TEAM
	@ID				NVARCHAR(20)
	,@STUDENT		NVARCHAR(20)
	,@TEAM		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		STD_TEAM 
	SET 
			STUDENT		= @STUDENT
			,TEAM= @TEAM
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_STD_TEAM
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_STD_TEAM()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		STD_TEAM
	WHERE 
		ID = @ID;
GO
--END <STD_TEAM> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<LEC_TEAM> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_LEC_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_LEC_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_LEC_TEAM()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <LEC_TEAM>
CREATE OR ALTER PROCEDURE INS_LEC_TEAM
	@LECTURER		NVARCHAR(20)
	,@TEAM		NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_LEC_TEAM AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		LEC_TEAM(
			ID
			,LECTURER
			,TEAM
		)
		VALUES(
			@ID
			,@LECTURER
			,@TEAM
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <LEC_TEAM>
CREATE OR ALTER PROCEDURE UPD_LEC_TEAM
	@ID				NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
	,@TEAM		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		LEC_TEAM 
	SET 
			LECTURER		= @LECTURER
			,TEAM= @TEAM
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_LEC_TEAM
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_LEC_TEAM()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		LEC_TEAM
	WHERE 
		ID = @ID;
GO
--END <LEC_TEAM> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<TKB_LEC> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_TKB_LEC()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_TKB_LEC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_TKB_LEC()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <TKB_LEC>
CREATE OR ALTER PROCEDURE INS_TKB_LEC
	@TKB		NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_TKB_LEC AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		TKB_LEC(
			ID
			,TKB
			,LECTURER
		)
		VALUES(
			@ID
			,@TKB
			,@LECTURER
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <TKB_LEC>
CREATE OR ALTER PROCEDURE UPD_TKB_LEC
	@ID				NVARCHAR(20)
	,@TKB		NVARCHAR(20)
	,@LECTURER		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		TKB_LEC 
	SET 
			TKB		= @TKB
			,LECTURER= @LECTURER
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_TKB_LEC
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_TKB_LEC()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		TKB_LEC
	WHERE 
		ID = @ID;
GO
--END <TKB_LEC> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--<TEAM_TKB> FUNCTIONS AND PROCEDURE******************************************************************************
CREATE OR ALTER FUNCTION CHK_INS_TEAM_TKB()
RETURNS INT
WITH EXECUTE AS CALLER
AS
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_UPD_TEAM_TKB()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION CHK_DEL_TEAM_TKB()
RETURNS INT
WITH EXECUTE AS CALLER
AS 
BEGIN
	RETURN 1
END
GO
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--INSERT A ROW TO <TEAM_TKB>
CREATE OR ALTER PROCEDURE INS_TEAM_TKB
	@TKB		NVARCHAR(20)
	,@TEAM		NVARCHAR(20)
AS
DECLARE 
	@ID			NVARCHAR(20)
--GET ID--
SELECT @ID = CAST(NEXT VALUE FOR SEQ_TEAM_TKB AS NVARCHAR(20))
BEGIN

	--INSERT--
	INSERT INTO 
		TEAM_TKB(
			ID
			,TKB
			,TEAM
		)
		VALUES(
			@ID
			,@TKB
			,@TEAM
		)
END;
GO
-----------------------------------------------------------------------------------------------------------------
--UPDATE A ROW IN <TEAM_TKB>
CREATE OR ALTER PROCEDURE UPD_TEAM_TKB
	@ID				NVARCHAR(20)
	,@TKB		NVARCHAR(20)
	,@TEAM		NVARCHAR(20)
AS
	--UPDATE--
	UPDATE 
		TEAM_TKB 
	SET 
			TKB		= @TKB
			,TEAM= @TEAM
	WHERE 
		ID = @ID;
GO
-----------------------------------------------------------------------------------------------------------------
--DELETE A ROW IN <TABLEBNAME>
CREATE OR ALTER PROCEDURE DEL_TEAM_TKB
	@ID			NVARCHAR(20)
AS
DECLARE @CHECK INT
SELECT @CHECK = dbo.CHK_DEL_TEAM_TKB()
IF @CHECK = 1
	--DELETE--
	DELETE FROM
		TEAM_TKB
	WHERE 
		ID = @ID;
GO
--END <TEAM_TKB> FUNCTIONS AND PROCEDURE**************************************************************************
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--MORE PROCEDURES--
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--MORE PROCEDURES--
--***************************************************************************************************************
-----------------------------------------------------------------------------------------------------------------
--INSERT SOME ROW--
-----------------------------------------------------------------------------------------------------------------
--MORE INSERT PROCEDURE--
--***************************************************************************************************************
