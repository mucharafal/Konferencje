create procedure AddWorkshopInstance (
	@WorkshopName varchar(50),
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int,
	@Time time,
	@MaxMembers money
) as
begin transaction
	begin try

		declare @WorkshopID as int
		select @WorkshopID = WorkshopID
		from Workshops
		where @WorkshopName = WorkshopName

		declare @ConferenceDayID as int
		set @ConferenceDayID = dbo.GetConferenceDayID(@ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber)

		insert into WorkshopInstances(
			WorkshopID,
			ConferenceDayID,
			Time,
			MaxMembers
		) values (
			@WorkshopID,
			@ConferenceDayID,
			@Time,
			@MaxMembers
		)

		end try
	begin catch
		if @@TRANCOUNT > 0 rollback transaction;
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot add Workshop instance. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
commit transaction