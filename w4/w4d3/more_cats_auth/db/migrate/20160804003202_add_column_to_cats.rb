class AddColumnToCats < ActiveRecord::Migration
  def change
      add_column :cats, :user_id, :integer
      add_index :cats, [:name, :user_id], :unique => true
  end
end
