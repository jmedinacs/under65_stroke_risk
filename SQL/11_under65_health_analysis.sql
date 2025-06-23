-- ==============================================
-- Health Distribution Analysis (Univariate + Bivariate)
-- 1. hypertension (hypertension_status)
-- 2. heart_disease (heart_disease_status)
-- 3. avg_glucose_level (glucose_category)
-- 4. bmi (bmi_category)
-- 5. stroke (univariate only)
-- WARNING: Assumed under65_bin_continuous and under65_engineer_category_columns has been ran!
-- ==============================================

-- ==============================================
-- Hypertension Distribution
-- ==============================================
WITH total_data AS (
	SELECT COUNT(*) AS total_count FROM stroke_data_under65
),
total_strokes AS (
	SELECT COUNT(*) AS stroke_total FROM stroke_data_under65 WHERE stroke = 1
),
hypertension_status_stats AS (
	SELECT
		hypertension_status,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count
	FROM stroke_data_under65
	GROUP BY hypertension_status
)
SELECT
	hypertension_status,
	total_group_count AS "Count",
	ROUND(100.0 * total_group_count / td.total_count,2) AS "Population %",
	stroke_count AS "Stroke Count",
	ROUND(100.0 * stroke_count / total_group_count,2) AS "In Group Stroke %",
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "% of Stroke"
FROM hypertension_status_stats, total_strokes ts, total_data td;


-- ==============================================
-- Heart Disease Distribution
-- ==============================================
WITH total_data AS (
	SELECT COUNT(*) AS total_count FROM stroke_data_under65
),
total_strokes AS (
	SELECT COUNT(*) AS stroke_total FROM stroke_data_under65 WHERE stroke = 1
),
heart_disease_status_stats AS (
	SELECT
		heart_disease_status,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count
	FROM stroke_data_under65
	GROUP BY heart_disease_status
)
SELECT 
	heart_disease_status,
	total_group_count AS "Count",
	ROUND(100.0 * total_group_count / td.total_count,2) AS "Population %",
	ROUND(100.0 * stroke_count / total_group_count,2) AS "In Group Stroke %",
	stroke_count AS "Stroke Count",
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "% of Stroke"
FROM heart_disease_status_stats, total_data td, total_strokes ts;

-- ==============================================
-- Glucose Distribution
-- ==============================================
WITH total_data AS (
	SELECT COUNT(*) AS total_count FROM stroke_data_under65
),
total_strokes AS (
	SELECT COUNT(*) AS stroke_total FROM stroke_data_under65 WHERE stroke = 1
),
glucose_category_stats AS (
	SELECT
		glucose_category,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count
	FROM stroke_data_under65
	GROUP BY glucose_category
)
SELECT 
	glucose_category,
	total_group_count AS "Count",
	ROUND(100.0 * total_group_count / td.total_count,2) AS "Population %",
	ROUND(100.0 * stroke_count / total_group_count,2) AS "In Group Stroke %",
	stroke_count AS "Stroke Count",
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "% of Stroke"
FROM glucose_category_stats, total_data td, total_strokes ts
ORDER BY CASE glucose_category
	WHEN 'hypoglycemic (<70)' THEN 1
	WHEN 'normal (70-99)' THEN 2
	WHEN 'pre-diabetic (100-125)' THEN 3
	WHEN 'diabetic (126-199)' THEN 4
	WHEN 'high diabetes (200+)'THEN 5
END;

-- ==============================================
-- BMI Distribution
-- ==============================================
WITH total_data AS (
	SELECT COUNT(*) AS total_count FROM stroke_data_under65
),
total_strokes AS (
	SELECT COUNT(*) AS stroke_total FROM stroke_data_under65 WHERE stroke = 1
),
bmi_category_stats AS (
	SELECT
		bmi_category,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count
	FROM stroke_data_under65
	GROUP BY bmi_category
)
SELECT 
	bmi_category,
	total_group_count AS "Count",
	ROUND(100.0 * total_group_count / td.total_count,2) AS "Population %",
	ROUND(100.0 * stroke_count / total_group_count,2) AS "In Group Stroke %",
	stroke_count AS "Stroke Count",
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "% of Stroke"
FROM bmi_category_stats, total_data td, total_strokes ts
ORDER BY CASE bmi_category
	WHEN 'underweight' THEN 1
	WHEN 'normal weight' THEN 2
	WHEN 'overweight' THEN 3
	WHEN 'obesity class 1' THEN 4
	WHEN 'obesity class 2' THEN 5
	WHEN 'obesity class 3' THEN 6
END;

-- ==============================================
-- Stroke Distribution
-- ==============================================
SELECT 
	stroke_status AS "Stroke Status",
	COUNT(*) AS total_group_count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM stroke_data_under65),2) AS "% of Population"
FROM stroke_data_under65
GROUP BY stroke_status;