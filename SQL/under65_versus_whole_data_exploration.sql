-- ==============================
-- Investigate Stroke Percentage Overall vs Under 65 
-- ==============================
WITH base AS(
	SELECT 
		COUNT(*) AS total_rows,
		COUNT(*) FILTER (WHERE stroke = 1) AS number_of_stroke,
		COUNT(*) FILTER (WHERE stroke = 1 AND age >= 65) AS stroke_65_and_over,
		COUNT(*) FILTER (WHERE stroke = 1 AND age < 65) AS stroke_under_65
	FROM stroke_data
)
SELECT 
	total_rows,
	number_of_stroke,
	ROUND(number_of_stroke * 100.0 / total_rows, 2) AS percent_stroke_overall,
	stroke_65_and_over,
	ROUND(stroke_65_and_over * 100.0 / total_rows, 2) AS percent_stroke_over_64,
	stroke_under_65,
	ROUND(stroke_under_65 * 100.0 / total_rows,2) percent_stroke_under_65,
	ROUND(stroke_under_65 * 100.0 / (total_rows - stroke_65_and_over),2) AS stroke_percent_after_trim
FROM base;