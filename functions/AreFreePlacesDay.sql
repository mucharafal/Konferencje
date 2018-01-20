create function AreFreePlacesDay (
	@ConferenceDayID int
) returns bit as
begin 
	declare @res as bit
	if (select AvaliablePlaces 
		from ParticipantsInConferenceDay 
		where @ConferenceDayID = ConferenceDayID) > 0
		set @res = 1
	else 
		set @res = 0
	return @res
end
