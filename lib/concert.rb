class Concert < ActiveRecord::Base
    belongs_to :venue
    has_many :artists, through: :artist_concert
end