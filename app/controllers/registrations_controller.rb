class RegistrationsController < Devise::RegistrationsController
  layout "login"#, only: [:login, :sign_up]

  before_action :configure_permitted_parameters

  def new
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  # def after_sign_out_path_for(resource_or_scope)
  #   case resource_or_scope
  #     when :admin then new_admin_session_path
  #   end
  # end

end


