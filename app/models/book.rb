class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :publication_year

  has_many :book_authors
  has_many :authors, through: :book_authors
end
