class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    cart = Cart.find_by(id: params[:id])
    cart.checkout
    cart.save
    current_user.delete_current_cart
    redirect_to cart_path(cart)
  end

end
