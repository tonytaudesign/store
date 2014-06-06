class ChargesController < ApplicationController
  require "stripe"
  skip_before_filter :authorization, only: [:new,:create]

  def new
    @cart = current_cart
  end

  def create
    Rails.configuration.stripe[:secret_key]
    amount = (params[:total].to_f * 100).to_i
    token = params[:stripeToken]
    name = params[:name]
    email =  params[:email]
    address =  params[:address]
    city = params[:city]
    state = params[:state]
    zip = params[:zip]
    @price = params[:total].to_f
    begin
      charge = Stripe::Charge.create(
        amount: amount,
        currency: "usd",
        card: token,
        description: "payinguser@example.com, #{name}, #{email}, #{address}, 
        #{city}, #{state}, #{zip}"
      )

    rescue Stripe::CardError => e
      redirect_to charges_new_path
    end

     @cart = current_cart
     @cart.line_items.each do |product|
        sizes = product.size.split(",")
        hash = Hash.new(0)
        sizes.each {|size| hash[size] += 1}

        product = Product.find(product.product_id)
        product.small   =  product.small - hash["s"]
        product.medium  =  product.medium - hash["m"]
        product.large   =  product.large - hash["l"]
        product.xlarge  =  product.xlarge - hash["xl"]
        product.xxlarge =  product.xxlarge - hash["xxl"]
        product.save
     end   

     @cart.destroy

  end #end of create


end
