create procedure AddContactDetails (
	@Email varchar(50),
	@PhoneNumber numeric(9,0)
) as
begin transaction
	begin try
	insert into ContactDetails
		(
			Email,
			PhoneNumber
		)
		values
		(
			@Email,
			@PhoneNumber
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot add Contact Details. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction