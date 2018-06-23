class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.date :starts_on
      t.date :ends_on
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
