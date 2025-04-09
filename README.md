# Comprehensive Dashboard Analysis: Bank Loans & Debit-Credit Trends

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools Used](#tools-used)
- [Data Cleaning/Preparation](#data-cleaningpreparation)
- [Exploratory Data Analysis](#exploratory-data-analysis-eda)
- [KPIs](#key-performance-indicators-kpis)
- [Excel Dashboards](#excel-dashboards)
- [Tableau Dashboards](#tableau-dashboards)
- [PowerBI Dashboards](#powerbi-dashboards)
- [SQL Queries](#sql-queries)
- [Results/Findings](#resultsfindings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
  
## Project Overview

Conducted an in-depth data analysis of banking data to uncover meaningful insights into customer behavior, debit-credit transaction patterns, and the bank’s financial performance, helping identify trends and opportunities for improvement.

### Data Sources
[DataSet1](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Bank%20Data%20Analystics.xlsx) | 
[DataSet2](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Debit%20and%20Credit%20banking_data.xlsx)

### Tools Used

- Excel - Data cleaning, transformation, analysis, and visualization. [Excel Download Link](https://support.microsoft.com/excel)
- SQL - Data querying and management for large datasets. [MySQL Workbench Download Link](https://dev.mysql.com/downloads/workbench/)
- PowerBI - Visualization, reporting, and trend analysis for easy  decision-making. [PowerBI Desktop Download Link](https://www.microsoft.com/en-us/power-platform/products/power-bi/downloads)
- Tableau - Visualization, reporting, and trend analysis for easy  decision-making. [Tableau Public Download Link](https://www.tableau.com/products/desktop/download)

### Data Cleaning/Preparation

1. Removed duplicates and irrelevant columns  
2. Handled missing values using imputation techniques  
3. Standardized date and currency formats  
4. Normalized categorical values for consistency  
5. Created calculated columns for analysis

### Exploratory Data Analysis (EDA)

- Explored customer, loan, and transaction data to understand overall structure   
- Summarized key metrics like average loan amount, default rates, and transaction volumes  
- Identified trends such as seasonal spending and loan approval patterns  
- Detected outliers and anomalies for data quality and insights  
- Visualized relationships to uncover correlations

### Key Performance Indicators (KPIs)

Identified and tracked crucial metrics to evaluate the bank’s performance and customer behavior.  

KPIs included in Bank Analytics dashboards:

1. Total Loan Amount Funded: Total amount disbursed by the bank.
2. Total Loans: Total number of loans issued by the bank.
3. Total Collection: Total amount of loan repayments or payments collected.
4. Total Interest: Total amount of interest earned buy the bank from loans.
5. Branch-Wise Performance: Analyzes revenue (interest, fees, total) by branch.
6. State-Wise Loan: Shows geographic distribution of loans.
7. Religion-Wise Loan: Monitors loan distribution across religious demographics 
8. Product Group-Wise Loan: Categorizes loans by product types. 
9. Disbursement Trend: Tracks changes in loan disbursements over time.
10. Grade-Wise Loan: Assesses portfolio risk by borrower credit grades.
11. Default Loan Count: Counts loans in default.
12. Delinquent Client Count: Tracks borrowers with missed payments.
13. Delinquent Loan Rate: Percentage of loans overdue in the portfolio.
14. Default Loan Rate: Proportion of defaulted loans to the total portfolio.
15. Loan Status-Wise Loan: Breaks down loans by status (active, delinquent, closed).
16. Age Group-Wise Loan: Categorizes loans by borrowers’ age groups.
17. Loan Maturity: Tracks the timeline until full repayment 
18. No Verified Loans: Identifies loans without proper verification.

KPIs included in Credit-Debit dashboards:

1. Total Credit Amount: Total amount credited to customers.
2. Total Debit Amount: Total amount debited to customers.
3. Credit to Debit Ratio: The ratio of total amount credited to customers compared to the total debit  amount.
4. Net Transaction Amount: The total value of transactions after accounting for both credit and debits.
5. Account Activity Ratio: Measures of how frequently accounts are active, based on number of transaction relation to their balance.
6. Transactions per Day, per Week, per Month: Number of transaction respect to time.
7. Total Transaction Amount by Branch: Total value of all transactions conducted at each individual branch.
8. Transaction Volume by Bank: Total number of transactions processed by the bank.
9. Transaction Method Distribution: Breakdown of transactions based on different methods (e.g., debit, credit, bank transfer) and their respective counts.
10. Branch Transaction Growth: Percentage change in total transaction amount over time.
11. High-Risk Transaction Flag: Flags transactions which exceeds predefined amount.
12. Suspicious Transaction Frequency: Number of High-Risk transaction over period.

## Excel Dashboards
[Excel Banking Analytics](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Excel%20Bank%20Analytics.xlsx)  
![image](https://github.com/user-attachments/assets/194d4b6c-0ae1-4d1a-a3d6-f12e60551d4e)

[Excel Credit-Debit Dashboard](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Excel%20Credit%20Debit)
![image](https://github.com/user-attachments/assets/77246dd4-4cb5-4950-9b91-72e62d6a9229)

## Tableau Dashboards
[Tablaeu Banking Analytics](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Tableau%20Bank%20Analytics.twbx)
![image](https://github.com/user-attachments/assets/da57a63e-8179-44ae-8514-eb9dc7697aca)

[Tableau Credit-Debit Dashboard](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Tableau%20Debit%20Credit.twbx)
![image](https://github.com/user-attachments/assets/220948bb-771a-423a-b137-e80aa3ca1a2f)

## PowerBI Dashboards
[PowerBI Banking Analytics](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/PowerBI%20Bank%20Analytics.pbix)
![image](https://github.com/user-attachments/assets/785c86ce-5ff8-4112-bb06-7acaaa1eb8eb)

[PowerBI Credit-Debit Dashboard](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/PowerBI%20Debit%20Credit.pbix)
![image](https://github.com/user-attachments/assets/c209f7bf-79f1-4a67-aa43-52ca6751d87f)

## SQL Queries
[SQL Banking Analytics Queries](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Bank_Analytics.sql) | [Dataset1.sql](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Banking_Analytics.sql)  
[SQL Credit-Debit Queries](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Credit_Debit.sql) | [Dataset2.sql](https://github.com/Lomoanj/Banking-Data-Analysis/blob/Banking/Debit_Credit.sql)  

some interesting code worked with are
```sql
select distinct year(date_add(str_to_date(`disbursement date`,'%d-%m-%Y'),
interval `term (months)` month)) Maturity_year, count(`account id`) Accounts from datasql group by 1 order by 1;

select Quarter, Branch,concat(round(((total-previous)/previous)*100,4),' %') Percentage_Change from (
select quarter, branch, total, lag(total) over(order by quarter) previous  from(
select distinct quarter(`transaction date`) Quarter, branch,
sum(amount) over(partition by quarter(`transaction date`)) Total from credit where branch like 'North Branch')abc)abc;

select distinct `transaction date`, count(*) over(partition by `transaction date`) per_Day,
count(*) over(partition by week(`transaction date`)) per_Week,
count(*) over(partition by month(`transaction date`)) per_Month from credit order by 1;
```

## Results/Findings

- Home loans accounted for the highest total loan amount  
- Uttar Pradesh, Punjab, and Bihar were the top three states in loan disbursement  
- Majority of loan holders identified as Hindus  
- Delinquent accounts made up 10.84% of the total, while defaults were at 1.56%  
- Most loans matured in the year 2022  
- 65% of loans were marked as "Not Verified"  
- Individuals aged 26–45 held the highest share of total loan amounts  
- The year 2018 recorded the highest overall loan disbursement

## Recommendations

- Strengthen verification process to reduce unverified loans  
- Focus on credit risk assessment for age group 26–45  
- Monitor delinquent accounts closely and improve follow-up strategies  
- Promote financial literacy in high-default regions  
- Digitize documentation and approval workflow for efficiency  
- Target high-performing states for new financial products  

## Limitations

The analysis faced several limitations, including incomplete or outdated data and limited customer demographics, which restricted deeper behavioral insights. A significant portion of loans (65%) lacked verification, affecting the reliability of findings. Additionally, the impact of external economic factors was not considered, and regional data imbalance may have influenced the overall trends and conclusions.
 
