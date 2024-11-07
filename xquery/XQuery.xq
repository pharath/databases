                   (:=== XQuery Demo ===:)

(:***************************************************************
   SIMPLE FLWOR QUERY
   Titles of books costing less than $90 where "Ullman" is
   an author
****************************************************************:)

for $b in doc("BookstoreQ.xml")/Bookstore/Book
where $b/@Price < 90
  and $b/Authors/Author/Last_Name = "Ullman"
return $b/Title

(:***************************************************************
   EXISTENTIAL QUANTIFICATION AND CONSTRUCTED RESULT
   Titles and author first names of books whose title contains
   one of the author's first names
****************************************************************:)

for $b in doc("BookstoreQ.xml")/Bookstore/Book
where some $fn in $b/Authors/Author/First_Name
         satisfies contains($b/Title, $fn)
return <Book>
          { $b/Title }
          { $b/Authors/Author/First_Name }
       </Book>

(:***************************************************************
   Same query but return only first names appearing in title
****************************************************************:)

for $b in doc("BookstoreQ.xml")/Bookstore/Book
where some $fn in $b/Authors/Author/First_Name
         satisfies contains($b/Title, $fn)
return <Book>
          { $b/Title }
          { for $fn in $b/Authors/Author/First_Name
            where contains($b/Title, $fn) return $fn }
       </Book>

(:***************************************************************
   LET CLAUSE, AGGREGATION, QUERY IN XML
   Average book price
****************************************************************:)

(: - WARNING: if you use https://www.videlibri.de/cgi-bin/xidelcgi
     run this in "XQuery 3.1" mode, not in "Autodetect" mode
   - "@Price" not "data(@Price)"
   - <Average> tags are necessary, must not remove them !
     - but may rename them
   - do not forget the curly braces :)
<Average>
  { let $plist := doc("BookstoreQ.xml")/Bookstore/Book/@Price
    return avg($plist) }
</Average>

(:***************************************************************
   Same query, compacted
****************************************************************:)

<Average>
  { let $a := avg(doc("BookstoreQ.xml")/Bookstore/Book/@Price)
    return $a }
</Average>

(:***************************************************************
   LET AND FOR TOGETHER, ATTRIBUTES TURNED INTO ELEMENTS
   Books whose price is below average
****************************************************************:)

(: Remember: ":=" and not "=" :)
let $a := avg(doc("BookstoreQ.xml")/Bookstore/Book/@Price)
for $b in doc("BookstoreQ.xml")/Bookstore/Book
where $b/@Price < $a
return <Book>
          { $b/Title }
          <Price> { $b/data(@Price) } </Price>
       </Book>

(:***************************************************************
   ORDERING
   Titles and prices sorted by price
   (error, then fix)
****************************************************************:)

for $b in doc("BookstoreQ.xml")/Bookstore/Book
order by $b/@Price
return <Book>
          { $b/Title }
          <Price> { $b/data(@Price) } </Price>
       </Book>

(: ging auch ohne xs:int() :)
for $b in doc("BookstoreQ.xml")/Bookstore/Book
order by xs:int($b/@Price)
return <Book>
          { $b/Title }
          <Price> { $b/data(@Price) } </Price>
       </Book>

(:***************************************************************
   DUPLICATE ELIMINATION
   All last names (duplicates, then eliminate)
****************************************************************:)

for $n in doc("BookstoreQ.xml")//Last_Name
return $n

for $n in distinct-values(doc("BookstoreQ.xml")//Last_Name)
return $n

(: phth: does not work! :)
for $ln in .//Last_Name
return distinct-values($ln)

(: prints THE STRING "$n" 3 times without evaluating it :)
for $n in distinct-values(doc("BookstoreQ.xml")//Last_Name)
return <Last_Name> $n </Last_Name>

for $n in distinct-values(doc("BookstoreQ.xml")//Last_Name)
return <Last_Name> {$n} </Last_Name>

(:***************************************************************
   UNIVERSAL QUANTIFICATION (FOR-ALL)
   Books where every author's first name includes "J"
****************************************************************:)

for $b in doc("BookstoreQ.xml")/Bookstore/Book
where every $fn in $b/Authors/Author/First_Name
         satisfies contains($fn, "J")
return $b

(:***************************************************************
   "SELF-JOIN"

   All pairs of titles containing a shared author
   (oversight, then fix)

   IMPLICITLY EXISTENTIAL QUANTIFICATION =
   "there is some last name under B1 that is equal to
      some last name under "B2", even if "B1" or "B2" 
      have many last names"
****************************************************************:)

for $b1 in doc("BookstoreQ.xml")/Bookstore/Book
for $b2 in doc("BookstoreQ.xml")/Bookstore/Book
where $b1/Authors/Author/Last_Name = $b2/Authors/Author/Last_Name
return
   <BookPair>
      <Title1> { data($b1/Title) } </Title1>
      <Title2> { data($b2/Title) } </Title2>
   </BookPair>

for $b1 in doc("BookstoreQ.xml")/Bookstore/Book
for $b2 in doc("BookstoreQ.xml")/Bookstore/Book
where $b1/Authors/Author/Last_Name = $b2/Authors/Author/Last_Name
and $b1/Title != $b2/Title   (: must exclude self ! :)
return
   <BookPair>
      <Title1> { data($b1/Title) } </Title1>
      <Title2> { data($b2/Title) } </Title2>
   </BookPair>

for $b1 in doc("BookstoreQ.xml")/Bookstore/Book
for $b2 in doc("BookstoreQ.xml")/Bookstore/Book
where $b1/Authors/Author/Last_Name = $b2/Authors/Author/Last_Name
and $b1/Title < $b2/Title   (: remove duplicates ! :)
return
   <BookPair>
      <Title1> { data($b1/Title) } </Title1>
      <Title2> { data($b2/Title) } </Title2>
   </BookPair>

(:***************************************************************
   GRAND FINALE
   Invert data: Authors with the books they've written
****************************************************************:)

<InvertedBookstore>
  { for $ln in distinct-values(doc("BookstoreQ.xml")//Author/Last_Name)
    for $fn in distinct-values(doc("BookstoreQ.xml")//Author[
                                    Last_Name=$ln]/First_Name)
    return
       <Author>
          <First_Name> { $fn } </First_Name>
          <Last_Name> { $ln } </Last_Name>
          { for $b in doc("BookstoreQ.xml")/Bookstore/Book[
                                 Authors/Author/Last_Name = $ln]
            return <Book> 
                      { $b/@ISBN } { $b/@Price }
                      { $b/Title } 
                   </Book> }
       </Author> }
</InvertedBookstore>

(:***************************************************************
   Same query, add Edition and Remark

   - works, although some books do not have these attributes
****************************************************************:)

<InvertedBookstore>
  { for $ln in distinct-values(doc("BookstoreQ.xml")//Author/Last_Name)
    for $fn in distinct-values(doc("BookstoreQ.xml")//Author[
                                    Last_Name=$ln]/First_Name)
    return
       <Author>
          <First_Name> { $fn } </First_Name>
          <Last_Name> { $ln } </Last_Name>
          { for $b in doc("BookstoreQ.xml")/Bookstore/Book[
                                 Authors/Author/Last_Name = $ln]
            return <Book> 
                      { $b/@ISBN } { $b/@Price } { $b/@Edition }
                      { $b/Title } {$b/Remark }
                   </Book> }
       </Author> }
</InvertedBookstore>
