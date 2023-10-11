--------------------------------------------------------------------------------
/*find all customers who have at least one loan and one deposit account. Include
the cust_ID, account_number, and loan_number in your results. Note: Some customers may
appear multiple times due to having multiple loans or deposit accounts. Must
include a JOIN.
*/
--------------------------------------------------------------------------------

SELECT b.cust_ID, d.account_number, b.loan_number 
FROM borrower b
JOIN depositor d
USING(cust_ID);  

--------------------------------------------------------------------------------
/* identify all customers who have a deposit account in the same city in which
they live. The results should include the cust_id, customer_city, branch_city, branch_name,
and account_number. Note: The city of a deposit account is the city where its branch is
located. Must use a JOIN*/
--------------------------------------------------------------------------------

SELECT c.cust_id, c.customer_city,b.branch_city, 
a.branch_name, d.account_number
FROM account a 
JOIN branch b
USING(branch_name)
JOIN depositor d
USING(account_number)
JOIN customer c
using(cust_ID)
where b.branch_city = c.customer_city;

--------------------------------------------------------------------------------
/*return the cust_ID and customer_name of customers who hold at least one
loan with the bank, but do not have any deposit accounts. Must use a subquery
and a SET operator*/
--------------------------------------------------------------------------------

SELECT cust_ID,customer_name FROM customer
WHERE cust_ID IN 
((SELECT cust_ID FROM borrower) 
	EXCEPT (SELECT cust_ID FROM depositor));
   
--------------------------------------------------------------------------------
/*Obtain the cust_ID and customer_name for all customers residing on the same 
street and in the same city as customer '12345'. Include customer '12345' in the
results. Must include a subquery.*/
--------------------------------------------------------------------------------

SELECT cust_ID, customer_name FROM customer
WHERE customer_street = 
(SELECT customer_street FROM customer
WHERE cust_ID = '12345')
AND customer_city =
(SELECT customer_city FROM customer
WHERE cust_ID = '12345');

--------------------------------------------------------------------------------
/*return a list of branch_names for every branch that has at least one customer 
living in 'Harrison' that has a deposit account with them. Branch names should 
not be duplicated. Must include a subquery and a JOIN*/
--------------------------------------------------------------------------------

SELECT branch_name FROM branch
JOIN account
USING(branch_name)
JOIN depositor
USING(account_number)
WHERE cust_ID IN
(SELECT cust_ID FROM customer
WHERE customer_city = 'Harrison');
    
--------------------------------------------------------------------------------
/*return each cust_ID and customer_name who has a deposit account at every
branch located in Brooklyn.Must include a subquery.*/
--------------------------------------------------------------------------------

SELECT cust_ID, customer_name
FROM customer
JOIN depositor USING(cust_ID)
JOIN account USING(account_number)
JOIN branch USING(branch_name)
WHERE branch_city = 'Brooklyn'
GROUP BY cust_id
HAVING COUNT(cust_id) >=3;

--------------------------------------------------------------------------------
/*retrieve the loan_number, customer_name, and branch_name of customers who have 
a loan at the Yonkahs Bankahs branch and whose loan amount exceeds the average
loan amount for that branch. Must include a JOIN and a subquery*/
--------------------------------------------------------------------------------

SELECT b.loan_number, c.customer_name, l.branch_name
FROM customer c
JOIN borrower b USING(cust_ID)
JOIN loan l USING (loan_number)
WHERE CAST(amount AS numeric(9,2)) > 
   (SELECT round(AVG(CAST(amount AS 
	numeric(9,2))),2) FROM loan)
GROUP BY b.loan_number, c.customer_name, l.branch_name
HAVING branch_name = 'Yonkahs Bankahs';

