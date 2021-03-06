class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :carts
  belongs_to :current_cart, :class_name => "Cart"

  def create_current_cart
    new_cart = self.carts.create
    self.current_cart_id = new_cart.id
    self.save
  end

  def delete_current_cart
    self.current_cart_id = nil
    self.save
  end
end
