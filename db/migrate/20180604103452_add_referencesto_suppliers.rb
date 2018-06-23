class AddReferencestoSuppliers < ActiveRecord::Migration[5.2]
  def change
    add_reference :suppliers, :area, foreign_key: true
  end
end
