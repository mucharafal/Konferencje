create view UserReservations as
select r.UserID, r.ReservationID, c.ConferenceName, ce.NumOfEdition, cd.ConferenceDayDate, isnull(w.WorkshopName, 'Brak zarezerwowanych warsztatów na dany dzieñ') as WorkshopName from Reservations as r
inner join ConferenceDayReservations as cdr on cdr.ReservationID = r.ReservationID
inner join ConferenceEditions as ce on ce.ConferenceEditionID = r.ConferenceEditionID
inner join ConferenceDays as cd on cd.ConferenceEditionID = ce.ConferenceEditionID and cdr.ConferenceDayID = cd.ConferenceDayID
inner join Conferences as c on c.ConferenceID = ce.ConferenceID
inner join WorkshopInstances as wi on wi.ConferenceDayID = cdr.ConferenceDayID
inner join Workshops as w on w.WorkshopID = wi.WorkshopID
left outer join WorkshopReservations as wr on wr.WorkshopInstanceID = wi.WorkshopInstanceID and r.ReservationID = wr.ReservationID