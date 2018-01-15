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
	Declare @ConferenceID as int
	select @ConferenceID = ConferenceID
	from Conferences 
	where ConferenceName = @ConferenceName

	if(@ConferenceID is null) 
	begin
		declare @errorMsg1 nvarchar(2048)
			= 'No such conference'
		;Throw 52000, @errorMsg1, 1
	end
	--finding ConferenceEdition
	Declare @ConferenceEditionID as int
	select @ConferenceEditionID = ConferenceEditionID
	from ConferenceEditions
	where ConferenceID = @ConferenceID and ConferenceEditions.NumOfEdition = @ConferenceEditionNumber

	if(@ConferenceEditionID is null) 
	begin
		declare @errorMsg2 nvarchar(2048)
			= 'No such conference edition'
		;Throw 52000, @errorMsg2, 1
	end

	--Przetestowaæ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	Declare @ConferenceDayID as int
	select @ConferenceDayID = b.ConferenceDayID from
	(select top 1 * from 
		(select top (@ConferenceDayNumber) * from ConferenceDays as d where d.ConferenceEditionID = @ConferenceEditionID order by d.ConferenceDayDate ) as c
		order by c.ConferenceDayDate desc
	) as b

	if(@ConferenceEditionID is null) 
	begin
		declare @errorMsg3 nvarchar(2048)
			= 'No such conference day'
		;Throw 52000, @errorMsg3, 1
	end

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
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch
