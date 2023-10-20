SELECT * FROM Patients
ORDER BY last_name, first_name;

SELECT specialization, COUNT(*) as count_of_doctors
FROM Doctors
GROUP BY specialization;

SELECT * FROM Appointments
WHERE is_confirmed = true
ORDER BY appointment_date_time;

SELECT first_name, last_name, specialization
FROM Doctors;

SELECT *
FROM Patients
WHERE EXTRACT(MONTH FROM date_of_birth) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(DAY FROM date_of_birth) = EXTRACT(DAY FROM CURRENT_DATE);



