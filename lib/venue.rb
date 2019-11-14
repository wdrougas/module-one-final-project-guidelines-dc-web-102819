class Venue < ActiveRecord::Base
    has_many :concerts


    def artists
        concert_artists = self.concerts.map do |concert|
            concert.artists
        end
        concert_artists.flatten
    end
end