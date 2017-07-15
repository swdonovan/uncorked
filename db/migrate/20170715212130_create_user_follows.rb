class CreateUserFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :user_follows do |t|
      t.references :user, foreign_key: true
      t.references :followable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
