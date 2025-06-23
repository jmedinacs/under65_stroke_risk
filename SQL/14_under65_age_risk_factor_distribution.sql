-- ==============================================
-- Age - Top Risk Factors Distribution
--
-- Analyze how top risk factor occurs over age 
-- progression
-- ==============================================


-- ==============================================
-- Age - Hypertension Distribution
-- ==============================================
WITH age_Hypertension_count AS (
	SELECT
		age_group,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN hypertension = 1 THEN 1 ELSE 0 END) AS hypertension_count
	FROM stroke_data_under65
	GROUP BY age_group
)
SELECT
	age_group AS "Category",
	total_group_count AS "Group Count",
	ROUND(100.0 * hypertension_count / total_group_count,2) AS "Hypertension %"
FROM age_hypertension_count
ORDER BY CASE age_group
	WHEN 'children(0-17)' THEN 1
	WHEN 'young adult(18-24)' THEN 2
	WHEN 'adults(25-34)' THEN 3
	WHEN 'midlife adults(34-44)' THEN 4
	WHEN 'older adults(45-54)' THEN 5
	WHEN 'pre-seniors(55-64)' THEN 6
END;

-- ==============================================
-- Age - Heart Disease Distribution
-- ==============================================
WITH age_heart_disease_count AS (
	SELECT
		age_group,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN heart_disease= 1 THEN 1 ELSE 0 END) AS heart_disease_count
	FROM stroke_data_under65
	GROUP BY age_group
)
SELECT
	age_group AS "Category",
	total_group_count AS "Group Count",
	ROUND(100.0 * heart_disease_count / total_group_count,2) AS " Heart Disease %"
FROM age_heart_disease_count
ORDER BY CASE age_group
	WHEN 'children(0-17)' THEN 1
	WHEN 'young adult(18-24)' THEN 2
	WHEN 'adults(25-34)' THEN 3
	WHEN 'midlife adults(34-44)' THEN 4
	WHEN 'older adults(45-54)' THEN 5
	WHEN 'pre-seniors(55-64)' THEN 6
END;


-- ==============================================
-- Age - Glucose Distribution 
-- ==============================================
WITH age_glucose_count AS (
	SELECT
		age_group,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN glucose_category IN('diabetic (126-199)', 'high diabetes (200+)') THEN 1 ELSE 0 END) AS diabetes_count,
		SUM(CASE WHEN glucose_category IN('hypoglycemic (<70)', 'normal (70-99)', 'pre-diabetic (100-125)') THEN 1 ELSE 0 END) AS no_diabetes_count
	FROM stroke_data_under65
	GROUP BY age_group
)
SELECT 
	age_group AS "Age Category",
	total_group_count AS "Group Count",
	ROUND(100.0 * diabetes_count / total_group_count,2) AS "Diabetes %",
	ROUND(100.0 * no_diabetes_count / total_group_count,2) AS "No Diabetes %"
FROM age_glucose_count
ORDER BY CASE age_group
	WHEN 'children(0-17)' THEN 1
	WHEN 'young adult(18-24)' THEN 2
	WHEN 'adults(25-34)' THEN 3
	WHEN 'midlife adults(34-44)' THEN 4
	WHEN 'older adults(45-54)' THEN 5
	WHEN 'pre-seniors(55-64)' THEN 6
END;

-- ==============================================
-- Age - Smoking Status Distribution
-- ==============================================
WITH age_smoking_count AS (
	SELECT
		age_group,
		COUNT(*) AS total_group_count,
		SUM(CASE WHEN smoking_status = 'smokes' THEN 1 ELSE 0 END) AS smokes_count,
		SUM(CASE WHEN smoking_status = 'formerly smoked' THEN 1 ELSE 0 END) AS formerly_smokes_count,
		SUM(CASE WHEN smoking_status = 'never smoked' THEN 1 ELSE 0 END) AS never_smoked_count,
		SUM(CASE WHEN smoking_status = 'unknown' THEN 1 ELSE 0 END) AS unknown_count,
		SUM(CASE WHEN smoking_status = 'smokes' OR smoking_status = 'formerly smoked' THEN 1 ELSE 0 END) AS history_of_smoking_count
	FROM stroke_data_under65
	GROUP BY age_group
)
SELECT 
	age_group AS "Age Category",
	total_group_count AS "Group Count",
	ROUND(100.0 * smokes_count / total_group_count,2) AS "Smokes %",
	ROUND(100.0 * formerly_smokes_count / total_group_count,2) AS "Formerly Smoked %",
	ROUND(100.0 * never_smoked_count / total_group_count,2) AS "Never Smoked %",
	ROUND(100.0 * unknown_count / total_group_count,2) AS "Unknown %",
	ROUND(100.0 * history_of_smoking_count / total_group_count,2) AS "History of Smoking %"
FROM age_smoking_count
ORDER BY CASE age_group
	WHEN 'children(0-17)' THEN 1
	WHEN 'young adult(18-24)' THEN 2
	WHEN 'adults(25-34)' THEN 3
	WHEN 'midlife adults(34-44)' THEN 4
	WHEN 'older adults(45-54)' THEN 5
	WHEN 'pre-seniors(55-64)' THEN 6
END;

