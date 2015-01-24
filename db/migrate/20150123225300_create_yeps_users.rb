class CreateYepsUsers < ActiveRecord::Migration
  def change
    create_table :yeps_users do |t|
      t.belongs_to :users, index: true
      t.belongs_to :yeps, index: true
    end
  end
end
