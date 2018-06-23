class AddCoordinatesToSuppliers < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :latitude, :float
    add_column :suppliers, :longitude, :float
  end
end
