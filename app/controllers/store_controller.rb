class StoreController < ApplicationController
  def index
    @products = Product.where(:user_id => current_user.id)

  end
end
