class RenameTableFollowsToFollows < ActiveRecord::Migration[5.1]
  def change
    rename_table :table_follows, :follows
  end
end
