/* =========================================================
   PROJECT NAME : Future IT Courses & Skills Analysis
   LEVEL        : Fresher / Entry-Level SQL Project
   DATABASE     : Microsoft SQL Server
   ========================================================= */


-- =========================================================
-- DATABASE OPERATIONS
-- =========================================================

-- View all existing databases in SQL Server
SELECT name FROM sys.databases;

-- Create a new database for this SQL project
CREATE DATABASE COPL_SQL_DB;

-- Switch context to the newly created database
USE COPL_SQL_DB;


-- =========================================================
-- TABLE 1: Future_Courses
-- Purpose:
-- Stores future IT courses along with cost, demand,
-- job safety, AI relevance, and fresher suitability
-- =========================================================

CREATE TABLE Future_Courses
(
   course_id INT IDENTITY(1,1) PRIMARY KEY,   -- Unique identifier for each course
   course_name VARCHAR(50) NOT NULL,          -- Name of the course
   domain VARCHAR(30) NOT NULL                -- Technology domain
       CHECK(domain IN('AI','Data','Cloud','Cybersecurity','Software','Networking','DevOps')),
   future_rank INT CHECK(future_rank >= 1),   -- Rank based on future demand
   cost_INR INT CHECK(cost_INR > 0),           -- Course cost in INR
   duration_months INT CHECK(duration_months BETWEEN 1 AND 36), -- Duration in months
   level VARCHAR(20) CHECK (level IN ('Beginner','Intermediate','Advanced')), -- Difficulty level
   job_safety_pct INT                         -- Job safety percentage in AI era
       CHECK(job_safety_pct BETWEEN 0 AND 100),
   ai_level VARCHAR(20)                       -- AI relevance level
       CHECK (ai_level IN ('Low','Medium','High','Very High')),
   demand_level VARCHAR(20)                   -- Market demand level
       CHECK (demand_level IN ('Low','Medium','High')),
   for_freshers VARCHAR(3)                    -- Whether suitable for freshers
       CHECK (for_freshers IN ('Yes','No')),
   created_on DATETIME DEFAULT GETDATE()      -- Record creation timestamp
);


-- View structure and constraints of Future_Courses table
EXEC sp_help Future_Courses;


-- =========================================================
-- INSERT DATA INTO Future_Courses
-- =========================================================

-- Insert future-oriented IT course data
INSERT INTO Future_Courses
(course_name, domain, future_rank, cost_INR, duration_months, level,
 job_safety_pct, ai_level, demand_level, for_freshers)
VALUES

-- ================= DATA DOMAIN =================
('Data Analyst', 'Data', 2, 45000, 6, 'Beginner', 85, 'High', 'High', 'Yes'),
('Business Intelligence Analyst', 'Data', 4, 50000, 6, 'Beginner', 80, 'Medium', 'High', 'Yes'),
('Data Scientist', 'Data', 1, 90000, 12, 'Advanced', 90, 'Very High', 'High', 'No'),
('Data Engineer', 'Data', 3, 85000, 10, 'Intermediate', 88, 'High', 'High', 'No'),
('Analytics Engineer', 'Data', 5, 60000, 6, 'Intermediate', 82, 'High', 'Medium', 'Yes'),

-- ================= AI DOMAIN =================
('AI Engineer', 'AI', 1, 120000, 12, 'Advanced', 95, 'Very High', 'High', 'No'),
('Machine Learning Engineer', 'AI', 2, 110000, 12, 'Advanced', 93, 'Very High', 'High', 'No'),
('Prompt Engineer', 'AI', 3, 50000, 4, 'Beginner', 85, 'Very High', 'High', 'Yes'),
('NLP Engineer', 'AI', 4, 100000, 10, 'Advanced', 90, 'Very High', 'Medium', 'No'),
('Computer Vision Engineer', 'AI', 5, 105000, 10, 'Advanced', 88, 'Very High', 'Medium', 'No'),

-- ================= CLOUD DOMAIN =================
('Cloud Engineer', 'Cloud', 2, 70000, 6, 'Intermediate', 88, 'High', 'High', 'Yes'),
('AWS Solutions Architect', 'Cloud', 1, 90000, 8, 'Advanced', 92, 'High', 'High', 'No'),
('Azure Cloud Engineer', 'Cloud', 3, 65000, 6, 'Intermediate', 85, 'High', 'High', 'Yes'),
('Cloud Support Associate', 'Cloud', 4, 40000, 4, 'Beginner', 80, 'Medium', 'Medium', 'Yes'),

