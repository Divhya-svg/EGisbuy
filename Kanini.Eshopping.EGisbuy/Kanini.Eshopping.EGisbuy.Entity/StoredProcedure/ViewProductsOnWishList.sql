CREATE PROCEDURE [dbo].[ViewProductsOnWishList]
	@userId int
AS
	select * from [dbo].[Product] inner join WishList wishlist on product.ProductId=wishlist.ProductId and wishlist.UserId= @userId

RETURN


