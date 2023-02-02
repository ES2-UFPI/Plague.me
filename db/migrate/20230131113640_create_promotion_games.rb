class CreatePromotionGames < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_games do |t|
      t.references :promotion, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
