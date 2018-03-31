class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    average = reviews.average(:rating).round(2)    
  end
end
