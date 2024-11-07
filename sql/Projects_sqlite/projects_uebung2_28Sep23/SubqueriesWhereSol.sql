SELECT Student.sID, sName
from Student
WHERE Student.sID in (SELECT Apply.sID from Apply WHERE Apply.major = 'CS');

SELECT Student.sID, sName
FROM Student, Apply
WHERE Student.sID = Apply.sID and Apply.major = 'CS';

SELECT DISTINCT Student.sID, sName
FROM Student, Apply
WHERE Student.sID = Apply.sID and Apply.major = 'CS';

SELECT sName
from Student
WHERE Student.sID in (SELECT Apply.sID from Apply WHERE Apply.major = 'CS');

SELECT sName
FROM Student, Apply
WHERE Student.sID = Apply.sID and Apply.major = 'CS';

SELECT DISTINCT sName
FROM Student, Apply
WHERE Student.sID = Apply.sID and Apply.major = 'CS';

SELECT sID, GPA
FROM Student
WHERE sID in (SELECT sID FROM Apply WHERE Apply.major = 'CS');

--incorrect
SELECT GPA
FROM Student, Apply
WHERE Student.sID = Apply.sID AND Apply.major = 'CS';

--still incorrect
SELECT DISTINCT GPA
FROM Student, Apply
WHERE Student.sID = Apply.sID AND Apply.major = 'CS';

SELECT sID
FROM Student
WHERE sID in (SELECT sID FROM Apply WHERE Apply.major = 'CS')
  and sID not in (SELECT sID FROM Apply WHERE Apply.major = 'EE');
  
SELECT sID
FROM Student
WHERE sID in (SELECT sID FROM Apply WHERE Apply.major = 'CS')
  and not sID in (SELECT sID FROM Apply WHERE Apply.major = 'EE');

SELECT c1.cName
FROM College c1
WHERE EXISTS (SELECT c2.cName from College c2 WHERE c1.state = c2.state AND c1.cName <> c2.cName);

SELECT c1.cName, c1.enrollment
FROM College c1
WHERE NOT EXISTS (SELECT c2.cName from College c2 WHERE c1.enrollment < c2.enrollment);

SELECT s1.sName, s1.GPA
FROM Student s1
WHERE NOT EXISTS (SELECT s2.sName FROM Student s2 WHERE s2.GPA > s1.GPA);

--incorrect
SELECT DISTINCT s1.sName, s1.GPA
FROM Student s1, Student s2
WHERE s2.GPA < s1.GPA;
/*
--geht nicht in sqlite
SELECT sName, GPA
FROM Student 
WHERE GPA >= ALL (SELECT GPA FROM Student);

--geht auch nicht
SELECT s1.sName, s1.GPA
FROM Student s1
WHERE s1.GPA > ALL (SELECT s2.GPA FROM Student AND s1.sID <> s2.sID);

SELECT c1.cName, c1.enrollment
FROM College c1
WHERE c1.enrollment > ALL (SELECT c2.enrollment from College c2 AND c1.cName <> c2.cName);

SELECT c1.cName, c1.enrollment
FROM College c1
WHERE NOT c1.enrollment <= ANY (SELECT c2.enrollment from College c2 AND c1.cName <> c2.cName);

SELECT s1.sID
FROM Student s1
WHERE NOT s1.sizeHS <= ALL (SELECT s2.sizeHS FROM Student s2);
*/
SELECT s1.sID
FROM Student s1
WHERE EXISTS (SELECT * FROM Student s2 WHERE s2.sizeHS < s1.sizeHS);

SELECT sID
FROM Student
WHERE sID = any (SELECT sID FROM Apply WHERE Apply.major = 'CS')
  and sID <> all (SELECT sID FROM Apply WHERE Apply.major = 'EE');
