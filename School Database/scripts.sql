--dim.students
INSERT INTO dim_students (name, last_name, dob, passport_id, phone_number, email, start_date, end_date)
SELECT TOP 100000 std_1.first_name,std_2.last_name,
DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '1993-01-01', '2003-01-01'), '1993-01-01'),
CONVERT(nvarchar(45), NEWID()),
CONVERT(varchar(15), FORMAT(CONVERT(BIGINT, 999999999999*RAND(CHECKSUM(NEWID()))), '000-00-000-0000')),
CONCAT(LEFT(std_1.first_name, 1), std_2.last_name, '@gmail.com'),
DATEADD(DAY,ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '2022-01-01', '2022-03-01'), '2022-01-01'),
DATEADD(DAY,ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '2022-03-31', '2022-05-31'), '2022-03-31')
FROM 
students AS std_1
CROSS JOIN
students AS std_2

--dim.teachers
INSERT INTO dim_teachers(name, last_name, major, dob)
SELECT TOP 100000 tch_1.first_name, tch_2.last_name, tch_3.major,
DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '1969-01-01', '1996-01-01'), '1969-01-01')
FROM 
teachers AS tch_1
CROSS JOIN
teachers AS tch_2
CROSS JOIN
teachers AS tch_3

--dim.lessons
INSERT INTO dim_lessons(name, description, course_name)
SELECT TOP 1000 name, description, course_name
FROM lessons

--fct_timetable
INSERT INTO fct_timetable (student_id, date_time, lesson_id, room, teacher_id)
SELECT TOP 1000000 std.id,
DATEADD(hh, FLOOR(RAND(CHECKSUM(NEWID())) * (19 - 9 + 1)) + 9, DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, CONVERT(DATETIME, std.start_date), CONVERT(DATETIME, std.end_date)), CONVERT(DATETIME, std.start_date))), 
FLOOR(RAND(CHECKSUM(NEWID()))*(1000)+1),
concat('Classroom ', FLOOR(RAND(CHECKSUM(NEWID())) * (20)) + 1), 
FLOOR(RAND(CHECKSUM(NEWID()))*(100000)+1)
FROM dim_students std
CROSS JOIN 
(SELECT TOP 100 *
FROM dim_students
ORDER BY NEWID()) std2

--fct_attendance_and_marks
INSERT INTO fct_attendance_and_marks (student_id, lesson_id, date, attendance, mark)
SELECT TOP 1000000 ttb.student_id, ttb.lesson_id, CONVERT(DATE, ttb.date_time), 
FLOOR(RAND(CHECKSUM(NEWID()))*2), 
FLOOR(RAND(CHECKSUM(NEWID())) * (10)) + 1
FROM fct_timetable ttb

UPDATE fct_attendance_and_marks
SET mark = NULL
WHERE attendance = 0
