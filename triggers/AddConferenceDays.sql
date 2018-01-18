create trigger AddConferenceDays 
on ConferenceEditions after insert as
begin transaction
	declare @i as int
	set @i = 0
	
	begin try

		Declare @ConferenceEditionID as int
		select @ConferenceEditionID = ConferenceEditionID
		from inserted

		Declare @ConferenceDayDate as date
		select @ConferenceDayDate = Date
		from inserted

		while @i < (select top 1 NumOfDay from inserted)
		begin 
			insert into ConferenceDays(
				ConferenceEditionID,
				ConferenceDayDate
			) values (
				@ConferenceEditionID,
				@ConferenceDayDate
			)
			set @ConferenceDayDate = dateadd(day, 1, @ConferenceDayDate)
			set @i = @i + 1
		end

	end try
	begin catch
		rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot add ConferenceDay. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction