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
	ROUND(100.0 * stroke_count / ts.stroke_total,2) AS "Overall Population Stroke %"
FROM gender_stats, total_data td, total_strokes ts
ORDER BY gender;

-- ==============================================
-- Age Distribution 
-- WARNING: Run under65_bin_age_group script first
-- ==============================================