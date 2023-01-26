class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :titlePublisher
      t.string :descriptionPublisher

      t.timestamps
    end
  end
end
