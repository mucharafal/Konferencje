create function GetWorkshopIDFromWorkshopReservationID (
	@WorkshopReservationID int
) returns int as
begin 
	declare @res as int
	select @res = WorkshopInstanceID
	from WorkshopReservations
	where @WorkshopReservationID = WorkshopReservationID

	return @res
end