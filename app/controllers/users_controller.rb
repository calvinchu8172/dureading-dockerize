class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
	  @books = @user.books.page(params[:page]).per(18)
  end

end
