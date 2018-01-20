select * from AvaliableConferences

select * from dbo.ConferenceEditionContent(10)

select * from ConferenceEditions
select * from WorkshopInstances


exec AddConference 'nowa', 'konferencje', '20180202', 1, 20, 20, null
exec AddWorkshop 'ala', 'aaa', 'Koza Pa', '00:20:00', 20, 'nowa', 1, 2, '03:00:00', 20
exec AddWorkshopInstance 'ala', 'nowa', 1, 3, '03:00:00', 20
exec AddWorkshopInstance 'ala', 'nowa', 1, 4, '03:00:00', 20