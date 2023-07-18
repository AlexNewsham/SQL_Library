


			-- CREATE DATE REFERENCE FRAME TO MAP TO
			declare @baseDate date ,@currentDate date
			set @baseDate = '2021-07-01';  -- THIS IS THE BASELINE DATE FOR AOW
			set @currentDate = convert(date,Getdate()); --'2064-08-01'; -- '2028-08-01'; --'2092-08-01';  --'2028-08-01'; --
			begin
			  declare @dateFrame table (dt date)

			  while @baseDate <= @currentDate
			  begin
					insert into @dateFrame
					select @baseDate
		
					-- Increment @baseDate for each successive day's date in the WHILE loop's data range
					set @baseDate = dateadd(day,1, @baseDate) 
			  end

			  set @baseDate = null
			end


            declare @academicYearMonthOrder table (SchoolMonth varchar(2), Seq int)
			insert into @academicYearMonthOrder 
			values('9', 0),('10',1),('11',2),('12',3),('1',4),('2',5),('3',6),('4',7),('5',8),('6',9),('7',10),('8',11)

			declare @academicYearDF table (Yr varchar(4), Mth varchar(2), SchoolYrSeq int, AcademicYear varchar(7), indexId int identity(1,1)) 
			insert into @academicYearDF
			select distinct year(df.dt) as Yr ,month(df.dt) as Mth ,mo.Seq
			       ,case when Seq between 4 and 11 then cast((year(df.dt)-1) as varchar(4)) + '-' + cast(right(year(df.dt),2) as varchar(2)) 
				         else cast(( year(df.dt)) as varchar(4)) + '-' + cast(right(year(df.dt)+1,2) as varchar(2))
						 end as AcademicYear
			from @dateFrame df
			left join @academicYearMonthOrder  mo
			       on month(df.dt) = mo.SchoolMonth

		    select * from @academicYearDF

