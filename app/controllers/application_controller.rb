# frozen_string_literal: true

  class ApplicationController < ActionController::Base
  #
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    if resource.role == 'admin'
      root_path
    elsif resource.role == 'retailer'
      company_path(resource.company)
    elsif resource.role == 'manager'
      outlet_products_path(resource.outlet)
    else
      root_path
    end
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :role, :company_id, :outlet_id, :password, :password_confirmation, :remember_me, outlet_attributes: %i[id address company_id user_id]]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
