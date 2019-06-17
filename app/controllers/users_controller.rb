class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find( current_user.id )
	  @books = @user.books.page(params[:page]).per(18)
  end

end
