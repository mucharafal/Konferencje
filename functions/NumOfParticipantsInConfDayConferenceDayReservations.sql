create function NumOfParticipantsInConfDayConferenceDayReservations (
	@ConferenceDayID int
) returns int as
begin 
	declare @res as int
	select @res = count(ConferenceDayReservationID)
	from ConferenceDayReservations
	where ConferenceDayID = @ConferenceDayID

	return @res
end