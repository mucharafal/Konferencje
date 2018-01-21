create procedure RemoveCompanyResercation (
    @CompanyReservationID int
) as
begin transaction
    begin try
        delete from CompanyReservations
        where CompanyReservationID = @CompanyReservationID
        and Paid = 0
    end try
    begin catch
        rollback transaction;
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot remove CompanyyReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch
commit transaction