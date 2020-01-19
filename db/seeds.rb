Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

# create users
@users = [
  {
    email:        'admin@admin.com',
    company_name: 'Администратор',
    role:         'admin'
 }, {
    email:        'retailer1@retailer.com',
    company_name: 'Перекрёсток',
    role:         'retailer'
  }, {
    email:        'retailer2@retailer.com',
    company_name: 'Братья Караваевы',
    role:         'retailer'
  }, {
    email:        'retailer3@retailer.com',
    company_name: 'Хлеб Насущный',
    role:         'retailer'
  }, {
    email:        'retailer4@retailer.com',
    company_name: 'ВкусВилл',
    role:         'retailer'
  }, {
    email:        'retailer5@retailer.com',
    company_name: 'Француская пекарня',
    role:         'retailer'
  }
]

def create_users(user)
  password = 'testtest'

  User.create(
    email:                 user[:email],
    company_name:          user[:company_name],
    role:                  user[:role],
    password:              password,
    password_confirmation: password
  )
end

@users.each do |user|
  u = create_users(user)
  puts "User with #{u.email} created"
end

# Create random users
def random_users
  rand(2..5)
end

# Product info && fake data methods
@weight_types = [ 'кг', 'г', 'шт', 'порция' ]
@sales = [ '25%', '50%', '70%' ]
@product_names = [ 'Бананы', 'Молоко', 'Рыба', 'Хотдог', 'Бутерброд', 'Макароны' ]

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


@categories = [ "Кулинария", "Выпечка", "Фрукты и овощи", "Мясо", "Напитки", "Сладкое" ]

Batch.create([
  {
    company_name: "1"
  },{
    company_name: "2"
  }
])

Product.create([
  {
    name:           @product_names.sample,
    weight_type:     random_weight_type,
    weight_quantity: random_weight_quantity,
    price:           random_price,
    category:        random_category,
    product_pic:     upload_fake_product_pic,
    user_id:         random_users
  },{
    name:           @product_names.sample,
    weight_type:     random_weight_type,
    weight_quantity: random_weight_quantity,
    price:           random_price,
    category:        random_category,
    product_pic:     upload_fake_product_pic,
    user_id:         random_users
  },{
    name:           @product_names.sample,
    weight_type:     random_weight_type,
    weight_quantity: random_weight_quantity,
    price:           random_price,
    category:        random_category,
    product_pic:     upload_fake_product_pic,
    user_id:         random_users
  },{
    name:           @product_names.sample,
    weight_type:     random_weight_type,
    weight_quantity: random_weight_quantity,
    price:           random_price,
    category:        random_category,
    product_pic:     upload_fake_product_pic,
    user_id:         random_users
  },{
    name:           @product_names.sample,
    weight_type:     random_weight_type,
    weight_quantity: random_weight_quantity,
    price:           random_price,
    category:        random_category,
    product_pic:     upload_fake_product_pic,
    user_id:         random_users
  },{
    name:           @product_names.sample,
    weight_type:     random_weight_type,
    weight_quantity: random_weight_quantity,
    price:           random_price,
    category:        random_category,
    product_pic:     upload_fake_product_pic,
    user_id:         random_users
  }
]

def create_product(product)
  Product.create(
    name:            product[:name],
    weight_type:     product[:weight_type],
    weight_quantity: product[:weight_quantity],
    price:           product[:price],
    category:        product[:category],
    product_pic:     product[:product_pic],
    user_id:         product[:user_id]
  )
end

@products.each do |product|
  p = create_product(product)

  if p.save
    puts "Product #{p.name} created"
  else
    puts "Product #{p.name} not created"
  end
end
