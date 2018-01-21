create procedure RemoveAddress (
    @AddressID
) as 
begin transaction
    begin try
        delete from Addresses
        left join Companies as c 
        on c.AddressID = Addresses.AddressID 
        left join Users as u 
        on u.AddressID = Addresses.AddressID 
        where @AddressID = Addresses.AddressID
    end try
    begin catch
		rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot remove Address. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction 