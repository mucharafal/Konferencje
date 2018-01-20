create view ParticipantsInConferenceDayHelper2 as
select p.ConferenceDayID, w.Participants - s.Participants + count(p.ConferenceDayReservationID) as Participants, r.MaxMembers - count(p.ConferenceDayReservationID) + s.Participants - w.Participants as AvaliablePlaces 
from ConferenceDays as q
left outer join ConferenceDayReservations as p on p.ConferenceDayID = q.ConferenceDayID
left outer join ConferenceEditions as r on q.ConferenceEditionID = r.ConferenceEditionID
left outer join ParticipantsInConferenceDayHelper as s on s.ConferenceDayID = p.ConferenceDayID
left outer join ParticipantsInConferenceDaysFromCompany as w on w.ConferenceDayID = p.ConferenceDayID
group by p.ConferenceDayID, r.MaxMembers, s.Participants, w.Participants