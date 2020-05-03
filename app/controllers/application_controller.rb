# frozen_string_literal: true

  class ApplicationController < ActionController::Base
  load_and_authorize_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :role, :company_id, :outlet_id, :password, :password_confirmation, :remember_me, outlet_attributes: %i[id address company_id user_id]]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
