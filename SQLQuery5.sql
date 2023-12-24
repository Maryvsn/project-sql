-- Create the Semester table
CREATE TABLE Semester (
  SemesterId INT PRIMARY KEY,
  SemesterName VARCHAR(50) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL
);
-- Create the Student table
CREATE TABLE Student (
  StudentId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  SemesterId INT,
  FOREIGN KEY (semesterId) REFERENCES Semester(semesterId)
);

-- Create the Student_Phone table
CREATE TABLE Student_Phone (
  StudentId INT,
  PhoneNumber VARCHAR(11) NOT NULL,
  FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);

-- Create the Department table
CREATE TABLE Department (
  DepartmentId INT PRIMARY KEY,
  DepartmentName VARCHAR(100) NOT NULL,
  HeadOfDepartment VARCHAR(100) NOT NULL,
  Location VARCHAR(100) NOT NULL
);

-- Create the Course table
CREATE TABLE Course (
  CourseId INT PRIMARY KEY,
  Instructor VARCHAR(100) NOT NULL,
  CourseName VARCHAR(100) NOT NULL,
  CreditHours INT NOT NULL,
  DepartmentId INT,
  FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

-- Create the Enrollment table
CREATE TABLE Enrollment (
  StudentId INT,
  CourseId INT,
  FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
  FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);

-- Create the Student_Grade table
CREATE TABLE Student_Grade (
  StudentId INT,
  CourseId INT,
  Grade VARCHAR(2) NOT NULL,
  FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
  FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);

-- Create the Faculty table
CREATE TABLE Faculty (
  FacultyId INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  DepartmentId INT,
  FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

-- Create the Faculty_Phone table
CREATE TABLE Faculty_Phone (
  FacultyId INT,
  PhoneNumber VARCHAR(11) NOT NULL,
  FOREIGN KEY (FacultyId) REFERENCES Faculty(FacultyId)
);

-- Create the Grade table
CREATE TABLE Grade (
  GradeId INT PRIMARY KEY,
  GradeName VARCHAR(10) NOT NULL,
  GradePoint DECIMAL(3, 2) NOT NULL,
  StudentId INT,
  FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);

-- Insert sample data into the tables
INSERT INTO Student (StudentId, FirstName, LastName) VALUES
  (1, 'John', 'Doe'),
  (2, 'Jane', 'Smith'),
  (3, 'Michael', 'Johnson'),
  (4, 'Emily', 'Davis'),
  (5, 'David', 'Anderson'),
  (6, 'Sarah', 'Wilson'),
  (7, 'Robert', 'Taylor'),
  (8, 'Olivia', 'Martin'),
  (9, 'Daniel', 'Moore'),
  (10, 'Sophia', 'Jackson'),
  (11, 'Matthew', 'Clark'),
  (12, 'Ava', 'Thomas'),
  (13, 'William', 'Lee'),
  (14, 'Isabella', 'Harris'),
  (15, 'James', 'Young');

INSERT INTO Student_Phone (StudentId, PhoneNumber) VALUES
  (1, '01234567891'),
  (2, '01234567892'),
  (3, '01234567893'),
  (4, '01234567894'),
  (5, '01234567895'),
  (6, '01234567896'),
  (7, '01234567897'),
  (8, '01234567898'),
  (9, '01234567899'),
  (10, '01234567890'),
  (11, '01123456789'),
  (12, '01123456788'),
  (13, '01123456787'),
  (14, '01123456786'),
  (15, '01123456785');

INSERT INTO Department (DepartmentId, DepartmentName, HeadOfDepartment, Location) VALUES
  (1, 'Computer Science Department', 'Professor Smith', 'Building A'),
  (2, 'Electrical Engineering Department', 'Professor Johnson', 'Building B'),
  (3, 'Mechanical Engineering Department', 'Professor Williams', 'Building C'),
  (4, 'Business Administration Department', 'Professor Brown', 'Building D'),
  (5, 'Psychology Department', 'Professor Davis', 'Building E'),
  (6, 'English Department', 'Professor Wilson', 'Building F'),
  (7, 'Mathematics Department', 'Professor Anderson', 'Building G'),
  (8, 'History Department', 'Professor Taylor', 'Building H'),
  (9, 'Chemistry Department', 'Professor Martin', 'Building I'),
  (10, 'Physics Department', 'Professor Moore', 'Building J'),
  (11, 'Biology Department', 'Professor Jackson', 'Building K'),
  (12, 'Art Department', 'Professor Clark', 'Building L'),
  (13, 'Music Department', 'Professor Thomas', 'Building M'),
  (14, 'Geography Department', 'Professor Lee', 'Building N'),
  (15, 'Economics Department', 'Professor Harris', 'Building O');

INSERT INTO Course (CourseId, Instructor, CourseName, CreditHours, DepartmentId) VALUES
  (1, 'Professor White', 'Introduction to Computer Science', 3, 1),
  (2, 'Professor Johnson', 'Data Structures and Algorithms', 4, 1),
  (3, 'Professor Brown', 'Database Management Systems', 3, 1),
  (4, 'Professor Wilson', 'Introduction to Psychology', 3, 5),
  (5, 'Professor Anderson', 'Calculus I', 4, 7),
  (6, 'Professor Taylor', 'World History', 3, 8),
  (7, 'Professor Martin', 'Organic Chemistry', 4, 9),
  (8, 'Professor Moore', 'Quantum Physics', 4, 10),
  (9, 'Professor Jackson', 'Genetics', 3, 11),
  (10, 'Professor Clark', 'Introduction to Art', 3, 12),
  (11, 'Professor Thomas', 'Music Theory', 3, 13),
  (12, 'Professor Lee', 'Introduction to Geography', 3, 14),
  (13, 'Professor Harris', 'Microeconomics', 3, 15),
  (14, 'Professor Johnson', 'Operating Systems', 3, 1),
  (15, 'Professor Brown', 'Software Engineering', 4, 1);

INSERT INTO Enrollment (StudentId, CourseId) VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4),
  (4, 5),
  (5, 6),
  (5, 7),
  (6, 8),
  (6, 9),
  (7, 10),
  (7, 11),
  (8, 12),
  (8, 13),
  (9, 14),
  (9, 15),
  (10, 1),
  (10, 2),
  (11, 3),
  (11, 4),
  (12, 5),
  (12, 6),
  (13, 7),
  (13, 8),
  (14, 9),
  (14, 10),
  (15, 11),
  (15, 12);

INSERT INTO Student_Grade (StudentId, CourseId, Grade) VALUES
  (1, 1, 'A'),
  (1, 2, 'A-'),
  (2, 1, 'B+'),
  (2, 3, 'A'),
  (3, 1, 'B'),
  (3, 2, 'B'),
  (4, 4, 'A-'),
  (4, 5, 'A'),
  (5, 6, 'B+'),
  (5, 7, 'A'),
  (6, 8, 'B+'),
  (6, 9, 'A-'),
  (7, 10, 'B'),
  (7, 11, 'A-'),
  (8, 12, 'A'),
  (8, 13, 'A'),
  (9, 14, 'B+'),
  (9, 15, 'A-'),
  (10, 1, 'B'),
  (10, 2, 'B+'),
  (11, 3, 'A-'),
  (11, 4, 'A'),
  (12, 5, 'B+'),
  (12, 6, 'B'),
  (13, 7, 'A-'),
  (13, 8, 'A'),
  (14, 9, 'B+'),
  (14, 10, 'A-'),
  (15, 11, 'B+'),
  (15, 12, 'A');

INSERT INTO Faculty (FacultyId, FirstName, LastName, DepartmentId) VALUES
  (1, 'Professor', 'Smith', 1),
  (2, 'Professor', 'Johnson', 2),
  (3, 'Professor', 'Williams', 3),
  (4, 'Professor', 'Brown', 4),
  (5, 'Professor', 'Davis', 5),
  (6, 'Professor', 'Wilson', 6),
  (7, 'Professor', 'Anderson', 7),
  (8, 'Professor', 'Taylor', 8),
  (9, 'Professor', 'Martin', 9),
  (10, 'Professor', 'Moore', 10),
  (11, 'Professor', 'Jackson', 11),
  (12, 'Professor', 'Clark', 12),
  (13, 'Professor', 'Thomas', 13),
  (14, 'Professor', 'Lee', 14),
  (15, 'Professor', 'Harris', 15);

INSERT INTO Faculty_Phone (FacultyId, PhoneNumber) VALUES
  (1, '01234567891'),
  (2, '01234567892'),
  (3, '01234567893'),
  (4, '01234567894'),
  (5, '01234567895'),
  (6, '01234567896'),
  (7, '01234567897'),
  (8, '01234567898'),
  (9, '01234567899'),
  (10, '01234567890'),
  (11, '01123456789'),
  (12, '01123456788'),
  (13, '01123456787'),
  (14, '01123456786'),
  (15, '01123456785');

INSERT INTO Grade (GradeId, GradeName, GradePoint, StudentId) VALUES
  (1, 'A', 4.0, 1),
  (2, 'A-', 3.7, 2),
  (3, 'B+', 3.3, 3),
  (4, 'B', 3.0, 4),
  (5, 'B-', 2.7, 5),
  (6, 'C+', 2.3, 6),
  (7, 'C', 2.0, 7),
  (8, 'C-', 1.7, 8),
  (9, 'D+', 1.3, 9),
  (10, 'D', 1.0, 10),
  (11, 'D-', 0.7, 11),
  (12, 'F', 0.0, 12),
  (13, 'A', 4.0, 13),
  (14, 'A-', 3.7, 14),
  (15, 'B+', 3.3, 15);

INSERT INTO Semester (SemesterId, SemesterName, StartDate, EndDate) VALUES
  (1, 'Fall 2021', '2021-09-01', '2021-12-31'),
  (2, 'Spring 2022', '2022-01-01', '2022-04-30'),
  (3, 'Summer 2022', '2022-05-01', '2022-08-31'),
  (4, 'Fall 2022', '2022-09-01', '2022-12-31'),
  (5, 'Spring 2023', '2023-01-01', '2023-04-30'),
  (6, 'Summer 2023', '2023-05-01', '2023-08-31'),
  (7, 'Fall 2023', '2023-09-01', '2023-12-31');

-- Query the tables to verify the data
SELECT * FROM Student;
SELECT * FROM Student_Phone;
SELECT * FROM Department;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Student_Grade;
SELECT * FROM Faculty;
SELECT * FROM Faculty_Phone;
SELECT * FROM Grade;
SELECT * FROM Semester;

--Modify the "GradePoint" column in the Grade table to allow NULL values

ALTER TABLE Grade
ALTER COLUMN GradePoint DECIMAL(3, 2) NULL;

--Increase the length of the "PhoneNumber" column in the Student_Phone table
  
   ALTER TABLE Student_Phone
   ALTER COLUMN PhoneNumber VARCHAR(15);
   

--Add a foreign key constraint to the Faculty_Phone table referencing the Faculty table
 
   ALTER TABLE Faculty_Phone
   ADD CONSTRAINT FK_Faculty_Phone_Faculty
   FOREIGN KEY (FacultyId) REFERENCES Faculty(FacultyId);
   

--Modify the "CreditHours" column in the Course table to allow NULL values

   ALTER TABLE Course
   ALTER COLUMN CreditHours INT NULL;

--Modify the "Location" column in the Department table to allow NULL values 
   ALTER TABLE Department
   ALTER COLUMN Location VARCHAR(100) NULL;
-- join
   select*from Course
  select CourseId,Instructor from Course where CourseId=4
  select*from Faculty
  select FirstName,LastName from Faculty where FacultyId=2
  select *from Student_Grade
  select StudentId,Grade from Student_Grade where Grade ='B+'
  select*from Semester
  select SemesterId,SemesterName from Semester order by SemesterName 
  offset 2 row
  fetch first 2 row only

  Select firstName,LastName,FacultyId ,DepartmentName from Faculty as f
inner join Department as D 
on f.DepartmentId=D.DepartmentId
Select firstName,LastName,FacultyId ,DepartmentName from Faculty as f
left join Department as D 
on f.DepartmentId=D.DepartmentId
Select firstName,LastName,FacultyId ,DepartmentName from Faculty as f
right join Department as D 
on f.DepartmentId=D.DepartmentId
select GradeId,GradeName,GradePoint,Grade from Grade as G
inner join Student_Grade as s
on  s.StudentId=G.StudentId
Select firstName,LastName,FacultyId ,DepartmentName from Faculty as f
left join Department as D 
on f.DepartmentId=D.DepartmentId
Select firstName,LastName,FacultyId ,DepartmentName from Faculty as f
right join Department as D 
on f.DepartmentId=D.DepartmentId

--Change the phone number for a specific student in the Student_Phone table
   
   UPDATE Student_Phone
   SET PhoneNumber = '9876543210'
   WHERE StudentId = 2;
   

--Update the credit hours for a specific course in the Course table
   
   UPDATE Course
   SET CreditHours = 5
   WHERE CourseId = 2;

--Change the department for a specific faculty member in the Faculty table
 
   UPDATE Faculty
   SET DepartmentId = 3
   WHERE FacultyId = 4;

--Change the department head for a specific department in the Department table
 
   UPDATE Department
   SET HeadOfDepartment = 'Professor NewHead'
   WHERE DepartmentId = 4;


--Change the location for a specific department in the Department table
   
   UPDATE Department
   SET Location = 'New Building'
   WHERE DepartmentId = 3;
--5 delete

--Delete a specific enrollment record

DELETE FROM Enrollment WHERE StudentId = 1 AND CourseId = 1;


--Delete a student's phone record

DELETE FROM Student_Phone WHERE StudentId = 2;


--Delete a faculty member's phone record

DELETE FROM Faculty_Phone WHERE FacultyId = 3;


--Delete a specific student's grades

DELETE FROM Student_Grade WHERE StudentId = 4;


--removing a semester record from the Semester table

DELETE FROM Semester WHERE SemesterId = 3;

--5 select

--Retrieve all students who received a grade of 'A'

SELECT * FROM Student_Grade WHERE Grade = 'A';

--Retrieve all faculty members in the Chemistry Department

SELECT * FROM Faculty WHERE DepartmentId = 9;

--Retrieve all courses in the Computer Science Department

SELECT * FROM Course WHERE DepartmentId = 1;

--Retrieve all students who have a grade point higher than 3.5

SELECT * FROM Grade WHERE GradePoint > 3.5;

--Retrieve all courses taught by Professor Brown

SELECT * FROM Course WHERE Instructor = 'Professor Brown';

--5 group by

--Retrieve the average credit hours for courses in each department

SELECT DepartmentId, AVG(CreditHours) AS AverageCreditHours
FROM Course
GROUP BY DepartmentId;


--Retrieve the total number of enrolled students in each course

SELECT CourseId, COUNT(*) AS EnrolledStudents
FROM Enrollment
GROUP BY CourseId;


--Retrieve the highest grade point achieved by each student

SELECT StudentId, MAX(GradePoint) AS HighestGradePoint
FROM Grade
GROUP BY StudentId;

--Retrieve the total credit hours taken by students in each department

SELECT DepartmentId, SUM(CreditHours) AS TotalCreditHours
FROM Course
GROUP BY DepartmentId;

--Retrieve the number of courses taught by each instructor

SELECT Instructor, COUNT(*) AS NumberOfCourses
FROM Course
GROUP BY Instructor;