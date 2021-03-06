class User < ActiveRecord::Base

  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_friendship

  # has_and_belongs_to_many :friends,
  #                         :class_name => 'User',
  #                         :join_table => 'users_friends',
  #                         :foreign_key => 'user_id',
  #                         :association_foreign_key => 'friend_id'

  # has_many :friendships
  # has_many :pending_friends,
  #          :through => :friendships,
  #          :source => :friend,
  #          :conditions => "accepted = false"
  # has_many :friends, through: :friendships

  has_and_belongs_to_many :yeps,
                          :join_table => 'yeps_users',
                          :foreign_key => 'user_id'

# This is a sql query to insert and remove friends
#                           :insert_sql => 'insert into friendships (`user_id`, `friend_id`) values
# (#{id}, #{record.id}), (#{record.id}, #{id})',
#                           :delete_sql => 'delete from friendships where (user_id = #{id} and friend_id
# = #{record.id}) or (user_id = #{record.id} and friend_id = #{id})'


  # def add_friend(friend)
  #   self.friends.push_with_attributes(friend, :friends_since => Time.now()) unless self.friends.include?(friend) || friend == self
  # end
  #
  # def accept_friend(friend)
  #   sql = User.sanitize(["UPDATE users_friends SET friends_since = ?, accepted = ? WHERE user_id = ? AND friend_id = ?", Time.now(), 1, self.id, friend].flatten)
  #   self.connection.update(sql, "Accept Friend")
  # end

end
