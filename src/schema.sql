.open fittrackpro.db
.mode column

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS locations;

CREATE TABLE locations(
    location_id  int,
    name      text,
    address     text,
    phone_number  text,
    email      text,
    opening_hours  text
 )
;
DROP TABLE IF EXISTS members;

CREATE TABLE members(
    member_id  int,
    first_name  text,
    last_name  text,
    email      text,
    phone_number  text,
    date_of_birth  text,
    join_date  text,
    emergency_contact_name  text,
    emergency_contact_phone  text
 )
;

DROP TABLE IF EXISTS memberships;

CREATE TABLE memberships(
    membership_id  int,
    member_id  int,
    type      text,
    start_date  text,
    end_date  text,
    status    text
 )
;

DROP TABLE IF EXISTS staff;

CREATE TABLE staff(
    staff_id  int,
    first_name  text,
    last_name  text,
    email      text,
    phone_number  text,
    position  text,
    hire_date  text,
    location_id  int
 )
;

DROP TABLE IF EXISTS classes;

CREATE TABLE classes(
    class_id  int,
    name      text,
    description  text,
    capacity  int,
    duration  int,
    location_id  int
 )
;

DROP TABLE IF EXISTS equipment;

CREATE TABLE equipment(
    equipment_id  int,
    name      text,
    type      text,
    purchase_date  text,
    last_maintenance_date  text,
    next_maintenance_date  text,
    location_id  int
 )
;

DROP TABLE IF EXISTS attendance;

CREATE TABLE attendance(
    attendance_id  INT PRIMARY KEY,
    member_id  INT,
    location_id  INT,
    check_in_time  DATETIME NOT NULL,
    check_out_time  DATETIME
 )
;

DROP TABLE IF EXISTS payments;

CREATE TABLE payments(
    payment_id  int,
    member_id  int,
    amount    real,
    payment_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method  text,
    payment_type  text
 )
;

DROP TABLE IF EXISTS class_schedule;

CREATE TABLE class_schedule(
    schedule_id  int,
    class_id  int,
    staff_id  int,
    start_time  text,
    end_time  text
 )
;

DROP TABLE IF EXISTS class_attendance;

CREATE TABLE class_attendance(
    class_attendance_id  int,
    schedule_id  int,
    member_id  int,
    attendance_status  text
 )
;

DROP TABLE IF EXISTS equipment_maintenance_log;

CREATE TABLE equipment_maintenance_log(
    log_id    int,
    equipment_id  int,
    maintenance_date  text,
    description  text,
    staff_id  int
 )
;

DROP TABLE IF EXISTS member_health_metrics;

CREATE TABLE member_health_metrics(
    metric_id  int,
    member_id  int,
    measurement_date  text,
    weight    real,
    body_fat_percentage  real,
    muscle_mass  real,
    bmi       real
 )
;

DROP TABLE IF EXISTS personal_training_sessions;

CREATE TABLE personal_training_sessions(
    session_id  int,
    member_id  int,
    staff_id  int,
    session_date  DATE,
    start_time  TIME,
    end_time  TIME,
    notes    text
 )
;