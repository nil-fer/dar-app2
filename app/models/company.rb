# frozen_string_literal: true

class Company < ApplicationRecord
  has_one :user
  has_many :outlets
  accepts_nested_attributes_for :user
  mount_uploader :company_cover, CompanyCoverUploader

  enum company_category: ['Продуктовый магазин', 'Пекарня', 'Кофейня', 'Ресторан', 'Булочная']
end
