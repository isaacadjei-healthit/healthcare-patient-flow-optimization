SELECT
    s.name,
    COUNT(vs.visit_id) AS assigned_visits
FROM Staff s
JOIN Visit_Staff vs
    ON s.staff_id = vs.staff_id
GROUP BY s.name
ORDER BY assigned_visits DESC;