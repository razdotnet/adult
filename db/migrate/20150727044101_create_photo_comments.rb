class CreatePhotoComments < ActiveRecord::Migration
  def change
    create_table :photo_comments do |t|
    	t.integer :user_id
    	t.integer :picture_id
    	t.string :body
      t.timestamps null: false
    end
  end
end
