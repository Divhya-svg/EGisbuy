CREATE PROCEDURE [dbo].[ViewCustomerDetailsByAdmin]
	@RoleNumber int
AS
	SELECT * from Users where RoleId in(select RoleId from UserRoles where @RoleNumber=RoleNumber)
RETURN 

