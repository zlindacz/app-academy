/* 13.1
What is a database index?
a special table that is kept in a specific order, that contains only the column or columns used to locate rows in the data table, along with info describing where the rows are physically located

Why would you want to create an index?
to speed up queries to the indexed table

What index is automatically created when you create a table?
primary key

How do you enforce uniqueness of values in a particular column?
mysql> ALTER TABLE department
-> ADD UNIQUE dept_name_idx (name);
An error will be thrown if you try to add another department with the same name

Why don't you need to build unique indices on your primary-key column(s) ?
THe server already checks for uniquess

Why would you use a multi-column index?
these are indexes that span multiple columns, used for queries that require all these columns. can build multiple indices using the same set of columns but in different orders to ensure adequate response time (coz order matters)

Understand broadly the structure and balancing nature of a balanced-tree or B-tree.

Extra-Credit: 13.1.2.2
Play around with the explain statement a bit to see how your queries get executed
EXPLAIN SELECT ... shows how query optimizer decides to execute the query

Why not index every column?
space-intensive: requires disk space

13.2
What is a constraint?
a restriction placed on one or more columns of a table

What is a foreign-key constraint?
restrict one or more columns to contain only values found in another table's primary key columns
