-- ============================
-- Investigate missing values
-- ============================

SELECT	
	COUNT(*) AS total_rows,

	-- Key columns
	SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS null_id,
	SUM(CASE WHEN stroke IS NULL THEN 1 ELSE 0 END) AS null_stroke,

	-- Demographics
	SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
	SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
	SUM(CASE WHEN work_type IS NULL THEN 1 ELSE 0 END) AS null_work_type,
	SUM(CASE WHEN residence_type IS NULL THEN 1 ELSE 0 END) AS null_residence_type,
	SUM(CASE WHEN ever_married IS NULL THEN 1 ELSE 0 END) AS null_ever_married,
	SUM(CASE WHEN smoking_status IS NULL THEN 1 ELSE 0 END) AS null_smoking_status,

	-- Health
	SUM(CASE WHEN hypertension IS NULL THEN 1 ELSE 0 END) AS null_hypertension,
	SUM(CASE WHEN heart_disease IS NULL THEN 1 ELSE 0 END) AS null_heart_disease,
	SUM(CASE WHEN avg_glucose_level IS NULL THEN 1 ELSE 0 END) AS null_avg_glucose_level,
	SUM(CASE WHEN bmi IS NULL THEN 1 ELSE 0 END) AS null_bmi	

FROM stroke_data;
	
