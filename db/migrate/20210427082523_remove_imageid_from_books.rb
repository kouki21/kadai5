class RemoveImageidFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :imageid, :string
  end
end
