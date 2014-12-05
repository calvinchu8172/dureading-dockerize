class ApiV1::CommentsController < ApiController

  before_action :require_login
  
	# POST /ap1/v1/books/{book_id}/comments 
	def create
    @book = Book.find( params[:book_id] )

    @comment = @book.comments.build( :content => params[:content], 
                                     :photo => params[:photo],
                                     :user => current_user )
    @comment.user = current_user
    @comment.save
    
		render :json => { :message => "Ok", :comment_id => @comment.id }
	end

	# DELETE /ap1/v1/comments/{id} 刪除
	def destroy
    @comment = Comment.find( params[:id] )

    if @comment.user == current_user
      @comment.destroy
    end

		render :json => { :message => "Ok" }
	end

end
