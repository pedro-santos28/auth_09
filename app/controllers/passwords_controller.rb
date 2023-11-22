class PasswordsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    puts params[:email].inspect
    puts "usuário encontrado: #{@user}"
    if @user
      PasswordRecoveryMailer.with(user: @user).recover_password.deliver_later

    else
      flash[:alert] = "Email not found or invalid"
      render :edit, status: :unprocessable_entity
    end


  end

  def edit
  end

  def new
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      flash[:alert] = "Your password has been updated"
      redirect_to root_path
    else
      flash[:alert] = "invalid passwords, try again"
      render :new, status: :unprocessable_entity
    end
  end
end
