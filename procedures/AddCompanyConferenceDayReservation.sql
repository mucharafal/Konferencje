create procedure AddCompanyConferenceDayReservation
	@CompanyName varchar(50),
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int,
	@Participants int
as
begin transaction
	set nocount on
	--finding Company
	Declare @CompanyID as int
	select @CompanyID = CompanyID
	from Companies 
	where CompanyName = @CompanyName

	begin try
		--finding Conference
		Declare @ConferenceDayID as int
		Set @ConferenceDayID = dbo.GetConferenceDayID(@ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber);

		Declare @CompanyReservationID as int
		select @CompanyReservationID = CompanyReservationID
		from CompanyReservations
		inner join ConferenceEditions on CompanyReservations.ConferenceEditionID = ConferenceEditions.ConferenceEditionID
		inner join Conferences on Conferences.ConferenceID = ConferenceEditions.ConferenceID
		where CompanyID = @CompanyID and NumOfEdition = @ConferenceEditionNumber and ConferenceName = @ConferenceName

		if @CompanyReservationID is null
		begin
			exec AddCompanyReservation @CompanyName, @ConferenceName, @ConferenceEditionNumber

			select @CompanyReservationID = CompanyReservationID
			from CompanyReservations
			inner join ConferenceEditions on CompanyReservations.ConferenceEditionID = ConferenceEditions.ConferenceEditionID
			inner join Conferences on Conferences.ConferenceID = ConferenceEditions.ConferenceID
			where CompanyID = @CompanyID and NumOfEdition = @ConferenceEditionNumber and ConferenceName = @ConferenceName
		end

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