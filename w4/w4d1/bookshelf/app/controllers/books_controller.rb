class BooksController < ApplicationController
  def index
    # GET /books
    @books = Book.all
  end

  def new
  end

  def create
    @book = Book.new(book_params)
      # title: params[:book][:title],
      # author: params[:book][:author])

    if @book.save
      redirect_to books_path
    else
      raise "book is missing something"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
