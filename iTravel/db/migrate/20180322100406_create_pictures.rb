class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.attachment :image
      t.text :description
      t.references :trip, foreign_key: true
      t.timestamps
    end

    add_index :pictures, [:trip_id, :created_at]

  end
end
