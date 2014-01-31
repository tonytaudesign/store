class StoreController < ApplicationController
  skip_before_filter :authorization

  def index
  	@cart = current_cart
  	@products = Product.all
  end
end
