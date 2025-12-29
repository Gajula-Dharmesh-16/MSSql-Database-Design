# MSSQL Database Design Project

## Project Description
This project is a beginner-level Microsoft SQL Server database design project.
It is created to understand how databases work in real-world applications.

The project focuses on **courses and skills mapping**, where each course requires
multiple skills. It helps to learn how tables are connected using relationships.

All data used in this project is **sample data created manually** for practice and learning.

This project is suitable for **freshers who are preparing for SQL interviews**.

---

## Tables Used in This Project

### 1. Future_Courses
This table stores information about future job-oriented courses.

Main columns:
- course_id – Unique ID for each course
- course_name – Name of the course
- domain – Course domain (AI, Data, Cloud, etc.)
- level – Beginner / Intermediate / Advanced
- for_freshers – Whether the course is suitable for freshers
- job_safety_pct – Job safety percentage
- demand_level – Market demand of the course

---

### 2. Skills_Master
This table stores details about different technical skills.

Main columns:
- skill_id – Unique ID for each skill
- skill_name – Name of the skill
- used_in_ai – Whether the skill is used in AI
- future_demand_level – Future demand of the skill
- job_impact – Job impact of the skill

---

### 3. Course_Skill_Map
This table connects courses with required skills.

Main columns:
- course_id – Course reference
- skill_id – Skill reference
- skill_priority – Core or Important skill
- recommended_level – Required skill level

---

## Concepts Covered in This Project
- Database and table creation
- Primary key and foreign key
- Table relationships
- INNER JOIN, LEFT JOIN
- Subqueries
- CASE statements
- Views
- Indexes
- UPDATE and DELETE using JOIN
- Real-world SQL queries

---

## Files in This Repository
- `future_courses_skills_sql_fresher_project.sql`  
  (Contains complete database design, data insertion, and queries)

---

## Tools Used
- Microsoft SQL Server
- SQL
- Git
- GitHub

---

## Purpose of This Project
- To practice SQL concepts step by step
- To understand database relationships clearly
- To prepare for fresher-level SQL interviews
- To showcase SQL skills on GitHub
