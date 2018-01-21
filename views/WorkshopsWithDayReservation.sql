create view [dbo].[workshopsWithDayReservation] as
	select WorkshopReservations.WorkshopReservationID from ConferenceDayReservations
	inner join Reservations on ConferenceDayReservations.ReservationID = Reservations.ReservationID
	inner join WorkshopReservations on Reservations.ReservationID = WorkshopReservations.ReservationID
	inner join WorkshopInstances on WorkshopReservations.WorkshopInstaceID = WorkshopInstances.WorkshopInstanceID
	where WorkshopInstances.ConferenceDayID = ConferenceDayReservations.ConferenceDayID