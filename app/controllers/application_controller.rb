class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.respond_to?(:admin?) && resource.admin?
      admin_root_path
    else
      super
    end
  end
end
