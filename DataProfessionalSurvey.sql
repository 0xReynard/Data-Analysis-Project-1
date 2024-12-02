SELECT * FROM DataProfessionalsurvey;

--DROPPING EMPTY COLUMNS
ALTER TABLE DataProfessionalsurvey 
DROP COLUMN Email,OS,Browser,Country,Referrer,City;

--FILLING EMPTY COLUMNS
UPDATE DataProfessionalsurvey
SET EducationalLevel = 'Bachelors'
WHERE Age <=25

UPDATE DataProfessionalsurvey
SET EducationalLevel = 'Masters'
WHERE Age >25

--RENAMING COLUMNS
EXEC sp_rename 'DataProfessionalsurvey.[Date Taken (America/New_York)]','DateTaken','COLUMN';
EXEC sp_rename 'DataProfessionalsurvey.[Time Taken (America/New_York)]','TimeTaken','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.[Q3 - Current Yearly Salary (in USD)]','YearlySalary','COLUMN';
EXEC sp_rename  'DataProfessionalsurvey.[Q1 - Which Title Best Fits your Current Role?]', 'CurrentRole','COLUMN';
EXEC sp_rename 'DataProfessionalsurvey.[switched careers?]','SwitchedCareers?','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.[Q4 - What Industry do you work in?]','Industry','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q5 - Favorite Programming Language','ProgrammingLanguage','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the followi','SalarySatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow1','WorkLifeSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow2','CoWorkersSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow3','ManagementSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow4','UpwardMobilitySatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q6 - How Happy are you in your Current Position with the follow5','LearningNewThingsSatisfaction','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q7 - How difficult was it for you to break into Data?','EaseOfEntryIntoData','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q8 - If you were to look for a new job today, what would be the ','NewJobInterest','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q9 - Male/Female?','Gender','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q10 - Current Age','Age','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q11 - Which Country do you live in?','Country','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q12 - Highest Level of Education','EducationalLevel','COLUMN'
EXEC sp_rename 'DataProfessionalsurvey.Q13 - Ethnicity','Ethnicity','COLUMN'


--SETTING YearlySalary
UPDATE DataProfessionalsurvey
SET YearlySalary=SUBSTRING(YearlySalary,CHARINDEX('-',YearlySalary)+1, LEN(YearlySalary))

 --REMOVING OTHERS PLEASE SPECIFY
SELECT CurrentRole from DataProfessionalsurvey
GROUP BY CurrentRole

UPDATE DataProfessionalsurvey
SET CurrentRole='Business Analyst'
WHERE CurrentRole='Business Analys'

UPDATE DataProfessionalsurvey
SET CurrentRole='Manager'
WHERE CurrentRole LIKE '%Manager%'

 UPDATE DataProfessionalsurvey
 SET CurrentRole=REPLACE(CurrentRole,'Other (Please Specify):','')
 WHERE CurrentRole LIKE 'Other (Please Specify):%'

 UPDATE DataProfessionalsurvey
 SET CurrentRole='Student'
 WHERE CurrentRole='Student/Looking/None'

 

 --CLEANING Q4
 SELECT Industry FROM DataProfessionalsurvey
 GROUP BY Industry

 UPDATE DataProfessionalsurvey
 SET Industry=REPLACE(Industry,'Other (Please Specify)','')
 WHERE Industry LIKE 'Other (Please Specify):%'

  UPDATE DataProfessionalsurvey
 SET Industry=REPLACE(Industry,':','')
 WHERE Industry LIKE ':%'

  UPDATE DataProfessionalsurvey
  set Industry=REPLACE(Industry,'None for now', NULL)
  WHERE Industry = 'None for now'

  UPDATE DataProfessionalsurvey
  set Industry=REPLACE(Industry,' Manufacturering ', 'Manufacturing')
  WHERE Industry =' Manufacturering '  

  UPDATE DataProfessionalsurvey
  set Industry=REPLACE(Industry,'I am a student%', 'Student')
  WHERE Industry LIKE 'I am a student%' 

--PROGRAMMING LANGUAGES
UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Other:','')
WHERE ProgrammingLanguage LIKE 'Other:%'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Sql &  plsql','SQL')
WHERE ProgrammingLanguage = 'Sql &  plsql'


UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'SQL because that is all I know really well so far. ','SQL')
WHERE ProgrammingLanguage = 'SQL because that is all I know really well so far. '

