# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :user
  has_many :outlets
  mount_uploader :company_cover, CompanyCoverUploader

  enum company_category: ['Продуктовый магазин', 'Пекарня', 'Кофейня', 'Ресторан', 'Булочная']
end
