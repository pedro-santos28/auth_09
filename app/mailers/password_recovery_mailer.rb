class PasswordRecoveryMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def recover_password
    @user = params[:user]

    mail(to: @user.email, subject: 'Password recovery')
  end
end
