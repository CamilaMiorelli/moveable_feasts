class AddPriceToFeasts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :feasts, :price, currency: { present: false }
  end
end
