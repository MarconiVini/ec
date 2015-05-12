class Admin::SessionsController < ApplicationController
  helper :sessions
  layout "login"#, only: [:login, :sign_up]


  def index
    binding.pry
  end

  def login

  end
  
  def create
    super
  end

  def sign_up
    @user = User.new
  end
end


