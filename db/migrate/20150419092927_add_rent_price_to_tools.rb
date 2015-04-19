class AddRentPriceToTools < ActiveRecord::Migration
  def change
    add_column :tools, :rent_price, :integer
  end
end
