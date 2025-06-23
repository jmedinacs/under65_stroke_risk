-- ========================================
-- Chi-Square Prep: Contingency Tables
-- ========================================

-- hypertension vs stroke
WITH cte_hypertension AS(
	SELECT
		'hypertension' AS feature,
		hypertension_status AS category,
		stroke_status,
		COUNT(*) AS count
	FROM stroke_data_under65
	GROUP BY hypertension_status, stroke_status		
),
-- Heart Disease vs Stroke
cte_heart_disease AS (
	SELECT
		'heart_disease' AS feature,
		heart_disease_status AS category,
		stroke_status,
		COUNT(*) AS count
	FROM stroke_data_under65
	GROUP BY heart_disease_status, stroke_status
),
-- gender vs stroke
cte_gender AS (
	SELECT
		'gender' AS feature,
		gender AS category,
		stroke_status,
		COUNT(*) AS count
	FROM stroke_data_under65
	GROUP BY gender, stroke_status	
),
-- ever_married vs stroke
cte_ever_married AS(
	SELECT
		'ever_married' AS feature,
		ever_married_status AS category,
		stroke_status,
		COUNT(*) AS count
	FROM stroke_data_under65
	GROUP BY ever_married_status, stroke_status
),
-- work_type vs stroke
cte_work_type AS(
	SELECT
		'work_type' AS feature,
		work_type AS category,
		stroke_status,
		COUNT(*) AS count
	FROM stroke_data_under65
	GROUP BY work_type, stroke_status
),
-- residence_type vs stroke
cte_residence_type AS(
	SELECT
		'residence_type' AS feature,
		residence_type AS category,
		stroke_status,
		COUNT(*) AS count
	FROM stroke_data_under65
	GROUP BY residence_type, stroke_status
),
-- smoking_status vs stroke
cte_smoking_status AS(
	SELECT
		'smoking_status' AS feature,
		smoking_status AS category,
		stroke_status,
		COUNT(*) AS count
	FROM stroke_data_under65
	GROUP BY smoking_status, stroke_status
)
SELECT * FROM cte_hypertension
UNION ALL
SELECT * FROM cte_heart_disease
UNION ALL
SELECT * FROM cte_gender
UNION ALL
SELECT * FROM cte_ever_married
UNION ALL
SELECT * FROM cte_work_type
UNION ALL
SELECT * FROM cte_residence_type
UNION ALL
SELECT * FROM cte_smoking_status
ORDER BY feature, category, stroke_status;
	