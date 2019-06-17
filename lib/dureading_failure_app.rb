class DureadingFailureApp < Devise::FailureApp
  def route(scope)
    :books_url
  end
end