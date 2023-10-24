class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_admin
  before_action :set_user, only: [ :change_genre]

  def index
    @users = User.page params[:page]
  end

  def change_genre
    new_genre = params[:new_genre].to_i

    if @user.update(genre: new_genre)
      flash[:notice] = 'Genre changed successfully'
    else
      flash[:alert] = 'Failed to change the genre'
    end

    redirect_to admin_users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def check_user_admin
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end
end