SELECT DISTINCT ProgrammingLanguage, COUNT(ProgrammingLanguage) OVER (Partition by ProgrammingLanguage Order by ProgrammingLanguage) FROM DataProfessionalsurvey

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'I currently do not work with programming languages yet',NULL)
WHERE ProgrammingLanguage = 'I currently do not work with programming languages yet'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'I do analysis and create presentations based on datasets provided by others',NULL)
WHERE ProgrammingLanguage = 'I do analysis and create presentations based on datasets provided by others'


UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'None%',NULL)
WHERE ProgrammingLanguage LIKE 'None%'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Dont require',NULL)
WHERE ProgrammingLanguage = 'Dont require'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Mostly use sql but that’s not programming language..','SQL')
WHERE ProgrammingLanguage = 'Mostly use sql but that’s not programming language..'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Knowledge of Excel and SQL yet','Excel')
WHERE ProgrammingLanguage = 'Knowledge of Excel and SQL yet'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'Just started learning',NULL)
WHERE ProgrammingLanguage = 'Just started learning'


UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'I don’t know any',NULL)
WHERE ProgrammingLanguage = 'I don’t know any'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'I don''t use programming in my role',NULL)
WHERE ProgrammingLanguage = 'I don''t use programming in my role'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'If SQL is categorised as a programming language then I will definitely say SQL. Since I am still learning, I can''t give a definite answer in relation to the abover mentioned but for the sake of choosing I will say R then followed by python','R')
WHERE ProgrammingLanguage = 'If SQL is categorised as a programming language then I will definitely say SQL. Since I am still learning, I can''t give a definite answer in relation to the abover mentioned but for the sake of choosing I will say R then followed by python'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'SAS SQL','SAS')
WHERE ProgrammingLanguage = 'SAS SQL'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'SQL Postgres','SQL')
WHERE ProgrammingLanguage = 'SQL Postgres'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage=REPLACE(ProgrammingLanguage,'unknown','N/A')
WHERE ProgrammingLanguage = 'unknown'

UPDATE DataProfessionalsurvey
SET ProgrammingLanguage='N/A'
WHERE ProgrammingLanguage = 'NA'


SELECT DISTINCT ProgrammingLanguage, COUNT(ProgrammingLanguage) OVER (Partition by ProgrammingLanguage ORDER BY ProgrammingLanguage) AS LanguageFrequency
FROM DataProfessionalsurvey
ORDER BY LanguageFrequency DESC


--Job Interest
SELECT DISTINCT NewJobInterest, COUNT(NewJobInterest) OVER (Partition by NewJobInterest Order by NewJobInterest) FROM DataProfessionalsurvey

UPDATE DataProfessionalsurvey
SET NewJobInterest=REPLACE(NewJobInterest,'Other (Please Specify):','')
WHERE NewJobInterest LIKE 'Other (Please Specify):%'

UPDATE DataProfessionalsurvey
SET NewJobInterest=REPLACE(NewJobInterest,'Remote too','Remote Work')
WHERE NewJobInterest LIKE 'Remote too'

--Ethnicity

SELECT Ethnicity FROM DataProfessionalsurvey
GROUP BY Ethnicity;

UPDATE DataProfessionalsurvey
SET Country=REPLACE(Country,'Other (Please Specify)',NULL)
WHERE Country LIKE 'Other (Please Specify) '

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Other (Please Specify):','')
WHERE Ethnicity LIKE 'Other (Please Specify)%'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'7','N/A')
WHERE Ethnicity LIKE '7'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'American Indian or Alaska Native','Native-American')
WHERE Ethnicity LIKE 'American Indian or Alaska Native'


UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Arabian','Arab')
WHERE Ethnicity LIKE 'Arab%'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Brown','Black')
WHERE Ethnicity LIKE 'Brown'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Bi-racial people should be able to check 2 options in 2022. ','Mixed')
WHERE Ethnicity LIKE 'Bi-racial people should be able to check 2 options in 2022. '


UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Asian or Asian American','Mixed')
WHERE Ethnicity LIKE 'Asian or Asian American'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Black or African American','Black')
WHERE Ethnicity LIKE 'Black or African American'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Half black and half white','Mixed')
WHERE Ethnicity = 'Half black and half white'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Hispanic or Latino','Latino')
WHERE Ethnicity = 'Hispanic or Latino'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Kenyan African','Black')
WHERE Ethnicity = 'Kenyan African'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Latino with Italian roots','Latino')
WHERE Ethnicity = 'Latino with Italian roots'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Mixed ( Caucasian / African-American )','Mixed')
WHERE Ethnicity = 'Mixed ( Caucasian / African-American )'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Nigeria','Black')
WHERE Ethnicity = 'Nigeria'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Race isn''t a thing','N/A')
WHERE Ethnicity = 'Race isn''t a thing'


UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Native Hawaiian or other Pacific Islander','Hawaiian')
WHERE Ethnicity = 'Native Hawaiian or other Pacific Islander'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Prefer not to ans','N/A')
WHERE Ethnicity = 'Prefer not to ans'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Other (Please Specify)','N/A')
WHERE Ethnicity = 'Other (Please Specify)'

UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'White or Caucasian','Caucasian')
WHERE Ethnicity = 'White or Caucasian'


UPDATE DataProfessionalsurvey
SET Ethnicity=REPLACE(Ethnicity,'Sudanese African','African')
WHERE Ethnicity = 'Sudanese African'

 --Cleaning country

 SELECT Country FROM DataProfessionalsurvey
 GROUP BY Country

 UPDATE DataProfessionalsurvey
 SET Country=REPLACE(Country,'Other (Please Specify):','')
 WHERE Country LIKE 'Other (Please Specify):%'

  UPDATE DataProfessionalsurvey
 SET Country=REPLACE(Country,'Africa (Nigeria)','Nigeria')
 WHERE Country LIKE 'Africa (Nigeria)'

  UPDATE DataProfessionalsurvey
 SET Country=REPLACE(Country,'Argentine','Argentina')
 WHERE Country LIKE 'Argentine'

   UPDATE DataProfessionalsurvey
 SET Country=REPLACE(Country,'Austr','Australia')
 WHERE Country LIKE 'Austr'
 
   UPDATE DataProfessionalsurvey
 SET Country=REPLACE(Country,'Fin','Finland')
 WHERE Country LIKE 'Fin'

    UPDATE DataProfessionalsurvey
 SET Country=REPLACE(Country,'Irel','Ireland')
 WHERE Country='Irel'

    UPDATE DataProfessionalsurvey
 SET Country=REPLACE(Country,'Brazik','Brazil')
 WHERE Country='Brazik'

  UPDATE DataProfessionalsurvey
 SET Country=TRIM(Country)
 WHERE Country=Country




 --Popular Programming Language
 SELECT  DISTINCT ProgrammingLanguage, COUNT(ProgrammingLanguage) OVER (PARTITION BY Programminglanguage) AS NoOfUsers  FROM DataProfessionalsurvey
ORDER BY NoOfUsers DESC

--MOST POPULAR ROLES
SELECT DISTINCT CurrentRole,COUNT(CurrentRole) OVER (PARTITION BY CurrentRole) AS Frequency FROM DataProfessionalsurvey
ORDER BY Frequency DESC

--MOST POPULAR INDUSTRY
SELECT DISTINCT Industry, COUNT(Industry) OVER (PARTITION BY Industry) AS Frequency FROM DataProfessionalsurvey
ORDER BY Frequency DESC

--AVERAGE SALARY SATISFACTION FOR DATA PROFESSIONAL
SELECT AVG(SalarySatisfaction) AS AvgSalarySatisfaction FROM DataProfessionalsurvey
WHERE CurrentRole LIKE '%Data%'


--EASE OF ENTRY INTO DATA WORLD
SELECT DISTINCT EaseOfEntryIntoData, COUNT(EaseOfEntryIntoData) OVER (PARTITION BY EaseOfEntryIntoData) AS Frequency FROM DataProfessionalsurvey
ORDER BY Frequency DESC

--POPULAR JOB INTEREST
SELECT DISTINCT NewJobInterest,COUNT(NewJobInterest) OVER (PARTITION BY NewJobInterest) AS Frequency FROM DataProfessionalsurvey
ORDER BY Frequency DESC
--GENDER DISTRIBUTION
SELECT DISTINCT Gender, COUNT(Gender) OVER (PARTITION BY Gender) AS Frequency FROM DataProfessionalsurvey
ORDER BY Gender
--ACADEMIC DISTIBUTION
SELECT DISTINCT EducationalLevel, COUNT(EducationalLevel) OVER (PARTITION BY EducationalLevel) AS Frequency FROM DataProfessionalsurvey
ORDER BY Frequency
--ETHNICITY
SELECT DISTINCT Ethnicity, COUNT(Ethnicity) OVER (PARTITION BY Ethnicity) AS Frequency FROM DataProfessionalsurvey
ORDER BY Frequency DESC

--COUNTRY WITH THE MOST SURVEY TAKERS
SELECT DISTINCT Country, COUNT(Country) OVER (PARTITION BY Country) AS Frequency FROM DataProfessionalsurvey
ORDER BY Frequency DESC