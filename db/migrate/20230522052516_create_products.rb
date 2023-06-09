class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description 
      t.float :price, precision: 8, scale: 2
      t.string :image_url
      t.timestamps
    end
  end
end
