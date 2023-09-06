class BookMailer < ApplicationMailer
  default from: 'rmeureun@gmail.com'

  def book_created
    @user = params[:user]
    @book = params[:book]
    mail(to: @user, subject: "'#{@book.title}' Successfully Created")
  end
end
