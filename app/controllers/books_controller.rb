class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def create
    @book= Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end
  
  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    
  end

  def show
  @book = Book.find(params[:id])
  @user = @book.user
  @books = @user.books
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
    
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
  

end