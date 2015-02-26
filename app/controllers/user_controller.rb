class UserController < ApplicationController

  before_action :authenticate_user!

  def friendCount
    render json: current_user.friends.count
  end

  def createYep
    yep = params[:newYep]
    p 'NOVO YEPPP -----'
    p yep

    render plain: "ok!"
  end
end
