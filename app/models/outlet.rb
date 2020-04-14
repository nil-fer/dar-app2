# frozen_string_literal: true

class Outlet < ApplicationRecord
  belongs_to :company
  has_many :batches
  has_many :products
end
