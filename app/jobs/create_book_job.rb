class CreateBookJob < ApplicationJob
  queue_as :default

  def perform(books, user)
    # Do something later
    BookMailer.with(book: books, user: user.email).book_created.deliver_now
  end
end
