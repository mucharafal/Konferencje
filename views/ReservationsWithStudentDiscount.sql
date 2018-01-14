create view StudentDiscountOnReservation  as
select a.ReservationID,
 CASE 
 when s.CardNumber is null then 0 
 else ISNULL(d.StudentDiscount, 0) end as 'Discount'
 from Reservations as a
inner join ConferenceDayReservations as b on a.ReservationID = b.ReservationID
inner join ConferenceDays as c on b.ConferenceDayID = c.ConferenceDayID
inner join ConferenceEditions as d on c.ConferenceEditionID  = d.ConferenceEditionID
left outer join Students as s on a.UserID = s.UserID