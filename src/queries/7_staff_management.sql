.open fittrackpro.db
.mode column

-- 7.1 
SELECT
    s.staff_id,
    s.first_name,
    s.last_name,
    s.position AS role
FROM staff AS s
;

-- 7.2 
SELECT s.staff_id AS trainer_id,
       CONCAT(s.first_name, ' ', s.last_name) AS full_name, 
       COUNT(*) AS session_count
FROM personal_training_sessions AS pts
JOIN staff AS s
  ON pts.staff_id = s.staff_id
WHERE date(pts.session_date) BETWEEN date('2025-01-20')
                               AND date('2025-01-20', '+30 days')
GROUP BY s.staff_id, s.first_name, s.last_name
HAVING COUNT(*) >= 1
ORDER BY s.staff_id;
