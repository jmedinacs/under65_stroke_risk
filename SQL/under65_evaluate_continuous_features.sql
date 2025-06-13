-- ==============================
-- Investigate Age Number Summary 
-- ==============================
SELECT 
	MIN(age) AS min_age,
	PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY age) AS q1_age,
	PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY age) AS median_age,
	PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY age) AS q3_age,
	MAX(age) AS max_age,
	ROUND(AVG(age),2) AS mean_age
FROM stroke_data_under65;

-- ==============================
-- Investigate avg_glucose_level Number Summary 
-- ==============================
SELECT 
	MIN(avg_glucose_level) AS min_glucose,
	PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY avg_glucose_level)  AS q1_glucose,
	PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY avg_glucose_level) AS median_glucose,
	PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY avg_glucose_level) AS q3_glucose,
	MAX(avg_glucose_level) AS max_glucose,
	ROUND(AVG(avg_glucose_level),2) AS mean_glucose
FROM stroke_data_under65;

-- ==============================
-- Investigate bmi Number Summary 
-- ==============================
SELECT 
	MIN(bmi) AS min_bmi,
	PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY bmi) AS q1_bmi,
	PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY bmi) AS median_bmi,
	PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY bmi) AS q3_bmi,
	MAX(bmi) AS max_bmi,
	ROUND(AVG(bmi),2) AS mean_bmi
FROM stroke_data_under65
WHERE bmi IS NOT NULL;