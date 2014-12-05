require 'rails_helper'

RSpec.describe "API_V1::Books", :type => :request do

	before do
		@user = User.create!( :email => 'test@example.com' )
		@book = Book.create!( :title => "test" )
	end

	example "GET /ap1/v1/books" do
		get '/api/v1/books', :auth_token => @user.token

		expect(response).to have_http_status(200)
	end

	example "POST /api/v1/books" do
		post '/api/v1/books', :isbn => "9780307887894", :auth_token => @user.token

		expect(response).to have_http_status(200)
		expect( Book.last.isbn ).to eq( "9780307887894" )
		expect( UserBook.last.user_id ).to eq( @user.id )
		expect( UserBook.last.book_id ).to eq( Book.last.id )
	end

	example "DELETE /api/v1/books/:id" do
		UserBook.create!( :user => @user, :book => @book)

		delete "/api/v1/books/#{@book.id}", :auth_token => @user.token

		expect(response).to have_http_status(200)
		expect(UserBook.count).to eq(0)
	end

	example "POST /api/v1/books/:id/comments" do
		post "/api/v1/books/#{@book.id}/comments", :content => "good", :auth_token => @user.token

		expect(response).to have_http_status(200)

		expect( Comment.last.content ).to eq("good")
	end

	example "DELETE /api/v1/comments/:id" do
		comment = Comment.create!( :book => @book, :user => @user, :content => "test" )

		delete "/api/v1/comments/#{comment.id}", :auth_token => @user.token

		expect(response).to have_http_status(200)
		expect( Comment.count ).to eq(0)
	end

end	