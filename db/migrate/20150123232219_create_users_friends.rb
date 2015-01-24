class CreateUsersFriends < ActiveRecord::Migration
  def change
    create_table :users_friends, :id => false do |t|
      t.integer :user_id
      t.integer :friend_id
      t.datetime :friends_since
      t.boolean :accepted, :default => false
      t.boolean :active, :default => true
    end
  end
end
