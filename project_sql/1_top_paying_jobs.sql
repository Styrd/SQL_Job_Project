/*
Fråga: Vad är de bäst betalande jobben som Data/Business Analyst i Sverige?
- Identifiera de 10 högst betalande jobben som Data/Business Analyst som är tillgängliga i Sverige.
- Fokusera på jobb som har en lön specifierad (ta bort NULL).
- Varför? Få fram bäst betalda jobb inom Data/Businesss Analyst, som kan erbjuda insikt i marknaden i Sverige.
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
LEFT JOIN                                               -- Länkar samman company_dim för att kunna få ut company_name
    company_dim AS cd ON
    jpf.company_id = cd.company_id
WHERE
    jpf.job_country = 'Sweden' AND                      -- Filtrerar på jobb i Sverige
    (jpf.job_title LIKE '%Data Analyst' OR
    jpf.job_title LIKE '%Business Analyst') AND         -- Filtrar ut jobb som innehåller 'Data Analyst' eller 'Business Analyst'
    jpf.salary_year_avg IS NOT NULL                     -- Tar bort NULL värden
ORDER BY
    jpf.salary_year_avg DESC
LIMIT 10;

/*
Notering: Vi har inte tillräckligt med data för att använda denna eftersom vi är dåliga på att lista lön i Sverige, om vi ska använda Sverige som parameter så måste vi hitta andra ingångsvärden. Vi bör därför skapa en ny frågeställning kring jobb Remote.
*/

/*
Fråga: Vad är de bäst betalande jobben som Data/Business Analyst Remote?
- Identifiera de 10 högst betalande jobben som Data/Business Analyst som är tillgängliga Remote.
- Fokusera på jobb som har en lön specifierad (ta bort NULL).
- Varför? Få fram bäst betalda jobb inom Data/Businesss Analyst, som kan erbjuda insikt om marknaden.
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
LEFT JOIN                                               -- Länkar samman company_dim för att kunna få ut company_name
    company_dim AS cd ON
    jpf.company_id = cd.company_id
WHERE
    (jpf.job_title LIKE '%Data Analyst' OR
    jpf.job_title LIKE '%Business Analyst') AND         -- Filtrar ut jobb som innehåller 'Data Analyst' eller 'Business Analyst'
    jpf.job_location = 'Anywhere' AND                   -- Filtering on roles that are available 'Anywhere' AKA remote
    jpf.salary_year_avg IS NOT NULL                     -- Tar bort NULL värden
ORDER BY
    jpf.salary_year_avg DESC
LIMIT 10;