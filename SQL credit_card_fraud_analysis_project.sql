


select * from [dbo].[credit_fraud_30]

select  count(*) [total] from [dbo].[credit_fraud_30]

-- 1. Total no.of fraud
select is_fraud, count(*) [total no.of fraud] from [dbo].[credit_fraud_30]
where is_fraud = 1
group by is_fraud

-- 2. Total no.of transaction
select count(*) [total transaction] from [dbo].[credit_fraud_30]

-- 3. fraud rate %
select 
    is_fraud, 
    count(*) as transactions,
    round(count(*) * 100.0 / (select count(*) from [dbo].[credit_fraud_30]), 2) [fraud %]
from [dbo].[credit_fraud_30]
group by is_fraud

-- 4. Top 10 state by fraude cases
select top 10 state_name, sum(is_fraud) [state by fraud]
from [dbo].[credit_fraud_30]
group by state_name
order by [state by fraud] desc

-- 5. Total amount
select sum(amount) as Total_amount
from [dbo].[credit_fraud_30]

-- 6. Total fraud amount
select is_fraud, sum(amount) [fraud_amount]
from [dbo].[credit_fraud_30]
where is_fraud = 1
group by is_fraud

-- 7. % of fraud amount
SELECT is_fraud,SUM(amount) AS total_amount,
ROUND(SUM(amount) * 100.0 / (SELECT SUM(amount) FROM [dbo].[credit_fraud_30]), 2) AS pct_of_amount
FROM [dbo].[credit_fraud_30]
GROUP BY is_fraud;