-- ================= CYBERSECURITY DOMAIN =================
('Cybersecurity Analyst', 'Cybersecurity', 1, 80000, 6, 'Intermediate', 92, 'High', 'High', 'Yes'),
('SOC Analyst', 'Cybersecurity', 2, 60000, 5, 'Beginner', 88, 'Medium', 'High', 'Yes'),
('Ethical Hacker', 'Cybersecurity', 3, 75000, 6, 'Intermediate', 90, 'Medium', 'High', 'No'),
('Security Engineer', 'Cybersecurity', 4, 95000, 10, 'Advanced', 93, 'High', 'Medium', 'No'),

-- ================= SOFTWARE DOMAIN =================
('Full Stack Developer', 'Software', 2, 70000, 8, 'Intermediate', 85, 'High', 'High', 'Yes'),
('Backend Developer', 'Software', 3, 65000, 6, 'Intermediate', 82, 'Medium', 'High', 'Yes'),
('Frontend Developer', 'Software', 4, 50000, 5, 'Beginner', 75, 'Medium', 'Medium', 'Yes'),
('Software Tester', 'Software', 5, 40000, 4, 'Beginner', 70, 'Low', 'Medium', 'Yes'),

-- ================= DEVOPS DOMAIN =================
('DevOps Engineer', 'DevOps', 1, 90000, 8, 'Advanced', 92, 'High', 'High', 'No'),
('Site Reliability Engineer', 'DevOps', 2, 100000, 10, 'Advanced', 94, 'High', 'High', 'No'),
('CI/CD Engineer', 'DevOps', 3, 65000, 6, 'Intermediate', 88, 'Medium', 'High', 'Yes'),
('Cloud DevOps Engineer', 'DevOps', 4, 80000, 8, 'Intermediate', 90, 'High', 'High', 'Yes'),

-- ================= NETWORKING DOMAIN =================
('Network Engineer', 'Networking', 2, 50000, 6, 'Beginner', 78, 'Low', 'Medium', 'Yes'),
('Network Security Engineer', 'Networking', 1, 75000, 8, 'Intermediate', 85, 'Medium', 'High', 'No'),
('Cloud Network Engineer', 'Networking', 3, 65000, 6, 'Intermediate', 82, 'Medium', 'High', 'Yes'),
('NOC Engineer', 'Networking', 4, 40000, 4, 'Beginner', 70, 'Low', 'Medium', 'Yes');


-- =========================================================
-- DATA VALIDATION & ANALYSIS QUERIES (Future_Courses)
-- =========================================================

-- View all courses
SELECT * FROM Future_Courses;

-- Verify total number of records (expected: 30)
SELECT COUNT(*) AS total_rows FROM Future_Courses;

-- Verify number of courses per domain
SELECT domain, COUNT(*) AS Total
FROM Future_Courses
GROUP BY domain;

-- Display all courses ordered by future ranking
SELECT * FROM Future_Courses
ORDER BY future_rank;

-- Show all courses from Data domain
SELECT * FROM Future_Courses
WHERE domain = 'Data';

-- Show courses suitable for freshers
SELECT * FROM Future_Courses
WHERE for_freshers = 'Yes';

-- Show courses with job safety above 85%
SELECT * FROM Future_Courses
WHERE job_safety_pct > 85;

-- Show courses costing more than 70,000 INR
SELECT course_name, cost_INR
FROM Future_Courses
WHERE cost_INR > 70000;

-- Show courses with duration less than 6 months
SELECT course_name, duration_months
FROM Future_Courses
WHERE duration_months < 6;

-- Show courses NOT suitable for freshers
SELECT course_name AS 'Not_Suitable For Freshers'
FROM Future_Courses
WHERE for_freshers != 'Yes';

-- Show Data domain courses suitable for freshers
SELECT *
FROM Future_Courses
WHERE domain = 'Data'
AND for_freshers = 'Yes';

-- Show courses with job safety between 75% and 90%
SELECT course_name, job_safety_pct
FROM Future_Courses
WHERE job_safety_pct BETWEEN 75 AND 90;

