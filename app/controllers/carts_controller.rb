class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    cart = Cart.find_by(id: params[:id])
    cart.checkout
    cart.save
    redirect_to cart_path(cart)
  end

end
