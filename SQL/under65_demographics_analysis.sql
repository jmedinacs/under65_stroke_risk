-- ==============================================
-- Demographics Distribution Analysis (Univariate + Bivariate)
-- 1. Gender
-- 2. Age
-- 3. Ever Married
-- 4. Work Type
-- 5. Residence Type
-- 6. Smoking Status

-- ==============================================
-- Gender Distribution
-- ==============================================
WITH total_data AS( 
	SELECt COUNT(*) AS total_count FROM stroke_data_under65
),
total_strokes AS (
	SELECT COUNT(*) AS stroke_total FROM stroke_data_under65 WHERE stroke = 1
),
gender_stats AS (
	SELECT
		gender,
		COUNT(*) AS total_group_count, -- Count of how many members in category
		SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count -- count stroke for each category
	FROM stroke_data_under65
	GROUP BY gender
)
SELECT 
	gender,
	total_group_count AS "Count",
	ROUND(100.0 * total_group_count / td.total_count,2) AS "Population %", -- How much of population represented
	stroke_count AS "Stroke Count", -- Number of stroke per gender
	ROUND(100.0 * stroke_count / total_group_count,2) AS "In Group Stroke %",
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "% of Stroke Cases"
FROM gender_stats, total_data td, total_strokes ts
ORDER BY gender;

-- ==============================================
-- Age Distribution 
-- WARNING: Run under65_bin_continuous script first if running for the first time
-- ==============================================
WITH total_data AS(
	SELECT COUNT(*) AS total_count FROM stroke_data_under65
),
total_strokes AS(
	SELECT COUNT(*) AS stroke_total FROM stroke_data_under65 WHERE stroke = 1
),
age_group_stats AS(
	SELECT 
		age_group,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count
		FROM stroke_data_under65
		GROUP BY age_group
)
SELECT
	age_group,
	total_group_count AS "Count",
	ROUND(100.0 * total_group_count / td.total_count,2) AS "Population %",
	stroke_count AS "Stroke Count",
	ROUND(100.0 * stroke_count / total_group_count,2) AS "In Group Stroke %",
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "% of Stroke Cases"
FROM age_group_stats, total_data td, total_strokes ts
ORDER BY CASE age_group
	WHEN 'children(0-17)' THEN 1
	WHEN 'young adult(18-24)' THEN 2
	WHEN 'adults(25-34)' THEN 3
	WHEN 'midlife adults(34-44)' THEN 4
	WHEN 'older adults(45-54)' THEN 5
	WHEN 'pre-seniors(55-64)' THEN 6
END;

-- ==============================================
-- Marriage History
-- WARNING: Run under65_engineer_categorical_columns script first
-- ==============================================
WITH total_data AS(
	SELECT COUNT(*) AS total_count FROM stroke_data_under65
),
total_strokes AS(
	SELECT COUNT(*) AS stroke_total FROM stroke_data_under65 WHERE stroke = 1
),
ever_married_stats AS(
	SELECT
		ever_married_status,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) AS stroke_count
		FROM stroke_data_under65
		GROUP BY ever_married_status
)
SELECT
	ever_married_status,
	total_group_count AS "Count",
	ROUND(100.0 * total_group_count / td.total_count,2) AS "Population %",
	stroke_count AS "Stroke Count",
	ROUND(100.0 * stroke_count / total_group_count,2) AS "In Group Stroke %",
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "% of Stroke Cases"
FROM ever_married_stats, total_data td, total_strokes ts
ORDER BY ever_married_status;
