require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :pages }
    it { should validate_presence_of :publication_year }
  end

  describe "relationships" do
    it { have_many :book_authors }
    it { have_many(:authors).through(:book_authors) }
  end
end
