CREATE TABLE [dbo].[Student_Course] (
    [Student_Id]    UNIQUEIDENTIFIER NOT NULL,
    [Course_Id]     UNIQUEIDENTIFIER NOT NULL,
    [Enrollment_Date] DATETIME2      NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [PK_Student_Course] PRIMARY KEY ([Student_Id], [Course_Id]),
    CONSTRAINT [FK_Student_Course_Student] FOREIGN KEY ([Student_Id]) REFERENCES [dbo].[Student]([Student_Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Student_Course_Course] FOREIGN KEY ([Course_Id]) REFERENCES [dbo].[Course]([Course_Id]) ON DELETE CASCADE
);