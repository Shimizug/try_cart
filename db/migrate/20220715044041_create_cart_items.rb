class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
