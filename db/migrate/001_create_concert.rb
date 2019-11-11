class CreateConcerts < ActiveRecord::Migration[5.2]

    def change
        create_table :concerts do |t|
            t.string :name
            t.integer :venue_id
            t.integer :price
        end
    end
end