class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :owner_id
      t.integer :visitor_id
      t.string :domain
      t.string :word
      t.timestamps
    end
  end
end
