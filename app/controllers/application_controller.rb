class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by using :null_session
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json

  def index
    render json: {status: "OK"}, status: 200
  end
end
