SELECT sName, major
FROM Student, Apply
WHERE Student.sID = Apply.sID;

SELECT sName, major
FROM Student INNER JOIN Apply
ON Student.sID = Apply.sID;

SELECT sName, major
FROM Student JOIN Apply
ON Student.sID = Apply.sID;

SELECT sName, GPA
FROM Student, Apply
WHERE Apply.sID = Student.sID
	AND Apply.major = 'CS' AND Student.sizeHS < 1000 AND Apply.cName = 'Stanford';
	
SELECT sName, GPA
FROM Student JOIN Apply
ON Apply.sID = Student.sID
WHERE Apply.major = 'CS' AND Student.sizeHS < 1000 AND Apply.cName = 'Stanford';

SELECT sName, GPA
FROM Student JOIN Apply
ON Apply.sID = Student.sID
	AND Apply.major = 'CS' AND Student.sizeHS < 1000 AND Apply.cName = 'Stanford';

select Apply.sID, sName, GPA, Apply.cName, enrollment
from Apply, Student, College
where Apply.sID = Student.sID and Apply.cName = College.cName;

select Apply.sID, sName, GPA, Apply.cName, enrollment
from Apply JOIN Student JOIN College
ON Apply.sID = Student.sID and Apply.cName = College.cName;

SELECT Apply.sID, sName, GPA, Apply.cName, enrollment
FROM (Apply JOIN Student ON Apply.sID = Student.sID) JOIN College ON College.cName = Apply.cName;

SELECT DISTINCT sName, major
FROM Student INNER JOIN Apply
WHERE Student.sID = Apply.sID;

SELECT DISTINCT sName, major
FROM Student NATURAL JOIN Apply;

SELECT *
FROM Student NATURAL JOIN Apply;

SELECT DISTINCT sID
FROM Student NATURAL JOIN Apply;

/* ambiguity error
SELECT DISTINCT sID
FROM Student, Apply;
*/

SELECT sName, GPA
FROM Student JOIN Apply
ON Student.sID = Apply.sID
WHERE sizeHS < 1000 AND major = 'CS' AND cName = 'Stanford';

SELECT sName, GPA
FROM Student NATURAL JOIN Apply
WHERE sizeHS < 1000 AND major = 'CS' AND cName = 'Stanford';

SELECT sName, GPA
FROM Student JOIN Apply USING(sID)
WHERE sizeHS < 1000 AND major = 'CS' AND cName = 'Stanford';

SELECT S1.sID, S1.sName, S1.GPA, S2.sID, S2.sName, S2.GPA
FROM Student S1, Student S2
WHERE S1.GPA = S2.GPA AND S1.sID < S2.sID;
/* incorrect
SELECT S1.sID, S1.sName, S1.GPA, S2.sID, S2.sName, S2.GPA
FROM Student S1 JOIN Student S2 USING(GPA)
ON S1.sID < S2.sID;
*/
SELECT S1.sID, S1.sName, S1.GPA, S2.sID, S2.sName, S2.GPA
FROM Student S1, Student S2 USING(GPA)
WHERE S1.sID < S2.sID;

SELECT *
FROM Student S1 NATURAL JOIN Student S2;

SELECT * FROM Student;

SELECT sName, sID, cName, major
FROM Student NATURAL JOIN Apply; -- bad practice, use JOIN ... USING() instead

select sName, sID, cName, major
from Student inner join Apply using(sID);

select sName, sID, cName, major
from Student LEFT OUTER JOIN Apply using(sID);

select sName, sID, cName, major
from Student LEFT JOIN Apply using(sID);

select sName, sID, cName, major
from Student NATURAL LEFT OUTER JOIN Apply;  --asymmetric

select sName, Student.sID, cName, major
from Student, Apply
WHERE Student.sID = Apply.sID
UNION
SELECT sName, Student.sID, NULL, NULL
FROM Student
WHERE sID not in (SELECT sID FROM Apply);
/*
insert into Apply values (321, 'MIT', 'history', 'N');
insert into Apply values (321, 'MIT', 'psychology', 'Y');
*/

SELECT sName, sID, cName, major
FROM Apply NATURAL LEFT OUTER JOIN Student;   --asymmetric
--oder
select sName, Student.sID, cName, major
from Student, Apply
WHERE Student.sID = Apply.sID
UNION
SELECT NULL, NULL, cName, major
FROM Apply
WHERE sID not in (SELECT sID FROM Student);
/* not supported
SELECT sName, sID, cName, major
FROM Student NATURAL RIGHT OUTER JOIN Apply;

SELECT sName, sID, cName, major
FROM Student FULL OUTER JOIN Apply USING(sID);

SELECT sName, sID, cName, major
FROM Student NATURAL LEFT OUTER JOIN Apply
UNION
SELECT sName, sID, cName, major
FROM Student NATURAL RIGHT JOIN Apply;
*/
select sName, Student.sID, cName, major
from Student, Apply
WHERE Student.sID = Apply.sID
UNION
SELECT NULL, sID, cName, major -- ACHTUNG: "sID" wird von FULL OUTER JOIN auch ausgegeben !
FROM Apply
WHERE sID not in (SELECT sID FROM Student)
UNION
SELECT sName, sID, NULL, NULL
FROM Student
WHERE sID not in (SELECT sID FROM Apply);
/*
create table T1 (A int, B int);
create table T2 (B int, C int);
create table T3 (A int, C int);
insert into T1 values (1,2);
insert into T2 values (2,3);
insert into T3 values (4,5);

select A,B,C
from (T1 natural full outer join T2) natural full outer join T3;

select A,B,C
from T1 natural full outer join (T2 natural full outer join T3);

drop table T1;
drop table T2;
drop table T3;
*/