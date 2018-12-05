class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :update]

  def index
    byebug
    @user = User.all
    render json: @user.to_json
  end

  def show
    render json: @user.to_json
  end

  def destroy
    if @user.destroy
      render json: @user.to_json
    else
      render json: @user.errors.to_json
    end
  end

  def update
    if @user.update(user_params)
      render json: @user.to_json
    else
      render json: @user.errors.to_json
    end
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      render json: @user.to_json
    else
      render json: @user.errors.to_json
    end
  end


  private 

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

  def set_user
    @user = @admin
    return if @admin.present?
    @user = User.find(params[:id])
  end
end
