class ChangeCloumnsNotnullAddTripContents < ActiveRecord::Migration[7.0]
  def change
    change_column :trip_contents, :timestamp, :datetime, null: false
    change_column :trip_contents, :content, :text, null: false
  end
end
