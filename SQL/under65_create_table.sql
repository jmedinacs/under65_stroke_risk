DROP TABLE IF EXISTS stroke_data;
CREATE TABLE stroke_data (
    id INTEGER PRIMARY KEY,
    gender TEXT,
    age NUMERIC,
    hypertension INTEGER,
    heart_disease INTEGER,
    ever_married TEXT,
    work_type TEXT,
    Residence_type TEXT,
    avg_glucose_level NUMERIC,
    bmi NUMERIC,
    smoking_status TEXT,
    stroke INTEGER
);
