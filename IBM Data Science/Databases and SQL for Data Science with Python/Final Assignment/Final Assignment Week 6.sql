#FINAL ASSIGNMENT

#PROBLEM 1
select cps.name_of_school, cps.average_student_attendance, ce.community_area_name, ce.hardship_index
from chicago_public_schools as cps
left outer join chicago_census as ce
on cps.community_area_number = ce.community_area_number
where ce.hardship_index = 98;

#PROBLEM 2
SELECT CR.CASE_NUMBER, CR.PRIMARY_TYPE, CE.COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME CR
LEFT OUTER JOIN CHICAGO_CENSUS CE
ON CR.COMMUNITY_AREA_NUMBER = CE.COMMUNITY_AREA_NUMBER 
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%';

#PROBLEM 3
CREATE VIEW SCHOOL_DATA ("School_Name", "Leaders_Rating")
AS SELECT NAME_OF_SCHOOL, Leaders_Icon
FROM CHICAGO_PUBLIC_SCHOOLS;

SELECT * FROM SCHOOL_DATA

#PROBLEM 4

--#SET TERMINATOR @
CREATE PROCEDURE UPDATE_LEADERS_SCORE(
IN in_School_ID INTEGER,
IN in_Leader_Score INTEGER)

LANGUAGE SQL 
READS SQL DATA 

DYNAMIC RESULT SETS 1 

BEGIN

	DECLARE C1 CURSOR
	WITH RETURN FOR 

	SELECT * FROM CHICAGO_PUBLIC_SCHOOLS;

	OPEN C1;

END @

#PROBLEM 5
--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE(
IN in_School_ID INTEGER,
IN in_Leader_Score INTEGER)

LANGUAGE SQL 
MODIFIES SQL DATA 

BEGIN

	UPDATE CHICAGO_PUBLIC_SCHOOLS
	SET Leaders_Score = in_Leader_Score
	WHERE School_ID = in_School_ID;

END @

#PROBLEM 6
--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE(
IN in_School_ID INTEGER, IN in_Leader_Score INTEGER)

LANGUAGE SQL 
MODIFIES SQL DATA 

BEGIN
	UPDATE CHICAGO_PUBLIC_SCHOOLS
	SET Leaders_Score=in_Leader_Score
	WHERE School_ID=in_School_ID;
		IF in_Leader_Score>0 AND in_Leader_Score<20 
		THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Very Weak';
		ELSEIF in_Leader_Score < 40 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Weak';
		ELSEIF in_Leader_Score < 40 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Average';
		ELSEIF in_Leader_Score < 40 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Strong';
		ELSEIF in_Leader_Score < 40 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Very Strong';
	END IF;
END @

#PROBLEM 7, 8 & 9
--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE(
IN in_School_ID INTEGER, IN in_Leader_Score INTEGER)
LANGUAGE SQL 

BEGIN
	UPDATE CHICAGO_PUBLIC_SCHOOLS
	SET Leaders_Score=in_Leader_Score
	WHERE School_ID=in_School_ID;
		IF in_Leader_Score>0 AND in_Leader_Score<20 
		THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Very Weak';
		ELSEIF in_Leader_Score < 40 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Weak';
		ELSEIF in_Leader_Score < 60 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='AVG';
		ELSEIF in_Leader_Score < 80 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Strong';
		ELSEIF in_Leader_Score < 100 THEN 
		 UPDATE CHICAGO_PUBLIC_SCHOOLS
		  SET Leaders_Icon='Very Strong';
		ELSE 
		ROLLBACK WORK; 
	END IF;
     COMMIT WORK;
END @

