class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = 'Book was successfully created.'
    else
      @books = Book.all
      @user = current_user
      render action: :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = 'Book was successfully destroyed.'
  end

  def edit
    @book = Book.find(params[:id])
    correct_user?(@book.user)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = 'Book was successfully updated.'
    else
      render action: :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def correct_user?(user)
    redirect_to books_path if current_user != user
  end
end
