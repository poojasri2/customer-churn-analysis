SELECT customerID, tenure, MonthlyCharges, TotalCharges
FROM customers
WHERE TotalCharges IS NULL;


UPDATE customers
SET TotalCharges = 0
WHERE TotalCharges IS NULL;

SELECT COUNT(*) 
FROM customers
WHERE TotalCharges IS NULL;
