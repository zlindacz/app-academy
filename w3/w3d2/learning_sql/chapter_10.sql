/* 10.1
What is an outer join?
join that includes all of the rows from one table and indludes data from the second table only if matching rows are found

What is a left outer join?
account on the left side has all rows included; the one on the right will either be the value or NULL if no data is available

What is the difference between a left outer join and a right outer join?
table on the left or right has all the rows

Know how to outer join 3 or more tables.
specify left outer join twice each with its own ON clause

Know how to perform self outer joins.
similar to other outer joins, must give aliases

10.2
What is a cartesian product (or cross join)?
really only used by accident. specify CROSS JOIN to use.

10.3
What is a natural join and why should it be avoided?
name the tables to be joined and let the database server determine what the join conitions need to be. Need to have identical column names across multiple tables as foreign keys. If the server can't find two identically named columns in two tables, it will skip the join condition

1.
SELECT p.product_cd, a.account_id, a.cust_id, a.avail_balance
FROM product p
LEFT OUTER JOIN account a
ON p.product_cd = a.product_cd

2.
SELECT p.product_cd, a.account_id, a.cust_id, a.avail_balance
FROM account a
RIGHT OUTER JOIN product p
ON p.product_cd = a.product_cd

3.
SELECT a.account_id, a.product_cd, i.fname, i.lname, b.name
FROM account a
LEFT OUTER JOIN business b
ON b.cust_id = a.cust_id
LEFT OUTER JOIN individual i
ON i.cust_id = a.cust_id
*/
