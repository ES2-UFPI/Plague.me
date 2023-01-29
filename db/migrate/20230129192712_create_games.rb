class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name_game
      t.text :description_game
      t.date :release
      t.float :rate_game
      t.string :franchise

      t.timestamps
    end
  end
end
