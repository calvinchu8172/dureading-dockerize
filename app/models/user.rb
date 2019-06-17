class User < ActiveRecord::Base
  include UserOmniauth
  include UserAccessToken

  has_many :user_books, :dependent => :destroy
  has_many :books, :through => :user_books

  strip_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :trackable, :confirmable, :timeoutable, 
         :omniauthable, omniauth_providers: [:sso]
  def name
    self.email.split('@').first
  end

end
