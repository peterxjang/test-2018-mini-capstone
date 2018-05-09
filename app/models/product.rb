class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  belongs_to :supplier

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
