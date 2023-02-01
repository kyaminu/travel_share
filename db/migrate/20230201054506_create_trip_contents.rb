class CreateTripContents < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_contents do |t|
      t.datetime :timestamp
      t.text :content
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
