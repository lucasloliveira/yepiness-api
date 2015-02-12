require "application_responder"

class ApplicationController < ActionController::API

  self.responder = ApplicationResponder
  respond_to :html

  include ActionController::MimeResponds
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::RespondWith
  include ActionController::ImplicitRender

  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

  private
  def record_not_unique
    render :json => {:error => "record_not_unique"}, :status => 400
  end
end
