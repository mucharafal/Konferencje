use rmucha_a
exec AddCompany 'SGH1', '1sgh@agh.edu.pl', 982632301, 'Poznan', '22-222', 'Staszica c', 114
select * from Companies
exec AddCompanyConferenceDayReservation 'AGH', 'zjazd', 1, 1, 100
select * from Conferences
inner join ConferenceEditions on ConferenceEditions.ConferenceID = Conferences.ConferenceID
exec AddConference 'zjazd', 'delegatów', '20180101', 3, 44, 20, null
exec AddConference 'zjazdMleczarzy', 'delegatów z OSM', '20180109', 3, 44, 20, null
exec AddWorkshop 'Warszaty dojenia krowy', 'ppp', 'Zdzisek Wladek', '00:20:00.0', 20, 'zjazdMleczarzy', 1, 2, '05:00:00', 3
exec AddWorkshopInstance 'Warszaty dojenia krowy', 'zjazdMleczarzy', 1, 3, '05:00:00', 3
select * from Workshops
inner join WorkshopInstances as a on a.WorkshopID = Workshops.WorkshopID
select * from ConferenceDays

exec AddCompanyWorkshopInstanceReservation 'AGH', 'zjazdMleczarzy', 1, 3, 'Warsztaty dojenia krowy', '05:00:00', 2