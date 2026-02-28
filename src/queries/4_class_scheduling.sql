.open fittrackpro.db
.mode column

-- 4.1 
SELECT
    s.schedule_id as class_id,
    c.name,
    i.first_name || ' ' || i.last_name AS instructor_name
FROM
    class_schedule s 
    JOIN classes c 
        ON s.class_id = c.class_id
    JOIN staff i 
        ON s.staff_id = i.staff_id
;

-- 4.2 
SELECT 
    s.schedule_id AS class_id,
    c.name,
    s.start_time,
    s.end_time,
    c.capacity AS available_spots
FROM
    class_schedule s 
    JOIN classes c 
        ON s.class_id = c.class_id
WHERE
    s.start_time like '2025-02-01%'
;

-- 4.3 
INSERT INTO class_attendance (class_attendance_id, schedule_id
    , member_id, attendance_status)
VALUES (16, 1, 11, 'Registered');

-- 4.4 
DELETE FROM class_attendance
WHERE class_attendance_id = 3;

-- 4.5 
SELECT 
    s.schedule_id AS class_id,
    c.name,
    COUNT(a.attendance_status) AS registration_count
FROM class_attendance a
    JOIN class_schedule s
        ON a.schedule_id = s.schedule_id 
    JOIN classes c 
        ON s.class_id = c.class_id
GROUP BY s.schedule_id, c.name
ORDER BY registration_count DESC
;

-- 4.6
WITH MemberAttendance AS (
    SELECT
        member_id,
        COUNT(attendance_status) AS total_classes_attended
    FROM class_attendance
    GROUP BY member_id
)    
SELECT
    AVG(total_classes_attended) AS average_classes_per_member
FROM MemberAttendance
;
