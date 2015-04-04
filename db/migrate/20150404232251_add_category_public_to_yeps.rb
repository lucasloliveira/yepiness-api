class AddCategoryPublicToYeps < ActiveRecord::Migration
  def change
    add_column :yeps, :category, :string
    add_column :yeps, :public, :boolean, :default => false
  end
end
