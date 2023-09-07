# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  context "a negative case" do
    it 'Failed create a book (no author_id present)' do
      book = Book.create(
        title: 'ABCDE',
        date_release: '2023-09-01'
      )

      expect(
        book.errors.messages[:author_id]
      ).to eq(["can't be blank"])
    end

    it 'fails if title is of whitespaces' do
      author = Author.create(name: 'Reza Firdaus')
      book = Book.create(
        title: '     ',
        author_id: author.id,
        date_release: '2023-09-01'
      )

      expect(
        book.errors.messages[:title]
      ).to eq(["can't be blank"])
    end
  end
  

  it 'Created a book' do
    author = Author.create(name: 'Reza Firdaus')
    Book.create(
      title: 'ABCDEF',
      author_id: author.id,
      date_release: '2023-09-01'
    )
    
    expect(Book.count).to eq(1)
  end
end