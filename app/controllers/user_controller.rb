class UserController < ApplicationController

  before_action :authenticate_user!

  def friendsCount
    render json: current_user.friends.count
  end

  def friends
    render json: current_user.friends
  end

  def addFriend

    if params[:friendId].to_i == current_user.id
      render json: {message: 'user.addFriend.failed.self'}
      return
    end

    friend = User.find(params[:friendId])
    current_user.friends << friend

    current_user.save

    render json: {message: 'user.addFriend.success'}
  end

  def byId
    user = User.find(params[:id])
    render json: user
  end

end
