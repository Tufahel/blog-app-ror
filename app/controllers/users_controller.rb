class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @all_users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
