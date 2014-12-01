class ApiV1::CommentsController < ApiController

	# POST /ap1/v1/books/{book_id}/comments 
	def create
		render :json => { :message => "Ok", :comment_id => 456 }
	end

	# DELETE /ap1/v1/comments/{id} 刪除
	def destroy
		render :json => { :message => "Ok" }
	end

end
