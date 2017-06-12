class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, :through => :line_items
  belongs_to :user

  def total
    total = self.line_items.inject(0) do |total, line_item|
      total + (line_item.item_price * line_item.quantity)
    end
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id)
    end
    line_item
  end

  def submitted?
    !!self.status == "submitted"
  end

  def update_status
    if self.status == "unsubmitted"
      self.status = "submitted"
    else
      self.status = "unsubmitted"
    end
  end

  def checkout
    self.update_status
    update_inventory
  end

  def update_inventory
    self.line_items.each do |line_item|
      item = Item.find_by(id: line_item.item_id)
      item.inventory -= line_item.quantity
      item.save
    end
  end

end
