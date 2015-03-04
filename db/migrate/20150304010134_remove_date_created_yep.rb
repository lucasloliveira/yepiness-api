class RemoveDateCreatedYep < ActiveRecord::Migration
  def change
    remove_column :yeps, :date_created
  end
end
