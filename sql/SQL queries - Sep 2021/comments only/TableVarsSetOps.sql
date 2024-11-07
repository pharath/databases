/**************************************************************
  TABLE VARIABLES AND SET OPERATORS
  Works for SQLite, Postgres
  MySQL doesn't support Intersect or Except
**************************************************************/

/**************************************************************
  Application information
**************************************************************/





/*** Introduce table variables ***/





/**************************************************************
  Pairs of students with same GPA
**************************************************************/





/*** Get rid of self-pairings ***/





/*** Get rid of reverse-pairings ***/





/**************************************************************
  List of college names and student names
**************************************************************/





/*** Add 'As name' to both sides ***/





/*** Change to Union All ***/





/*** Notice not sorted any more (SQLite), add order by cName ***/






/**************************************************************
  IDs of students who applied to both CS and EE
**************************************************************/





/**************************************************************
  IDs of students who applied to both CS and EE
  Some systems don't support intersect
**************************************************************/





/*** Why so many duplicates? Look at Apply table ***/
/*** Add Distinct ***/





/**************************************************************
  IDs of students who applied to CS but not EE
**************************************************************/





/**************************************************************
  IDs of students who applied to CS but not EE
  Some systems don't support except
**************************************************************/





/*** Add Distinct ***/





/*** Can't do it with constructs we have so far ***/
