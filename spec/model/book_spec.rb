require 'rails_helper'

describe Book do
  describe 'instance methods' do
    describe '#average_rating' do
      it 'calculates the average rating of all reviews' do
        book = Book.create!(title: "Book Title")
        user_1 = User.create!(name: "User_1")
        user_2 = User.create!(name: "User_2")
        user_3 = User.create!(name: "User_3")
        user_4 = User.create!(name: "User_4")
        user_5 = User.create!(name: "User_5")
        user_6 = User.create!(name: "User_6")
        review_1 = user_1.reviews.create!(body: "Really great book", rating: 5, book_id: book.id)
        review_2 = user_2.reviews.create!(body: "Really bad book", rating: 1, book_id: book.id)
        review_3 = user_3.reviews.create!(body: "Really wonderful book", rating: 4, book_id: book.id)
        review_4 = user_4.reviews.create!(body: "Really long book", rating: 3, book_id: book.id)
        review_5 = user_5.reviews.create!(body: "Really boring book", rating: 2, book_id: book.id)
        review_6 = user_6.reviews.create!(body: "Really fantastic book", rating: 5, book_id: book.id)

        expect(book.average_rating).to eq(3.33)
      end
    end

    describe '.highest_rating' do
      it 'returns review with highest rating' do
        book = Book.create!(title: "Book Title")
        user_1 = User.create!(name: "User_1")
        user_2 = User.create!(name: "User_2")
        user_3 = User.create!(name: "User_3")
        review_1 = user_1.reviews.create!(body: "Really great book", rating: 5, book_id: book.id)
        review_2 = user_2.reviews.create!(body: "Really bad book", rating: 1, book_id: book.id)
        review_3 = user_3.reviews.create!(body: "Really wonderful book", rating: 4, book_id: book.id)

        expect(book.highest_rating).to eq(review_1)
      end
    end

    describe '.lowest_rating' do
      it 'returns review with highest rating' do
        book = Book.create!(title: "Book Title")
        user_1 = User.create!(name: "User_1")
        user_2 = User.create!(name: "User_2")
        user_3 = User.create!(name: "User_3")
        review_1 = user_1.reviews.create!(body: "Really great book", rating: 5, book_id: book.id)
        review_2 = user_2.reviews.create!(body: "Really bad book", rating: 1, book_id: book.id)
        review_3 = user_3.reviews.create!(body: "Really wonderful book", rating: 4, book_id: book.id)

        expect(book.lowest_rating).to eq(review_2)
      end
    end
  end
end
