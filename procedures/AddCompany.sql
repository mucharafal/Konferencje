
create procedure AddCompany
	@CompanyName varchar(50),
	@Email varchar(50),
	@PhoneNumber numeric(9,0),
	@CityName varchar(50),
	@PostalCode char(6),
	@Street varchar(50),
	@Number int
as
begin transaction
--Getting CityID
	Declare @CityID as int
	select @CityID = CityID
	from Cities 
	where CityName = @CityName

	--inserting Address
	begin try
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

		insert into Companies
		(
			CompanyName,
			ContactID,
			AddressID
		)
		values
		(
			@CompanyName,
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
