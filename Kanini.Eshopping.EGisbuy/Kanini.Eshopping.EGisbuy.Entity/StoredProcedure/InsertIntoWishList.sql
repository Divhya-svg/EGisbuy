CREATE PROCEDURE [dbo].[InsertIntoWishList]
	@userId int,
	@ProductId int,
	@DateOfCartAdd date
AS
	insert into [dbo].[WishList] values (
	@userId,
	@ProductId,
	GETDATE())
RETURN