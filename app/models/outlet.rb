# frozen_string_literal: true

class Outlet < ApplicationRecord
  belongs_to :company
  has_one :batch
  has_many :products

  def display_full_address
    return '' if address.blank?

    "#{address['city']}, #{address['street']}, д. #{address['apartment']}, #{address['block']}"
  end

  def display_title_address
    return '' if address.blank?

    "#{address['street']}"
  end
end
