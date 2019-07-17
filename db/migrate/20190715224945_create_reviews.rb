class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :restaurant_name
      t.string :restaurant_review

      t.timestamps
    end
  end
end
