# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all
Book.destroy_all
BookAuthor.destroy_all

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
