class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name_publisher
      t.string :description_publisher

      t.timestamps
    end
  end
end
