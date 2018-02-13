class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.date :start_date
      t.date :finish_date
      t.string :country
      
      t.timestamps
    end
  end
end
