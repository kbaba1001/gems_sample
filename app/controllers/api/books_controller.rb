class Api::BooksController < Api::ApplicationController
  def create
    puts request.env['REQUEST_URI']

    book = Book.new(book_params)

    if book.valid?
      book.save

      render json: {book_id: book.id} and return
    end

      # render json: {errors: book.errors.full_messages.join(' ')}, status: :bad_request
    fail InvalidParameterError, book.errors.full_messages.join(' ')
  end

  private

  def book_params
    params.require(:book).permit(:title, :price)
  end
end
