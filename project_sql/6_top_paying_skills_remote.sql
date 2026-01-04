/*
QUESTION: What are the top skills based on salary, for remote jobs?
- Look at the average salary associated with each skill for Data/Business Analyst positions.
- Focus on roles with specified salaries, and filter on remote jobs.
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
--    COUNT (sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary_skill
FROM
    job_postings_fact AS jpf
INNER JOIN
    skills_job_dim AS sjd ON
    sjd.job_id = jpf.job_id
INNER JOIN
    skills_dim AS sd ON
    sd.skill_id = sjd.skill_id
WHERE
    (jpf.job_title LIKE '%Data Analyst%' or
    jpf.job_title LIKE '%Business Analyst%') AND
    jpf.salary_year_avg IS NOT NULL 
GROUP BY
    skills
ORDER BY
    avg_salary_skill DESC
LIMIT 25;

/*
Top-Paying Skills for Remote Data & Business Analyst Roles: 

Key Insights

*   Niche & Backend Skills Command Premium Salaries
    Tools like Yarn, Couchbase, and Golang suggest top salaries go to analysts with engineering or infrastructure skills — often in hybrid roles.
*   Cloud & Distributed Systems Expertise Is In Demand
    High-paying roles value skills in Airflow, Kafka, DynamoDB, and VMware, highlighting a shift toward cloud-first remote data teams.
*   Proficiency in Remote Collaboration Tools Pays Off
    Tools like GitLab, Bitbucket, and Notion reflect the need for analysts to work efficiently in distributed, asynchronous environments.

[
  {
    "skills": "yarn",
    "avg_salary_skill": "340000.00"
  },
  {
    "skills": "dplyr",
    "avg_salary_skill": "196250.00"
  },
  {
    "skills": "fastapi",
    "avg_salary_skill": "185000.00"
  },
  {
    "skills": "golang",
    "avg_salary_skill": "161750.00"
  },
  {
    "skills": "couchbase",
    "avg_salary_skill": "160515.00"
  },
  {
    "skills": "vmware",
    "avg_salary_skill": "147500.00"
  },
  {
    "skills": "perl",
    "avg_salary_skill": "141921.21"
  },
  {
    "skills": "dynamodb",
    "avg_salary_skill": "140000.00"
  },
  {
    "skills": "twilio",
    "avg_salary_skill": "138500.00"
  },
  {
    "skills": "datarobot",
    "avg_salary_skill": "128992.75"
  },
  {
    "skills": "keras",
    "avg_salary_skill": "127833.33"
  },
  {
    "skills": "gitlab",
    "avg_salary_skill": "127033.78"
  },
  {
    "skills": "rust",
    "avg_salary_skill": "124833.33"
  },
  {
    "skills": "bitbucket",
    "avg_salary_skill": "124791.33"
  },
  {
    "skills": "watson",
    "avg_salary_skill": "121838.33"
  },
  {
    "skills": "airflow",
    "avg_salary_skill": "117423.37"
  },
  {
    "skills": "angular",
    "avg_salary_skill": "117212.62"
  },
  {
    "skills": "notion",
    "avg_salary_skill": "116710.00"
  },
  {
    "skills": "kafka",
    "avg_salary_skill": "116515.97"
  },
  {
    "skills": "php",
    "avg_salary_skill": "116507.34"
  },
  {
    "skills": "scala",
    "avg_salary_skill": "115530.69"
  },
  {
    "skills": "jupyter",
    "avg_salary_skill": "114667.13"
  },
  {
    "skills": "pytorch",
    "avg_salary_skill": "113210.32"
  },
  {
    "skills": "node",
    "avg_salary_skill": "113125.00"
  },
  {
    "skills": "confluence",
    "avg_salary_skill": "112488.16"
  }
]
*/