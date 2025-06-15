-- ==============================================
-- Age Group Binning
-- Based on CDC Categories 
-- ==============================================

-- Add age_group column
ALTER TABLE stroke_data_under65
ADD COLUMN age_group TEXT;

UPDATE stroke_data_under65
SET age_group = CASE
	WHEN age BETWEEN 0 AND 17 THEN 'children(0-17)'
	WHEN age BETWEEN 18 AND 24 THEN 'young adult(18-24)'
	WHEN age BETWEEN 25 AND 34 THEN 'adults(25-34)'
	WHEN age BETWEEN 35 AND 44 THEN 'midlife adults(34-44)'
	WHEN age BETWEEN 45 AND 54 THEN 'older adults(45-54)'
	WHEN age BETWEEN 55 AND 64 THEN 'pre-seniors (55-64)'
	ELSE 'unknown'
END;

-- Check the age_group column
SELECT * 
FROM stroke_data_under65
LIMIT 100;

-- ==============================================
-- Average gluscose Level Group Binning
-- Based on CDC Categories 
-- ==============================================

-- Create glucose_category column
ALTER TABLE stroke_data_under65
ADD COLUMN glucose_category TEXT;

UPDATE stroke_data_under65
SET glucose_category = CASE
	WHEN avg_glucose_level < 70 THEN 'hypoglycemic (<70)'
	WHEN avg_glucose_level >= 70 AND avg_glucose_level < 100 THEN 'normal (70-99)'
	WHEN avg_glucose_level >= 100 AND avg_glucose_level < 126 THEN 'pre-diabetic (100-125)'
	WHEN avg_glucose_level >= 126 AND avg_glucose_level < 200 THEN 'diabetic (126-199)'
	WHEN avg_glucose_level >= 200 THEN 'high diabetes (200+)'
	ELSE 'unknown'
END;

SELECT glucose_category
FROM stroke_data_under65
WHERE glucose_category = 'unknown'

-- ==============================================
-- BMI Group Binning
-- Based on CDC Categories 
-- ==============================================

-- Add bmi_category column
ALTER TABLE stroke_data_under65
ADD COLUMN bmi_category TEXT;

UPDATE stroke_data_under65
SET bmi_category = CASE
	WHEN bmi < 18.5 THEN 'underweight'
	WHEN bmi < 25 THEN 'normal weight'
	WHEN bmi < 30 THEN 'overweight'
	WHEN bmi < 35 THEN 'obesity class 1'
	WHEN bmi < 40 THEN 'obesity class 2'
	WHEN bmi >= 40 THEN 'obesity class 3'
	ELSE 'unknown'
END;

-- Check column for unkown
SELECT bmi_category FROM stroke_data_under65 WHERE bmi_category = 'unknown' LIMIT 10;