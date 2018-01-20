create function GetConferenceDayID
(
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int
) returns int
as 
begin
	Declare @ConferenceID as int
	select @ConferenceID = ConferenceID
	from Conferences 
	where ConferenceName = @ConferenceName

	if(@ConferenceID is null) 
	begin
		declare @errorMsg1 nvarchar(2048)
			= 'No such conference'
		;return cast(@errorMsg1 as int)
	end
	--finding ConferenceEdition
	Declare @ConferenceEditionID as int
	select @ConferenceEditionID = ConferenceEditionID
	from ConferenceEditions
	where ConferenceID = @ConferenceID and ConferenceEditions.NumOfEdition = @ConferenceEditionNumber

	if(@ConferenceEditionID is null) 
	begin
		declare @errorMsg2 nvarchar(2048)
			= 'No such conference edition'
		;return cast(@errorMsg2 as int)
	end

	--Przetestowaæ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	Declare @ConferenceDayID as int
	select @ConferenceDayID = b.ConferenceDayID from
	(select top 1 * from 
		(select top (@ConferenceDayNumber) * , ROW_NUMBER() over( order by c.ConferenceDayDate desc ) as pozycja  from ConferenceDays as d where d.ConferenceEditionID = @ConferenceEditionID order by d.ConferenceDayDate ) as c
	) as b
	where pozycja = @ConferenceDayNumber

	if(@ConferenceEditionID is null) 
	begin
		declare @errorMsg3 nvarchar(2048)
			= 'No such conference day'
		;return cast(@errorMsg3 as int)
	end
	return @ConferenceDayID;
	end;