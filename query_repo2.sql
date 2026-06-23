WITH churn_1 AS (
    SELECT
        "Senior Citizen",
        "Partner",
        "Dependents",
        "Phone Service",
        "Multiple Lines",
        "Internet Service",
        "Online Security",
        "Tech Support",
        "Streaming TV",
        "Streaming Movies",
        "Churn Value"
    FROM telco_customer_churn
    WHERE "Churn Value" = 1
    ORDER BY RANDOM()
    LIMIT 1850
),

churn_0 AS (
    SELECT
        "Senior Citizen",
        "Partner",
        "Dependents",
        "Phone Service",
        "Multiple Lines",
        "Internet Service",
        "Online Security",
        "Tech Support",
        "Streaming TV",
        "Streaming Movies",
        "Churn Value"
    FROM telco_customer_churn
    WHERE "Churn Value" = 0
    ORDER BY RANDOM()
    LIMIT 1850
),

balanced_data AS (
    SELECT * FROM churn_1
    UNION ALL
    SELECT * FROM churn_0
)

SELECT
    CASE
        WHEN "Senior Citizen" = 'Yes' THEN 1
        WHEN "Senior Citizen" = 'No' THEN 0
        ELSE NULL
    END AS senior_citizen,

    CASE
        WHEN "Partner" = 'Yes' THEN 1
        WHEN "Partner" = 'No' THEN 0
        ELSE NULL
    END AS partner,

    CASE
        WHEN "Dependents" = 'Yes' THEN 1
        WHEN "Dependents" = 'No' THEN 0
        ELSE NULL
    END AS dependents,

    CASE
        WHEN "Phone Service" = 'Yes' THEN 1
        WHEN "Phone Service" = 'No' THEN 0
        ELSE NULL
    END AS phone_service,

    CASE
        WHEN "Multiple Lines" ILIKE '%No%' THEN 0
        WHEN "Multiple Lines" IS NULL THEN NULL
        ELSE 1
    END AS multiple_lines,

    CASE
        WHEN "Internet Service" ILIKE '%No%' THEN 0
        WHEN "Internet Service" IS NULL THEN NULL
        ELSE 1
    END AS internet_service,

    CASE
        WHEN "Online Security" ILIKE '%No%' THEN 0
        WHEN "Online Security" IS NULL THEN NULL
        ELSE 1
    END AS online_security,

    CASE
        WHEN "Tech Support" ILIKE '%No%' THEN 0
        WHEN "Tech Support" IS NULL THEN NULL
        ELSE 1
    END AS tech_support,

    CASE
        WHEN "Streaming TV" ILIKE '%No%' THEN 0
        WHEN "Streaming TV" IS NULL THEN NULL
        ELSE 1
    END AS streaming_tv,

    CASE
        WHEN "Streaming Movies" ILIKE '%No%' THEN 0
        WHEN "Streaming Movies" IS NULL THEN NULL
        ELSE 1
    END AS streaming_movies,

    "Churn Value" AS churn_value

FROM balanced_data
ORDER BY RANDOM();