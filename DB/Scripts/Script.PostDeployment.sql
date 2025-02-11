-- Insertion des Professeurs
DECLARE @InsertedProfessorIds TABLE (Professor_Id UNIQUEIDENTIFIER);

INSERT INTO [Professor] ([Professor_Id], [First_Name], [Last_Name], [Email])
OUTPUT inserted.[Professor_Id] INTO @InsertedProfessorIds
VALUES 
(NEWID(), 'John', 'Smith', 'john.smith@example.com'),
(NEWID(), 'Jane', 'Doe', 'jane.doe@example.com');

-- Insertion des Étudiants
DECLARE @InsertedStudentIds TABLE (Student_Id UNIQUEIDENTIFIER);

INSERT INTO [Student] ([Student_Id], [First_Name], [Last_Name], [Email])
OUTPUT inserted.[Student_Id] INTO @InsertedStudentIds
VALUES 
(NEWID(), 'Alice', 'Brown', 'alice.brown@example.com'),
(NEWID(), 'Bob', 'Williams', 'bob.williams@example.com'),
(NEWID(), 'Charlie', 'Johnson', 'charlie.johnson@example.com');

-- Insertion des Cours
DECLARE @InsertedCourseIds TABLE (Course_Id UNIQUEIDENTIFIER);

INSERT INTO [Course] ([Course_Id], [Title], [Credits])
OUTPUT inserted.[Course_Id] INTO @InsertedCourseIds
VALUES 
(NEWID(), 'Mathematics 101', 3),
(NEWID(), 'Computer Science 201', 4),
(NEWID(), 'Physics 301', 3);

-- Mise à jour de la colonne Professor_Id dans la table Course
UPDATE c
SET c.[Professor_Id] = p.[Professor_Id]
FROM [Course] c
JOIN @InsertedProfessorIds p ON 
    (p.[Professor_Id] IN (SELECT Professor_Id FROM [Professor] WHERE [First_Name] = 'John') 
     AND c.[Course_Id] IN (SELECT Course_Id FROM [Course] WHERE [Title] = 'Mathematics 101'))
    OR (p.[Professor_Id] IN (SELECT Professor_Id FROM [Professor] WHERE [First_Name] = 'Jane') 
     AND c.[Course_Id] IN (SELECT Course_Id FROM [Course] WHERE [Title] = 'Computer Science 201'));

-- Inscription des étudiants aux cours
INSERT INTO [Student_Course] ([Student_Id], [Course_Id], [Enrollment_Date]) -- Ajout de la date d'inscription
SELECT s.[Student_Id], c.[Course_Id], GETDATE() -- Date d'inscription actuelle
FROM @InsertedStudentIds s
JOIN @InsertedCourseIds c ON 
   (s.[Student_Id] IN (SELECT Student_Id FROM [Student] WHERE [First_Name] = 'Alice') AND c.[Course_Id] IN (SELECT Course_Id FROM [Course] WHERE [Title] = 'Mathematics 101'))
   OR (s.[Student_Id] IN (SELECT Student_Id FROM [Student] WHERE [First_Name] = 'Bob') AND c.[Course_Id] IN (SELECT Course_Id FROM [Course] WHERE [Title] = 'Computer Science 201'))
   OR (s.[Student_Id] IN (SELECT Student_Id FROM [Student] WHERE [First_Name] = 'Charlie') AND c.[Course_Id] IN (SELECT Course_Id FROM [Course] WHERE [Title] = 'Physics 301'));
