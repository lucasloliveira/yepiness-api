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

  def yep_params
    params.require(:newYep).permit(:title, :content, :description, :url, :image)
  end
end
