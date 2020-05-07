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
puts 'Users were created'
create_companies
puts 'Companies were created'
create_outlets
puts 'Outlets were created'
create_products
puts 'Products were created'
create_batches
puts 'Batches were created'
create_batches_products
puts 'Batches Products were created'
