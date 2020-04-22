def create_batches_products
  5.times do
    create_batches_product
  end
end

def create_batches_product
  Batch.all.each do |batch|
    BatchesProduct.create(
      batch_id: batch.id,
      product_id: batch.outlet.products.sample.id,
      quantity: random_quantity
    )
  end
end

def random_quantity
  rand(1..10)
end
