class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :image
      t.string :description
      t.integer :actLatitude
      t.integer :actLongitude
      t.integer :location_id

      t.timestamps
    end
  end
end
