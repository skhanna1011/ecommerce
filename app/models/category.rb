class Category < ApplicationRecord

  has_many :products
  has_many :sub_categories
  
  validates_presence_of :name
  validates_uniqueness_of :name, message:"Category already Exists"
end
