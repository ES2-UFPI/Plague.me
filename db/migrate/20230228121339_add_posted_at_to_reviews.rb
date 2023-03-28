class AddPostedAtToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :posted_at, :datetime
  end
end
