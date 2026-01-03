/*
QUESTION: What are the most  in-demand skills for data/business analysts remote roles?
- Identify the top 5 in-demand skills for data/business analysts
- Focus on remote jobs
- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
FROM
    job_postings_fact AS jpf
INNER JOIN
    skills_job_dim AS sjd ON
    sjd.job_id = jpf.job_id
INNER JOIN
    skills_dim AS sd ON
    sd.skill_id = sjd.skill_id
WHERE
    (job_title LIKE '%Data Analyst%' OR
    job_title LIKE '%Business Analyst%') AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*

Result:
* SQL - 7622
* Excel - 4540
* Python - 4533
* Tableau - 4003
* Power BI - 2621

- SQL, Excel and Python are the outliers
- Tabelau is more used than Power BI remotely

*/
