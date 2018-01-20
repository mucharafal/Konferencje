create procedure AddIndividualUserConferenceDayReservation (
	@UserID int,
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int
) as
begin transaction
	declare @ConferenceDayID as int
	set @ConferenceDayID = dbo.GetConferenceDayID(@ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber);

	declare @ReservationID as int
	select @ReservationID = ReservationID
	from Reservations as r
	inner join ConferenceDays as cd on r.ConferenceEditionID = cd.ConferenceEditionID
	where r.UserID = @UserID

	if @ReservationID is null
	begin
		exec AddReservation @UserID, @ConferenceName, @ConferenceEditionNumber

		select @ReservationID = ReservationID
		from Reservations as r
		inner join ConferenceDays as cd on r.ConferenceEditionID = cd.ConferenceEditionID
		where r.UserID = @UserID
	end

