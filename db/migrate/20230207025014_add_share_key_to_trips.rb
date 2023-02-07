class AddShareKeyToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :share_key, :string
  end
end
