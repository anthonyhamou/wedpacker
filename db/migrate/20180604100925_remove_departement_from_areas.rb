class RemoveDepartementFromAreas < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :department
  end
end
