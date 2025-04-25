
-- 1. View all data
SELECT * FROM health_data;

-- 2. Provinces with the highest HIV prevalence
SELECT Province, HIV_Prevalence
FROM health_data
ORDER BY HIV_Prevalence DESC
LIMIT 5;

-- 3. Average number of clinics and hospitals per 100k people
SELECT 
    ROUND(AVG(Clinics_per_100k), 2) AS Avg_Clinics,
    ROUND(AVG(Hospitals_per_100k), 2) AS Avg_Hospitals
FROM health_data;

-- 4. Provinces with below-average COVID vaccination rates
SELECT Province, COVID_Vaccination_Rate
FROM health_data
WHERE COVID_Vaccination_Rate < (
    SELECT AVG(COVID_Vaccination_Rate) FROM health_data
);

-- 5. Correlation-like insight (not actual correlation in SQL)
SELECT Province,
       Clinics_per_100k,
       TB_Incidence_per_100k
FROM health_data
ORDER BY TB_Incidence_per_100k DESC;
