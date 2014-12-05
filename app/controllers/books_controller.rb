class BooksController < ApplicationController


	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
  		@book = Book.new
	end

	def create	
		@book = find_or_create_book_information(book_params)
		@book.save
		@book.user_books.create( :user_id => current_user.id )
		# Rails.logger.debug(@book.inspect) #add by 雨蒼

		# TODO: create UserBook 20141202
		#@book = current_user.user_books.new( :book => @book )
		#@book.user = current_user
		
		#redirect_to books_url
		redirect_to user_url(current_user)
		# redirect_to :action => :show, :id => @event
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
		book = Book.where( :isbn => params[:isbn] ).first
		unless book
			book = Book.new(params)
			# Rails.logger.debug(book) #add by 雨蒼
			book.fill_goodreads
			# Rails.logger.debug(book) #add by 雨蒼
			book.save!
		end

		book
	end

	def book_params
      params.require(:book).permit(:isbn, :title, :author, :description, :logo, :comment)
    end

end
