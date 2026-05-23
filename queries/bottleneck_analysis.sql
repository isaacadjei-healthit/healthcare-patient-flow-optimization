SELECT
    visit_id,
    department,
    wait_time_minutes,
    length_of_stay_hours
FROM Visits
ORDER BY wait_time_minutes DESC;