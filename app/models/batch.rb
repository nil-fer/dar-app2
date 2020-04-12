# frozen_string_literal: true

class Batch < ApplicationRecord
  has_many :batches_products, dependent: :destroy
  has_many :products, through: :batches_products
  belongs_to :user

  accepts_nested_attributes_for :batches_products

  enum discount: %w[25 50 75]
end
