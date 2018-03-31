class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating).round(2)
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end
end
