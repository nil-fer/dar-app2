# frozen_string_literal: true

# create users
users = [
  {
    email: 'admin@admin.com',
    company_name: 'Администратор',
    role: 'admin'
  }, {
    email: 'perekrestok@user.com',
    company_name: 'Перекрёсток',
    role: 'retailer'
  }, {
    email: 'k-brothers2@user.com',
    company_name: 'Братья Караваевы',
    role: 'retailer'
  }, {
    email: 'hleb@user.com',
    company_name: 'Хлеб Насущный',
    role: 'retailer'
  }, {
    email: 'vkusvill4@user.com',
    company_name: 'ВкусВилл',
    role: 'retailer'
  }, {
    email: 'french-bakery@user.com',
    company_name: 'Француская пекарня',
    role: 'retailer'
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

def random_users
  rand(2..5)
end

product_names = %w[Бананы Молоко Рыба Хотдог Бутерброд Макароны]

def random_weight_type
  rand(0..1)
end

def random_category
  rand(0..5)
end

def random_weight_quantity
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
    weight_quantity: random_weight_quantity,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_users
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_quantity: random_weight_quantity,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_users
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_quantity: random_weight_quantity,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_users
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_quantity: random_weight_quantity,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_users
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_quantity: random_weight_quantity,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_users
  }, {
    name: product_names.sample,
    weight_type: random_weight_type,
    weight_quantity: random_weight_quantity,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    user_id: random_users
  }
])
