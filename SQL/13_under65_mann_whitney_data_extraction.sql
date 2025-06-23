-- ========================================
-- Extract the data for the Mann-Whitney Test
-- ========================================
SELECT
	stroke_status,
	avg_glucose_level,
	bmi
FROM stroke_data_under65
WHERE avg_glucose_level IS NOT NULL AND bmi IS NOT NULL;