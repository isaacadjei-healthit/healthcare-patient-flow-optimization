SELECT
    COUNT(*) AS total_visits,
    ROUND(AVG(wait_time_minutes),1) AS avg_wait_time,
    ROUND(AVG(length_of_stay_hours),1) AS avg_los
FROM Visits;