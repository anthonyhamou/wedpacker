class CreateBundles < ActiveRecord::Migration[5.2]
  def change
    create_table :bundles do |t|
      t.string :state
      t.date :starts_on
      t.date :ends_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
