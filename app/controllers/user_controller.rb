class UserController < ApplicationController

  before_action :authenticate_user!

  def friends
    render json: current_user.friends
  end

  def friendsCount
    render json: current_user.friends.count
  end

  def addFriend
    friendId = params[:friendId].to_i
    if friendId == current_user.id
      render json: {message: 'user.friend.add.failed'}
      return
    end

    friend = User.find(friendId)
    friendship = current_user.friend_request(friend)

    render json: {message: 'user.friend.add.success', response: friendship}
  end

  def sentRequests
    render json: {message: 'user.friend.sent.success', response: current_user.pending_friends}
  end


  def receivedRequests
    render json: {message: 'user.friend.received.success', response: current_user.requested_friends}
  end

  def acceptFriend
    friend = User.find(params[:friendId])
    current_user.accept_request(friend)

    render json: {message: 'user.friend.accept.success', response: friend}
  end

  def declineFriend
    friend = User.find(params[:friendId])
    current_user.decline_request(friend)
    render json: {message: 'user.friend.decline.success', response: friend}
  end

  def removeFriend
    friend = User.find(params[:friendId])
    curent_user.remove_friend(friend)
    render json: {message: 'user.friend.remove.success', response: friend}
  end

  def byId
    user = User.find(params[:id])
    render json: user
  end

end
