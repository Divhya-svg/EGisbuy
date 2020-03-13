CREATE PROCEDURE [dbo].[DeleteUserIfNotActive]
	@UserIsActive bit
AS
	delete from [dbo].[Users] where RoleId in (select RoleId from UserRoles where UserIsActive=0)
RETURN

