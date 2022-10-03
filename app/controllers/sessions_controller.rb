# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :autherised_user, only: %i[create new]

  def new; end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path,
                  flash: { success: 'Logged in Successfully' }
    else
      redirect_to sign_in_path,
                  flash: { danger: 'Invalid login credentials. Try again' }
    end
  end

  def destroy
    flash[:success] = 'Logged out successfully'
    log_out
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def autherised_user
    redirect_to root_path if logged_in?
  end
end
