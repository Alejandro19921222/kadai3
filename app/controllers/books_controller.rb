class BooksController < ApplicationController

  def create
     @book = Book.new(book_params)
    if @book.save(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
    render action: :index
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
   flash[:notice] = "Book was successfully destroyed."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def updated
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully updated."
    else
    render action: :edit
    end
  end

end
