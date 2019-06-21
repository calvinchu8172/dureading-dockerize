class BooksController < ApplicationController
  before_action :authenticate_user!, :except => :index

	def index
    @books = Book.includes(:users).page(params[:page]).per(18)
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
  	@book = Book.new
	end

	def create	
		@book = find_or_create_book_information(book_params)

    if @book
      @book.user_books.create( :user_id => current_user.id )
      redirect_to user_url(current_user)
    else
      flash[:alert] = "ISBN 查無此書"
      redirect_to :back
    end
	end

	def edit
  		@book = current_user.books.find(params[:id])
	end

	def update
  		@book = current_user.books.find(params[:id])
  		@book.update(book_params)

  		#redirect_to books_url(@photo)
  		redirect_to user_url(current_user)
	end

	def destroy
  		@user_book = current_user.user_books.where( :book_id => params[:id] ).first
  		@user_book.destroy

  		redirect_to user_url(current_user)
	end


	protected

	def find_or_create_book_information(params) #fix by 雨蒼
    # find existed book
		book = Book.where( :isbn => params[:isbn] ).first
    return book if book

    # try to create new book based on ISBN
		book = Book.new(params)
		book.fill_goodreads
		if book.save
      return book
    else
      return nil
    end
	end

	def book_params
      params.require(:book).permit(:isbn, :title, :author, :description, :logo, :comment)
    end

end
