# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :user
  has_many :outlets

  enum company_category: ['продуктовый магазин', 'пекарня', 'кофейня', 'ресторан', 'булочная']
end
