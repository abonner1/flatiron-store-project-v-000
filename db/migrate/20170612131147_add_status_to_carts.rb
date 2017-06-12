class AddStatusToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :status, :string, :default => "unsubmitted"
  end
end
