class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, :through => :line_items
  belongs_to :user

  def total
    total = self.line_items.inject(0) do |total, line_item|
      total + (line_item.item_price * line_item.quantity)
    end.round(2)
  end

  def add_item(item_id)
    item = Item.find_by(id: item_id)
    self.line_items.find_or_initialize_by(item_id: item.id)
  end

end
