CREATE TABLE [dbo].[Course] (
    [Course_Id]     UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [Title]         NVARCHAR(100)    NOT NULL,
    [Credits]       TINYINT          NOT NULL CHECK ([Credits] BETWEEN 1 AND 10),
    [Professor_Id]  UNIQUEIDENTIFIER NULL,
    [CreatedAt]     DATETIME2        NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [PK_Course] PRIMARY KEY ([Course_Id]),
    CONSTRAINT [UK_Course_Title] UNIQUE ([Title]),
    CONSTRAINT [FK_Course_Professor] FOREIGN KEY ([Professor_Id]) REFERENCES [dbo].[Professor]([Professor_Id]) ON DELETE SET NULL
);