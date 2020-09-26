DROP DATABASE IF EXISTS assign5;
CREATE DATABASE IF NOT EXISTS assign5;
USE assign5;

CREATE TABLE classes(
	class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_shortname CHAR(20) NOT NULL UNIQUE,
    class_desc VARCHAR(50) DEFAULT 'No description.'
);
CREATE TABLE majors(
	major_id INT PRIMARY KEY AUTO_INCREMENT,
    major_name VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE students(
	student_id CHAR(20) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    email VARCHAR(50),
    major_id INT,
    CONSTRAINT students_fk_majors
		FOREIGN KEY (major_id)
        REFERENCES majors (major_id)
);
CREATE TABLE enrolls(
	enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id CHAR(20) NOT NULL,
    class_id INT NOT NULL,
    CONSTRAINT enrolls_fk_students
		FOREIGN KEY (student_id)
        REFERENCES students (student_id),
	CONSTRAINT enrolls_fk_classes
		FOREIGN KEY (class_id)
        REFERENCES classes (class_id)
);

INSERT INTO classes (class_shortname) VALUES
('IT1025'),
('IT1050'),
('IT2351'),
('MATH1200');
INSERT INTO majors (major_name) VALUES
('Programming'),
('Networking'),
('Engineering');
INSERT INTO students VALUES
('S1','Joe','Smith','124 Main St.','Joe@school.edu',1),
('S2','Sue','Brown','345 Second St.','Sue@school.edu',1),
('S3','Nick','Green','45 York Road','Nick@school.edu',2),
('S4','Andy','Andrews','600 5th Ave.','Andy@school.edu',2),
('S5','Harold','Berwick','20 Crestbrook St.','Harold@school.edu',1),
('S6','Alison','Swan','4 Maple Ave.','Alison@school.edu',2),
('S7','Korbin','Dallas','99 Tower Road','Korbin@school.edu',3);
INSERT INTO enrolls (student_id,class_id) VALUES
('S1',1),
('S1',4),
('S1',2),
('S2',1),
('S2',2),
('S2',3),
('S3',1),
('S4',1),
('S4',2),
('S5',1),
('S5',2),
('S6',3),
('S7',3),
('S7',4);