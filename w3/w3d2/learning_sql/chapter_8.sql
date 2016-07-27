/* 8.1
How do you GROUP BY a specific column?
Use that column's name after GROUP BY

Why can't you use a WHERE clause to filter a group returned by GROUP BY?
The where clause runs before GROUP BY, so it doesn't know what filters were applied in GROUP BY
e.g.
mysql> SELECT open_emp_id, COUNT(*) how_many
-> FROM account
-> WHERE COUNT(*) > 4
-> GROUP BY open_emp_id;
ERROR 1111 (HY000): Invalid use of group function

because COUNT doesn't know that you're counting because the groups have not yet been generated

How does WHERE interact with GROUP BY?
GROUP BY takes the results specified by WHERE and applies filters to them

What should you use instead to achieve the same type of filtering?
HAVING

mysql> SELECT open_emp_id, COUNT(*) how_many
-> FROM account
-> GROUP BY open_emp_id
-> HAVING COUNT(*) > 4;

How many rows are returned from a single group?
one row for each distinct value in that column

What kinds of columns are you allowed to select when performing a GROUP BY?
select by column that you grouped by, as well as aggregate functions of those

8.2
What is an aggregate function?
performs a specific operation over all rows in a group
max, min, avg,sum, count

Understand the explicit grouping covered in 8.2.1
when there is no GROUP BY clause, but 
.
How do you count distinct values for a column across all members of the group?
How is NULL handled by aggregate functions?
8.3
How do you group on a single column?
How do you group on multiple columns?
How do you group via expressions?
What are "rollups" used for?



1. Construct a query that counts the number of rows in the account table.

SELECT count(*)
FROM account;

2. Modify your query from Exercise 8-1 to count the number of accounts held by each
customer. Show the customer ID and the number of accounts for each customer.

SELECT cust_id, count(*)
FROM account
GROUP BY cust_id;

3. Modify your query from Exercise 8-2 to include only those customers having at least
two accounts.

SELECT cust_id, count(*)
FROM account
GROUP BY cust_id
HAVING count(*) >= 2;

4. Find the total available balance by product and branch where there is more than one
account per product and branch. Order the results by total balance (highest to lowest).

SELECT product_cd, open_branch_id, sum(avail_balance)
FROM account
GROUP BY product_cd, open_branch_id
HAVING count(*) > 1
ORDER BY sum(avail_balance + pending_balance) DESC;
*/
