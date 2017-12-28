class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :owner_id
      t.integer :visitor_id
      t.timestamps
    end
  end
end
