class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating).round(2)
  end

  def highest_rating
    reviews.order(:rating).last
  end

  def lowest_rating
    reviews.order(:rating).first
  end
end
