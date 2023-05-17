class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book =Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

   def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
     flash[:alert] = "2 errors prohibited this book from being saved:"
     flash[:alert] = "Title can't be blank"
     flash[:alert] = "Body can't be blank"
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