-- Show courses from selected domains
SELECT *
FROM Future_Courses
WHERE domain IN ('AI', 'Data', 'Cloud');

-- Show high job safety courses ordered by cost
SELECT course_name, cost_INR, job_safety_pct
FROM Future_Courses
WHERE job_safety_pct >= 85
ORDER BY cost_INR;

-- Show intermediate or advanced courses with high job safety for freshers
SELECT course_name, for_freshers, level
FROM Future_Courses
WHERE job_safety_pct > 85
AND level IN ('Intermediate','Advanced')
AND for_freshers = 'YES';

-- Show courses NOT suitable for freshers and costing more than 60k
SELECT course_name, for_freshers
FROM Future_Courses
WHERE cost_INR > 60000
AND for_freshers = 'No';

-- Show AI domain courses with 'Engineer' in name
SELECT course_name
FROM Future_Courses
WHERE domain = 'AI'
AND course_name LIKE '%Engineer';

-- Show AI domain beginner courses with medium safety range
SELECT course_name, for_freshers
FROM Future_Courses
WHERE domain = 'AI'
AND level NOT IN ('Intermediate','Advanced')
AND job_safety_pct BETWEEN 75 AND 85;

-- Show courses costing less than the average course cost
SELECT course_name, cost_INR
FROM Future_Courses
WHERE cost_INR <
(
    SELECT AVG(cost_INR)
    FROM Future_Courses
);


-- =========================================================
-- TABLE 2: Skills_Master
-- =========================================================

CREATE TABLE Skills_Master
(
    skill_id INT IDENTITY(1,1) PRIMARY KEY,   -- Unique identifier for each skill
    skill_name VARCHAR(50) NOT NULL,          -- Name of the technical skill
    skill_category VARCHAR(30),               -- Category (Programming, Cloud, AI, etc.)
    skill_level VARCHAR(20),                  -- Skill difficulty level
    used_in_ai VARCHAR(3),                    -- Indicates AI usage (Yes/No)
    future_demand_level VARCHAR(20),          -- Market demand level
    job_impact VARCHAR(30),                   -- Impact on jobs
    created_on DATETIME DEFAULT GETDATE()     -- Record creation timestamp
);

-- View table structure and constraints
EXEC sp_help Skills_Master;

-- Check initial state of Skills_Master table
SELECT * FROM Skills_Master;


-- =========================================================
-- INSERT DATA INTO Skills_Master
-- Covers Programming, Database, OS, Cloud, AI, DevOps, Tools
-- =========================================================

INSERT INTO Skills_Master
(skill_name, skill_category, skill_level, used_in_ai, future_demand_level, job_impact)
VALUES

-- ========= Programming Languages =========
('Python', 'Programming', 'Beginner', 'Yes', 'Very High', 'Creates Jobs'),
('Java', 'Programming', 'Intermediate', 'No', 'High', 'Enhances Jobs'),
('JavaScript', 'Programming', 'Beginner', 'Yes', 'High', 'Enhances Jobs'),
('C++', 'Programming', 'Advanced', 'No', 'Medium', 'Enhances Jobs'),

-- ========= Databases =========
('SQL Server', 'Database', 'Beginner', 'Yes', 'High', 'Enhances Jobs'),
('MySQL', 'Database', 'Beginner', 'Yes', 'High', 'Enhances Jobs'),
('PostgreSQL', 'Database', 'Intermediate', 'Yes', 'High', 'Creates Jobs'),

-- ========= Operating Systems =========
('Linux', 'Operating System', 'Intermediate', 'Yes', 'High', 'Enhances Jobs'),
('Windows Server', 'Operating System', 'Beginner', 'No', 'Medium', 'Enhances Jobs'),

-- ========= Cloud Technologies =========
('AWS', 'Cloud', 'Intermediate', 'Yes', 'Very High', 'Creates Jobs'),
('Azure', 'Cloud', 'Intermediate', 'Yes', 'High', 'Creates Jobs'),
('Google Cloud', 'Cloud', 'Intermediate', 'Yes', 'High', 'Creates Jobs'),

-- ========= DevOps Tools =========
('Docker', 'DevOps', 'Intermediate', 'Yes', 'High', 'Enhances Jobs'),
('Kubernetes', 'DevOps', 'Advanced', 'Yes', 'Very High', 'Creates Jobs'),
('CI/CD Pipelines', 'DevOps', 'Intermediate', 'Yes', 'High', 'Enhances Jobs'),

