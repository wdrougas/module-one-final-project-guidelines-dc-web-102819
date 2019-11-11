require 'pry'

Artist.destroy_all
Concert.destroy_all
Venue.destroy_all
ConcertArtist.destroy_all

drake = Artist.create(:name=>'Drake')
mj = Artist.create(:name=>'Michael Jackson')
beyonce = Artist.create(:name=>'Beyonce')
adele = Artist.create(:name=>'Adele')
future = Artist.create(:name=>'Future')


concert_hall = Venue.create(:name=>'Concert Hall', :street_address=>'1234 Main Street', :zip=>20005)
boogie_hall = Venue.create(:name=>'Boogie Hall', :street_address=>'1234 U Street', :zip=>20003)
warner_theatre = Venue.create(:name=>'Warner Theatre', :street_address=>'513 13th Street NW', :zip=>20004)
echostage = Venue.create(:name=>'Echostage', :street_address=>'2135 Queens Chapel Rd NE', :zip=>20018)
u_street = Venue.create(:name=>'U Street Music Hall', :street_address=>'1115A U St NW', :zip=>20009)


holiday_bash = Concert.create(:name=>'Holiday Bash 2019', :venue_id=> concert_hall.id, :price=> 100)
summer_jam = Concert.create(:name=>'Summer Jam 2020', :venue_id=> u_street.id, :price=> 200)
adele_tour = Concert.create(:name=>'Adele 2020 Tour', :venue_id=> warner_theatre.id, :price=> 50)
spring_fest = Concert.create(:name=>'SpringFest 2020', :venue_id=> echostage.id, :price=> 75)
fall_fest = Concert.create(:name=>'FallFest 2020', :venue_id=> u_street.id, :price=> 80)


ac1 = ConcertArtist.create(:concert_id=> holiday_bash.id, :artist_id=> drake.id)
ac2 = ConcertArtist.create(:concert_id=> holiday_bash.id, :artist_id=> mj.id)
ac3 = ConcertArtist.create(:concert_id=> holiday_bash.id, :artist_id=> beyonce.id)
ac4 = ConcertArtist.create(:concert_id=> holiday_bash.id, :artist_id=> adele.id)
ac5 = ConcertArtist.create(:concert_id=> summer_jam.id, :artist_id=> drake.id)
ac6 = ConcertArtist.create(:concert_id=> summer_jam.id, :artist_id=> mj.id)
ac7 = ConcertArtist.create(:concert_id=> adele_tour.id, :artist_id=> adele.id)
ac8 = ConcertArtist.create(:concert_id=> spring_fest.id, :artist_id=> mj.id)
ac9 = ConcertArtist.create(:concert_id=> spring_fest.id, :artist_id=> adele.id)
ac10 = ConcertArtist.create(:concert_id=> spring_fest.id, :artist_id=> future.id)
ac11 = ConcertArtist.create(:concert_id=> fall_fest.id, :artist_id=> mj.id)
ac12 = ConcertArtist.create(:concert_id=> fall_fest.id, :artist_id=> beyonce.id)
ac13 = ConcertArtist.create(:concert_id=> fall_fest.id, :artist_id=> adele.id)
ac14 = ConcertArtist.create(:concert_id=> fall_fest.id, :artist_id=> future.id)

binding.pry