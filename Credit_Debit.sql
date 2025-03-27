select * from credit;

# 1 Total Credit Amount
select round(sum(amount),2) Total_Credit_Amount from credit where `Transaction Type`='credit';

# 2 Total Debit Amount
select round(sum(amount),2) Total_Debit from credit where `Transaction Type`='debit';

# 3 Credit to Debit Ratio
select round(total_credit,2) Total_Credit, round(Total_Debit,2) Total_Debit,
case when total_debit= 0 then null else round(Total_Credit/Total_Debit,4) end Credit_to_Debit_Ratio
from (
	select sum(case when `transaction type`='credit' then amount else 0 end) Total_Credit,
sum(case when `transaction type`='debit' then amount else 0 end) Total_Debit from credit)subquery;

# 4 Net Transaction Amount
select round(total_credit-total_debit,2) Net_Transaction from (
select sum(case when `transaction type`='credit' then amount else 0 end) Total_Credit,
	sum(case when `transaction type`='debit' then amount else 0 end) Total_Debit from credit)abc;

# 5 Account Activity Ratio
select Transactions, Balance, round(transactions/balance,5) Activity_Ratio from(
select count(`customer id`) Transactions,round(sum(balance),2) Balance from credit)abc;

# 6 Transaction per Day/Week/Month
select distinct `transaction date`, count(*) over(partition by `transaction date`) per_Day, count(*) over(partition by week(`transaction date`)) per_Week,
count(*) over(partition by month(`transaction date`)) per_Month from credit order by 1;
--
# 7 Total Transaction Amount by Branch (Top 5)
select Branch, round(sum(amount),2) Total_Amount from credit group by 1 order by 2 desc limit 5;

# 8 Transaction Volume by Bank (Top 5)
select `Bank Name`, round(sum(amount),2) Total_Amount from credit group by 1 order by 2 desc limit 5;

# 9 Transaction Method Distribution
select distinct `Transaction Method`, count(*) over(partition by `transaction method`) Transactions from credit order by 2;

# 10 Branch Transaction Growth
select Quarter, Branch,concat(round(((total-previous)/previous)*100,4),' %') Percentage_Change from (
select quarter, branch, total, lag(total) over(order by quarter) previous  from(
select distinct quarter(`transaction date`) Quarter, branch,
sum(amount) over(partition by quarter(`transaction date`)) Total from credit where branch like 'North Branch')abc)abc;

# 11 High-Risk Transaction Flag (>4000)
select High_Risk, total-high_risk Low_Risk, total from (
select count(if(amount>4000,`customer id`,null)) high_risk, count(*) Total from credit)abc;

# 12 Suspicious Transaction Frequency
select quarter(`Transaction Date`) Quarter,count(if(amount>4000,`customer id`,null)) High_Risk  from credit group by 1 order by 1;
