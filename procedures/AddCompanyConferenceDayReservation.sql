create procedure AddCompanyConferenceDayReservation
	@CompanyReservationID int,
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int,
	@Participants int
as
begin
/*
	--finding Company
	Declare @CompanyID as int
	select @CompanyID = CompanyID
	from Companies 
	where CompanyName = @CompanyName

	if(@CompanyID is null) 
	begin
		declare @errorMsg nvarchar(2048)
			= 'No such company'
		;Throw 52000, @errorMsg, 1
	end
	*/
	--finding Conference
	Declare @ConferenceDayID as int
	Set @ConferenceDayID = dbo.GetConferenceDayID(@ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber);


	--inserting CompanyConferenceDayReservations
	begin try
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
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot add CompanyConferenceDayReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch
	end;
