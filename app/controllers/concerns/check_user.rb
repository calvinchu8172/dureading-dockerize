module CheckUser

  def check_user
    if current_user.nil?
      redirect_to books_path
    end
  end

end