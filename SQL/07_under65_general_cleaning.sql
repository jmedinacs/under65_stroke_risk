-- ==============================================
-- General Cleaning Steps:
-- 1. Standardize (lower + trim) TEXT fields.
-- 2. Category consistency (DISTINCT) check.
-- 3. Check for duplicates (exclude id)
-- ==============================================

-- Step 1: Standardize text fields
UPDATE stroke_data_under65
SET gender = LOWER(TRIM(gender));

UPDATE stroke_data_under65
SET ever_married = LOWER(TRIM(ever_married));

UPDATE stroke_data_under65
SET work_type = LOWER(TRIM(work_type));

UPDATE stroke_data_under65
SET residence_type = LOWER(TRIM(residence_type));

UPDATE stroke_data_under65
SET smoking_status = LOWER(TRIM(smoking_status));

-- Step 2: Category consistency check
SELECT *
FROM( 
	SELECT 'gender' AS column_name, gender AS value FROM stroke_data_under65
	UNION
	SELECT 'hypertension', CAST(hypertension AS TEXT) FROM stroke_data_under65
	UNION
	SELECT 'heart_disease', CAST(heart_disease AS TEXT) FROM stroke_data_under65
	UNION
	SELECT 'ever_married', ever_married FROM stroke_data_under65
	UNION
	SELECT 'work_type', work_type FROM stroke_data_under65
	UNION
	SELECT 'residence_type', residence_type FROM stroke_data_under65
	UNION
	SELECT 'smoking_status', smoking_status FROM stroke_data_under65
	UNION
	SELECT 'stroke', CAST(stroke AS TEXT) FROM stroke_data_under65
) AS cobined_column_cats
ORDER BY column_name, value;

-- Step 3: Duplicate rows check and removal
SELECT 
	gender, age, hypertension, heart_disease, ever_married, work_type,
	residence_type, avg_glucose_level, bmi, smoking_status, stroke,
	COUNT(*) AS duplicate_count
FROM stroke_data_under65
GROUP BY
	gender, age, hypertension, heart_disease, ever_married, work_type,
	residence_type, avg_glucose_level, bmi, smoking_status, stroke
HAVING COUNT(*) > 1;