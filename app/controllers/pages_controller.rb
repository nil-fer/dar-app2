# frozen_string_literal: true

class PagesController < ApplicationController
  #TO DO декомпозировать и перенести в модель
  def home_page
    @products = Product.all
    earliest_start = Batch.where('DATE(activation_start) = ?' , Date.today.to_s).order(activation_start: :asc).first.activation_start
    @batches_early = Batch.where('activation_start between ? and ?', earliest_start, earliest_start + 1.hour).includes(:user, :batches_products)
    @batches_late = Batch.where('activation_start >= ?', earliest_start + 1.hour).includes(:user, :batches_products)
    @batches = Batch.all

    @outlets_early = @batches_early.limit(3).map { |batch| batch.outlet }
    @outlets_late = @batches_late.limit(9).map { |batch| batch.outlet }
    @outlets = Outlet.all
    @companies = Company.all
  end
end
