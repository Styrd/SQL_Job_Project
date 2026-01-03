/*
QUESTION: What are the top-paying data/business analyst jobss, and what skills are required?
- Identify the top 10 highest-paying Data/Business Analyst jobs and the specific skills required for these roles.
- Filter for roles with specified salaries that are remote.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries, for remote roles.
*/

WITH top_paying_jobs AS (                                   -- CTE based on a previous query that named the top 10 highest-paying jobs
    SELECT
        jpf.job_id,
        jpf.job_title,
        cd.name AS company_name,
        jpf.salary_year_avg
    FROM
        job_postings_fact AS jpf
    LEFT JOIN                                               -- JOINs company_dim to be able to get the company name
        company_dim AS cd ON
        jpf.company_id = cd.company_id
    WHERE
        (jpf.job_title LIKE '%Data Analyst' OR
        jpf.job_title LIKE '%Business Analyst') AND         -- Filter jobs to only include 'Data Analyst' or 'Business Analyst'
        jpf.job_location = 'Anywhere' AND                   -- Filtering on roles that are available 'Anywhere' AKA remote
        jpf.salary_year_avg IS NOT NULL                     -- Removes NULL values
    ORDER BY
        jpf.salary_year_avg DESC
    LIMIT 10
)

SELECT
    tpj.*,
    skills
FROM
    top_paying_jobs AS tpj
INNER JOIN                                                  -- INNER JOINs the CTE with skills_job_dim to make skills_dim available
    skills_job_dim AS sjd ON
    sjd.job_id = tpj.job_id
INNER JOIN                                                  -- INNER JOINs skills_job_dim with skills_dim to get the skill names
    skills_dim AS sd ON
    sd.skill_id = sjd.skill_id
ORDER BY
    tpj.salary_year_avg;

/*
Most In-Demand Skills in Top-Paying Remote Analyst Jobs (2023)
* SQL – 7
* Python – 7
* R – 5
* Tableau – 5
* AWS – 3
From ChatGPT analyzation on the csv result

- We can see that SQL and Python are good skills to learn followed by Tableau as visulasation tool and AWS for cloud platforms.
- If you rather want to pick R instead of Python that is a valid pick
- These skills builds up to a reasonalbe stack of skills.

Down below are the result in JSON, if we need it for later:

[
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "ssis"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "linux"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "databricks"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "azure"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "couchbase"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "postgresql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "mysql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "r"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "scala"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "python"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "sql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "visio"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "cognos"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "tableau"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "airflow"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "pyspark"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "watson"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "snowflake"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "oracle"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "redshift"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "aws"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "sql"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "r"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "swift"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "excel"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "looker"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "170000.0",
    "skills": "go"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "170000.0",
    "skills": "java"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "170000.0",
    "skills": "excel"
  },
  {
    "job_id": 332437,
    "job_title": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "tableau"
  },
  {
    "job_id": 332437,
    "job_title": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "sql"
  },
  {
    "job_id": 332437,
    "job_title": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "r"
  },
  {
    "job_id": 332437,
    "job_title": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "zoom"
  },
  {
    "job_id": 332437,
    "job_title": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "looker"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "r"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "python"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "windows"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "fastapi"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "flask"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "angular"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "keras"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "aws"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "css"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "html"
  },
  {
    "job_id": 1638595,
    "job_title": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "sql"
  }
]
*/
