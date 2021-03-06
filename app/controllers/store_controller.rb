class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] += 1
  end

  def set_counter_to_zero
    session[:counter] = 0
  end

  def index
    @count = increment_counter
    @products = Product.order(:title)
  end
end
