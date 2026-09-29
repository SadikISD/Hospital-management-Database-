CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(15),
    Location VARCHAR(15)
);

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Doctor_Name VARCHAR(15),
    Specialization VARCHAR(20),
    Phone VARCHAR(15),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(20),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Doctor_ID INT,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE Medicine (
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(30),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Surgery (
    Surgery_ID INT PRIMARY KEY,
    Surgery_Name VARCHAR(20),
    Surgery_Date DATE,
    Patient_ID INT,
    Doctor_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

INSERT INTO Department VALUES
(1, '    Cardiology',  '    Block A'),
(2, '    Neurology',   '     Block B'),
(3, '    Orthopedics', '   Block C'),
(4, '    Pediatrics',  '    Block D');

INSERT INTO Doctor VALUES
(101, 'Dr. Rahman', 'Cardiologist', '01711111111', 1),
(102, 'Dr. Karim', 'Neurologist', '01822222222', 2),
(103, 'Dr. Hasan', 'Orthopedic Surgeon', '01933333333', 3),
(104, 'Dr. Nabila', 'Pediatrician', '01644444444', 4);

INSERT INTO Patient VALUES
(201, 'John Ahmed', 35, 'Male', '01755555555', 101),
(202, 'Sadia Islam', 28, 'Female', '01866666666', 102),
(203, 'Rakib Hasan', 42, 'Male', '01977777777', 103),
(204, 'Mim Akter', 10, 'Female', '01688888888', 104);

INSERT INTO Medicine VALUES
(301, 'Paracetamol', 20.00, 100),
(302, 'Amoxicillin', 50.00, 75),
(303, 'Omeprazole', 35.00, 60),
(304, 'Azithromycin', 80.00, 40);

INSERT INTO Surgery VALUES
(401, 'Heart Surgery', TO_DATE('2026-09-20', 'YYYY-MM-DD'), 201, 101),
(402, 'Brain Surgery', TO_DATE('2026-09-21', 'YYYY-MM-DD'), 202, 102),
(403, 'Bone Surgery', TO_DATE('2026-09-22', 'YYYY-MM-DD'), 203, 103);


SELECT Medicine_Name, Price
FROM Medicine
WHERE Price > 30;

SELECT Patient_Name, Age
FROM Patient
WHERE Age > 30;

SELECT d.Doctor_Name,
       d.Specialization,
       dep.Department_Name
FROM Doctor d
JOIN Department dep
ON d.Department_ID = dep.Department_ID;

SELECT s.Surgery_Name,
       s.Surgery_Date,
       p.Patient_Name,
       d.Doctor_Name
FROM Surgery s
JOIN Patient p
ON s.Patient_ID = p.Patient_ID
JOIN Doctor d
ON s.Doctor_ID = d.Doctor_ID;


select * from Medicine;
select * from Surgery;
select * from Patient;
select * from Doctor;
select * from Department;


