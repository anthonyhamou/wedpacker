class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :country
      t.string :region
      t.string :department
      t.string :city

      t.timestamps
    end
  end
end
