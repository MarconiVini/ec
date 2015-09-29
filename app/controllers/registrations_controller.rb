class RegistrationsController < Devise::RegistrationsController
  layout "login"#, only: [:login, :sign_up]

  def new
    super
  end

  # def after_sign_out_path_for(resource_or_scope)
  #   case resource_or_scope
  #     when :admin then new_admin_session_path
  #   end
  # end

end


