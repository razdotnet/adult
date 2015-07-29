class AddModelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :model, :boolean
  end
end
