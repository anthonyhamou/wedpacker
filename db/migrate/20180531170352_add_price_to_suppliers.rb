class AddPriceToSuppliers < ActiveRecord::Migration[5.2]
  def change
    add_monetize :suppliers, :price, currency: { present: false }
  end
end
