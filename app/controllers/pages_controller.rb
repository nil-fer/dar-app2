# frozen_string_literal: true

class PagesController < ApplicationController
  def home_page
    @current_batches =
      Batch
      .with_products
      .where('activation_start < ? AND activation_end > ?', Time.current, Time.current)
      .limit(3)
    @future_batches =
      Batch
      .with_products
      .where(
        'DATE(activation_start) = ? AND activation_start > ?' , Date.current.to_s, Time.current
      )
      .limit(9)
    @all_batches =
      Batch
      .with_products
      .where(
        'DATE(activation_start) = ? AND activation_end > ?' , Date.current.to_s, Time.current
      )
  end
end
