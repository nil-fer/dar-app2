# frozen_string_literal: true

class Outlet < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :products, dependent: :destroy
  has_one :batch

  enum outlet_category: ['Продуктовый магазин', 'Пекарня', 'Кофейня', 'Ресторан', 'Булочная']
end
