class Author < ApplicationRecord
  validates_presence_of :name

  has_many :book_authors
  has_many :books, through: :book_authors

  def ave_page_count
    books.average(:pages).round(2)
  end
end
