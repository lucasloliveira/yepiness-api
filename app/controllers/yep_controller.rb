class YepController < ApplicationController

  before_action :authenticate_user!

  def create
    yep = Yep.new(yep_params)
    yep.user = current_user
    friends = params[:newYep][:friends]
    if params[:newYep][:category]
      yep.category_id = params[:newYep][:category][:id]
    end

    if !friends.nil?
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
    end

    yep.save
    render json: yep
  end

  def remove
    yep = Yep.find(params[:yepId])
    yep.active = false

    yep.save
    render json: yep
  end

  def updateCategory
    yep = Yep.find(params[:yepId])
    yep.category_id  = params[:categoryId]

    yep.save

    render json: yep
  end

  def updateRating
    yep = Yep.find(params[:yepId])
    yep.rating = params[:rating]

    yep.save

    render json: yep
  end


  def sent
    yeps = Yep.where(user_id: current_user.id, active: true)
    p 'sent'
    p yeps

    render json: yeps.order(created_at: :desc).to_json(:include => [:users, :category])
  end

  def received
    receivedYeps = Yep.joins(:users).where(users: {id: current_user.id}, active: true)
    p 'received'
    p receivedYeps
    render json: receivedYeps.order(created_at: :desc).to_json(:include => [:user, :users, :category])
  end

  private
  def yep_params
    params.require(:newYep).permit(:title, :category, :content, :description, :shortUrl, :url, :image)
  end
end
