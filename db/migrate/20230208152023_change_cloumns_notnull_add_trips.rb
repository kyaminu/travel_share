class ChangeCloumnsNotnullAddTrips < ActiveRecord::Migration[7.0]
  def change
    change_column :trips, :name, :integer, null: false
    change_column :trips, :name_of_trip, :string, null: false
    change_column :trips, :when, :date, null: false
    change_column :trips, :share_key, :string, unique: true
  end
end
