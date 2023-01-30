class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.string :name_developer
      t.string :description_developer

      t.timestamps
    end
  end
end
