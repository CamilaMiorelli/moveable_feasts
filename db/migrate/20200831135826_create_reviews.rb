class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :review_title
      t.integer :rating
      t.text :review_description

      t.timestamps
    end
  end
end
