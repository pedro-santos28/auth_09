class SessionsController < ApplicationController

  before_action :user, only: :create

  def destroy
  end

  def new
  end

  def create
    if @user
      flash[:notice] = "Welcome #{user.email}"
      redirect_to root_path
    else
      flash[:alert] = "Invalid credentials"
      render :new, status: :unprocessable_entity
    end

  end

  private

    def user
      @user = User.find_by(email: params[:email])
        &.authenticate(params[:password])
    end
end
