create function ConferenceEditionContent (
	@ConferenceEditionID int
) returns table as
return (
	select cd.ConferenceDayID, wi.WorkshopInstanceID 
	from ConferenceDays as cd
	inner join WorkshopInstances 
	as wi on cd.ConferenceDayID = wi.ConferenceDayID
	where dbo.AreFreePlacesDay(cd.ConferenceDayID) > 0 
		and dbo.AreFreePlacesWorkshops(WorkshopInstanceID) > 0
		and @ConferenceEditionID = ConferenceEditionID
)