class Product < ApplicationRecord

  belongs_to :category
  belongs_to :sub_category
  has_many :cart_line_items
  
  validates_presence_of :name, :price, :category_id, :description
  validates_numericality_of :price, :category_id, greater_than_or_equal: 1
end