/**************************************************************
  INSERT, DELETE, AND UPDATE STATEMENTS
  Works for Postgres
  SQLite doesn't support All
  MySQL doesn't allow deletes from Apply with subquery on
    Apply (then College deletion behaves differently)
**************************************************************/

/**************************************************************
  Insert new college
**************************************************************/



/**************************************************************
  Have all students who didn't apply anywhere apply to
  CS at Carnegie Mellon
**************************************************************/

/*** First see who will be inserted ***/





/*** Then insert them ***/




/*** Admit to Carnegie Mellon EE all students who were turned down
     in EE elsewhere ***/

/*** First see who will be inserted ***/






/*** Then insert them ***/





/**************************************************************
  Delete all students who applied to more than two different
  majors
**************************************************************/

/*** First see who will be deleted ***/






/*** Then delete them ***/




/*** Delete same ones from Apply ***/
/*** NOTE SOME SYSTEMS DISALLOW  ***/




/**************************************************************
  Delete colleges with no CS applicants
**************************************************************/

/*** First see who will be deleted ***/




/*** Then delete them ***/




/**************************************************************
  Accept applicants to Carnegie Mellon with GPA < 3.6 but turn
  them into economics majors
**************************************************************/

/*** First see who will be updated ***/





/*** Then update them ***/






/**************************************************************
  Turn the highest-GPA EE applicant into a CSE applicant
**************************************************************/

/*** First see who will be updated ***/



  


/*** Then update them ***/




/**************************************************************
  Give everyone the highest GPA and smallest HS
**************************************************************/





/**************************************************************
  Accept everyone
**************************************************************/



