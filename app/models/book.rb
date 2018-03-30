class Book < ApplicationRecord
  validates_presence_of :title
  has_many :user_books
  has_many :users, through: :user_books
end
