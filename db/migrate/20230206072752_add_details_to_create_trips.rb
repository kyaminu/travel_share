class AddDetailsToCreateTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :name_of_trip, :string
    add_column :trips, :when, :date
    add_column :trips, :total_day, :integer
  end
end
