class YepController < ApplicationController

  before_action :authenticate_user!

  def create
    # yep = params[:newYep]
    yep = Yep.new(yep_params)
    yep.user = current_user
    yep.users << current_user

    yep.save

    render json: yep
  end

  def yep_params
    params.require(:newYep).permit(:title, :content, :description, :url, :image)
  end
end
