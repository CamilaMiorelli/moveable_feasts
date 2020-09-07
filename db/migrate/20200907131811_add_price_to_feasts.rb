class AddPriceToFeasts < ActiveRecord::Migration[6.0]
  def change
    remove_column :feasts, :price
    add_monetize :feasts, :price, currency: { present: false }
  end
end
