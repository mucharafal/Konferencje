create view IndividualUserReservations as
select UserID, ur.ReservationID, pr.Date, pfr.Price, pr.Paid, ConferenceName, NumOfEdition, ConferenceDayDate, WorkshopName from UserReservations as ur
inner join PrivateReservations as pr on pr.ReservationID = ur.ReservationID
inner join PriceForReservation as pfr on pfr.ReservationID = ur.ReservationID