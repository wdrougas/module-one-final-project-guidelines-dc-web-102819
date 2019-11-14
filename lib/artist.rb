class Artist < ActiveRecord::Base
    has_many :concert_artists
    has_many :concerts, through: :concert_artists
    

    def venues
        self.concerts.map do |concert|
            concert.venue
        end
    end

    def artist_number_of_concerts
        self.concerts.count
    end

    def Artist.most_concerts
        self.all.max_by do |artist|
            artist.artist_number_of_concerts
        end
    end

    
end