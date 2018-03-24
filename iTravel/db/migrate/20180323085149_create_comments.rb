class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end

    add_index :comments, [:trip_id, :created_at]
    add_index :comments, [:user_id, :created_at]

  end
end