-- ========= AI / Analytics Tools =========
('Machine Learning Basics', 'AI', 'Beginner', 'Yes', 'Very High', 'Creates Jobs'),
('Deep Learning', 'AI', 'Advanced', 'Yes', 'Very High', 'Creates Jobs'),
('Power BI', 'Analytics Tool', 'Beginner', 'Yes', 'High', 'Enhances Jobs'),

-- ========= Networking / General =========
('Networking Basics', 'Networking', 'Beginner', 'No', 'Medium', 'Enhances Jobs'),
('Git & GitHub', 'Tool', 'Beginner', 'No', 'High', 'Enhances Jobs');


-- =========================================================
-- DATA VALIDATION & FILTERING QUERIES (Skills_Master)
-- =========================================================

-- Verify total number of skills (expected: 20)
SELECT COUNT(*) AS total_skills FROM Skills_Master;

-- View all skills
SELECT * FROM Skills_Master;

-- View skills with high or very high future demand
SELECT skill_name, future_demand_level
FROM Skills_Master
WHERE future_demand_level IN ('High','Very High');

-- View basic skill details
SELECT skill_id, skill_name, skill_category, future_demand_level
FROM Skills_Master;

-- View unique skill categories
SELECT DISTINCT skill_category
FROM Skills_Master;

-- View skills not used in AI but still in high demand
SELECT skill_name, used_in_ai, future_demand_level
FROM Skills_Master
WHERE used_in_ai = 'No'
AND future_demand_level = 'High';

-- Sort skills alphabetically
SELECT skill_name, skill_category
FROM Skills_Master
ORDER BY skill_name ASC;

-- Sort skills by category and demand level
SELECT skill_name, skill_category, future_demand_level
FROM Skills_Master
ORDER BY skill_category, future_demand_level DESC;

-- Count skills per category
SELECT skill_category, COUNT(*) AS Total_Skiils
FROM Skills_Master
GROUP BY skill_category;

-- Show categories having more than 2 skills
SELECT skill_category, COUNT(*) AS total_skills
FROM Skills_Master
GROUP BY skill_category
HAVING COUNT(*) > 2;


-- =========================================================
-- CASE STATEMENTS (CORE INTERVIEW TOPIC)
-- =========================================================

-- Assign letter grades based on future demand
SELECT skill_name,
       future_demand_level,
       CASE
           WHEN future_demand_level = 'Very High' THEN 'Grade A'
           WHEN future_demand_level = 'High' THEN 'Grade B'
           WHEN future_demand_level = 'Medium' THEN 'Grade C'
           ELSE 'Grade D'
       END AS Skill_Grade
FROM Skills_Master;

-- Convert demand levels into numeric scores
SELECT skill_name,
       CASE
           WHEN future_demand_level = 'Very High' THEN 4
           WHEN future_demand_level = 'High' THEN 3
           WHEN future_demand_level = 'Medium' THEN 2
           ELSE 1
       END AS Grade_Point
FROM Skills_Master;

-- Simple CASE comparing a single column
SELECT skill_name,
       future_demand_level,
       CASE future_demand_level
           WHEN 'Very High' THEN 'Top'
           WHEN 'High' THEN 'Medium'
           ELSE 'Low'
       END AS demand_category
FROM Skills_Master;


-- =========================================================
-- ALTER TABLE OPERATIONS
-- =========================================================

-- Add certification requirement column
ALTER TABLE Skills_Master
ADD certification_required VARCHAR(3);

-- Verify updated table structure
EXEC sp_help Skills_Master;

-- Find skills where certification requirement is not decided
SELECT skill_name
FROM Skills_Master
WHERE certification_required IS NULL;


-- =========================================================
-- UPDATE OPERATIONS
-- =========================================================

-- Update certification requirement for Cloud and DevOps skills
UPDATE Skills_Master
SET certification_required = 'Yes'
WHERE skill_category IN ('Cloud', 'DevOps');

-- View certification requirement status
SELECT skill_name, certification_required
FROM Skills_Master;

-- Update future demand level for Python
UPDATE Skills_Master
SET future_demand_level = 'Very High'
WHERE skill_name = 'Python';

