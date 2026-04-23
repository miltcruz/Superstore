USE [Superstore]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Milton Cruz	
-- Create date: 4/23/2026
-- Update date: 
-- Description:	Update an Address
-- EXEC UpdateAddress @AddressID = 1, @AddressLine1 = '123 Main St', @AddressLine2 = 'Apt 4', @City = 'Anytown', @StateID = 1, CountryID = 1, @PostalCode = 12345, @RegionID = 1, @AddressTypeID = 1, @CustomerID = 1, @CustomerID = 1
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAddress]
	@AddressID INT,
	@AddressLine1 NVARCHAR(25),
	@AddressLine2 NVARCHAR(25),
	@City NVARCHAR(50),
	@StateID INT,
	@CountryID INT,
    @PostalCode INT,
    @RegionID INT,
    @AddressTypeID INT,
    @CustomerID  INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
    	UPDATE dbo.Address
		SET AddressLine1 = @AddressLine1, 
			AddressLine2 = @AddressLine2, 
			City = @City, 
			StateID = @StateID, 
			CountryID = @CountryID, 
			PostalCode = @PostalCode, 
			RegionID = @RegionID, 
			AddressTypeID = @AddressTypeID, 
			CustomerID = @CustomerID,
			DateUpdated = GETDATE()
		WHERE AddressID = @AddressID;
	END TRY
	BEGIN CATCH
    	SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END
