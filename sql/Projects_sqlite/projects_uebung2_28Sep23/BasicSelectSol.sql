SELECT Student.sID, Student.sName, Student.GPA
FROM Student
WHERE Student.GPA > 3.6;

SELECT Student.sName, Apply.major
FROM Student, Apply
WHERE Student.sID = Apply.sID;

SELECT DISTINCT Student.sName, Apply.major
FROM Student, Apply
WHERE Student.sID = Apply.sID;

SELECT Student.sName, GPA, decision
FROM Student, Apply
WHERE Student.sID = Apply.sID and Student.sizeHS < 1000 and Apply.major = 'CS';

SELECT DISTINCT College.cName
FROM College, Apply 
WHERE Apply.cName = College.cName AND College.enrollment > 10000 AND Apply.major = 'CS';

SELECT *
FROM Student, Apply, College
WHERE Student.sID = Apply.sID AND Apply.cName = College.cName
ORDER by Student.GPA DESC, enrollment ASC;

SELECT Student.sName
FROM Student, Apply
WHERE Apply.major like '%bio%' and Student.sID = Apply.sID;

SELECT *
FROM Student, Apply
WHERE Apply.major like '%bio%' and Student.sID = Apply.sID;

SELECT *
FROM Student, Apply;

SELECT *, GPA*sizeHS/1000 as scaledGPA
FROM Student;