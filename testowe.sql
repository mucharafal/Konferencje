use rmucha_a
exec AddCompany 'SGH1', '1sgh@agh.edu.pl', 982632301, 'Poznan', '22-222', 'Staszica c', 114
select * from Companies
exec AddCompanyConferenceDayReservation 'AGH', 'Ala ma kota i papugê', 2, 1, 10
select * from Conferences
inner join ConferenceEditions on ConferenceEditions.ConferenceID = Conferences.ConferenceID
exec AddConference 'zjazd', 'delegatów', '20180101', 3, 44, 20, null