create procedure RemoveReservation (
    @ReservationID int,
) as
begin transaction
    begin try
        delete from Reservations
        where ReservationID = @ReservationID
    end try
    begin catch
        rollback transaction;
        declare @errorMsg4 nvarchar(2048)
            =   'Cannot remove Reservation. Error message: ' + ERROR_MESSAGE();
            ;Throw 52000, @errorMsg4, 1
    end catch
commit transaction