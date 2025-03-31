select * from datasql;

# 1 Total Loan Amount Funded
select sum(`funded amount`) Total_Funded_Amount  from datasql;

# 2 Total Loans
select distinct count(`account id`) Total_Loans from datasql;

# 3 Total Collection
select * from datasql;
select total_rec_prncp, total_rec_interest, rec_late_fee, total_rec_prncp+total_rec_interest Total_Collection from (
select round(sum(`total rec prncp`),2) Total_Rec_Prncp,round(sum(`total rec late fee`),2) Rec_late_fee, round(sum(`total rec int`),2) Total_Rec_Interest from datasql)abc;

# 4 Total Interest
select round(sum(`loan amount`*`int rate`*(`term (months)`/12)),2) Total_Interest from datasql;

# 5 Branch-Wise Performance (Top 5)
select `Branch Name`,round(Total_Interest,2) Total_Interest,round(Total_Fees,2) Total_Fees,round(total_interest+total_fees,2) as Revenue from (
select `Branch Name`,sum(`loan amount`*`int rate`*(`term (months)`/12)) Total_Interest, round(sum(`total fees`),2) Total_Fees from datasql group by 1)abc group by 1 order by 4 desc limit 5;

# 6 State-wise Performace (Top 5)
select `state name`, sum(`loan amount`) Loan_Amount from datasql group by 1 order by 2 desc limit 5;

# 7 Religion-Wise Loan
select distinct `Religion`, sum(`loan amount`) Loan_Amount from datasql group by 1 order by 2 desc;

# 8 Product Group-Wise Loan (Top 5)
select distinct(`purpose category`) Category, sum(`loan amount`) Loan_Amout from datasql group by 1 order by 2 desc limit 5;

# 9 Disbursement Trend
select right(`disbursement date`,4) Year, sum(`loan amount`) Loan_amount from datasql group by 1 order by 1;

# 10 Grade-Wise Loan
select distinct(Grade), sum(`loan amount`) Loan_Amount from datasql group by 1 order by 1;

# 11 Default Loan Count
select sum(`is default loan`) Default_Loan from datasql;

# 12 Delinquent Loan Count
select sum(`is delinquent loan`) Delinquent_Loan from datasql;

# 13 Delinquent Loan Rate
select concat((sum(`is delinquent loan`)/count(`account id`))*100,' %') as Delinquent_Loan_Rate from datasql;

# 14 Default Loan Rate
select concat((sum(`is default loan`)/count(`account id`))*100,' %') as Default_Loan_Rate from datasql;

# 15 Loan Status-Wise Loan
select distinct `Loan Status`, sum(`loan amount`) Loan_Amount from datasql group by 1 order by 2 desc;

# 16 Age Group-Wise Loan
select distinct Age, sum(`loan amount`) Loan_Amount from datasql group by 1 order by 1;

# 17 No. of Verified Loans
select distinct `Verification Status`, count(`account id`) Accounts from datasql group by 1;

# 18 Loan Maturity
select * from datasql;
select distinct right(`disbursement date`,4) Year from datasql order by 1;
select distinct year(date_add(concat((right(`disbursement date`,4)),'-01-01'),interval `term (months)` month)) Maturity_Year, count(`account id`) Accounts from datasql
group by 1 order by 1;

# 18 Perfected
select distinct year(date_add(str_to_date(`disbursement date`,'%d-%m-%Y'),interval `term (months)` month)) Maturity_year,
count(`account id`) Accounts from datasql group by 1 order by 1;
