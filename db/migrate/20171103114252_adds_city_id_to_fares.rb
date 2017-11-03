class AddsCityIdToFares < ActiveRecord::Migration[5.1]
  def change
    add_column :fares, :city_id, :integer
  end
end
