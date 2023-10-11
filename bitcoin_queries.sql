 
--- Create Table Statement
CREATE TABLE bitcoin_data
(
	trans_date DATE, --A--
	price_usd NUMERIC(11,3), --B--
	code_size INTEGER, --C--
	sent_by_address INT, --D--
	transactions INTEGER, --E--
	mining_profitability NUMERIC(6,4), --F--
	sent_in_usd BIGINT, --G--
	transaction_fees NUMERIC(11,5), --H--
	median_transaction_fee NUMERIC(11,5), --I--
	confirmation_time NUMERIC(11,4), --J--
	market_cap BIGINT, --K--
	transaction_value INT, --L--
	median_transaction_value NUMERIC(8,4), --M--
	tweets INTEGER, --N--
	google_trends NUMERIC(9,4), --O--
	fee_to_reward NUMERIC(9,4), --P--
	active_addresses INT, --Q--
	top_100_cap  NUMERIC(9,4)--R--	
);
	
--Copy Statement

COPY bitcoin_data
FROM 'bitcoin_data.csv'
WITH (FORMAT CSV, HEADER, NULL "null");

---returns all the data in the table
SELECT * FROM bitcoin_data;

/*return the trans_date and the code_size divided by the
transactions and name the output column difficulty.
o include all decimal places */

SELECT trans_date, (CAST((code_size) AS NUMERIC(20,5)) / transactions)
AS difficulty
FROM bitcoin_data;


/*eturn the trans_date and the product of median_transaction_fee
and transactions. Label this column as daily_cost.*/ 

SELECT trans_date, (median_transaction_fee * transactions) 
AS daily_cost
FROM bitcoin_data;

/* return the trans_date and the sent_in_usd divided by the number of
transactions. Name the output column avg_transaction. Include the
median_transaction_value */

SELECT trans_date, 
(sent_in_usd / transactions) AS avg_transaction, 
median_transaction_value
FROM bitcoin_data;

---return the average price_usd and label column avg_price.

SELECT AVG(price_usd) AS avg_price
FROM bitcoin_data

/*return the total amount of all transactions and name the resulting
column total_transactions */

SELECT SUM(transactions) AS total_transactions FROM bitcoin_data;

---return the largest market_cap value and call it max_cap

SELECT MAX(market_cap) AS max_cap FROM bitcoin_data;

/*return the mean number of tweets, including all decimal places,
label the output avg_daily_tweets*/

SELECT AVG(tweets) AS avg_daily_tweets FROM bitcoin_data;

