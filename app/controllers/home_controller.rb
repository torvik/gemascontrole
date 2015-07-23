class HomeController < ApplicationController
    before_action :authenticate_user!, only: [:dashboard]
  def index
  end

  def sobre
  end

  def contato
  end

  def dashboard
    @products = Product.where(:user_id => current_user.id).last(5)
    @sales = Sale.where(:user_id => current_user.id).last(5)
    @customers = Customer.where(:user_id => current_user.id).last(5)
  end

end
