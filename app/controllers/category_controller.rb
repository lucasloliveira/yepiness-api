class CategoryController < ApplicationController

  before_action :authenticate_user!

  def list
    render json: Category.all
  end
end
