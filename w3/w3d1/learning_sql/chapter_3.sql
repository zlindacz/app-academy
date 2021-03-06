/* Ch 3

/* 3.1
What is a database connection and how long is it held?
- A database connection is established between the application that requested it and the database server. It is established after the SQL server verifies your login info.
- With the connection in place, you can now access and manipulate info in the database using the mysql/postgres tool.
- The connection lasts until you or the server releases the conenction.

What is the query optimizer?
- A function of the database management system that determines the most efficient way to execute your query.

3.2
Be able to describe the purpose of the SELECT, FROM, WHERE, GROUP BY, HAVING and ORDER BY clauses. Don't worry about memorizing the definitions in this section now, but you should have internalized them by the time you've finished this chapter.
- SELECT => determines which of all possible columns to include in the query's result set
- FROM => identidies the tables from which to draw data and how the tables should be joied
- WHERE => filters out unwanted data
- GROUP BY => used to group rows together by common column values
- HAVING => filters out unwanted groups
- ORDER BY => sorts the rows of the final result set by one or more columns

3.3
How do you add column aliases to a SELECT clause?
- To add your own labels to columns, add the alias after
each element of your select clause

How do you remove duplicates from a SELECT clause?
- add the word DISTINCT directly after the select keyword

Why does this make the query slower?
- data is first sorted

3.4
What is a subquery?
- query contained within another query; subqueries are surrounded by parentheses and can be found in various parts of a select statement

What does a subquery generate (or return)?
- in the FROM clause, generates a temporary table that is visible from all other query clauses and can interact with other tables named in the clause
- The subquery is referenced by the containing query via its alias (e.g. e)

What is a view?
- A view is a query that is stored in the data dictionary. It looks and acts like a table, but there is no data associated with a view (a virtual table)
- When the view is created, no additional data is generated or stored: the server simply
tucks away the select statement for future use. Now that the view exists, you can issue
queries against it
- Views are created for various reasons, including to hide columns from users and to simplify complex database designs.

How do you create an alias for a table?
- may choose to use the AS keyword, or not. give the alias after each FROM column_name or after the JOIN command

3.5
Know how to write simple WHERE clauses with multiple filter conditions. Know how to group conditions with parentheses.
- separate WHERE filter conditions using operators such as AND, OR, and NOT
- the operators should start on a new line, offset tot he right by 2 spaces
- if multiple operators are used, use parentheses to group


3.7
How do you order on multiple columns (i.e., first on one column, then on another)?
- separate by comma (e.g. ORDER BY open_emp_id, product_cd;)

What is the default sorting order, and how do you flip it?
How do you sort via an expression?
- default order is ascending; add DESC to flip it (ORDER BY avail_balance DESC;)
*/
