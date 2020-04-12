class PagesController < ApplicationController
  # load_and_authorize_resource
  def home
    earliest_start = Batch.where('DATE(activation_start) = ?' , Date.current.to_s).order(activation_start: :asc).first.activation_start
    @batches_early = Batch.where('activation_start between ? and ?', earliest_start, earliest_start + 1.hour).includes(:user, :batches_products)
    @batches_late = Batch.where('activation_start >= ?', earliest_start + 1.hour).includes(:user, :batches_products)
  end
end
