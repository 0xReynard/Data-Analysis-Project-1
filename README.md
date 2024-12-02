# Data-Analysis-Project-1
This repository contains SQL Server queries and exported Power BI file for my first end to end project. 

# Data Professionals Survey Analysis
# OVERVIEW
This repository contains the SQL Queries, Power BI file which were results of analysing a survey of current or intending data professionals. each survey taker was assigned a unique ID and questions in the survey focused on their current roles, industries, age, gender, and transition to tech world, satisfaction with various aspects of their jobs.
The queries explored various metrics such as the most popular role of current data professionals, most utilized programming languages, salary satisfaction, ease of migrating into tech field etc.

# Software Used
-	SQL Server was used to carry out data cleaning and Exploratory Data Analysis (EDA)
-	Power BI was used to carry out the visualization and additional transformation of the data set.

# Data Source
The queries were run on the DataProfessional Table from the Portfolio database. The table contains columns with information on:
•	Unique ID: Unique identification tag given to each survey taker
•	DateTaken, TimeTaken, Time Spent: Information on the date survey was taken, time it was taken and duration of the survey.
•	CurrentRole: Current working position of the survey taker
•	SwitchedCareers?: Did the survey taker switch into the Data field from another field
•	YearlySalary: The value of their yearly salary 
•	Industry: Which industry does the survey taker work in? 
•	ProgrammingLanguage : Prominent Programming language used by the survey taker
•	Satisfaction (Scale of 0 to 10): It covered factors such as Salary, Work Life balance, Co-Workers, Management, Upward Mobility, Learning New Things.
•	EaseOfEntryIntoData: Ease of entry into the data field.
•	NewJobInterest: What will the survey taker look for in a new job?
•	Gender: Gender of the survey taker
•	Age: Age of survey taker
•	Country: Current Country of Survey taker
•	Educational Level: Shows the academic level of the survey taker. 
•	Ethnicity: Ethnicity of the survey taker

# Key Metrics
With the aid of SQL Server and Power BI, Queries were written and executed to determine the following:
1.	Top Job titles of Survey takers: This gives insight on the position and roles of the survey takers in the profession.
2.	Ratio of Tech Switch: This shows how many survey takers left their previous career path to switch into a data related field.
3.	Ease of switch into Tech: This gives information on how easy/difficult it was to make a switch into the data field.
4.	Average Salary of a data professional: This gives an idea on how much a data professional makes annually. Filters were added to give clearer information based on countries.
5.	Top Programming Languages: This gives an insight on which programming languages are important for data professionals working actively in the field.
6.	Academic level: This gives an insight on the level of education which may be required to successfully work in a data related field.
7.	Yearly Salaries across ages: This gives an insight on how the salary of a professional is affected by their ages.

# CONCLUSION
These queries provide insights on how the Data field is for professionals in various countries. It can be used by those enthusiastic about joining the profession to make decisions on if they want to, it can also be used by current data professionals looking to switch job between industries, employers can also make use of this to determine how to satisfy their employees to increase job satisfaction.


# FUTURE IMPROVEMENTS
Number of survey takers would be increased to get a larger sample size which could enable inferences to be made from the data to be more accurate and detailed.


