.open fittrackpro.db
.mode column

-- 6.1 
INSERT INTO attendance (attendance_id, member_id, location_id, check_in_time)
VALUES (4,7,1,'2025-02-14 16:30:00')
;
-- 6.2 
SELECT date(check_in_time) as visit_date,
check_in_time,check_out_time
FROM attendance
WHERE member_id = 5
;
-- 6.3 
SELECT strftime('%u', check_in_time) AS day_of_week,
       COUNT(*) AS visit_count
FROM attendance
GROUP BY strftime('%u', check_in_time)
ORDER BY visit_count DESC
;

-- 6.4 
SELECT a.location_id, l.name AS location_name
, COUNT(*) AS visit_count
FROM attendance AS a
JOIN locations AS l
  ON a.location_id = l.location_id;

-- 6.5
-- average daily attendance per location including days with no visits
WITH date_range(d) AS (
    SELECT date(min(check_in_time))
    FROM attendance
    UNION ALL
    SELECT date(d, '+1 day')
    FROM date_range
    WHERE d < (SELECT date(max(check_in_time)) FROM attendance)
),
location_dates AS (
    SELECT l.location_id,
           l.name AS location_name,
           dr.d AS visit_date
    FROM locations AS l
    CROSS JOIN date_range AS dr
),
visits AS (
    SELECT location_id,
           date(check_in_time) AS visit_date,
           COUNT(*) AS visit_count
    FROM attendance
    GROUP BY location_id, date(check_in_time)
)
SELECT 
    ld.location_name,
    AVG(COALESCE(v.visit_count, 0)) AS avg_daily_attendance
FROM location_dates AS ld
LEFT JOIN visits AS v
    ON v.location_id = ld.location_id
   AND v.visit_date = ld.visit_date
GROUP BY ld.location_id, ld.location_name
ORDER BY ld.location_id;

