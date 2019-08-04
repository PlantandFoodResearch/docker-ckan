-- Create a new table called 'TestHello' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.TestHello', 'U') IS NOT NULL
DROP TABLE SchemaName.TestHello
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.TestHello
(
  TestHelloId INT NOT NULL PRIMARY KEY, -- primary key column
  Column1 [NVARCHAR](50) NOT NULL,
  Column2 [NVARCHAR](50) NOT NULL
  -- specify more columns here
);
GO