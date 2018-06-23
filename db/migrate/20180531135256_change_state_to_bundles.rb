class ChangeStateToBundles < ActiveRecord::Migration[5.2]
  def change
    change_column :bundles, :state, :string, default: "pending"
  end
end
