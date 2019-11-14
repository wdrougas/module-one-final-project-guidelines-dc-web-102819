class AddDatesToConcerts < ActiveRecord::Migration[6.0]
    def change
        add_column :concerts, :date, :string
    end
end