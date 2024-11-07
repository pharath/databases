# Usage

- there are
  - sqlite database files
  - sqlite project files (`.sqbpro`)
- press ctrl - i to see the file type

## sqlite database files

- open them in sqlite GUI using the "Open Database" button
  - note: in the file browser you must switch from "SQLite database files" to "All files" to select a database file

## sqlite project files (`.sqbpro`)
  
- double clicking/pressing enter on a sqlite project file opens sqlite automatically
- some sqlite project files only contain sql files, but do not contain a database
  - in this case, after opening the sqlite project file open a database file as described in the point above
- if you click on "Save Project", the database that is currently opened will be opened automatically the next time you open the `.sqbpro` file
  - however, if you delete or move the database file, then the next time you open the `.sqbpro` file the database file will **not** be opened, but instead sqlite will ask you to select a database file

## sql code to generate a database

- must run `CollegeSchema.sql` first before you can run `CollegeData.sql`
