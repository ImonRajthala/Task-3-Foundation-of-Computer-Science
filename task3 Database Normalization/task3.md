# College Club Membership Management Database Normalization
## Introduction

Database normalization is an important technique used to organize data
efficiently and reduce redundancy in relational databases. It ensures that
data is stored logically while maintaining consistency and accuracy.

In the given scenario, a college stores student club membership
information in a single table. This approach causes redundancy and
several data anomalies. To improve database efficiency and maintain
data integrity, the table must be normalized into multiple related tables.

This report analyzes the problems in the current table and demonstrates
the normalization process through First Normal Form (1NF), Second
Normal Form (2NF), and Third Normal Form (3NF). It also includes an
Entity Relationship (ER) diagram and SQL queries for managing the
normalized database.

## Task 1: Identify Data Problems

### Problems in the Table

The given table has several issues:

1. **Data Redundancy**
   - Student information such as name and email appears repeatedly.

2. **Duplicate Data**
   - Club information such as room and mentor is repeated multiple times.

3. **Data Inconsistency Risk**
   - If club mentor changes, it must be updated in many rows.

4. **Difficult Data Management**
   - Updating student or club information requires multiple updates.

### Why the Table is Not Normalized

The table is not normalized because it stores multiple types of data
(student data and club data) in a single table. This violates normalization
rules that require separation of independent entities.

### Redundant Data vs Duplicate Data

Redundant Data  
Data that is unnecessarily repeated in a database.

Example  
Student name appears multiple times for each club membership.

Duplicate Data  
Exact copies of data records stored multiple times.

### Data Anomalies

Insert Anomaly  
Occurs when new data cannot be inserted without other unrelated data.

Example  
A new club cannot be added without assigning a student.

Update Anomaly  
Occurs when updating data requires multiple changes.

Example  
If the mentor of a club changes, many rows must be updated.

Deletion Anomaly  
Occurs when deleting data removes important information.

Example  
Deleting the last student in a club may delete club information.

## Step 1: First Normal Form (1NF)

First Normal Form ensures that:
- Each column contains atomic values.
- Each record is unique.

In this table, the combination of **StudentID and ClubName**
can act as a composite primary key.


## Step 2: Second Normal Form (2NF)

Second Normal Form removes partial dependency.

Student information depends only on StudentID.

Club information depends only on ClubName.

Therefore the table is divided into three tables:

### Student Table

StudentID (Primary Key)  
StudentName  
Email

### Club Table

ClubID (Primary Key)  
ClubName  
ClubRoom  
ClubMentor

### Membership Table

MembershipID (Primary Key)  
StudentID (Foreign Key)  
ClubID (Foreign Key)  
JoinDate

## Step 3: Third Normal Form (3NF)

Third Normal Form removes transitive dependencies.

Student attributes depend only on StudentID.

Club attributes depend only on ClubID.

The final structure is:

Student(StudentID, StudentName, Email)

Club(ClubID, ClubName, ClubRoom, ClubMentor)

Membership(MembershipID, StudentID, ClubID, JoinDate)
