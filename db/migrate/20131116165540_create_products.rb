class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.string :image_url
      t.string :thumb_nail

      t.timestamps
    end
  end
end
