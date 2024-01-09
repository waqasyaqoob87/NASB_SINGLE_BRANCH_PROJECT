CREATE TABLE [dbo].[Customer]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NCHAR(10) NULL, 
    [Age] INT NULL, 
    [Gender] NCHAR(10) NULL, 
    [Location] NVARCHAR(50) NULL, 
    [nasb-new-col] NCHAR(10) NULL
)
