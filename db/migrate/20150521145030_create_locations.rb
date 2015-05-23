class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.integer :user_id
    	t.string :postcode
      t.timestamps null: false
    end
  end
end
