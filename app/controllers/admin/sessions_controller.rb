class Admin::SessionsController < Devise::SessionsController
  helper :sessions
  layout "login"#, only: [:login, :sign_up]

  def login
    #super
  end

  def sign_up
    @user = User.new
  end
end


