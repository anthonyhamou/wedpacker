class AddCapacityToBundles < ActiveRecord::Migration[5.2]
  def change
    add_column :bundles, :capacity, :integer
  end
end
