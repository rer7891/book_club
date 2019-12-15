require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "validations" do
    it {should validate_presence_of :name }
  end

  describe "relationships" do
    it {should have_many :book_authors }
    it {should have_many(:books).through(:book_authors) }
  end

  describe "methods" do
    it "can calculate an ave number of book pages per author" do
      sona= Author.create!(name: "Sona Charaipotra")
      pretty_things = sona.books.create!(title: "Tiny Pretty Things",
                            pages: 256,
                            publication_year: "2010")
      another_book = sona.books.create!(title: "Another Book",
                            pages: 316,
                            publication_year: "2000")
      expect(sona.ave_page_count).to eql(286)
    end
  end
end
