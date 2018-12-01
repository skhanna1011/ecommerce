class AddSubCategoryToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sub_category_id, :integer
  end
end
