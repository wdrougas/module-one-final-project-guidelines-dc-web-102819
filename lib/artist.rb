class Artist < ActiveRecord::Base
    has_many :concert_artists
    has_many :concerts, through: :concert_artists
    

    def venues
        self.concerts.map do |concert|
            concert.venue
        end
    end
    
end