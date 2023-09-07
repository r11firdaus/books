module Api::V1
  class BooksController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_book, only: %i[ show edit update destroy ]

    # GET /books
    def index
      books = if params[:page].present?
                query = Book.page(params[:page]).per(10).joins(:author).select("books.*, authors.name as author_name")
                if params[:writer].present?
                  query.where("authors.name = ?", params[:writer])
                else
                  query.all
                end
              else
                Book.all
              end

      # render json: books
      render json: books.to_json(only: [:id, :author_name, :title, :date_release])
    end

    # GET /books/1
    def show
      render json: @book
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.joins(:author).select("books.*, authors.name as author_name").find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:title, :author_id, :date_release)
      end
  end
end