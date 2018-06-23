class CreateBundleLines < ActiveRecord::Migration[5.2]
  def change
    create_table :bundle_lines do |t|
      t.references :supplier, foreign_key: true
      t.references :bundle, foreign_key: true

      t.timestamps
    end
  end
end
