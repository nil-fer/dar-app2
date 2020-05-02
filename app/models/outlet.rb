# frozen_string_literal: true

class Outlet < ApplicationRecord
  belongs_to :company
  has_many :products, dependent: :destroy
  has_one :batch
end
