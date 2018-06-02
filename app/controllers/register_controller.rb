class RegisterController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_category)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :user_category)
  end
end
