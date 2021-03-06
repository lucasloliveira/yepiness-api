class Yep < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_and_belongs_to_many :users,
                          :join_table => 'yeps_users',
                          :foreign_key => 'yep_id'
end
