class AddReviewsToUserBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :user_books, :review, :text
  end
end
