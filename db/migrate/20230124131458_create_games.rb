class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :banner_game
      t.string :title_game
      t.text :synopsis_game
      t.boolean :isforsale_game

      t.timestamps
    end
  end
end
