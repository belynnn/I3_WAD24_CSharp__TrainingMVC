CREATE TABLE [dbo].[Student] (
    [Student_Id]    UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [First_Name]    NVARCHAR(64)     NOT NULL,
    [Last_Name]     NVARCHAR(64)     NOT NULL,
    [Email]         NVARCHAR(320)    NOT NULL,
    [CreatedAt]     DATETIME2        NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [PK_Student] PRIMARY KEY ([Student_Id]),
    CONSTRAINT [UK_Student_Email] UNIQUE ([Email])
);