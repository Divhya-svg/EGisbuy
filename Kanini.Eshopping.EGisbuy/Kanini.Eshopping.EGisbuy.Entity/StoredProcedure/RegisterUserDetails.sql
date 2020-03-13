CREATE PROCEDURE [dbo].[RegisterUserDetails]
	@Name varchar = 30,
	@MobileNumber varchar=15,
	@DateOfBirth date,
	@Gender varchar=10,
	@EMailId varchar= 30,
	@Password varchar =20,
	@RoleId int,
	@CreatedDate date,
	@ModifiedDate date,
	@UserIsActive bit
AS
	
	insert into [dbo].[Users](Name,MobileNumber,DateOfBirth,Gender,EMailId,Password,RoleId,CreatedDate,ModifiedDate,UserIsActive
	)values(
	@Name,
	@MobileNumber,
	@DateOfBirth,
	@Gender,
	@EMailId,
	@Password,
	@RoleId,
	@CreatedDate,
	@ModifiedDate,
	@UserIsActive)
RETURN

select * from  [dbo].[Users]
