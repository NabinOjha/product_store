class CreateUserProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :user_products do |t|
      t.references :user, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.integer :status
      t.timestamps
    end
  end
end
