declare @iNum int, @iMsg varchar (500)

set @iNum = 1

  set @iMsg = 'Your 3 good deeds are: '
print @iMsg

While @iNum <=4 
Begin

	/* Do 3 worthwihile things today */

	if @iNum = 1
		begin
			  set @iMsg = '1. Leave the car at home and walk to work!'
			print @iMsg
		end
	else if @iNum = 2
		begin
			  set @iMsg = '2. Plant a tree!'
			print @iMsg
		end
	else if @iNum = 3
		begin
			  set @iMsg = '3. Make someone smile!'
			print @iMsg
		end
	else 
		begin
		      set @iMsg = 'Don''t forget to do your 3 good deeds of the day!'
		    print @iMsg 
		end

	set @iNum = @iNum +1
End