  # frozen_string_literal: true

class UsersController < ApplicationController

  load_and_authorize_resource
  def index
    authorize! :index, User
    @users = User.all
  end

  def edit; end

  def profile
    @products = current_user.products
    @batch = Batch.where('user_id = ? and DATE(activation_start) =?', current_user.id, Date.current.to_s).first
    @batch ||= current_user.batches.build
  end

  def user_params
    params.require(:user).permit(:company_name, :email, address: %i[city street apartment block])
  end
end
