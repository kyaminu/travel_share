class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :trips, :name, :destination
    rename_column :trips, :when, :start_at
    rename_column :trips, :name_of_trip, :title

    rename_column :trip_contents, :timestamp, :scheduled_time
    rename_column :trip_contents, :content, :schedule
  end
end
