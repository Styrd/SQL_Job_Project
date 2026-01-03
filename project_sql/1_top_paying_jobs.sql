/*
QUESTION: What are the top-paying Data/Business Analyst jobs in Sweden?
- Identify the top 10 highest-paying Data/Business Analyst roles that are available in Sweden.
- Focus on job postings with specified salaries (no NULL values)
- Why? Aims to highlight the top-paying opportunities for Data Analysts, offering insights into employment options in Sweden.
*/

SELECT
    jpf.job_id AS jobb_id,
    jpf.job_title AS jobbtitel,
    cd.name AS arbetsgivare,
    jpf.job_location AS plats,
    jpf.job_schedule_type AS anställningsform,
    jpf.job_work_from_home AS hybrid,
    jpf.salary_year_avg AS medellön_år,
    jpf.job_posted_date AS publicerad
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
LIMIT 10;

/*
Note: We don't have enough data, we only have 7 job listings that includes a salary in Sweden, therefore we need other parameters if we want to analyse job postings in Sweden.
Therefore we will change the scope to remote jobs and make a new query below.
*/

/*
QUESTION: What are the top-paying Data/Business Analyst jobs?
- Identify the top 10 highest-paying Data/Business Analyst roles that are available available remotely.
- Focus on job postings with specified salaries (no NULL values)
- Why? Aims to highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    jpf.job_id AS jobb_id,
    jpf.job_title AS jobbtitel,
    cd.name AS arbetsgivare,
    jpf.job_location AS plats,
    jpf.job_schedule_type AS anställningsform,
    jpf.salary_year_avg AS medellön_år,
    jpf.job_posted_date AS publicerad
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
LIMIT 10;