class ChangeUser < ActiveRecord::Migration
  def change
    remove_column :users, :name, :email

    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
