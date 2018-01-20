create view AvaliableConferences as
select ConferenceEditionID, ConferenceName, ConferenceDescription from ConferenceEditions
inner join Conferences on ConferenceEditions.ConferenceID = Conferences.ConferenceID
where ConferenceEditions.Date > getdate() and dbo.AreFreePlaces(ConferenceEditionID)