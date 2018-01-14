create view ReservationDate as
select Reservations.ReservationID, PrivateReservations.Date as 'Date' from Reservations
inner join PrivateReservations on Reservations.ReservationID = PrivateReservations.ReservationID
union
select Reservations.ReservationID, CompanyReservations.Date from Reservations
inner join EmployeeConferenceDayReservations on Reservations.ReservationID = EmployeeConferenceDayReservations.ReservationID
inner join CompanyConferenceDayReservations on EmployeeConferenceDayReservations.CompanyConferenceDayReservationID = CompanyConferenceDayReservations.CompanyConferenceDayReservationID
inner join CompanyReservations on CompanyConferenceDayReservations.CompanyReservationID = CompanyReservations.CompanyReservationID
--Rezerwacji od strony Workshopow nie robi�, bo je�li s� workshopy, to musz� by� i dniKonferencji