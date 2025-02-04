require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:valid_date) { Date.today.to_s }

  context 'validations' do
    it 'is valid' do
      book = Book.new(title: 'testbook', author: 'me', price: 4.20, published_date: :valid_date)
      expect(book).to be_valid
    end

    it 'is invalid without a title' do
      book = Book.new(title: '')
      expect(book).not_to be_valid
    end

    it 'is invalid without an author' do
        book = Book.new(title: 'testbook', author: '')
        expect(book).not_to be_valid
      end
  
      it 'is invalid without a price' do
        book = Book.new(title: 'testbook', author: 'me', price: nil)
        expect(book).not_to be_valid
      end
  
      it 'is invalid without a published_date' do
        book = Book.new(title: 'testbook', author: 'me', price: 4.20, published_date: nil)
        expect(book).not_to be_valid
      end
  end
end
