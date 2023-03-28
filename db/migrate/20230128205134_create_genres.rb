class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :name_genre
      t.string :description_genre

      t.timestamps
    end
  end
end
