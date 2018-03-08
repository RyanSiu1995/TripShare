class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :description
      t.references :trip, foreign_key: true
      t.timestamps
    end

    add_index :cities, [:trip_id, :created_at]

  end
end
