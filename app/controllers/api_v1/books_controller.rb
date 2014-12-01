class ApiV1::BooksController < ApiController

	def index
		render :json => { :message => "TEST" }
	end

end
