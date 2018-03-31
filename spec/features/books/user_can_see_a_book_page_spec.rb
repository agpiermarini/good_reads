require 'rails_helper'

describe 'User' do
  describe 'visits book show page' do
    it 'sees book title' do
      book = Book.create!(title: "Book Title")

      visit book_path(book)

      expect(page).to have_content(book.title)
    end

    it 'sees list of reviews for that book, including the reviewer, review body and review rating' do
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

      visit book_path(book)

      expect(page).to have_content(review_1.user.name)
      expect(page).to have_content(review_2.user.name)
      expect(page).to have_content(review_3.user.name)
      expect(page).to have_content(review_4.user.name)
      expect(page).to have_content(review_5.user.name)
      expect(page).to have_content(review_6.user.name)

      expect(page).to have_content(review_1.body)
      expect(page).to have_content(review_2.body)
      expect(page).to have_content(review_3.body)
      expect(page).to have_content(review_4.body)
      expect(page).to have_content(review_5.body)
      expect(page).to have_content(review_6.body)

      expect(page).to have_content(review_1.rating)
      expect(page).to have_content(review_2.rating)
      expect(page).to have_content(review_3.rating)
      expect(page).to have_content(review_4.rating)
      expect(page).to have_content(review_5.rating)
      expect(page).to have_content(review_6.rating)
    end

    it 'sees the average rating for a book' do
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

      visit book_path(book)

      expect(page).to have_content("Average Rating: #{book.average_rating}")
    end

    it 'sees rating, body and reviewer name for the review with the highest rating' do
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

      visit book_path(book)

      within(".highest_rating") do
        expect(page).to have_content("Highest Rating: #{book.highest_rating.rating}")
        expect(page).to have_content("Reviewer: #{book.highest_rating.user.name}")
        expect(page).to have_content("Review: #{book.highest_rating.body}")
      end
    end

    it 'sees rating, body and reviewer name for the review with the lowest rating' do
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

      visit book_path(book)

      within(".lowest_rating") do
        expect(page).to have_content("Lowest Rating: #{book.lowest_rating.rating}")
        expect(page).to have_content("Reviewer: #{book.lowest_rating.user.name}")
        expect(page).to have_content("Review: #{book.lowest_rating.body}")
      end
    end
  end
end




    #When I visit a book show page, I see the book title and a list of reviews for that book,
    # including the body and the user that created that review. I also see the rating (1-5; you
    # do not need to validate that this falls within this range) that the user gave the book.
    #
    # When I visit the book show page, I see the average rating for that book.
    #
    # When I visit the book show page, I see a header that includes the highest rating for that book (e.g "Highest Rating: 4").
    #
    # When I visit the book show page, I see a header that includes the lowest rating for that book (e.g "Lowest Rating: 1").
    #
    # When I visit the book show page, under the header for highest rating, I see the body of that review and the name of the reviewer that submitted that review.
    #
    # When I visit the book show page, under the header for lowest rating, I see the body of that review and the name of the reviewer that submitted that review.
    # ```
    #
    # You do not need to create a form for a review or implement current userd
