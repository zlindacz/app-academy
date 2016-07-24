/* Ch 4

4.1
Be familiar with the NOT operator.
- if find confusing, use !=

4.3
Be familiar with the following types of conditions:
- equality/inequality: =, !=, <>
- range (incl. the BETWEEN operator): <, >, <=, >=, BETWEEN (earlier_datetime) AND (later_datetime)
- membership (the IN operator, via subqueries, NOT IN)

Skip Section 4.3.4.1 (Wildcards).
F% Strings beginning with F
%t Strings ending with t
%bas% Strings containing the substring 'bas'
_ _t_ Four-character strings with a t in the third position
_ _ _-_ _-_ _ _ _ 11-character strings with dashes in the fourth and seventh positions

Know how to use regex in a search expression.
- REGEXP followed by regex (WHERE lname REGEXP '^[FG]';)

4.4
How do you test if an expression is NULL?
- An expression can be null, but it can never equal null.
- Two nulls are never equal to each other.

How do you test if a value has been assigned to a column?
- use IS NULL in expression (WHERE superior_emp_id IS NULL;)
*/

/* Exercise 4

Construct a query that finds all nonbusiness customers whose last name contains an
a in the second position and an e anywhere after the a.

SELECT cust_id, fname, lname
FROM individual
WHERE lname LIKE '_a%e%';
