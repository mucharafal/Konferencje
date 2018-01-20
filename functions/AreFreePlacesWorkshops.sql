create function AreFreePlacesWorkshops (
	@WorkshopInstanceID int
) returns bit as
begin 
	declare @res as bit
	if isnull((select AvaliablePlaces from ParticipantsInWorkshopInstance where @WorkshopInstanceID = WorkshopInstanceID), 1) > 0
		set @res = 1
	else 
		set @res = 0
	return @res
end