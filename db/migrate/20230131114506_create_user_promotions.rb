class CreateUserPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_promotions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
