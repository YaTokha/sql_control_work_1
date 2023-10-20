CREATE TABLE Clinics (
                         clinic_id SERIAL PRIMARY KEY,
                         clinic_name VARCHAR(100),
                         clinic_address VARCHAR(100),
                         contact_number VARCHAR(15)
);

CREATE TABLE Patients (
                          patient_id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50),
                          last_name VARCHAR(50),
                          date_of_birth DATE,
                          address VARCHAR(100),
                          phone_number VARCHAR(15),
                          email VARCHAR(100),
                          insurance_number VARCHAR(20) UNIQUE
);

CREATE TABLE Doctors (
                         doctor_id SERIAL PRIMARY KEY,
                         first_name VARCHAR(50),
                         last_name VARCHAR(50),
                         specialization VARCHAR(50),
                         license_number VARCHAR(20) UNIQUE,
                         clinic_id INT,
                         FOREIGN KEY (clinic_id) REFERENCES Clinics(clinic_id)
);

CREATE TABLE Appointments (
                              appointment_id SERIAL PRIMARY KEY,
                              patient_id INT,
                              doctor_id INT,
                              appointment_date_time TIMESTAMP,
                              reason_for_visit VARCHAR(200),
                              is_confirmed BOOLEAN,
                              FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
                              FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Добавление записей в таблицу Клиники
INSERT INTO Clinics (clinic_name, clinic_address, contact_number)
VALUES
    ('Клиника "Здоровье"', 'ул. Медицинская, 789', '+1112223333'),
    ('Медицинский центр "Семейное здоровье"', 'пр. Здоровья, 456', '+4445556666'),
    ('Офтальмологическая клиника "Вид"', 'ул. Глаза, 123', '+7778889999');

-- Добавление записей в таблицу Пациенты
INSERT INTO Patients (first_name, last_name, date_of_birth, address, phone_number, email, insurance_number)
VALUES
    ('Иван', 'Иванов', '1990-05-15', 'ул. Пушкина, 123', '+1234567890', 'ivan@example.com', '12345'),
    ('Мария', 'Смирнова', '1985-03-20', 'ул. Ленина, 456', '+9876543210', 'maria@example.com', '67890'),
    ('Петр', 'Петров', '1982-11-10', 'ул. Гагарина, 789', '+1122334455', 'petr@example.com', '13579'),
    ('Елена', 'Сидорова', '1978-08-25', 'пр. Кирова, 567', '+9988776655', 'elena@example.com', '24680'),
    ('Алексей', 'Козлов', '1995-02-01', 'ул. Бульварная, 321', '+7854693201', 'alex@example.com', '98765');


-- Добавление записей в таблицу Врачи
INSERT INTO Doctors (first_name, last_name, specialization, license_number, clinic_id)
VALUES
    ('Доктор', 'Иванов', 'Хирург', 'D12345', 1),
    ('Доктор', 'Петров', 'Терапевт', 'D67890', 2),
    ('Доктор', 'Сидоров', 'Окулист', 'D24680', 3),
    ('Доктор', 'Козлова', 'Педиатр', 'D98765', 1),
    ('Доктор', 'Смирнов', 'Стоматолог', 'D13579', 2);



-- Добавление записей в таблицу Записи на прием
INSERT INTO Appointments (patient_id, doctor_id, appointment_date_time, reason_for_visit, is_confirmed)
VALUES
    (1, 1, '2023-11-01 09:00:00', 'Плановая консультация', true),
    (2, 2, '2023-11-02 10:30:00', 'Боль в горле', true),
    (3, 3, '2023-11-03 15:15:00', 'Проблемы с зрением', false),
    (4, 1, '2023-11-04 14:00:00', 'Детская прививка', true),
    (5, 2, '2023-11-05 11:45:00', 'Зубная боль', false);






