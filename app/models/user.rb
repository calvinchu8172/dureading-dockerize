class User < ActiveRecord::Base

	has_many :user_books, :dependent => :destroy
    has_many :books, :through => :user_books

    def self.from_omniauth(auth_hash)
    	user = where( :facebook_uid => auth_hash[:uid] ).first_or_initialize
    	user.name = auth_hash[:info][:name]
    	user.email = auth_hash[:info][:email]
    	user.fb_token = auth_hash[:credentials][:token]
    	user.fb_expires_at = Time.at(auth_hash[:credentials][:expires_at])
    	user.save!
    	user
  	end
	
end
