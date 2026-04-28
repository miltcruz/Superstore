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
-- Description:	Create a Product
-- EXEC CreateProduct @ProductName = 'New Product', @CategoryID = 1, @SubCategoryID = 1, @UnitPrice = 0.00
-- =============================================
CREATE PROCEDURE [dbo].[CreateProduct]
	@ProductName NVARCHAR(150),
	@CategoryID INT,
	@SubCategoryID INT,
    @UnitPrice DECIMAL(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
   		INSERT INTO dbo.Product(ProductName, CategoryID, SubCategoryID, UnitPrice)
		VALUES(@ProductName, @CategoryID, @SubCategoryID, @UnitPrice);
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END
