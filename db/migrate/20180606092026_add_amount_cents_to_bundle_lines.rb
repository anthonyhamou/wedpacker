class AddAmountCentsToBundleLines < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bundle_lines, :amount, currency: { present: false }
  end
end
