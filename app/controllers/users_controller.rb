class UsersController < ApplicationController

  def show
    @orders = Cart.all.where(user_id: params[:id], status: "submitted")
  end

end
