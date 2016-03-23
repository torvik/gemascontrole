class HomeController < ApplicationController
    before_action :authenticate_user!, only: [:dashboard]

  layout "main"
  def index
  end

  layout "main"
  def sobre
  end

  layout "main"
  def contato
  end


  layout "application"
  def dashboard
    @products = Product.where(:user_id => current_user.id).order("created_at DESC").limit(5)
    #@sales = Sale.where(:user_id => current_user.id).order("created_at DESC").limit(5)
    @orders = Order.where(:user_id => current_user.id).order("created_at DESC").limit(5)
    @customers = Customer.where(:user_id => current_user.id).order("created_at DESC").limit(5)
  end

end
