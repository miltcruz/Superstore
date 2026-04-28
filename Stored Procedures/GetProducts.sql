USE [Superstore]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Milton Cruz	
-- Create date: 4/28/2026
-- Update date: 
-- Description:	Get all Products
-- EXEC GetProducts
-- =============================================
CREATE PROCEDURE [dbo].[GetProducts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
   		
		SELECT TOP 100 ProductID,
			ProductName,
			CategoryID,
			SubCategoryID,
			UnitPrice,
			ProductKey
			FROM dbo.Product
			--WHERE IsActive = 1;
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END
