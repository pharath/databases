/**************************************************************
  AGGREGATION
  Works for SQLite, MySQL
  Postgres doesn't allow ambiguous Select columns in Group-by queries
**************************************************************/

/**************************************************************
  Average GPA of all students
**************************************************************/




/**************************************************************
  Lowest GPA of students applying to CS
**************************************************************/





/*** Average GPA of students applying to CS ***/





/*** Fix incorrect counting of GPAs ***/





/**************************************************************
  Number of colleges bigger than 15,000
**************************************************************/





/**************************************************************
  Number of students applying to Cornell
**************************************************************/





/*** Show why incorrect result, fix using Count Distinct ***/









/**************************************************************
  Students such that number of other students with same GPA is
  equal to number of other students with same sizeHS
**************************************************************/








/**************************************************************
  Amount by which average GPA of students applying to CS
  exceeds average of students not applying to CS
**************************************************************/









/*** Same using subqueries in Select ***/









/*** Remove duplicates ***/








/*** Back to original Group-by form, fewer than 5 applicants [statt applications] ***/








/**************************************************************
  Number of applications to each college
**************************************************************/





/*** First do query to picture grouping ***/





/*** Now back to query we want ***/





/**************************************************************
  College enrollments by state
**************************************************************/





/**************************************************************
  Minimum + maximum GPAs of applicants to each college & major
**************************************************************/






/*** First do query to picture grouping ***/






/*** Now back to query we want ***/






/*** Widest spread ***/







/**************************************************************
  Number of colleges applied to by each student
**************************************************************/






/*** First do query to picture grouping ***/






/*** Now back to query we want ***/






/*** Add student name ***/






/*** First do query to picture grouping ***/






/*** Now back to query we want ***/






/*** Add college (shouldn't work but does in some systems) ***/






/*** Back to query to picture grouping ***/






/**************************************************************
  Number of colleges applied to by each student, including
  0 for those who applied nowhere
**************************************************************/






/*** Now add 0 counts ***/










/**************************************************************
  Colleges with fewer than 5 applications
**************************************************************/






/*** Same query without Group-by or Having ***/





/*** Remove duplicates ***/





/*** Back to original Group-by form, fewer than 5 applicants ***/






/**************************************************************
  Majors whose applicant's maximum GPA is below the average
**************************************************************/






