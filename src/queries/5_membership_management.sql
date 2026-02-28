.open fittrackpro.db
.mode column

-- 5.1 
SELECT 
    m.member_id,
    mem.first_name,
    mem.last_name,
    m.type,
    m.start_date AS join_date
FROM memberships AS m
JOIN members AS mem
  ON m.member_id = mem.member_id
WHERE m.status = 'Active'
;

-- 5.2 
SELECT
    m.type AS membership_type,
    AVG((julianday(a.check_out_time) - julianday(a.check_in_time)) * 24 * 60) 
        AS avg_visit_druration_minutes
FROM attendance AS a
JOIN memberships AS m
  ON a.member_id = m.member_id
GROUP BY m.type
;

-- 5.3 
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    m.email,
    mm.end_date
FROM members AS m
JOIN memberships AS mm
  ON m.member_id = mm.member_id
WHERE end_date like '2025-%'
;