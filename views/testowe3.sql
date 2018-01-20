select * from ConferenceDays as cd
inner join ConferenceEditions as ce on cd.ConferenceEditionID = ce.ConferenceEditionID
inner join Conferences as c on ce.ConferenceID = c.ConferenceID
inner join WorkshopInstances as wi on wi.ConferenceDayID = cd.ConferenceDayID


print isnull(dbo.GetConferenceDayID('nowa', 1, 20), -1)

select * from ConferenceEditionContent(10)
drop function ConferenceEditionContent
drop function AreFreePlacesWorkshops
drop function AreFreePlacesDay

print dbo.AreFreePlacesDay(27)
