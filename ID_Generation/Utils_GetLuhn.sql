USE [master]
GO
/****** Object:  UserDefinedFunction [Utils].[GetLuhn]    Script Date: 30/06/2023 15:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** author: Alex Newsham
** created: 06/05/2022
** Purpose to add check digits to a submitted ID and return the value
** The ID Generation scripts in this folder assume this script has been run on the database you wish to use to run the ID generation scripts 
*/

CREATE FUNCTION	[Utils].[GetLuhn]
(
	@Luhn VARCHAR(7999)
)
RETURNS VARCHAR(8000)
WITH SCHEMABINDING
AS

BEGIN
	IF @Luhn LIKE '%[^0-9]%'
		RETURN @Luhn

	DECLARE	@Index SMALLINT,
		@Multiplier TINYINT,
		@Sum INT,
		@Plus TINYINT

	SELECT	@Index = LEN(@Luhn),
		@Multiplier = 2,
		@Sum = 0

	WHILE @Index >= 1
		SELECT	@Plus = @Multiplier * CAST(SUBSTRING(@Luhn, @Index, 1) AS TINYINT),
			@Multiplier = 3 - @Multiplier,
			@Sum = @Sum + @Plus / 10 + @Plus % 10,
			@Index = @Index - 1

	RETURN	@Luhn + CASE WHEN @Sum % 10 = 0 THEN '0' ELSE CAST(10 - @Sum % 10 AS CHAR) END
END






