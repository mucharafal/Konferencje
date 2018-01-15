create view ParticipantsInConferenceDay as
select p.ConferenceDayID, s.Participants + count(p.ConferenceDayReservationID) as Participants, r.MaxMembers - count(p.ConferenceDayReservationID) - s.Participants as AvaliablePlaces 
from ConferenceDayReservations as p
inner join ConferenceDays as q on p.ConferenceDayID = q.ConferenceDayID
inner join ConferenceEditions as r on q.ConferenceEditionID = r.ConferenceEditionID
inner join ParticipantsInConferenceDayHelper as s on s.ConferenceDayID = p.ConferenceDayID
group by p.ConferenceDayID, r.MaxMembers, s.Participants
