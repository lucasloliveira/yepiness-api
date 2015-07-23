class AddCategoryToUser < ActiveRecord::Migration
  def change

    remove_column :yeps, :category
    add_reference :yeps, :category
  end
end