-- Set certification requirement dynamically using CASE
UPDATE Skills_Master
SET certification_required =
    CASE
        WHEN future_demand_level = 'Very High' THEN 'Yes'
        ELSE 'No'
    END;


-- =========================================================
-- DELETE & MODIFY OPERATIONS
-- =========================================================

-- Remove a low-value skill (example practice delete)
DELETE FROM Skills_Master
WHERE skill_name = 'Excel';

-- Increase skill_name column length for future expansion
ALTER TABLE Skills_Master
ALTER COLUMN skill_name VARCHAR(50);


-- =========================================================
-- TABLE 3: Course_Skill_Map
-- =========================================================

CREATE TABLE Course_Skill_Map
(
    map_id INT IDENTITY(1,1) PRIMARY KEY,     -- Unique mapping identifier
    course_id INT NOT NULL,                   -- References Future_Courses
    skill_id INT NOT NULL,                    -- References Skills_Master
    skill_priority VARCHAR(20),               -- Core / Important / Optional
    recommended_level VARCHAR(20),            -- Required skill level
    created_on DATETIME DEFAULT GETDATE(),    -- Mapping creation timestamp

    -- Foreign key constraint to Future_Courses
    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES Future_Courses(course_id),

    -- Foreign key constraint to Skills_Master
    CONSTRAINT fk_skill
        FOREIGN KEY (skill_id)
        REFERENCES Skills_Master(skill_id)
);

-- View structure and constraints of Course_Skill_Map table
EXEC sp_help Course_Skill_Map;

-- Check initial state of mapping table
SELECT * FROM Course_Skill_Map;


-- =========================================================
-- INSERT DATA INTO Course_Skill_Map
-- =========================================================

-- Insert course-to-skill mappings
INSERT INTO Course_Skill_Map
(course_id, skill_id, skill_priority, recommended_level)
VALUES

-- ================= DATA ANALYST =================
(1, 1, 'Core', 'Beginner'),        -- Data Analyst → Python
(1, 5, 'Core', 'Beginner'),        -- Data Analyst → SQL Server
(1, 18, 'Important', 'Beginner'),  -- Data Analyst → Power BI

-- ================= DATA SCIENTIST =================
(3, 1, 'Core', 'Advanced'),        -- Data Scientist → Python
(3, 16, 'Core', 'Intermediate'),   -- Data Scientist → Machine Learning
(3, 17, 'Important', 'Advanced'),  -- Data Scientist → Deep Learning

-- ================= AI ENGINEER =================
(6, 1, 'Core', 'Advanced'),        -- AI Engineer → Python
(6, 16, 'Core', 'Advanced'),       -- AI Engineer → Machine Learning
(6, 17, 'Core', 'Advanced'),       -- AI Engineer → Deep Learning

-- ================= CLOUD ENGINEER =================
(11, 10, 'Core', 'Intermediate'),  -- Cloud Engineer → AWS
(11, 11, 'Important', 'Intermediate'), -- Cloud Engineer → Azure
(11, 8, 'Important', 'Intermediate'),  -- Cloud Engineer → Linux

-- ================= DEVOPS ENGINEER =================
(25, 13, 'Core', 'Intermediate'),  -- DevOps Engineer → Docker
(25, 14, 'Core', 'Advanced'),      -- DevOps Engineer → Kubernetes
(25, 8, 'Important', 'Intermediate'), -- DevOps Engineer → Linux

-- ================= FULL STACK DEVELOPER =================
(19, 1, 'Important', 'Beginner'),  -- Full Stack → Python
(19, 3, 'Core', 'Beginner'),       -- Full Stack → JavaScript
(19, 20, 'Important', 'Beginner'); -- Full Stack → Git & GitHub


-- =========================================================
-- JOIN OPERATIONS (CORE SQL CONCEPTS)
-- =========================================================


--  Show each course along with its required skills and priority (INNER JOIN)
SELECT 
    c.course_name,
    s.skill_name,
    m.skill_priority
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id;


--  Show skills required only for the 'Data Analyst' course
SELECT 
    c.course_name,
    s.skill_name
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id
WHERE c.course_name = 'Data Analyst';


-- Count how many skills are required for each course
SELECT 
    c.course_name,
    COUNT(s.skill_id) AS total_skills
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id
GROUP BY c.course_name;


