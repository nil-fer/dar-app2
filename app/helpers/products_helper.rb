# frozen_string_literal: true

module ProductsHelper
  def categories_collection
    Product.categories.collect do |k, v|
      k
    end
  end
end
