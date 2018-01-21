create function NumOfParticipantsInWorkshopReservations (
	@WorkshopInstanceID int
) returns int as
begin 
	declare @res as int
	select @res = count(WorkshopReservationID)
	from WorkshopReservations
	where WorkshopInstanceID = @WorkshopInstanceID

	return @res
end