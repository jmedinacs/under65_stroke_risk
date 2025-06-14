-- ==============================================
-- Agen Group Binning
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
LIMIT 10;