-- Create Student Table
CREATE TABLE Student(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50),
Email VARCHAR(100)
);

-- Create Club Table
CREATE TABLE Club(
ClubID INT PRIMARY KEY,
ClubName VARCHAR(50),
ClubRoom VARCHAR(20),
ClubMentor VARCHAR(50)
);

-- Create Membership Table
CREATE TABLE Membership(
MembershipID INT PRIMARY KEY,
StudentID INT,
ClubID INT,
JoinDate DATE,
FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
FOREIGN KEY(ClubID) REFERENCES Club(ClubID)
);

-- Insert Student
INSERT INTO Student VALUES
(8,'Rita','rita@email.com');

-- Insert Club
INSERT INTO Club VALUES
(4,'Art Club','R404','Mr. Hari');

-- Display Students
SELECT * FROM Student;

-- Display Clubs
SELECT * FROM Club;

-- JOIN Query
SELECT Student.StudentName,
Club.ClubName,
Membership.JoinDate
FROM Membership
JOIN Student ON Membership.StudentID = Student.StudentID
JOIN Club ON Membership.ClubID = Club.ClubID;
--------------------------------------------------------------------
--Task 6: Reflection
--How Normalization Reduces Data Repetition
--Normalization organizes data into separate tables based on logical relationships. By separating student information and club information, repeated data is eliminated.
--This reduces storage requirements and improves database performance.
--How Normalization Improves Data Accuracy
--When information is stored in one place, updates only need to be performed once. This prevents inconsistencies and ensures that all records remain accurate.
--Why JOIN Operations Are Necessary After Normalization
--Because data is stored in multiple tables, JOIN operations are required to combine related information.
--JOIN queries allow the database to retrieve meaningful results by linking tables using primary and foreign keys.
