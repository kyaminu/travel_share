class ChangetoTripsAddUnique < ActiveRecord::Migration[7.0]
  def change
    add_index :trips, :share_key, unique: true
  end
end
