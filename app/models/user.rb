# frozen_string_literal: true
class User < ActiveRecord::Base

  has_many :products
  has_one :company
  has_many :batches
  has_one :outlet
  accepts_nested_attributes_for :outlet

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def display_address
    return '' if address.blank?

    "#{address['city']}, #{address['street']}, д. #{address['apartment']}, #{address['block']}"
  end
end
