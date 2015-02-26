class UpdateYepSchema < ActiveRecord::Migration
  def change
    rename_column :yeps, :imageUrl, :image
    change_column_default :yeps, :seen, false
    change_column_default :yeps, :active, true
  end
end
