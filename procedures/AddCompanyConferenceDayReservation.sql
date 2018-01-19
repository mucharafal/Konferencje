create procedure AddCompanyConferenceDayReservation
	@CompanyName varchar(50),
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int,
	@Participants int
as
begin transaction
	set nocount on
	begin try
		--finding Conference
		Declare @ConferenceDayID as int
		Set @ConferenceDayID = dbo.GetConferenceDayID(@ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber);

		Declare @CompanyReservationID as int
		set @CompanyReservationID = dbo.FindCompanyReservation( @CompanyName, @ConferenceName, @ConferenceEditionNumber );

		--inserting CompanyConferenceDayReservations
	
		insert into CompanyConferenceDayReservations
		(
			CompanyReservationID,
			Places,
			ConferenceDayID
		)
		values
		(
			@CompanyReservationID,
			@Participants,
			@ConferenceDayID
		)
	end try
	begin catch
		rollback transaction
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot add CompanyConferenceDayReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch
commit transaction