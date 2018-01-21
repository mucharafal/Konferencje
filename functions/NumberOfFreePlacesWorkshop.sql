create function NumberOfFreePlacesWorkshop (
	@WorkshopInstanceID int
) returns int as
begin
	declare @ap as int
	select @ap = AvaliablePlaces 
	from ParticipantsInWorkshopInstance
	where WorkshopInstanceID = @WorkshopInstanceID
	return @ap
end