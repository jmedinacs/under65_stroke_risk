-- ==============================
-- Create New Table for Patients Under 65 
-- ==============================

CREATE TABLE stroke_data_under65 AS 
SELECT * 
FROM stroke_data
WHERE age < 65;