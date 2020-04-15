# frozen_string_literal: true

# create users
users = [
  {
    email: 'admin@admin.com',
    role: 'admin'
  }, {
    email: 'retailer@perekrestok.com',
    role: 'retailer'
  }, {
    email: 'retailer@karavaev-brothers.com',
    role: 'retailer'
  }, {
    email: 'retailer@mcdonalds.com',
    role: 'retailer'
  }, {
    email: 'retailer@vkusvill.com',
    role: 'retailer'
  }, {
    email: 'retailer@french-bakery.com',
    role: 'retailer'
  },
    #managers
  {
    email: 'manager@perekrestok.com',
    role: 'manager'
  }, {
    email: 'manager@karavaev-brothers.com',
    role: 'manager'
  }, {
    email: 'manager@mcdonalds.com',
    role: 'manager'
  }, {
    email: 'manager@vkusvill.com',
    role: 'manager'
  }, {
    email: 'manager@french-bakery.com',
    role: 'manager'
  }
]

def create_users(user)
  password = 'testtest'

  User.create(
    email: user[:email],
    role: user[:role],
    password: password,
    password_confirmation: password
  )
end

users.each do |user|
  u = create_users(user)
  puts "User with #{u.email} created"
end

def random_managers
  rand(6..10)
end

def random_managers
  rand(6..10)
end

companies = [
  {
    company_name: 'Перекрёсток',
    user_id: 1
  }, {
    company_name: "Братья Караваевы",
    user_id: 2
  }, {
    company_name: "Макдоналдс",
    user_id: 3
  }, {
    company_name: "Вкусвилл",
    user_id: 4
  }, {
    company_name: "Французская пекарня",
    user_id: 5
  }
]

def create_companies(company)
  Company.create(
    company_name: company[:company_name],
    user_id: company[:user_id]
  )
end

companies.each do |company|
  c = create_companies(company)
  puts "Company with #{c.company_name} created"
end


outlets = [
  {
    company_id: 0,
    address: { city: 'Москва', street: "ул. Новый Арбат", apartment: "15", block: "с1" },
  }, {
    company_id: 1,
    address: { city: 'Москва', street: "ул. Спиридоновка", apartment: "25", block: "20с1" },
  }, {
    company_id: 2,
    address: { city: 'Москва', street: "ул. Никольская", apartment: "10", block: "" },
  }, {
    company_id: 3,
    address: { city: 'Москва', street: "пер. Сивцев Вражек", apartment: "20", block: "" },
  }, {
    company_id: 4,
    address: { city: 'Москва', street: "ул. Мясницкая", apartment: "17", block: "с1" },
  }
]

def create_outlets(outlet)
  Outlet.create(
    company_id: outlet[:company_id],
    address: outlet[:address]
  )
end

outlets.each do |outlet|
  o = create_outlets(outlet)
  puts "Outlet created"
end

def random_weight_type
  rand(1..2)
end

def random_category
  rand(0..5)
end

def random_discount
  rand(0..2)
end

def random_weight_amount
  rand(100..4000)
end

def random_price
  rand(15..500)
end

# Fake product pic
def upload_fake_product_pic
  uploader = ProductPicUploader.new(Product.new, :product_pic)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/product_pics', '*')).sample))
  uploader
end

product_names = %w[Бананы Молоко Рыба Хотдог Бутерброд Макароны]

Product.create!([
  {
    name: product_names.sample,
    weight_type: 1,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: 1,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: 1,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: 1,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: 1,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: 1,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }
])

Batch.create!([
  {
    activation_start: Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short),
    activation_end: Faker::Time.between(from: Time.now - 6, to: Time.now, format: :short),
    discount: random_discount,
    user_id: 1,
    outlet_id: 1
  },{
    activation_start: Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short),
    activation_end: Faker::Time.between(from: Time.now - 6, to: Time.now, format: :short),
    discount: random_discount,
    user_id: 2,
    outlet_id: 1
  },{
    activation_start: Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short),
    activation_end: Faker::Time.between(from: Time.now - 6, to: Time.now, format: :short),
    discount: random_discount,
    user_id: 3,
    outlet_id: 2
  },{
    activation_start: Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short),
    activation_end: Faker::Time.between(from: Time.now - 6, to: Time.now, format: :short),
    discount: random_discount,
    user_id: 4,
    outlet_id: 3
  },{
    activation_start: Faker::Time.between(from: Time.now - 1, to: Time.now, format: :short),
    activation_end: Faker::Time.between(from: Time.now - 6, to: Time.now, format: :short),
    discount: random_discount,
    user_id: 5,
    outlet_id: 4
  }
])

def random_batch_id
  rand(1..5)
end

def random_product_id
  rand(1..9)
end

def random_quantity
  rand(1..10)
end


BatchesProduct.create!([
  {
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  },{
    batch_id: random_batch_id,
    product_id: random_product_id,
    quantity: random_quantity
  }
])
