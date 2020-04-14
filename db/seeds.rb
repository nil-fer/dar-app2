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
    company_name: user[:company_name],
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

companies = [
  {
    company_name: 'Перекрёсток',
    user_id: 1
  }, {
    company_name: "Кулинарная Лавка Братьев Караваевых",
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

outlets = [
  {
    company_id: 0,
    address: { city: 'Москва', street: "ул. Новый Арбат", apartment: "15", block: "с1" },
  }, {
    company_id: 0,
    address: { city: 'Москва', street: "ул. Спиридоновка", apartment: "25", block: "20с1" },
  }, {
    company_id: 0,
    address: { city: 'Москва', street: "ул. Никольская", apartment: "10", block: "" },
  }, {
    company_id: 0,
    address: { city: 'Москва', street: "пер. Сивцев Вражек", apartment: "20", block: "" },
  }, {
    company_id: 0,
    address: { city: 'Москва', street: "ул. Мясницкая", apartment: "17", block: "с1" },
  }
]



product_names = %w[Бананы Молоко Рыба Хотдог Бутерброд Макароны]

def random_weight_type
  rand(0..1)
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

Product.create!([
  {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_managers
  }
])

def time_now
  time_now = DateTime.current
  DateTime.new(time_now.year, time_now.month, time_now.day, 18, 0, 0)
end

Batch.create!([
  {
    activation_start: time_now,
    activation_end: Faker::Time.between(from: Time.now - 1, to: DateTime.now, format: :short),
    discount: random_discount,
    user_id: 2
  },{
    activation_start: time_now,
    activation_end: Faker::Time.between(from: Time.now - 1, to: DateTime.now, format: :short),
    discount: random_discount,
    user_id: 3
  }
])
