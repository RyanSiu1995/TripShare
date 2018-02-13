class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.date :start_date
      t.date :finish_date
      t.string :country

      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :trips, [:user_id, :created_at]

  end
end
