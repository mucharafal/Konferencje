create procedure AddCompany
	@CompanyName varchar(50),
	@Email varchar(50),
	@PhoneNumber numeric(9,0),
	@CityName varchar(50),
	@PostalCode char(6),
	@Street varchar(50),
	@Number int
as
declare @AddedCompanyID as int
begin transaction
--Getting CityID
	set nocount on
	--inserting Address
	begin try

		Declare @AddressID as int
		exec @AddressID = AddAddress @CityName, @PostalCode, @Street, @Number

		--Inserting ContactDetails

		Declare @ContactID as int
		exec @ContactID = AddContactDetails @Email, @PhoneNumber

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
		if @@TRANCOUNT > 0 rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot add Company. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch

	select @AddedCompanyID = CompanyID
	from Companies
	where @CompanyName = CompanyName

commit transaction
return @AddedCompanyID