--  Display only those courses that require more than 2 skills
SELECT 
    c.course_name,
    COUNT(*) AS total_skills
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
GROUP BY c.course_name
HAVING COUNT(*) > 2;


--  Show all courses and their skills, including courses with no skills mapped (LEFT JOIN)
SELECT 
    c.course_name,
    s.skill_name
FROM Future_Courses c
LEFT JOIN Course_Skill_Map m
    ON c.course_id = m.course_id
LEFT JOIN Skills_Master s
    ON m.skill_id = s.skill_id;


--  Find courses that currently have no skills assigned
SELECT 
    c.course_name
FROM Future_Courses c
LEFT JOIN Course_Skill_Map m
    ON c.course_id = m.course_id
WHERE m.course_id IS NULL;


--  Show all skills and the courses they are used in,
--     including skills not mapped to any course (RIGHT JOIN)
SELECT 
    s.skill_name,
    c.course_name
FROM Course_Skill_Map m
RIGHT JOIN Skills_Master s
    ON m.skill_id = s.skill_id
LEFT JOIN Future_Courses c
    ON m.course_id = c.course_id;


--  Show all courses and all skills, even if they are not linked (FULL OUTER JOIN)
SELECT
    c.course_name,
    s.skill_name
FROM Future_Courses c
FULL OUTER JOIN Course_Skill_Map m
    ON c.course_id = m.course_id
FULL OUTER JOIN Skills_Master s
    ON m.skill_id = s.skill_id;


--  Find skills that belong to the same category (SELF JOIN)
SELECT
    s1.skill_name AS Skill_1,
    s2.skill_name AS Skill_2,
    s1.skill_category
FROM Skills_Master s1
INNER JOIN Skills_Master s2
    ON s1.skill_category = s2.skill_category
   AND s1.skill_id < s2.skill_id;


-- =========================================================
-- UPDATE & DELETE USING JOIN (REAL-WORLD OPERATIONS)
-- =========================================================


--  Mark all skills used by 'AI Engineer' course as 'Creates Jobs'
UPDATE s
SET s.job_impact = 'Creates Jobs'
FROM Skills_Master s
INNER JOIN Course_Skill_Map m
    ON s.skill_id = m.skill_id
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
WHERE c.course_name = 'AI Engineer';


-- Verify skills updated for AI Engineer
SELECT 
    s.skill_name,
    s.job_impact
FROM Skills_Master s
INNER JOIN Course_Skill_Map m
    ON s.skill_id = m.skill_id
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
WHERE c.course_name = 'AI Engineer';


--  Remove skill mappings for courses that are NOT suitable for freshers
DELETE m
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
WHERE c.for_freshers = 'No';


-- Verify that non-fresher course mappings are removed
SELECT 
    c.course_name,
    s.skill_name
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id
WHERE c.for_freshers = 'No';

-- =========================================================
-- PART 4: UNION, VIEWS, INDEXES
-- Purpose:
-- Demonstrates set operations, reusable queries (views),
-- and performance optimization (indexes)
-- =========================================================


-- =========================================================
-- UNION & UNION ALL
-- =========================================================

--  List all course names and all skill names in a single column
-- UNION removes duplicate values
SELECT course_name AS name 
FROM Future_Courses
UNION
SELECT skill_name 
FROM Skills_Master;


-- Q13: List all course names and skill names including duplicates
-- UNION ALL keeps duplicate values
SELECT course_name AS name 
FROM Future_Courses
UNION ALL
SELECT skill_name 
FROM Skills_Master;


-- =========================================================
-- VIEWS (Reusable Virtual Tables)
-- =========================================================


--  View showing course, skill, priority, and skill demand
-- Used to analyze how skill demand maps to each course
CREATE VIEW view_course_skill_demand AS
SELECT
    c.course_name,
    c.domain,
    s.skill_name,
    s.future_demand_level,
    m.skill_priority
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id;

-- View data from view_course_skill_demand
SELECT * FROM view_course_skill_demand;


--  View showing fresher-friendly courses and number of skills required
-- Helps freshers identify course complexity
CREATE VIEW view_fresher_course_skill_count AS
SELECT
    c.course_name,
    COUNT(m.skill_id) AS total_skills
FROM Future_Courses c
LEFT JOIN Course_Skill_Map m
    ON c.course_id = m.course_id
