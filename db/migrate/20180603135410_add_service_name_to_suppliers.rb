class AddServiceNameToSuppliers < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :service_name, :string
  end
end
