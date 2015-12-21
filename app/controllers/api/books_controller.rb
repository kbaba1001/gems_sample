class Api::BooksController < ApplicationController
  def create
    book = Book.new(book_params)

    if book.valid?
      book.save

      render json: {book_id: book.id}
    else
      render json: {errors: book.errors.full_messages.join(' ')}, status: :bad_request
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :price)
  end
end
