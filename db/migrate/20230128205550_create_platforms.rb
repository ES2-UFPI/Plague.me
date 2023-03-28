class CreatePlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :platforms do |t|
      t.string :name_platform
      t.string :description_platform

      t.timestamps
    end
  end
end
