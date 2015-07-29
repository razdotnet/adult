class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.integer :product_id
    	t.integer :wishlist_id
      t.timestamps null: false
    end
  end
end
