```sql
select distinct cName, state,
  (select distinct GPA
   from Apply, Student
   where College.cName = Apply.cName
     and Apply.sID = Student.sID
     and GPA >= all
           (select GPA from Student, Apply
            where Student.sID = Apply.sID
              and Apply.cName = College.cName)) as GPA
from College;
```

- wir gehen jeden Eintrag in College durch
- dabei wird die subquery (in der äußersten Klammer) "for each" `College.cName` ausgeführt
- geht nur, weil die subquery nur einen GPA Wert für jeden Eintrag in College ausgibt (vgl. nächstes Beispiel)
