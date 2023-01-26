class CreateGameMidia < ActiveRecord::Migration[7.0]
  def change
    create_table :game_midia do |t|
      t.string :screenshotGameMidia
      t.string :videoGameMidia

      t.timestamps
    end
  end
end
