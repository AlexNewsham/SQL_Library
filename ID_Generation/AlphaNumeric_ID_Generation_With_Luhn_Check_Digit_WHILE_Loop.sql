use [master]
go

/*
** ~\SQL_Library\ID_Generation\AlphaNumeric_ID_Generation_With_Luhn_Check_Digit_WHILE_Loop.sql
** created by: Alex Newsham
** created on: 06/05/2022
** purpose: This script employs a table variable (i.e. a temporary table) and a while loop to dynamically generate and store an alphanumeric study ID with a Luhn check digit
**			and outputs a result set. You can modify the script so that it stores the result in a designated persistent table
** N.B. This script presupposes that the accompanying CREATE FUNCTION [Utils].[GetLuhn] script has been run on a system or a designated database that you intend to use 
**      to run this script
*/

declare @IndexID int, @maxIndexID int, @iCount int

declare @t table (IndexID int, Id int, Id_WithLuhnCheckDigit int, StudyId char(15))

/*
** N.B. IF YOU INCREASE THE SIZE OF THIS NUMBER THEN CHECK YOU HAVE THE CORRECT CHARACTER LENGTH SPECIFIED FOR STAGE 3  
*/
set @maxIndexID = 899999 -- 99999 --  
set @iCount = 1

while @iCount <= @maxIndexID
begin
	insert into @t(IndexID)
	select @iCount

	set @iCount = @iCount + 1
end

set @iCount = null

-- STAGE 1 -- CREATE A LIST OF BASE IDENTIFIERS
update @t
set Id = 100000 + IndexID

-- STAGE 2 -- CREATE A NUMERIC ID WITH A LUHN CHECK DIGIT FOR ALL THE CORRESPONDING BASE IDENTIFIERS 
update @t
set Id_WithLuhnCheckDigit = [Utils].[GetLuhn](Id)

-- STAGE 3 - ADD YOUR ALPHANUMERIC IDENTIFIERS TO THE @t TEMPORARY TABLE
update @t
set StudyId = cast('R'+cast(Id_WithLuhnCheckDigit as char) as Char(15))

select * from @t order by 1



