class Comment < ActiveRecord::Base
	

  has_attached_file :photo, :storage => :s3, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	belongs_to :user
	belongs_to :book #, :counter_cache => true
end
