create function FindCompanyReservation (
	@CompanyName varchar(50),
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int
) returns int
as
begin 
		Declare @CompanyID as int
		select @CompanyID = CompanyID
		from Companies 
		where CompanyName = @CompanyName

		Declare @CompanyReservationID as int
		select @CompanyReservationID = CompanyReservationID
		from CompanyReservations
		inner join ConferenceEditions on CompanyReservations.ConferenceEditionID = ConferenceEditions.ConferenceEditionID
		inner join Conferences on Conferences.ConferenceID = ConferenceEditions.ConferenceID
		where CompanyID = @CompanyID and NumOfEdition = @ConferenceEditionNumber and ConferenceName = @ConferenceName


		return @CompanyReservationID
end