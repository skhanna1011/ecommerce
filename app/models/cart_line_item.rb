class CartLineItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :product, presence: true
  validates :user, presence: true
  validates_numericality_of :quantity, greater_than: 0, less_than_or_equal_to: 10

  def save_and_update
    line_item = CartLineItem.find_by(product_id:  self.product_id, user_id: self.user_id)
    if line_item
      line_item.update_attributes(quantity: line_item.quantity + self.quantity)
      line_item.errors.full_messages
    else
      self.save
      self.errors.full_messages
    end
  end
end