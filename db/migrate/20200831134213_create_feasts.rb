class CreateFeasts < ActiveRecord::Migration[6.0]
  def change
    create_table :feasts do |t|
      t.time :start_at
      t.time :end_at
      t.string :title
      t.text :description
      t.string :meal_type
      t.integer :guest_limit
      t.float :price
      t.boolean :status
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
