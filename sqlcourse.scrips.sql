USE devcamp_project;

-- The average grade that is given by each professor --
SELECT p.professor_name as "PROFESSOR", ROUND(AVG(grade) ,0) AS "AVERAGE GRADE"
FROM grades g
JOIN professors p
ON g.professor_id = p.professor_id
GROUP BY p.professor_name;

-- The top grades for each student --
SELECT s.student_name AS "STUDENT", c.course_name AS "COURSE", MAX(grade) AS "HIGHEST GRADE"
FROM grades g
JOIN students s
ON g.student_id = s.student_id
JOIN courses c
ON g.course_id = c.course_id
GROUP BY s.student_name;

-- Group students by the courses they are enrolled in --
SELECT c.course_name AS "COURSE", s.student_name AS "STUDENT", g.grade AS "GRADES"
FROM grades g
JOIN students s
ON g.student_id = s.student_id
JOIN courses c
ON g.course_id = c.course_id
ORDER BY c.course_name, g.grade;

-- Summary report of courses and their average grades, sorted by the most challenging course --
SELECT c.course_name as "COURSE",  ROUND(AVG(grade) ,0) AS "AVERAGE GRADE"
FROM grades g
JOIN  courses c
ON g.course_id = c.course_id
GROUP BY c.course_name
ORDER BY ROUND(AVG(grade) ,0) ASC;

-- Finding which student and professor have the most courses in common --
SELECT p.professor_name AS "PROFESSOR", s.student_name AS "STUDENT", COUNT(*)
FROM grades g
JOIN students s
On g.student_id = s.student_id
JOIN professors p
ON p.professor_id = g.professor_id
GROUP BY professor_name, student_name
ORDER BY COUNT(*) DESC
LIMIT 1