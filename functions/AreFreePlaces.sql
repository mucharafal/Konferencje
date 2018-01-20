create function AreFreePlaces (
	@ConferenceEditionID int
) returns bit
as
begin
	declare @sum as int
	select @sum = sum(AvaliablePlaces) from ParticipantsInConferenceDay as vp
	inner join ConferenceDays as cd on cd.ConferenceDayID = vp.ConferenceDayID
	where @ConferenceEditionID = cd.ConferenceEditionID
	group by cd.ConferenceEditionID
	declare @res as int
	if @sum > 0 
		set @res = 1
	else 
		set @res = 0
	return @res
end