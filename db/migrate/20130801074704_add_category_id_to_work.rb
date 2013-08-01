class AddCategoryIdToWork < ActiveRecord::Migration
  def change
    add_column :works, :category_id, :integer

    add_index :works, :category_id
  end
end
