/*
QUESTION: What are the top-paying data/business analyst jobs, and what skills are required?
- Identify the highest-paying Data/Business Analyst jobs in Sweden and the specific skills required for these roles.
- Filter for roles with specified salaries that are remote.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries, for the Swedish job market.
*/

WITH top_paying_jobs AS (                                   -- CTE on previous query that named the top-paying jobs in Sweden
    SELECT
        jpf.job_id,
        jpf.job_title,
        cd.name AS company_name,
        jpf.job_location,
        jpf.job_schedule_type,
        jpf.salary_year_avg
    FROM
        job_postings_fact AS jpf
    LEFT JOIN                                               -- JOINs company_dim to be able to get the company name
        company_dim AS cd ON
        jpf.company_id = cd.company_id
    WHERE
        jpf.job_country = 'Sweden' AND                      -- Filter the country to 'Sweden'
        (jpf.job_title LIKE '%Data Analyst' OR
        jpf.job_title LIKE '%Business Analyst') AND         -- Filter jobs to only include 'Data Analyst' or 'Business Analyst'
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
INNER JOIN                                                  --  INNER JOINs skills_job_dim with skills_dim to get the skill names
    skills_dim AS sd ON
    sd.skill_id = sjd.skill_id
ORDER BY
    tpj.salary_year_avg

/*
Most In-Demand Skills in Top-Paying Remote Analyst Jobs (2023) (from top 7 swedish jobs)
* SQL – 5
* Python – 5
* Power BI – 4
* R – 3
* Azure – 2
From ChatGPT analyzation on the csv result

Compared to

Most In-Demand Skills in Top-Paying Remote Analyst Jobs (2023) (from top 10 remote jobs)
* SQL – 7
* Python – 7
* R – 5
* Tableau – 5
* AWS – 3
From ChatGPT analyzation on the csv result

- The trend of SQL and Python is the same in Sweden.
- Power BI seem to be more popular then Tableau in Sweden compared to the remote market.
- Sweden also seem to use Azure instead of AWS.

Down below is the JSON file for this result:

[
  {
    "job_id": 412856,
    "job_title": "Product Data Analyst",
    "company_name": "H&M Group",
    "job_location": "Stockholm, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "skills": "gdpr"
  },
  {
    "job_id": 680315,
    "job_title": "Data Analyst",
    "company_name": "Gotely",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 680315,
    "job_title": "Data Analyst",
    "company_name": "Gotely",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 680315,
    "job_title": "Data Analyst",
    "company_name": "Gotely",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 680315,
    "job_title": "Data Analyst",
    "company_name": "Gotely",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 680315,
    "job_title": "Data Analyst",
    "company_name": "Gotely",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 369289,
    "job_title": "Senior Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "azure"
  },
  {
    "job_id": 369289,
    "job_title": "Senior Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 369289,
    "job_title": "Senior Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "databricks"
  },
  {
    "job_id": 369289,
    "job_title": "Senior Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "power bi"
  },
  {
    "job_id": 369289,
    "job_title": "Senior Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "dax"
  },
  {
    "job_id": 1034611,
    "job_title": "Data Analyst",
    "company_name": "Trustly",
    "job_location": "Stockholm, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 1034611,
    "job_title": "Data Analyst",
    "company_name": "Trustly",
    "job_location": "Stockholm, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 846822,
    "job_title": "Senior Data Analyst",
    "company_name": "Truecaller",
    "job_location": "Stockholm, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 846822,
    "job_title": "Senior Data Analyst",
    "company_name": "Truecaller",
    "job_location": "Stockholm, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 846822,
    "job_title": "Senior Data Analyst",
    "company_name": "Truecaller",
    "job_location": "Stockholm, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "r"
  },
  {
    "job_id": 846822,
    "job_title": "Senior Data Analyst",
    "company_name": "Truecaller",
    "job_location": "Stockholm, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "job_id": 70470,
    "job_title": "Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 70470,
    "job_title": "Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 70470,
    "job_title": "Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "azure"
  },
  {
    "job_id": 70470,
    "job_title": "Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "databricks"
  },
  {
    "job_id": 70470,
    "job_title": "Data Analyst",
    "company_name": "Vattenfall",
    "job_location": "Solna, Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "skills": "power bi"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "word"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "vba"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "r"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "python"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "power bi"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "excel"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1086100,
    "job_title": "GFCP Senior/Master Expert - Senior Data Analyst",
    "company_name": "Nordea",
    "job_location": "Sweden",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "skills": "sql"
  }
]
*/