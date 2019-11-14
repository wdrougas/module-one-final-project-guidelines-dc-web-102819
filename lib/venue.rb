class Venue < ActiveRecord::Base
    has_many :concerts


    def artists
        concert_artists = self.concerts.map do |concert|
            concert.artists
        end
        concert_artists.flatten
    end

  def venue_number_of_concerts
    self.concerts.count
  end

  def Venue.most_concerts
    self.all.max_by do |venue|
        venue.venue_number_of_concerts
    end
  end

end