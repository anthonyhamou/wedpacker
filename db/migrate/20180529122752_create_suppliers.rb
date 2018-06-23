class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :owner
      t.text :description
      t.float :avg_rating
      t.string :originality
      t.string :email
      t.integer :capacity
      t.string :address
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
