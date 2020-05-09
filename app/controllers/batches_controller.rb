# frozen_string_literal: true

class BatchesController < ApplicationController
   

  def create
    @batch = current_user.batches.build(batch_params)
    @products = current_user.products

    respond_to do |format|
      if @batch.save
        format.html { redirect_to users_profile_path, notice: 'Updated' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render 'users/profile' }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

# TODO разобраться что делает этот метод и правильно ли он работает
  def update
    @batch = Batch.where('user_id = ? and DATE(activation_start) =?', current_user.id, Date.current.to_s).first
    @products = current_user.products

    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to users_profile_path, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render 'users/profile' }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:discount, :activation_start, :activation_end, batches_products_attributes: %i[product_id quantity id])
  end
end
