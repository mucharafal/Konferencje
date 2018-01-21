create procedure RemoveAddress (
    @AddressID int
) as 
begin transaction
    begin try
        delete from Addresses
        where @AddressID = Addresses.AddressID
    end try
    begin catch
		rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot remove Address. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction 