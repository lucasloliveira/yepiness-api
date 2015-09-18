class AddRatingToYep < ActiveRecord::Migration
  def change
    add_column :yeps, :rating, :integer, default: 0
  end
end
