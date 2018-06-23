class DropSupplierAreas < ActiveRecord::Migration[5.2]
  def change
    drop_table :supplier_areas
  end
end
