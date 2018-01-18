create procedure AddIndividualUser (
	@FirstName varchar(50),
	@LastName varchar(50),
	@Email varchar(50),
	@PhoneNumber numeric(9,0),
	@CityName varchar(50),
	@PostalCode char(6),
	@Street varchar(50),
	@Number int
	) 
as
begin transaction
--Getting CityID
	Declare @CityID as int
	select @CityID = CityID
	from Cities 
	where CityName = @CityName
	
	begin try
	--inserting Address
		insert into Addresses
		(
			CityID,
			PostalCode,
			Street,
			Number
		)
		values
		(
			@CityID,
			@PostalCode,
			@Street,
			@Number
		)

		Declare @AddressID as int
		select @AddressID = AddressID
		from Addresses 
		where CityID = @CityID and @PostalCode = PostalCode and @Street = Street and @Number = Number

	--Inserting ContactDetails
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

		Declare @ContactID as int
		select @ContactID = ContactID
		from ContactDetails 
		where Email = @Email and @PhoneNumber = PhoneNumber

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
	end try
	begin catch
		rollback transaction;
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
commit transaction

