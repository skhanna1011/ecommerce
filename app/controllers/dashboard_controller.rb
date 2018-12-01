class DashboardController < ApplicationController
  def home
    @categories = Category.all
    @products = Products.all
    @users = User.all
    
  end

  def categories
  end

  def products
  end

  def users
  end

  def reviews
  end

  def orders
  end
end
