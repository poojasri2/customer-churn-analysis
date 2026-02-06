SELECT 
    COUNT(*) AS total_customers,
    SUM(CAST(Churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(Churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customers;


SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers'
  AND COLUMN_NAME = 'Churn';


  SELECT
    CASE
        WHEN tenure < 12 THEN '0–12 months'
        WHEN tenure < 24 THEN '12–24 months'
        WHEN tenure < 48 THEN '24–48 months'
        ELSE '48+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CAST(Churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(Churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customers
GROUP BY
    CASE
        WHEN tenure < 12 THEN '0–12 months'
        WHEN tenure < 24 THEN '12–24 months'
        WHEN tenure < 48 THEN '24–48 months'
        ELSE '48+ months'
    END
ORDER BY churn_rate_percent DESC;

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CAST(Churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(Churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customers
GROUP BY Contract
ORDER BY churn_rate_percent DESC;


SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CAST(Churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(Churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;

SELECT
    customerID,
    tenure,
    Contract,
    PaymentMethod,
    MonthlyCharges
FROM customers
WHERE
    tenure < 12
    AND Contract = 'Month-to-month'
    AND PaymentMethod = 'Electronic check'
    AND Churn = 0;


