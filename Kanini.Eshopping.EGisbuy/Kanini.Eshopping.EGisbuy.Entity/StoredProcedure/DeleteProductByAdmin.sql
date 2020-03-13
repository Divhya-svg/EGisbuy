CREATE PROCEDURE [dbo].[DeleteProductByAdmin]
	@ProductId int
AS
	DELETE from [dbo].[Product] where ProductId=@ProductId
RETURN

