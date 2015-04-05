class YepController < ApplicationController

  before_action :authenticate_user!

  def create
    yep = Yep.new(yep_params)
    yep.user = current_user
    friends = params[:newYep][:friends]

    friends.each do |friend|
      if friend[:id].nil?
        u = User.where(email: friend[:name], active: false).first_or_initialize
        if u.id.nil?
          # Name means EMAIL in this case
          u.email = friend[:name]
          u.password = "password"
          u.password_confirmation = "password"
          u.confirmed_at = Time.zone.now
          u.provider = "email"
          u.active = false
          u.save!
        end
        yep.users << u
      else
        yep.users << User.find(friend[:id])
      end
    end

    yep.save
    render json: yep
  end


  def sent
    yeps = Yep.where(user_id: current_user.id)
    p 'sent'
    p yeps

    render json: yeps.order(created_at: :desc).to_json(:include => [:users])
  end

  def received
    receivedYeps = Yep.joins(:users).where(users: {id: current_user.id})
    p 'received'
    p receivedYeps
    render json: receivedYeps.order(created_at: :desc)
  end

  private
  def yep_params
    params.require(:newYep).permit(:title, :content, :description, :url, :image, :category, :friends)
  end
end
