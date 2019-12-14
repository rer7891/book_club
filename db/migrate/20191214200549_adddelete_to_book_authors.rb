class AdddeleteToBookAuthors < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :book_authors, :books
    add_foreign_key :book_authors, :books, on_delete: :cascade
    remove_foreign_key :book_authors, :authors
    add_foreign_key :book_authors, :authors, on_delete: :cascade
  end
end
