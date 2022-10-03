# frozen_string_literal: true

class RegistrationsController < ApplicationController
  before_action :autherised_user, only: %i[create new]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path,
                  flash: { success: 'Account created Successfully' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :contact, :email, :password, :password_confirmation)
  end

  def autherised_user
    redirect_to root_path if logged_in?
  end
end
