# frozen_string_literal: true

%w{
  batch_data
  batches_product_data
  company_data
  outlet_data
  product_data
  user_data
}.each do |file|
  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{file}.rb"
end

create_users
create_companies
create_outlets
create_products
create_batches
create_batches_products
