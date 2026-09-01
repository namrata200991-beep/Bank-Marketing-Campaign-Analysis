select * from bank_marketing;
SELECT COUNT(*)
FROM bank_marketing;

--calculating overall term-deposit conversion rate
SELECT
    subscribed,
    COUNT(*) AS customers
FROM bank_marketing
GROUP BY subscribed;

select ROUND(100.0*COUNT(*) FILTER (WHERE subscribed='yes')/count(*),2) as conversion_rate from bank_marketing;

--calculating occupations having the highest conversion rates

SELECT
    job,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed_customers,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes')
        / COUNT(*),
        2
    ) AS conversion_rate
FROM bank_marketing
GROUP BY job
ORDER BY conversion_rate DESC;

--exploring which age groups has most no of subscriptions

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed_customers,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY age_group
ORDER BY subscription_rate DESC;

--finding out whether ac balance affect subscription

SELECT
    CASE
        WHEN balance < 0 THEN 'Negative Balance'
        WHEN balance BETWEEN 0 AND 1000 THEN '0-1K'
        WHEN balance BETWEEN 1001 AND 5000 THEN '1K-5K'
        WHEN balance BETWEEN 5001 AND 10000 THEN '5K-10K'
        ELSE '10K+'
    END AS balance_group,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed_customers,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY balance_group
ORDER BY subscription_rate DESC;

--identifying the impact of housing loan customers on susbcriptions
SELECT
    housing,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY housing
ORDER BY subscription_rate DESC;

--identifying personal loan impact on subscriptions

SELECT
    loan,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY loan
ORDER BY subscription_rate DESC;

--impact of bank contact on subscriptions

SELECT
    contact,
    COUNT(*) AS customers_contacted,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY contact
ORDER BY subscription_rate DESC;

--impact of no of bank contacts on subscriptions

SELECT
    CASE
        WHEN campaign = 1 THEN '1 Contact'
        WHEN campaign = 2 THEN '2 Contacts'
        WHEN campaign = 3 THEN '3 Contacts'
        WHEN campaign BETWEEN 4 AND 5 THEN '4-5 Contacts'
        ELSE '6+ Contacts'
    END AS contact_frequency,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY contact_frequency
ORDER BY MIN(campaign);

--calculating result of previous marketing campaign on subscriptions
SELECT
    poutcome,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY poutcome
ORDER BY subscription_rate DESC;

--identifying months in which campaigns perform best

SELECT
    month,
    COUNT(*) AS customers_contacted,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY month
ORDER BY subscription_rate DESC;

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    housing,
    loan,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes') / COUNT(*),
        2
    ) AS subscription_rate
FROM bank_marketing
GROUP BY age_group, housing, loan
HAVING COUNT(*) >= 200
ORDER BY subscription_rate DESC;


SELECT
    CASE
        WHEN poutcome = 'success'
            THEN 'High Priority'

        WHEN (age >= 60 OR age < 30)
             AND housing = 'no'
             AND loan = 'no'
            THEN 'High Priority'

        WHEN housing = 'no'
             AND loan = 'no'
            THEN 'Medium Priority'

        ELSE 'Low Priority'
    END AS customer_priority,

    COUNT(*) AS customers,

    COUNT(*) FILTER (WHERE subscribed = 'yes') AS subscribed,

    ROUND(
        100.0 * COUNT(*) FILTER (WHERE subscribed = 'yes')
        / COUNT(*),
        2
    ) AS subscription_rate

FROM bank_marketing

GROUP BY customer_priority

ORDER BY subscription_rate DESC;
