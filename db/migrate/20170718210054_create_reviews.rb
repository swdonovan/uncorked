class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :reviewable, polymorphic: true, index: true 

      t.timestamps
    end
  end
end
