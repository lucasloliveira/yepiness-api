class ChangeYepsUsersColumns < ActiveRecord::Migration
  def change
    rename_column :yeps_users, :yeps_id, :yep_id
    rename_column :yeps_users, :users_id, :user_id
  end
end
