--FOR RETRIVING ALL DATA
SELECT * FROM Bank_Loan_Data

-- QUERY FOR RETRIVING TOTAL APPLICATIONS
SELECT COUNT(id) AS TOTAL_APPLICATIONS FROM Bank_Loan_Data

-- QUERY FOR RETRIVING MONTHLY TOTAL APPLICATIONS
SELECT COUNT(id) AS MTD_TOTAL_APPLICATIONS FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 10 AND YEAR(issue_date) = 2021

-- QUERY FOR RETRIVING TOTAL LOAN AMOUNT
SELECT SUM(loan_amount) as fundeded_amount from Bank_Loan_Data

-- QUERY FOR RETRIVING MONTHLY LOAN AMOUNT
SELECT SUM(loan_amount) as MTD_fundeded_amount from Bank_Loan_Data
WHERE MONTH(issue_date) = 10 AND YEAR(issue_date) = 2021

-- QUERY FOR RETRIVING TOTAL MONTLY RECEIVED AMOUNT
SELECT SUM(total_payment) as MTD_RECEIVED_amount from Bank_Loan_Data
WHERE MONTH(total_payment) = 10 AND YEAR(issue_date) = 2021

-- QUERY FOR RETRIVING AVG INTEREST RATE
SELECT ROUND(AVG(int_rate),4)*100 as INTEREST_amount from Bank_Loan_Data

-- QUERY FOR RETRIVING AVG  MONTLY INTEREST RATE
SELECT ROUND(AVG(int_rate),4)*100 as INTEREST_amount from Bank_Loan_Data
WHERE MONTH(total_payment) = 10 AND YEAR(issue_date) = 2021

-- QUERY FOR RETRIVING AVG DTI
SELECT ROUND(AVG(dti),4)*100 as AVG_DTI from Bank_Loan_Data

-- QUERY FOR RETRIVING AVG MTD DTI
SELECT ROUND(AVG(dti),4)*100 as MTD_AVG_DTI from Bank_Loan_Data
WHERE MONTH(total_payment) = 10 AND YEAR(issue_date) = 2021

-- QUERY FOR RETRIVING LOAN_STATUS
SELECT LOAN_STATUS FROM Bank_Loan_Data

-- QUERY FOR RETRIVING GOOD LOAN APPLICATION %
SELECT 
(COUNT (CASE WHEN LOAN_STATUS = 'FULLY PAID' OR LOAN_STATUS = 'CHARGED' THEN ID END)*100)
/
COUNT (ID) AS GOOD_LOAN_APPLICATION
FROM Bank_Loan_Data

-- QUERY FOR RETRIVING GOOD LOAN APPLICATION
SELECT COUNT(ID)  AS GOOD_LOAN_APPLICATION FROM Bank_Loan_Data
WHERE loan_status  = 'FULLY PAID' OR LOAN_STATUS = 'CHARGED'

-- QUERY FOR RETRIVING FUNDED_AMOUN
SELECT SUM(loan_amount)  AS FUNDED_AMOUNT FROM Bank_Loan_Data
WHERE loan_status  = 'FULLY PAID' OR LOAN_STATUS = 'CHARGED'

-- QUERY FOR RETRIVING RECEIVED LOAN PAYMENT
SELECT SUM(total_payment)  AS RECEIVED_LOAN_PAYMENT FROM Bank_Loan_Data
WHERE loan_status  = 'FULLY PAID' OR LOAN_STATUS = 'CHARGED'

-- QUERY FOR RETRIVING BAD LOAN APPLICATION %
SELECT 
(COUNT (CASE WHEN LOAN_STATUS = 'CHARGED OFF' THEN ID END)*100)
/
COUNT (ID) AS BAD_LOAN_APPLICATION
FROM Bank_Loan_Data

-- QUERY FOR RETRIVING BAD LOAN APPLICATION 
SELECT COUNT (ID) AS BAD_LOAN_APPLICATION FROM Bank_Loan_Data
WHERE loan_status= 'CHARGED OFF' 

-- QUERY FOR RETRIVING  BAD LOAN FUNDED_AMOUNT
SELECT SUM(loan_amount)  AS BAD_LOAN_FUNDED_AMOUNT FROM Bank_Loan_Data
WHERE  LOAN_STATUS = 'CHARGED OFF'

-- QUERY FOR RETRIVING RECEIVED  BAD LOAN PAYMENT
SELECT SUM(total_payment)  AS BAD_LOAN_RECEIVED_LOAN_PAYMENT FROM Bank_Loan_Data
WHERE loan_status  = 'CHARGED OFF'

-- QUERY FOR RETRIVING LOAN STATUS
SELECT
LOAN_STATUS,
COUNT(ID) AS LOAN_COUNT,
SUM(TOTAL_PAYMENT) AS TOTAL_PAYMENT_RECEIVED,
SUM(LOAN_AMOUNT) AS TOTAL_FUNDED_AMOUNT,
AVG(INT_RATE *100) AS INTEREST_RATE,
AVG(dti*100) as DTI
FROM
Bank_Loan_Data
GROUP BY
loan_status
 
 -- QUERY FOR RETRIVING LOAN STATUS BY MONTH
SELECT
loan_status,
SUM(TOTAL_PAYMENT) AS MTD_TOTAL_PAYMENT_RECEIVED,
SUM(LOAN_AMOUNT) AS MTD_TOTAL_FUNDED_AMOUNT
FROM
Bank_Loan_Data
WHERE MONTH(issue_date) = 11
GROUP BY
loan_status

 -- QUERY FOR RETRIVING LOAN  REPORT STATUS BY MONTH
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

 -- QUERY FOR RETRIVING LOAN REPORT STATUS BY STATES
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state


 -- QUERY FOR RETRIVING LOAN TERMS
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

 -- QUERY FOR RETRIVING EMPLOYEMENT LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

 -- QUERY FOR RETRIVING LOAN PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

 -- QUERY FOR RETRIVING Home_OwnershiP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership

 -- QUERY FOR RETRIVING GRADE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose












