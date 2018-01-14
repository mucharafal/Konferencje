create view StudentDiscountOnReservation as
SELECT a.ReservationID, CASE WHEN s.CardNumber IS NULL THEN 0 ELSE ISNULL(d .StudentDiscount, 0) END AS Discount
FROM     dbo.Reservations AS a INNER JOIN
                  dbo.ConferenceDayReservations AS b ON a.ReservationID = b.ReservationID INNER JOIN
                  dbo.ConferenceDays AS c ON b.ConferenceDayID = c.ConferenceDayID INNER JOIN
                  dbo.ConferenceEditions AS d ON c.ConferenceEditionID = d.ConferenceEditionID LEFT OUTER JOIN
                  dbo.Students AS s ON a.UserID = s.UserID