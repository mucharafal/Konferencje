create procedure AddUser (
	@FirstName varchar(50),
	@LastName varchar(50),
	@ContactID int,
	@AddressID int,
	@StudentID int
)
as 
declare @AddedUserID as int
begin transaction
	set nocount on		
	
	begin try

		insert into Users
		(
			FirstName,
			LastName,
			ContactID,
			AddressID
		)
		values
		(
			@FirstName,
			@LastName,
			@ContactID,
			@AddressID
		)

		select @AddedUserID = UserID
		from Users
		where @FirstName = FirstName and @LastName = LastName and @AddressID = AddressID and @ContactID = ContactID

		if (@StudentID is not null)
		begin 
			insert into Students(
				UserID,
				CardNumber
			) values (
				@AddedUserID,
				@StudentID
			)
		end

	end try
	begin catch
		if @@TRANCOUNT > 0 rollback transaction;
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot add User. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
	
commit transaction
return @AddedUserID