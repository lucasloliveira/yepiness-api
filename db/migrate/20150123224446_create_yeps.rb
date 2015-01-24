class CreateYeps < ActiveRecord::Migration
  def change
    create_table :yeps do |t|
      t.text :content
      t.string :title
      t.string :description
      t.string :shortUrl
      t.string :url
      t.references :user, index: true
      t.string :imageUrl
      t.datetime :date_created
      t.boolean :active
      t.boolean :seen

      t.timestamps
    end
  end
end
