class RemoveNameFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :name
  end
end
