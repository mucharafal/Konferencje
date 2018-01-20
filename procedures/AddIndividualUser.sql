create procedure AddIndividualUser (
	@FirstName varchar(50),
	@LastName varchar(50),
	@Email varchar(50),
	@PhoneNumber numeric(9,0),
	@CityName varchar(50),
	@PostalCode char(6),
	@Street varchar(50),
	@Number int,
	@StudentID int
	) 
as
declare @AddedUserID as int
begin transaction;
--Getting CityID
	set nocount on
	
	begin try
	--inserting Address

		Declare @AddressID as int
		exec @AddressID = AddAddress @CityName, @PostalCode, @Street, @Number

	--Inserting ContactDetails
		
		Declare @ContactID as int
		exec @ContactID = AddContactDetails @Email, @PhoneNumber

		exec @AddedUserID = AddUser @FirstName, @LastName, @ContactID, @AddressID, @StudentID

	end try
	begin catch
		if @@TRANCOUNT > 0 rollback transaction;
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot add Individual user. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
commit transaction
return @AddedUserID