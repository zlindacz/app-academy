/* Ch 5

5.1
What is a cross join and how is it generated?
- aka Cartesian join, rarely used because it shows every permutation of the two tables joined (lots of repetition). It's generated if we don't specify HOW the tables should be joined
e.g.
mysql-> SELECT e.fname, e.lname, d.name
     -> FROM employee e INNER JOIN department d;

What is an inner join and how is it generated?
- If a value exists for one table but not the other, then the joinfails for the rows containing that value and those rows are excluded from the result set
e.g.
mysql-> SELECT e.fname, e.lname, d.name
     -> FROM employee e INNER JOIN department d
     -> ON e.dept_id = d.dept_id;

Alternatively, can also use USING (dept_id) when the columns used to join the two tables are identical

What is the default type of join?
- inner join (if we specify the how), but get in the habit of specifying how

Skip 5.1.3 (ANSI Join Syntax)

5.2
Know how to inner join 3 (or more) tables.
- Need two join types and two ON subclauses in the FROM clause
e.g.
mysql-> SELECT a.account_id, c.fed_id, e.fname, e.lname
     -> FROM account a INNER JOIN customer c
     -> ON a.cust_id = c.cust_id
     -> INNER JOIN employee e
     -> ON a.open_emp_id = e.emp_id
     -> WHERE c.cust_type_cd = 'B';
Regardless of the order by which the tables are listed and the corresponding ON subclauses are called, the results are the same. This is because SQL is a nonprocedural language, meaning it'll do what we want but we don't get to tell it HOW to do it. (Althogh it CAN be done with straight-join)

Know how to inner join to the same table multiple times.
- when two or more tables are joined to same/different column(s) in this table
- need to give aliases to the table in these different contexts so the server knows which instance you're referring to
e.g.
mysql> SELECT a.account_id, e.emp_id,
    -> b_a.name open_branch, b_e.name emp_branch
    -> FROM account a INNER JOIN branch b_a
    -> ON a.open_branch_id = b_a.branch_id
    -> INNER JOIN employee e
    -> ON a.open_emp_id = e.emp_id
    -> INNER JOIN branch b_e
    -> ON e.assigned_branch_id = b_e.branch_id
    -> WHERE a.product_cd = 'CHK';

5.3
What is a self-referencing foreign key?
- a column that points to the primary key within the same table (e.g. a list of employees with a column superior_emp_id that points to the primary key emp_id because employees can work under other employees)

How do you inner join a table to itself?
- in this ^ case, join the emp_table to itself, one to provide employee names and the other to provide manager names
e.g.
mysql> SELECT e.fname, e.lname,
    -> e_mgr.fname mgr_fname, e_mgr.lname mgr_lname
    -> FROM employee e INNER JOIN employee e_mg
    -> ON e.superior_emp_id = e_mgr.emp_id;

5.4
How do you inner join a table to another on a range of values instead of on an equality condition?
- equi-joins: values from the two tables must match for the join to succeed
(ON e.assigned_branch_id = b.branch_id)
- non-equi joins: use >= or <= or != instead of =, and don't have to have foreign key

How do you do that for a self-join?
- self-non-equi-join is used when self-referencing table needs to match up with itself but under some non-equality condition
e.g. employees table when we need to organize an intra-company chess tournament and employees won't be matched up against themselves
( use the join condition e1.emp_id < e2.emp_id so that each emp is paired only with those emps having a higher employee ID, no reverse-repeat pairings)

5.5
As you know, join conditions belong in the ON clause and filter conditions belong in the WHERE clause. What happens if you put a join condition in the WHERE clause and/or a filter condition in an ON clause?
- same results; write for readability and maintainability
 */


/* Exercises
Write a query that returns the account ID for each nonbusiness customer
(customer.cust_type_cd = 'I') with the customer’s federal ID (customer.fed_id) and
the name of the product on which the account is based (product.name).

SELECT a.account_id,c.fed_id, p.name
FROM account a INNER JOIN customer c
  ON a.cust_id = c.cust_id
  INNER JOIN product p
  ON a.product_cd = p.product_cd
WHERE c.cust_type_cd = 'I';

Construct a query that finds all employees whose supervisor is assigned to a different
department. Retrieve the employees’ ID, first name, and last name.

employee (self) supervisor
department (emp), department(supervisor)

SELECT e.emp_id, e.fname, e.lname
FROM employee e INNER JOIN employee s
  ON e.superior_emp_id = s.emp_id
WHERE e.dept_id != s.dept_id;
