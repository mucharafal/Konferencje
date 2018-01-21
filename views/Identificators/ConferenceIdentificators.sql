create view ConferenceIdentificators as
select u.UserID, u.Firstname, u.Lastname, cd.ConferenceDayID, cd.ConferenceDayDate from Users
inner join Reservations as r 
on r.UserID = u.UserID 
inner join ConferenceDayReservations as cdr 
on cdr.ReservationID = r.ReservationID
inner join ConferenceDays as cd 
on cdr.ConferenceDayID = cd.ConferenceDayID
where 
