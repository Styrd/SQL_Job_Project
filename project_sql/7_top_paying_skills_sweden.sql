/*
QUESTION: What are the top skills based on salary, in Sweden?
- Look at the average salary associated with each skill for Data/Business Analyst positions.
- Focus on roles with specified salaries, and filter on the Swedish job market.
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
    jpf.salary_year_avg IS NOT NULL AND
    job_country = 'Sweden' 
GROUP BY
    skills
ORDER BY
    avg_salary_skill DESC
LIMIT 25;

/*
🔍 Top 3 Insights for Sweden-Based Roles

📊 Office Productivity Tools Top the List

Skills like Word, Excel, PowerPoint, SharePoint, and VBA are surprisingly among the highest-paid.

This suggests a strong presence of traditional BI and reporting roles in Sweden — possibly in large corporations or government sectors that prioritize documentation and internal tooling.

📈 Business Intelligence (BI) Stack is Highly Valued

Tools like Power BI, Looker, DAX, and Databricks appear prominently.

This reflects a focus on dashboarding, reporting, and data modeling rather than pure engineering or machine learning work.

🧠 Generalist Analytical Programming Skills Are Present but Less Dominant

Python, R, and SQL are all well-paid but not at the very top.

Suggests that Sweden-based jobs may prioritize tool fluency over advanced modeling or engineering capabilities.

If we compare the remote market with the Swedish market we can get som key takeaways:

📌 Key Takeaway:

Remote analyst jobs pay more for tech-heavy, ML-integrated, and cloud-native skill sets.

Sweden-based roles reward BI, reporting, and office productivity expertise, reflecting possibly more corporate or enterprise environments with established workflows.

[
  {
    "skills": "word",
    "avg_salary_skill": "118140.00"
  },
  {
    "skills": "excel",
    "avg_salary_skill": "118140.00"
  },
  {
    "skills": "hadoop",
    "avg_salary_skill": "118140.00"
  },
  {
    "skills": "powerpoint",
    "avg_salary_skill": "118140.00"
  },
  {
    "skills": "sharepoint",
    "avg_salary_skill": "118140.00"
  },
  {
    "skills": "vba",
    "avg_salary_skill": "118140.00"
  },
  {
    "skills": "looker",
    "avg_salary_skill": "111175.00"
  },
  {
    "skills": "dax",
    "avg_salary_skill": "111175.00"
  },
  {
    "skills": "databricks",
    "avg_salary_skill": "111175.00"
  },
  {
    "skills": "power bi",
    "avg_salary_skill": "107622.50"
  },
  {
    "skills": "python",
    "avg_salary_skill": "107027.50"
  },
  {
    "skills": "r",
    "avg_salary_skill": "106438.33"
  },
  {
    "skills": "sql",
    "avg_salary_skill": "105308.38"
  },
  {
    "skills": "tableau",
    "avg_salary_skill": "104125.67"
  },
  {
    "skills": "gdpr",
    "avg_salary_skill": "92900.00"
  },
  {
    "skills": "azure",
    "avg_salary_skill": "90638.83"
  },
  {
    "skills": "nosql",
    "avg_salary_skill": "89100.00"
  },
  {
    "skills": "qlik",
    "avg_salary_skill": "43200.00"
  }
]

*/