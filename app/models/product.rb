class Product < ApplicationRecord
  def is_discounted
    price.to_f <= 5
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end
end
