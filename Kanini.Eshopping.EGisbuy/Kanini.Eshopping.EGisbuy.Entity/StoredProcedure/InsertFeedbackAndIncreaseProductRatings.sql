CREATE PROCEDURE [dbo].[InsertFeedbackAndIncreaseProductRatings]
	@ProductId int,
	@UserId int,
	@Feedback varchar=MAX,
	@Rating decimal(2,1)
	
AS
	insert into [dbo].[Feedback] values (@ProductId,@UserId,@Feedback,@Rating)
RETURN 
