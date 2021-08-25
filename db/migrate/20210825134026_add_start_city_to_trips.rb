class AddStartCityToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :startCity, :string
  end
end
