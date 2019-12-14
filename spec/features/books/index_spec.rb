require 'rails_helper'

RSpec.describe "As a user", type: :feature do
  describe "when I visit /books I see each book" do
    it "including all book details" do
      sona= Author.create!(name: "Sona Charaipotra")
      clayton = Author.create!(name: "Dhonielle Clayton")
      pretty_things = sona.books.create!(title: "Tiny Pretty Things",
                            pages: 256,
                            publication_year: "2010")
      another_book = sona.books.create!(title: "Another Book",
                            pages: 316,
                            publication_year: "2000")

      becky = Author.create!(name: " Adam Silvera")
      adam = Author.create!(name: "Becky Albertalli")
      what_if = becky.books.create!(title: "What If It’s Us",
                            pages: 176,
                            publication_year: "2008")
      another_book_2= becky.books.create!(title: "Another Book 2",
                            pages: 106,
                            publication_year: "2004")
      what_if.authors << adam
      pretty_things.authors << clayton

      visit '/books'
      books = [pretty_things, what_if, another_book, another_book_2]
      books.each do |book|
        expect(page).to have_content(book.title)
        expect(page).to have_content(book.pages)
        expect(page).to have_content(book.publication_year)
        book.authors.each {|author| expect(page).to have_content(author.name)}
      end
    end
  end
end
