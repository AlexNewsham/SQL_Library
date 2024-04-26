Use Master
go

/*
**    Purpose: To generate a list of the dates falling within a date range, together with Year, Month, Day Name and Week of the Year Properties
**   Features: You can generate a list of successive days or comment out to switch to the generation of a list of 
**             the first day of each successive month; comment in the INTO clause to produce a persistent table on your chosen database
**        Use: Various - can be used for mapping or computational purposes
** Created by: Alex Newsham
** Created on: 26/01/2024
*/

declare @baseDate date ,@currentDate date
set @baseDate = '2007-01-01' -- '2022-02-01';
set @currentDate = '2050-12-01'

  declare @d table (d date)

  while @baseDate <= @currentDate
  begin
		insert into @d
		select @baseDate

		--Either, increment @baseDate as first day of the month
		--set @baseDate = dateadd(month,1, @baseDate)
		
		-- Or, increment @baseDate for each successive day's date in the WHILE loop's data range
		set @baseDate = dateadd(day,1, @baseDate) 
  end

  set @baseDate = null

  select d ,year(d) as Yr ,month(d) as Mth ,datename(weekday, d) as DayNameLabel ,datepart(iso_week, d) as WeekOfTheYear
  --into dbo.Calendar
  from @d
  order by d