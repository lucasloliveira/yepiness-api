class RemoveYepsUsersId < ActiveRecord::Migration
  def change
    remove_column :yeps_users, :id
  end
end
