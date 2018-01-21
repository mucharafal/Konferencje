create function NumberOfFreePlacesConferenceDay (
	@ConferenceDayID int
) returns int as
begin
	declare @ap as int
	select @ap = AvaliablePlaces 
	from ParticipantsInConferenceDay 
	where ConferenceDayID = @ConferenceDayID
	return @ap
end