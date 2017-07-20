class CreateTableFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :table_follows do |t|
      t.references :user, foreign_key: true
      t.references :target, polymorphic: true
    end
  end
end
