CREATE PROCEDURE [dbo].[SearchProduct]
	@ProductName varchar(30)
AS
	select * from  Product where Name like '%'+@ProductName+'%' 

RETURN

