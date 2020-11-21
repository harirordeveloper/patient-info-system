class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  protected

  def after_sign_out_path_for(_resource_or_scope)
    new_admin_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    authenticated_root_path || root_path
  end
end
