SELECT *, GPA*sizeHS/1000 as scaledgpa
FROM Student
WHERE scaledgpa - GPA > 1 or GPA - scaledgpa > 1;

SELECT *, GPA*sizeHS/1000 as scaledgpa
FROM Student
WHERE abs(scaledgpa - GPA) > 1;

SELECT *
FROM (SELECT *, GPA*sizeHS/1000 as scaledgpa FROM Student) G
WHERE abs(G.scaledgpa - G.GPA) > 1;

SELECT DISTINCT College.cName, Student.GPA
FROM Student, College, Apply
WHERE Apply.cName = College.cName and Student.sID = Apply.sID
	and Student.GPA >= ALL (SELECT Student.GPA
							FROM Student, Apply -- Achtung: nur 2 der 3 relations !
							WHERE Student.sID = Apply.sID
								AND Apply.cName = College.cName);
								
SELECT DISTINCT College.cName
	(SELECT Student.GPA 
	 FROM Student, Apply
	 WHERE Student.sID = Apply.sID
			and Student.GPA >= ALL (SELECT Student.GPA
									FROM Student, Apply
									WHERE Student.sID = Apply.sID
										AND Apply.cName = College.cName);
FROM College;