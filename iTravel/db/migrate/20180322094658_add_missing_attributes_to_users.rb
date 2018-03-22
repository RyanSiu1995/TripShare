class AddMissingAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthdate, :datetime
    add_column :users, :nationality, :string
  end
end
