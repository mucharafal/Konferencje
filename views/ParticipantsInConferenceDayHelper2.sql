create view ParticipantsInConferenceDayHelper2 as
select p.ConferenceDayID,
 isnull(dbo.NumOfParticipantsInConfDayConferenceDayReservations(p.ConferenceDayID), 0) - isnull(dbo.NumEmployeeConfDayRes(p.ConferenceDayID), 0) + isnull(dbo.NumCompanyConferenceDayRes(p.ConferenceDayID), 0) as Participants,
 r.MaxMembers - isnull(dbo.NumCompanyConferenceDayRes(p.ConferenceDayID), 0) + isnull(dbo.NumEmployeeConfDayRes(p.ConferenceDayID), 0) - isnull(dbo.NumOfParticipantsInConfDayConferenceDayReservations(p.ConferenceDayID), 0) as AvaliablePlaces 
from ConferenceDays as p
inner join ConferenceEditions as r on p.ConferenceEditionID = r.ConferenceEditionID

