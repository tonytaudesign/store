class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]


  def index
    @carts = Cart.all
  end


  def show
    @cart = current_cart
    @page = "checkout"

    if session[:cart_id] == params[:id].to_i
      begin
        @cart = Cart.find(params[:id])
      rescue  ActiveRecord::RecordNotFound
        logger.error "Attempt to access invalid cart #{params[:id]}"
        redirect_to store_url
      else
        respond_to do |format|
          format.html #show.html
          format.json { render json: @cart }
        end
      end
    else
      redirect_to store_url
    end
  end #end of show action

  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

 
  def edit
    @cart = Cart.find(params[:id])
  end


  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
  end #end of destroy action






  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params[:cart]
    end

    def store
      redirect_to store_url
    end

end
