class AddSmallAndMediumAndLargeAndXlargeAndXxlargeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :small, :integer, default: 0
    add_column :products, :medium, :integer, default: 0
    add_column :products, :large, :integer, default: 0
    add_column :products, :xlarge, :integer, default: 0
    add_column :products, :xxlarge, :integer, default: 0
    add_column :products, :quantity, :integer, default: 0
  end
end
