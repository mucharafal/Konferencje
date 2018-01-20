create procedure AddContactDetails (
	@Email varchar(50),
	@PhoneNumber numeric(9,0)
) as
declare @AddedContactDetails as int
begin transaction
	set nocount on
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
	select @AddedContactDetails = ContactDetails.ContactID
	from ContactDetails
	where @Email = Email and @PhoneNumber = PhoneNumber
commit transaction
return @AddedContactDetails