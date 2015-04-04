class YepController < ApplicationController

  before_action :authenticate_user!

  def create
    yep = Yep.new(yep_params)
    yep.user = current_user
    friends = params[:newYep][:friends]

    friends.each do |friend|
      yep.users << User.find(friend[:id])
    end

    # TODO: Implement relation between users and yeps
    # yep.users << current_user

    yep.save

    render json: yep
  end


  def sent
    yeps = Yep.where(user_id: current_user.id)
    p 'sent'
    p yeps

    render json: yeps.order(created_at: :desc)
  end

  def received
    receivedYeps = Yep.joins(:users).where(users: {id: current_user.id})
    p 'received'
    p receivedYeps
    render json: receivedYeps.order(created_at: :desc)
  end

  private
  def yep_params
    params.require(:newYep).permit(:title, :content, :description, :url, :image, :friends)
  end
end
