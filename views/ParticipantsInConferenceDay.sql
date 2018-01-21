create view ParticipantsInConferenceDay as
select cd.ConferenceDayID, isnull(p.Participants, 0) as Participants, isnull(p.AvaliablePlaces, ce.MaxMembers) as AvaliablePlaces  from ConferenceDays as cd
inner join ConferenceEditions as ce on ce.ConferenceEditionID = cd.ConferenceEditionID
inner join ParticipantsInConferenceDayHelper2 as p on p.ConferenceDayID = cd.ConferenceDayID