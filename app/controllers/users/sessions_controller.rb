class Users::SessionsController < Devise::SessionsController

  def new
    # 載入上次登入的 Email 資訊
    params[:user] = { email: cookies[:email], remember_me: '1' } if cookies[:email].present?
    super
  end

  def create
    super do |resource|
      # 儲存此次登入的 Email 資訊
      cookies[:email] = params[:user][:remember_me] == '1' ? params[:user][:email] : nil
    end
  end
end
