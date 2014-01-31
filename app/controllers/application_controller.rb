 class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception


  include SessionsHelper
  #before_filter :authorization


  rescue_from ActiveRecord::RecordNotFound do
    render_404
  end 

  def render_404
    #just sends back to site instead of displaying 404 page
    redirect_to store_url
  end

 private

   def current_cart
     Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    	cart = Cart.create
    	session[:cart_id] = cart.id
    	cart
   end

 protected
 
 def authorization
	  if current_user
	    redirect_to(store_url) unless current_user.admin?
	  else
	    redirect_to(store_url)
	  end
  end
   
end


