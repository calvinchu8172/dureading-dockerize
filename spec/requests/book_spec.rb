require 'rails_helper'

RSpec.describe "API_V1::Books", :type => :request do

	example "GET /ap1/v1/books" do
		get '/api/v1/books', :auth_token => "our-user-token"

		expect(response).to have_http_status(200)

		# TODO
		#expect(response.body).to eq({}.to_json)
	end

	example "POST /api/v1/books" do
		post "/api/v1/books", :isbn => "12345678", :auth_token => "our-user-token"

		expect(response).to have_http_status(200)
	end

	example "DELETE /api/v1/books/:id" do
		delete "/api/v1/books/123", :auth_token => "our-user-token"

		expect(response).to have_http_status(200)
	end

	example "POST /api/v1/books/:id/comments" do
		post "/api/v1/books/123/comments", :content => "good", :auth_token => "our-user-token"

		expect(response).to have_http_status(200)
	end

	example "DELETE /api/v1/comments/:id" do
		delete "/api/v1/comments/456", :auth_token => "our-user-token"

		expect(response).to have_http_status(200)
	end

end	