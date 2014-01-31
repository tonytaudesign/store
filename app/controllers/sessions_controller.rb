class SessionsController < ApplicationController

  skip_before_filter :authorization

   def new
    @cart = current_cart
    redirect_to store_url if signed_in?
   end

  def signout
    @cart = current_cart
  end



	def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to store_url
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to store_url
  end


end
