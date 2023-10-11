--------------------------------------------------------------------------------
/*				                 Table Creation		  		                  */
--------------------------------------------------------------------------------

CREATE TABLE customer_spending
(
sale_date DATE,
sale_year SMALLINT,
sale_month VARCHAR(10),
age SMALLINT,
gender VARCHAR(1),
country VARCHAR(100),
state VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
quantity INT,
unit_cost NUMERIC(10,2),
unit_price NUMERIC(10,6),
cost INT,
revenue INT
);

--------------------------------------------------------------------------------
/*				                 Import Data           		  		          */
--------------------------------------------------------------------------------

COPY customer_spending
FROM 'customer_spending.csv'
WITH (FORMAT CSV, HEADER, NULL "null");


--------------------------------------------------------------------------------
/*return each category and the corresponding total revenue for that
category for the sale_year 2016, alphabetically*/
--------------------------------------------------------------------------------

SELECT category, SUM(revenue) AS revenue 
FROM customer_spending
GROUP BY category, sale_year
HAVING sale_year = 2016
ORDER BY category;

--------------------------------------------------------------------------------
/*return a list of sub_categories and their corresponding averageunit_price, 
average unit_cost, as well as the difference between these two values alias as
margin, for the sale_year 2015. alphabetically*/
--------------------------------------------------------------------------------

SELECT sub_category,
AVG(unit_price) AS avgerage_unit_price,
AVG(unit_cost) AS agerage_unit_cost,
(AVG(unit_price) - AVG(unit_cost)) AS margin
FROM customer_spending
GROUP BY sub_category, sale_year
HAVING sale_year = 2015
ORDER BY sub_category;

--------------------------------------------------------------------------------
/* returns the total number of female buyers (gender) who made purchases in
   the Clothing category */
--------------------------------------------------------------------------------

SELECT COUNT(gender) FROM customer_spending
GROUP BY gender, category
HAVING gender = 'F' AND category = 'Clothing';

--------------------------------------------------------------------------------
/*return the age, sub_cateogry, average quantity (as a whole
number), and average cost of products purchased by each age and sub_category.
Output should show the columns in the same order they are listed. Organize the data
by age, oldest to youngest, and then by sub_category alphabetically*/
--------------------------------------------------------------------------------

SELECT age,
sub_category, 
ROUND(AVG(quantity)) AS average_quantity,
AVG(cost) AS average_cost
FROM customer_spending
GROUP BY age, sub_category
ORDER BY age DESC, sub_category;

--------------------------------------------------------------------------------
/*return a list of countries where more than 30 transactions were
made by customers between the ages of 18-25 (inclusive).*/
--------------------------------------------------------------------------------

SELECT country, COUNT(*) 
FROM customer_spending
WHERE age BETWEEN 18 AND 25
GROUP BY country
HAVING COUNT(*) > 30;

--------------------------------------------------------------------------------
/*returns a list of sub_categories along with their average quantity
and average cost, both rounded to 2 decimal places, and named as avg_quantity 
and avg_cost respectively. Only include sub_categories that have at least
10 records in the data set. Organize the data by sub_category alphabetically*/
--------------------------------------------------------------------------------

SELECT sub_category,
ROUND(AVG(quantity),2) AS avg_quantity, 
ROUND(AVG(cost),2) AS avg_cost
FROM customer_spending
GROUP BY sub_category
HAVING COUNT(*) >=10
ORDER BY sub_category;

--------------------------------------------------------------------------------
/* return each sub_cateogry and their respective total quantity and
total revenue for male buyers (gender), in the sale_year of 2016.*/
--------------------------------------------------------------------------------

SELECT sub_category,
SUM(quantity) AS total_quantity,
SUM(revenue) AS total_revenue
FROM customer_spending
GROUP BY sub_category, gender, sale_year
HAVING gender = 'M' AND sale_year = 2016;

--------------------------------------------------------------------------------
/*determine each country’s total revenue generated from sales, alphabetically*/
--------------------------------------------------------------------------------

SELECT country, SUM(revenue) AS total_revenue
FROM customer_spending
GROUP BY country
ORDER BY country;
--------------------------------------------------------------------------------
/*determine the highest unit_cost, lowest unit_cost, and average
unit_cost for each gender in each category. The output columns should be gender,
category, high_cost, low_cost, avg_cost. Organize by gender and then category*/
--------------------------------------------------------------------------------

SELECT gender, category,
MAX(unit_cost) AS high_cost,
MIN(unit_cost) AS low_cost,
AVG(unit_cost) AS  avg_cost
FROM customer_spending
GROUP BY gender, category
ORDER BY gender, category;

--------------------------------------------------------------------------------
/*return the country with the highest average revenue(alias as high_sales)*/
--------------------------------------------------------------------------------

SELECT country, AVG(revenue) AS high_sales
FROM customer_spending
GROUP BY country
ORDER BY AVG(revenue) DESC
LIMIT 1;
	
	