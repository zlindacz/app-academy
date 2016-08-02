class ChangeEmailToUsernameDeleteOldUsername < ActiveRecord::Migration
  def change
    remove_column :users, :username

    rename_column :users, :email, :username
  end
end
