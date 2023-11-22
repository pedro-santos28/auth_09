class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)

    if @user.save
      flash[:notice] = "Welcome #{@user.email}"
      redirect_to root_path
    else
      flash[:alert] = "Invalid information, try again"
      render :new, status: :unprocessable_entity
    end
  end

  private

    def create_params
      params.require(:user).permit(:email, :password)
    end
end
