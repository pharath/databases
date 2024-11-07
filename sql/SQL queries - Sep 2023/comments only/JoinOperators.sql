/**************************************************************
  JOIN OPERATORS
  Works for Postgres
  MySQL doesn't support FULL OUTER JOIN
  SQLite doesn't support RIGHT or FULL OUTER JOIN
**************************************************************/

/**************************************************************
  INNER JOIN
  Student names and majors for which they've applied
**************************************************************/

/*** Rewrite using INNER JOIN ***/

/*** Abbreviation is JOIN ***/

/**************************************************************
  INNER JOIN WITH ADDITIONAL CONDITIONS
  Names and GPAs of students with sizeHS < 1000 applying to
  CS at Stanford
**************************************************************/

/*** Rewrite using JOIN ***/

/*** Can move everything into JOIN ON condition ***/

/**************************************************************
  THREE-WAY INNER JOIN
  Application info: ID, name, GPA, college name, enrollment
**************************************************************/

/*** Rewrite using three-way JOIN ***/
/*** Works in SQLite and MySQL but not Postgres ***/

/*** Rewrite using binary JOIN ***/

/**************************************************************
  NATURAL JOIN
  Student names and majors for which they've applied
**************************************************************/

/*** Rewrite using NATURAL JOIN ***/

/*** Like relational algebra, eliminates duplicate columns ***/

/*** Would get ambiguity error with cross-product ***/

/**************************************************************
  NATURAL JOIN WITH ADDITIONAL CONDITIONS
  Names and GPAs of students with sizeHS < 1000 applying to
  CS at Stanford
**************************************************************/

/*** Rewrite using NATURAL JOIN ***/

/*** USING clause considered safer ***/

/**************************************************************
  SELF-JOIN
  Pairs of students with same GPA
**************************************************************/

/*** Rewrite using JOIN and USING (disallowed) ***/

/*** Without ON clause ***/

/**************************************************************
  SELF NATURAL JOIN
**************************************************************/

/*** Verify equivalence to Student ***/

/**************************************************************
  LEFT OUTER JOIN
  Student application info: name, ID, college name, major
**************************************************************/

/*** Include students who haven't applied anywhere ***/

/*** Abbreviation is LEFT JOIN ***/

/*** Using NATURAL OUTER JOIN ***/

/*** Can simulate without any JOIN operators ***/

/*** Instead include applications without matching students ***/

/**************************************************************
  RIGHT OUTER JOIN
  Student application info: name, ID, college name, major
**************************************************************/

/*** Include applications without matching students ***/

/**************************************************************
  FULL OUTER JOIN
  Student application info
**************************************************************/

/*** Include students who haven't applied anywhere ***/
/*** and applications without matching students ***/

/*** Can simulate with LEFT and RIGHT outerjoins ***/
/*** Note UNION eliminates duplicates ***/

/*** Can simulate without any JOIN operators ***/

/**************************************************************
  THREE-WAY OUTER JOIN
  Not associative
**************************************************************/

