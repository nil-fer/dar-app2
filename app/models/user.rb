# frozen_string_literal: true

class User < ApplicationRecord
  has_many :products
  has_one :profile
  has_many :batches

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def display_address
    return '' if address.blank?
    "#{address['city']}, #{address['street']}, д. #{address['apartment']}, #{address['block']}"
  end
end
