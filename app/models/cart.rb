class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end

  def add_product(product_id, size) 
  	current_item = line_items.find_by_product_id(product_id)
  	if current_item
  		current_item.quantity += 1
      previous_size = current_item.size
      current_item.size = "#{size}" +","+ "#{previous_size}"
  	else
  		current_item = line_items.build(product_id: product_id)
      current_item.size = size
  	end
  	  current_item
  end

end