WHERE c.for_freshers = 'Yes'
GROUP BY c.course_name;

-- View fresher-friendly course skill counts
SELECT * FROM view_fresher_course_skill_count;


--  View showing only high-demand skills linked to courses
-- Filters skills with strong market demand
CREATE VIEW view_high_demand_skills AS
SELECT
    c.course_name,
    s.skill_name,
    s.future_demand_level
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id
WHERE s.future_demand_level IN ('High','Very High');

-- View high-demand skills
SELECT * FROM view_high_demand_skills;


-- Filter view output dynamically
SELECT *
FROM view_course_skill_demand
WHERE future_demand_level = 'High';


--  View to analyze course cost with required skill priority
-- Useful for cost vs skill analysis
CREATE VIEW view_course_cost_skill_priority AS
SELECT
    c.course_name,
    c.cost_INR,
    m.skill_priority,
    s.skill_name
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id;

-- View cost vs skill priority
SELECT * FROM view_course_cost_skill_priority;


--  View showing only courses with cost greater than 50,000
-- Used for premium course analysis
CREATE VIEW view_course_cost AS
SELECT
    c.course_name,
    c.cost_INR,
    m.skill_priority,
    s.skill_name
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id
WHERE c.cost_INR > 50000;

-- View expensive courses and skills
SELECT * FROM view_course_cost;


--  View combining course job safety and skill demand
-- Used to analyze safe careers with strong skill demand
CREATE VIEW view_course_safety_skill_demand AS
SELECT
    c.course_name,
    c.job_safety_pct,
    s.skill_name,
    s.future_demand_level
FROM Course_Skill_Map m
INNER JOIN Future_Courses c
    ON m.course_id = c.course_id
INNER JOIN Skills_Master s
    ON m.skill_id = s.skill_id
WHERE future_demand_level = 'Very High';

-- View job-safe, high-demand skill courses
SELECT * FROM view_course_safety_skill_demand;

-- 


-- =========================================================
-- INDEXES (Performance Optimization)
-- =========================================================


--  Create index on course_id in mapping table
-- Improves JOIN performance between Course_Skill_Map and Future_Courses
CREATE INDEX idx_map_course_id
ON Course_Skill_Map(course_id);

-- View indexes created on Course_Skill_Map
EXEC sp_helpindex 'Course_Skill_Map';


--  Create index on demand_level
-- Improves filtering on high-demand courses
CREATE INDEX index_course_demand
ON Future_Courses(demand_level);

-- View indexes on Future_Courses
EXEC sp_helpindex 'Future_Courses';


--  Composite index on domain and fresher flag
-- Optimizes queries filtering by domain and fresher suitability
CREATE INDEX index_domain_fresher
ON Future_Courses(domain, for_freshers);

-- View updated index list
EXEC sp_helpindex 'Future_Courses';

-- =========================================================
-- CLEANUP SECTION (DROP OBJECTS)
-- Purpose:
-- Demonstrates complete SQL lifecycle management
-- Safe to execute ONLY when cleanup is required
-- =========================================================


-- =========================================================
-- DROP VIEWS
-- =========================================================

-- Drop view showing course-skill-demand mapping
DROP VIEW IF EXISTS view_course_skill_demand;

-- Drop view showing fresher-friendly courses with skill count
DROP VIEW IF EXISTS view_fresher_course_skill_count;

-- Drop view showing high-demand skills linked to courses
DROP VIEW IF EXISTS view_high_demand_skills;

-- Drop view analyzing course cost and skill priority
DROP VIEW IF EXISTS view_course_cost_skill_priority;

-- Drop view showing premium (cost > 50k) courses
DROP VIEW IF EXISTS view_course_cost;

-- Drop view combining course safety and skill demand
DROP VIEW IF EXISTS view_course_safety_skill_demand;


-- =========================================================
-- DROP TABLES
-- =========================================================

-- Drop mapping table first (depends on other tables)
DROP TABLE IF EXISTS Course_Skill_Map;  

-- Drop skills master table
DROP TABLE IF EXISTS Skills_Master;

-- Drop courses table
DROP TABLE IF EXISTS Future_Courses;


-- =========================================================
-- DROP DATABASE
-- =========================================================

-- Switch to master or another database before dropping project DB
USE master;

-- Drop the project database
DROP DATABASE IF EXISTS COPL_SQL_DB;
