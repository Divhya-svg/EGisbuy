CREATE PROCEDURE [dbo].[ViewFeedbackDetailsByAdmin]
	
AS
	SELECT Rating,Feedback from [dbo].[Feedback]
RETURN 
