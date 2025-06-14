-- ==============================================
-- Convert Categorical Column Values:
-- 1. hypertension from 0 / 1 to no hypertension / hypertension
-- 2. heart_disease from 0 / 1 to no heart disease / heart disease
-- 3. ever_married from no / yes to never married / married
-- 4. stroke from 0 / 1 to no stroke / had stroke
-- ==============================================

-- Add columns for categorical status
ALTER TABLE stroke_data_under65
ADD COLUMN hypertension_status TEXT,
ADD COLUMN heart_disease_status TEXT,
ADD COLUMN ever_married_status TEXT,
ADD COLUMN stroke_status TEXT;

-- Update hypertension_status
UPDATE stroke_data_under65
SET hypertension_status = CASE
	WHEN hypertension = 0 THEN 'no hypertension'
	ELSE 'hypertension'
END;

-- Update heart_disease
UPDATE stroke_data_under65
SET heart_disease_status = CASE
	WHEN heart_disease = 0 THEN 'no heart disease'
	ELSE 'heart disease'
END;

-- Update ever_married
UPDATE stroke_data_under65
SET ever_married_status = CASE
	WHEN ever_married = 'no' THEN 'never married'
	ELSE 'married'
END;

-- Update stroke
UPDATE stroke_data_under65
SET stroke_status = CASE
	WHEN stroke = 0 THEN 'no stroke'
	ELSE 'had stroke'
END;
