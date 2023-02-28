class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.integer :idshops
      t.string :title_shop

      t.timestamps
    end
  end
end
