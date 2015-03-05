class YepController < ApplicationController

  before_action :authenticate_user!

  def create
    yep = Yep.new(yep_params)
    yep.user = current_user

    # TODO: Implement relation between users and yeps
    # yep.users << current_user

    yep.save

    render json: yep
  end


  def sent
    yeps = Yep.where(user_id: current_user.id)

    render json: yeps.order(created_at: :desc)
  end

  def received
    render json: current_user.yeps.order(created_at: :desc)
  end

  private
  def yep_params
    params.require(:newYep).permit(:title, :content, :description, :url, :image)
  end
end
