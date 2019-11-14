class Venue < ActiveRecord::Base
    has_many :concerts


    # def artists
    #     self.concerts.map do |concert|
    #         concert.artists
    #     end
    # end
end