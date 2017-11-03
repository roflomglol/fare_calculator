class CreateFares < ActiveRecord::Migration[5.1]
  def change
    create_table :fares do |t|
      t.integer :kind
      t.integer :pickup
      t.integer :per_minute
      t.integer :per_km
      t.integer :minimum_price

      t.timestamps
    end
  end
end
