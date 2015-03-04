class UserController < ApplicationController

  before_action :authenticate_user!

  def friendCount
    render json: current_user.friends.count
  end

end
