def create_products
  6.times do
    create_product('manager@perekrestok.com')
    create_product('manager@karavaev_brothers.com')
    create_product('manager@mcdonalds.com')
    create_product('manager@french_bakery.com')
  end
end

def create_product(user_email)
  user = User.find_by_email(user_email)

  Product.create(
    name: random_food.sample,
    weight_type: 1,
    weight_amount: random_weight_amount,
    price: random_price,
    category: random_category,
    product_pic: upload_fake_product_pic,
    outlet_id: user.outlet_id,
    user_id: user.id
  )
end

def random_food
  %w[Бананы Молоко Рыба Хотдог Бутерброд Макароны]
end

def random_weight_amount
  rand(100..4000).round(-1)
end

def random_price
  rand(15..5000).round(-1)
end

def upload_fake_product_pic
  uploader = ProductPicUploader.new(Product.new, :product_pic)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/product_pics', '*')).sample))
  uploader
end

def random_category
  rand(0..5)
end
