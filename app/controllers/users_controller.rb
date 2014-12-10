class UsersController < ApplicationController

  def show
    @user = User.find( params[:id] )
	  @books = @user.books.page(params[:page]).per(4)
  end

end
