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

	Declare @ConferenceDayID as int
	
	select @ConferenceDayID = c.ConferenceDayID from
	( select * , ROW_NUMBER () over ( order by d.ConferenceDayDate ) as rn
		from ConferenceDays as d 
		where d.ConferenceEditionID = @ConferenceEditionID 
	) as c
	where c.rn = @ConferenceDayNumber

	if(@ConferenceDayID is null) 
	begin
		declare @errorMsg3 nvarchar(2048)
			= 'No such conference day'
		;return cast(@errorMsg3 as int)
	end
	return @ConferenceDayID;
	end;