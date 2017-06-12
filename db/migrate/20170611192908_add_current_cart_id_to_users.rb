class AddCurrentCartIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :current_cart, index: true
    add_foreign_key :users, :current_carts
  end
end
