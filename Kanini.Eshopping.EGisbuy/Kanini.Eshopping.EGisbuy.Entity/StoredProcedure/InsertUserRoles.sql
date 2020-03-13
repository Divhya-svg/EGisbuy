CREATE PROCEDURE [dbo].[InsertUserRoles]
	@RoleDescription varchar = 20,
	@RoleNumber int,
	@CreatedDate date,
	@ModifiedDate date,
	@RoleIsActive bit
AS
	INSERT INTO [dbo].[UserRoles] values (
	@RoleDescription,
	@RoleNumber,
	GETDATE(),
	GETDATE(),
	@RoleIsActive)
RETURN 

