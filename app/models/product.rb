# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :batch, required: false

  # data enumerizers
  enum weight_type: ['на вес', 'в порциях']
  enum category: ['Кулинария', 'Выпечка', 'Фрукты и овощи', 'Мясо', 'Напитки', 'Сладкое']
end
