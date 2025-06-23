-- ==============================
-- Impute null bmi values with median value of 27.7
-- bmi column contains large outlier values making mean imputation less favorable
-- ==============================

UPDATE stroke_data_under65
SET bmi = 27.7
WHERE bmi IS NULL;