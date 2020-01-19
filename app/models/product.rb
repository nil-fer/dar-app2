class Product < ApplicationRecord
  has_one :category
  belongs_to :batch

  # data enumerizers
  enum weight_type: [ 'на вес', 'в порциях' ]
  enum category: [ 'Кулинария', 'Выпечка', 'Фрукты и овощи', 'Мясо', 'Напитки', 'Сладкое' ]
end
