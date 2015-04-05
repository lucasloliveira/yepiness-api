class CreateYeps < ActiveRecord::Migration
  def change
    create_table :yeps do |t|
      t.text :content
      t.string :title
      t.string :description
      t.string :shortUrl
      t.string :url
      t.references :user, index: true
      t.string :image
      t.string :category
      t.boolean :active, :default => true
      t.boolean :public, :default => true
      t.boolean :seen, :default => false

      t.timestamps
    end
  end
end
