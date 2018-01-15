create view ParticipantsInConferenceDay as
select p.ConferenceDayID, count(p.ConferenceDayReservationID) as Participants, r.MaxMembers - count(p.ConferenceDayReservationID) as AvaliablePlaces 
from ConferenceDayReservations as p
inner join ConferenceDays as q on p.ConferenceDayID = q.ConferenceDayID
inner join ConferenceEditions as r on q.ConferenceEditionID = r.ConferenceEditionID
group by p.ConferenceDayID, r.MaxMembers
