class ApplicationController < ActionController::Base

  def authenticate_admin_or_user
    authenticate_user! unless admin_signed_in?
  end
end
