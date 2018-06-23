class AddPaymentToBundles < ActiveRecord::Migration[5.2]
  def change
    add_column :bundles, :payment, :json
  end
end
