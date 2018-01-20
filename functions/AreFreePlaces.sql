create function AreFreePlaces (
	@ConferenceEditionID int
) returns bit
as
begin
	declare @sum as int
	select @sum = sum(isnull(AvaliablePlaces, ce.MaxMembers)) from ConferenceDays as cd
	inner join ConferenceEditions as ce on ce.ConferenceEditionID = cd.ConferenceEditionID
	left outer join ParticipantsInConferenceDay as vp on cd.ConferenceDayID = vp.ConferenceDayID
	where @ConferenceEditionID = cd.ConferenceEditionID
	group by cd.ConferenceEditionID
	declare @res as int
	if @sum > 0 
		set @res = 1
	else 
		set @res = 0
	return @res
end
