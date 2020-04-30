# frozen_string_literal: true

class Outlet < ApplicationRecord
  belongs_to :company
  has_many :products, dependent: :destroy
  has_one :batch
  attr_writer :login

def login
  @login || self.username || self.email
end
end
