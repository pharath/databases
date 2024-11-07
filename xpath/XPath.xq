                    (:=== XPath Demo ===:)

(:***************************************************************
   SIMPLE PATH EXPRESSION
   All book titles
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book/Title
(: equiv :)
doc("BookstoreQ.xml")//Title

(:***************************************************************
   ALTERNATIVES (UNION)
   All book or magazine titles
****************************************************************:)

(: logical OR :)
doc("BookstoreQ.xml")/Bookstore/(Book|Magazine)/Title

(: logical AND :)
doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90]/(Title|Authors/Author[1])
(: hat ein anderes Format als ... :)
doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90]/Authors/Author[1] , doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90]/Title

(:***************************************************************
   WILDCARD
   All titles
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/*/Title

(:***************************************************************
   OPERATOR // (ALL DESCENDANTS)
   All titles
****************************************************************:)

doc("BookstoreQ.xml")//Title

(:***************************************************************
   COMBINING // AND WILDCARD
   All elements
****************************************************************:)

doc("BookstoreQ.xml")//*
doc("BookstoreQ.xml")//data(*)   (: without tags :)

(:***************************************************************
   SELECTING ATTRIBUTES
   All book ISBNs 

   error:
   - attributes cannot be what is called "serialized" in order to
     return them in an XML-looking result
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book/@ISBN
doc("BookstoreQ.xml")/Bookstore/Book/data(@ISBN)

(:***************************************************************
   PATH WITH CONDITION
   All books costing less than $90
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90]

(:***************************************************************
   CONDITION INSIDE PATH
   Titles of books costing less than $90
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90]/Title

(:***************************************************************
   EXISTENCE CONDITION
   Titles of books containing a remark
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book[Remark]/Title

(:***************************************************************
   COMPLEX CONDITION
   Titles of books costing less than $90 where "Ullman" is
   an author
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90 and
              Authors/Author/Last_Name = "Ullman"]/Title

(:***************************************************************
   Same query but "Jeffrey Ullman" is an author
   (demonstrate error then fix)
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90 and
              Authors/Author/Last_Name = "Ullman" and
              Authors/Author/First_Name="Jeffrey"]/Title

doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90 and
              Authors/Author/Last_Name = "Widom" and
              Authors/Author/First_Name="Jeffrey"]/Title

(: einfach nur das folgende merken :)
doc("BookstoreQ.xml")/Bookstore/Book[@Price < 90 and
              Authors/Author[Last_Name = "Ullman" and
              First_Name="Jeffrey"]]/Title

(:***************************************************************
   NEGATION
   Titles of books where "Ullman" is an author and "Widom" is
   not an author

   (attempt, cannot do this using constructs seen so far)

   (solution: see "NEGATION REVISITED", at the bottom of this
   file)
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book[
              Authors/Author/Last_Name = "Ullman" and
              Authors/Author/Last_Name != "Widom"]/Title

(:***************************************************************
   Nth ELEMENT
   All second authors, third, tenth authors
****************************************************************:)

doc("BookstoreQ.xml")//Authors/Author[2]
doc("BookstoreQ.xml")//Authors/Author[3]
doc("BookstoreQ.xml")//Authors/Author[10]

(:***************************************************************
   CONTAINS() PREDICATE
   Titles of books with a remark containing "great"
****************************************************************:)

doc("BookstoreQ.xml")//Book[contains(Remark, "great")]/Title
(: check with :)
doc("BookstoreQ.xml")//Book[contains(Remark, "great")]/(Title|Remark)

(:***************************************************************
   "SELF-JOIN"
   All magazines where there's a book with the same title

   - although the square brackets contain a SET, the "=" sign
     is implicitly existentially quantified
     - there is a lot of implicit existential quantification
       going on in XPath and XQuery
****************************************************************:)

doc("BookstoreQ.xml")//Magazine[Title = 
                               doc("BookstoreQ.xml")//Book/Title]

(:***************************************************************
   PARENT AXIS AND NAME() FUNCTION
   All elements whose parent tag is not "Bookstore" or "Book"
****************************************************************:)

(: geht nicht ohne das "/Bookstore//" :)
doc("BookstoreQ.xml")/Bookstore//*[name(parent::*) != "Bookstore"
                                   and name(parent::*) != "Book"]

(:***************************************************************
   SIBLING AXIS
   All books and magazines with non-unique titles
   (not quite right, then fix)
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/(Book|Magazine)[Title = 
                                  following-sibling::*/Title]

doc("BookstoreQ.xml")/Bookstore/(Book|Magazine)[Title = 
                                  following-sibling::*/Title or
                           Title = preceding-sibling::*/Title]

doc("BookstoreQ.xml")/Bookstore/(Book|Magazine)[Title = 
                                  following-sibling::Book/Title or
                           Title = preceding-sibling::Book/Title]

(:***************************************************************
   phth: einfach nur count(Authors/Author) merken, Rest egal
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/(Book|Magazine)[count(Authors/Author) = 1]
doc("BookstoreQ.xml")/Bookstore/(Book|Magazine)[count(Authors/Author) = 2]

(:***************************************************************
   FOR-ALL (KLUDGE) [a kludge is a workaround or quick-and-dirty 
   solution that is clumsy, inelegant, inefficient, difficult to 
   extend and hard to maintain]
   
   Books where every author's first name includes "J"

   - there is no "for all" (universal quantification) in
     XPath, but we can use the "count()" function instead
****************************************************************:)

doc("BookstoreQ.xml")//Book[
            count(Authors/Author[contains(First_Name, "J")]) =
            count(Authors/Author/First_Name)]

(:***************************************************************
   NEGATION REVISITED
   Titles of books where "Ullman" is an author and "Widom" is
   not an author
****************************************************************:)

doc("BookstoreQ.xml")/Bookstore/Book[
           Authors/Author/Last_Name = "Ullman" and
           count(Authors/Author[Last_Name = "Widom"]) = 0]/Title
