create function GetConferenceDayIDFromConferenceDayReservationID (
	@ConferenceDayReservationID int
) returns int as
begin 
	declare @res as int
	select @res = ConferenceDayID
	from ConferenceDayReservations
	where @ConferenceDayReservationID = ConferenceDayReservationID

	return @res
end