USE hospital_db;
GO

-- Portfolio Screenshot Queries
-- Healthcare Patient Flow Optimization System


-- 1. Patient Visit Summary

SELECT
    v.visit_id,
    p.first_name + ' ' + p.last_name AS patient_name,
    v.visit_type,
    v.admission_time,
    v.discharge_time,
    DATEDIFF(HOUR, v.admission_time, v.discharge_time) AS length_of_stay_hours
FROM dbo.Visits v
JOIN dbo.Patients p
    ON v.patient_id = p.patient_id
ORDER BY v.visit_id;


-- 2. Bottleneck Analysis

SELECT
    visit_id,
    department,
    wait_time_minutes,
    length_of_stay_hours
FROM Visits
ORDER BY wait_time_minutes DESC;


-- 3. Staff Workload Tracking

SELECT
    s.name AS staff_name,
    s.role,
    s.department,
    COUNT(vs.visit_id) AS assigned_visits
FROM dbo.Staff s
JOIN dbo.Visit_Staff vs
    ON s.staff_id = vs.staff_id
GROUP BY s.name, s.role, s.department
ORDER BY assigned_visits DESC;


-- 4. Resource Utilization Monitoring

SELECT
    r.resource_type,
    r.status,
    COUNT(vr.visit_id) AS times_used
FROM dbo.Resources r
JOIN dbo.Visit_Resources vr
    ON r.resource_id = vr.resource_id
GROUP BY r.resource_type, r.status
ORDER BY times_used DESC;


-- 5. Executive KPI Reporting

SELECT
    COUNT(*) AS total_visits,
    AVG(length_of_stay_hours) AS avg_length_of_stay_hours,
    MAX(wait_time_minutes) AS highest_wait_time_minutes
FROM dbo.Visits;