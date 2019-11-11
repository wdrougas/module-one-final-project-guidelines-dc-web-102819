class CreateConcertArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :concert_artists do |t|
      t.integer :artist_id
      t.integer :concert_id
    end
  end
end
