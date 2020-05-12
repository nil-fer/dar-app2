# frozen_string_literal: true
class User < ActiveRecord::Base

  belongs_to :company, optional: true
  belongs_to :outlet, optional: true
  has_many :products
  has_many :batches
  accepts_nested_attributes_for :outlet

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def display_address
    return '' if address.blank?

    "#{address['city']}, #{address['street']}, д. #{address['apartment']}, #{address['block']}"
  end
end
