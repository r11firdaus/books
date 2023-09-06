# Preview all emails at http://localhost:3000/rails/mailers/book_mailer
class BookMailerPreview < ActionMailer::Preview
  def book_created
    BookMailer.with(book: Book.first).book_created
  end
end
