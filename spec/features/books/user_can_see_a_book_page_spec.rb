require 'rails_helper'

describe 'User' do
  describe 'visits book show page' do
    it 'sees book title' do
      book = Book.create!(title: "Book Title")

      visit book_path(book)

      expect(page).to have_content(book.title)
    end

    it 'sees a list of reviews for that book' do
      book = Book.create!(title: "Book Title")
      user = User.create!(name: "Andrew")


      visit book_path(book)

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
