create procedure AddCompany
	@CompanyName varchar(50),
	@Email varchar(50),
	@PhoneNumber numeric(9,0),
	@CityName varchar(50),
	@PostalCode char(6),
	@Street varchar(50),
	@Number int
as
begin
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
	end try
	begin catch
		declare @errorMsg nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch

	Declare @AddressID as int
	select @AddressID = AddressID
	from Addresses 
	where CityID = @CityID and @PostalCode = PostalCode and @Street = Street and @Number = Number

	--Inserting ContactDetails
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
		declare @errorMsg1 nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg1, 1
	end catch

	Declare @ContactID as int
	select @ContactID = ContactID
	from ContactDetails 
	where Email = @Email and @PhoneNumber = PhoneNumber

	begin try
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
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
end;
