SELECT *
FROM Student, Apply
WHERE Student.sID = Student.sID;

SELECT *
FROM Student S, Apply A
WHERE S.sID = A.sID;

SELECT S1.sName, S2.sName
FROM Student S1, Student S2
WHERE S1.GPA = S2.GPA AND S1.sID < s2.sID;

SELECT sName as name
from Student
UNION
SELECT cName as name
FROM College;

SELECT sName as name
from Student
UNION ALL
SELECT cName as name
FROM College;

SELECT sName as name
from Student
UNION ALL
SELECT cName as name
FROM College
ORDER BY name;

SELECT Student.sID
FROM Apply, Student
WHERE Apply.major = 'CS' and Student.sID = Apply.sID
INTERSECT
SELECT Student.sID
FROM Apply, Student
WHERE Apply.major = 'EE' and Student.sID = Apply.sID;

SELECT DISTINCT Student.sID
FROM Apply A1, Apply A2, Student
WHERE A1.major = 'CS' and Student.sID = A1.sID
  AND A2.major = 'EE' AND Student.sID = A2.sID;
  
SELECT Student.sID
FROM Apply, Student
WHERE Apply.major = 'CS' AND Student.sID = Apply.sID
EXCEPT
SELECT Student.sID
FROM Apply, Student
WHERE Apply.major = 'EE' AND Student.sID = Apply.sID;

SELECT Student.sID
FROM Apply A1, Apply A2, Student
WHERE A1.major = 'CS' AND Student.sID = A1.sID
  and A2.major <> 'EE' AND Student.sID = A2.sID;

SELECT DISTINCT Student.sID
FROM Apply A1, Apply A2, Student
WHERE A1.major = 'CS' AND Student.sID = A1.sID
  and A2.major <> 'EE' AND Student.sID = A2.sID;