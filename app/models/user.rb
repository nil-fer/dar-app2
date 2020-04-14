# frozen_string_literal: true

class User < ApplicationRecord
  has_many :products
  has_one :company
  has_many :batches
  has_one :outlet

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def display_address
    return '' if address.blank?

    "#{address['city']}, #{address['street']}, д. #{address['apartment']}, #{address['block']}"
  end
end
