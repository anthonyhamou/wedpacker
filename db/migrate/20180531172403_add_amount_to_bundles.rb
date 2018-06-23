class AddAmountToBundles < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bundles, :amount, currency: { present: false }
  end
end
