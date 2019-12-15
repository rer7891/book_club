require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit /books" do
  before :each do
    @sona= Author.create!(name: "Sona Charaipotra")
    @clayton = Author.create!(name: "Dhonielle Clayton")
    @pretty_things = @sona.books.create!(title: "Tiny Pretty Things",
                          pages: 256,
                          publication_year: "2010")
    @another_book = @sona.books.create!(title: "Another Book",
                          pages: 316,
                          publication_year: "2000")

    @adam = Author.create!(name: "Adam Silvera")
    @becky = Author.create!(name: "Becky Albertalli")
    @what_if = @becky.books.create!(title: "What If It’s Us",
                          pages: 176,
                          publication_year: "2008")
    @another_book_2 = @becky.books.create!(title: "Another Book 2",
                          pages: 106,
                          publication_year: "2004")
    @what_if.authors << @adam
    @pretty_things.authors << @clayton
  end
    describe "I'm then taken to /authors/:id and can see" do
      it "author's name, title of each book and ave number of pages for all books" do
        visit "/books"
        within "#book-#{@pretty_things.id}" do
          click_link "#{@sona.name}"
        end
        expect(current_path).to eql ("/authors/#{@sona.id}")
        expect(page).to have_content(@sona.name)
        expect(page).to have_content(@pretty_things.title)
        expect(page).to have_content(@another_book.title)
        expect(page).to have_content("The average number of pages for all #{@sona.name}'s books is 286.")
      end
    end
  end
end
