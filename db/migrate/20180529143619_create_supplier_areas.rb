class CreateSupplierAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_areas do |t|
      t.references :area, foreign_key: true
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
