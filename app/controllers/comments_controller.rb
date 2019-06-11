class CommentsController < ApplicationController
  include CheckUser
  before_action :check_user

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build( comment_params )
    @comment.user = current_user

     if @comment.save
       redirect_to book_path(@book)
     else
       render "/books/show"
     end

  end

  def destroy
    @book = Book.find( params[:book_id] )
    @comment = @book.comments.find( params[:id] )

     if @comment.user == current_user
      @comment.destroy
    end

    redirect_to :back
  end

  protected

  def comment_params
    params.require(:comment).permit(:content, :book_id, :user_id, :photo)
  end

end
