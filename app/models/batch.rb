# frozen_string_literal: true

class Batch < ApplicationRecord
  has_many :batches_products, dependent: :destroy
  has_many :products, through: :batches_products
  belongs_to :user
  belongs_to :outlet

  accepts_nested_attributes_for :batches_products

  enum discount: %w[25 50 75]

  scope :with_products, lambda {
    joins(:batches_products, :outlet)
    .select('batches.*, COUNT(batches_products.id) AS products_count')
    .where('batches_products.quantity > 0')
    .having('COUNT(batches_products.id) > 0')
    .includes(outlet: :company)
    .group(:id)
  }
end
