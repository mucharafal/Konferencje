create procedure RemoveConferenceDayReservation (
    @ConferenceDayReservationID int
) as 
begin transaction
    begin try
        delete from ConferenceDayReservations
        where ConferenceDayReservationID = @ConferenceDayReservationID
    end try
    begin catch
        rollback transaction;
		declare @errorMsg varchar(2048) = 
			'Cannot remove ConferenceDayReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction 