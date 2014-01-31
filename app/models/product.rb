class Product < ActiveRecord::Base
  default_scope order: 'title'
  
  has_many :line_items
  has_many :orders, through: :line_items

  before_save :update_it
  before_destroy :ensure_not_referenced_by_any_line_item
  

    def update_it 
      self.quantity = self.small + self.medium + self.large + self.xlarge + self.xxlarge 
    end


  private


    # def update_quantity
    #   total_quantity = self.small + self.medium + self.large + self.xlarge + self.xxlarge
    #   self.update_columns(quantity: total_quantity)
    # end



    def ensure_not_referenced_by_any_line_item
    	if line_items.empty?
    		return true
    	else
    		errors.add(:base, 'Line Items Present')
    		return false
    	end
    end
end
