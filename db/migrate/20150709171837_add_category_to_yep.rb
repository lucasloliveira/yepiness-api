class AddCategoryToYep < ActiveRecord::Migration
  def change
    add_column :yeps, :category, :string
  end
end
