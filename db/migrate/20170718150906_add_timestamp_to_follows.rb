class AddTimestampToFollows < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :created_at, :datetime
    add_column :follows, :updated_at, :datetime
  end
end
