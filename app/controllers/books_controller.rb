class BooksController < ApplicationController


	def create	
		@book = find_or_create_book_information(params[:isbn])

		# TODO: create UserBook 
	end

	protected

	def find_or_create_book_information(isbn)
		book = Book.where( :isbn => isbn ).first
		unless book
			book = Book.new( :isbn => isbn )
			book.fill_goodreads
			book.save!
		end

		book
	end

end
