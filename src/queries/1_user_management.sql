.open fittrackpro.db
.mode column 

-- 1.1
SELECT member_id,
    first_name,
    last_name,
    email,
    join_date
FROM members;

-- 1.2
UPDATE members
SET phone_number = '07000 100005',
    email = 'emily.jones.updated@email.com'
WHERE member_id = 5;

-- 1.3
SELECT COUNT(*) AS total_members
FROM members;

-- 1.4
WITH registration_counts AS (
    SELECT member_id,
        COUNT(*) AS registration_count
    FROM class_attendance
    GROUP BY member_id
),
max_registration AS (
    SELECT MAX(registration_count) AS max_count
    FROM registration_counts
)
SELECT m.member_id,
    m.first_name,
    m.last_name,
    rc.registration_count
FROM members m
    LEFT JOIN registration_counts rc ON m.member_id = rc.member_id
WHERE rc.registration_count = (
        SELECT max_count
        FROM max_registration
    );

-- 1.5
WITH registration_counts AS (
    SELECT member_id,
        COUNT(*) AS registration_count
    FROM class_attendance
    GROUP BY member_id
),
min_registration AS (
    SELECT MIN(registration_count) AS min_count
    FROM registration_counts
)
SELECT m.member_id,
    m.first_name,
    m.last_name,
    rc.registration_count
FROM members m
    LEFT JOIN registration_counts rc ON m.member_id = rc.member_id
WHERE rc.registration_count = (
        SELECT min_count
        FROM min_registration
    );

-- 1.6
WITH registration_counts AS (
    SELECT member_id,
        COUNT(*) AS registration_count
    FROM class_attendance
    GROUP BY member_id
)
SELECT COUNT(DISTINCT member_id) AS unique_members
FROM registration_counts
WHERE registration_count >= 2;