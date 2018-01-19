create procedure AddWorkshop (
	@WorkshopName varchar(50),
	@WorkshopDescription varchar(5000),
	@Mentor varchar(50),
	@Duration time,
	@Price money,
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int,
	@Time time,
	@MaxMembers money
) as
begin transaction
	begin try
		declare @ConferenceDayID as int
		set @ConferenceDayID = dbo.GetConferenceDayID(@ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber)

		insert into Workshops (
			WorkshopName,
			WorkshopDescription,
			Mentor,
			Duration,
			Price
		) values (
			@WorkshopName,
			@WorkshopDescription,
			@Mentor,
			@Duration,
			@Price
		)

		exec AddWorkshopInstance @WorkshopName, @ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber, @Time, @MaxMembers
	end try
	begin catch
		if @@TRANCOUNT > 0 rollback transaction;
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot add Workshop. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
commit transaction