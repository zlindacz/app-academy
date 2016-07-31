/* 9.1
What is a subquery?
a subquery is  a query contained within another SQL statement. it is enclosed within parentheses and executed prior to the containing statement

What is a containing statement?
the statement that contains the subquery

What is statement scope?
the server frees up any memory allocated to the subquery resutls after the SQL statementhas finished execution

9.3
What is a noncorrelated subquery?
a self-contained subquery which doesn't need to reference columns from the containing statement like the correlated subqueries do
- correlated subqueries used in update or delete

What is a scalar subquery?
query that returns a single row and column

What operator would you use to check if a single value can be found within a set of values?
IN of NOT IN (beware of NULL values)

What operator would you use to make comparisons between a single value and every value in a set?
ALL in conjunction with a comparison operator (=, <>, >, <)
(beware of NULL values)

What is the difference between the ANY and ALL operators?
Similar: like ALL, ANY allows a value to be compared to the members of a set of values
Different: a condition using ANY evaluates to true as soon as a single comparison is favorable

IN and = ANY are the same

9.4
What is a correlated subquery?
a subquery that is dependent on its containing statement from which it references one or more columns

What is the difference between a correlated subquery and a noncorrelated subquery?
correlated is executed once for each candidate row; just run the containing query once

What is the EXISTS operator used for?
used for when you want to identify that a relationship eists without regardfor the quantity

9.5
Can you use a subquery in a FROM clause?
Yes. the FROM clause names the tables to be used by the query, which is what a subquery generates (result set containing rows and columns of data)

Can you use both correlated and noncorrelated subqueries in a FROM clause?
Only non-correlated; they are executed first and the data held in memory until the containing query finishes execution

Have an understanding of where you can (and might want to) use subqueries.
when you want to generate data that don't exist in any form within your database. This can be an advantage over creating lots of little permanent tables so that you don'tlitter your database with special-purpose tables that later you can't remember why were created in the first place

1. Construct a query against the account table that uses a filter condition with a noncorrelated subquery against the product table to find all loan accounts ( product.prod uct_type_cd = 'LOAN' ). Retrieve the account ID, product code, customer ID, and available balance.

SELECT
account_id, cust_id, avail_balance, product_cd
FROM
  account
WHERE
  product_cd IN (SELECT product_cd
  FROM products
  WHERE product_type_cd = 'LOAN');

2. Rework the query from Exercise 9-1 using a correlated subquery against the product table to achieve the same results.

SELECT
  account.account_id, account.cust_id, account.avail_balance, prouct.product_cd
FROM
  product
WHERE
  product_cd IN (SELECT product_cd
FROM
  products
WHERE
  product_type_cd = 'LOAN')
JOIN
  account
ON account.product_cd = product.product_cd;

SELECT account.account_id, account.product_cd, account.cust_id, account.avail_balance
FROM account
WHERE EXISTS (SELECT 1
  FROM product
  WHERE product_cd = account.product_cd
AND product.product_type_cd = 'LOAN');

3.
SELECT e.id, e.fname, e.lname,
(SELECT d.name
FROM department AS d
WHERE d.id = e.dept_id) AS dept_name,
(SELECT b.name
FROM branch AS b
WHERE b.id = e.assigned_branch_id) AS branch_name
FROM employee AS e;
*/
