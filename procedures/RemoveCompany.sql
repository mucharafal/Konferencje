create procedure RemoveCompany (
    @CompanyID int
) as
declare @AddressID as int
begin transaction
    begin try
        select @AddressID = AddressID from Companies
        left join CompanyReservations as cr 
        on cr.CompanyID = Companies.CompanyID 
        where cr.CompanyID = null
        and @CompanyID = Companies.CompanyID 
        if @CompanyID <> null
            delete from Companies
            where @CompanyID = CompanyID
            exec RemoveAddress @AddressID;
	end try
    begin catch
        if @@TRANCOUNT > 0 rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot remove Company. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction
        