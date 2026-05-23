SELECT
    department,
    ROUND(AVG(length_of_stay_hours), 1) AS avg_los_hours
FROM Visits
GROUP BY department
ORDER BY avg_los_hours DESC;