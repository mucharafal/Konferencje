create procedure RemovePrivateReservation (
    @PrivateRezervationID int
) as
begin transaction 
    declare @ReservationID as int
    begin try
        select @ReservationID = Reservations.ReservationID 
        from Reservations 
        inner join PrivateReservations as pr 
        on pr.ReservationID = Reservations.ReservationID 
        and pr.PrivateReservationID = @PrivateReservationID

        delete from PrivateReservations
        where PrivateReservationID = @PRivateReservationID 
        and Paid = 0

        exec RemoveReservation( @ReservationID )
    end try
    begin catch
		if @@TRANCOUNT > 0 rollback transaction;
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot remove PrivateReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
commit transaction