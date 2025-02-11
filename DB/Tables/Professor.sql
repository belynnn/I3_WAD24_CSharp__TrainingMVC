CREATE TABLE [dbo].[Professor] (
    [Professor_Id]  UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [First_Name]    NVARCHAR(64)     NOT NULL,
    [Last_Name]     NVARCHAR(64)     NOT NULL,
    [Email]         NVARCHAR(320)    NOT NULL,
    [CreatedAt]     DATETIME2        NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [PK_Professor] PRIMARY KEY ([Professor_Id]),
    CONSTRAINT [UK_Professor_Email] UNIQUE ([Email])
);