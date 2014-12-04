class Book < ActiveRecord::Base

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

    has_many :user_books
    has_many :users, :through => :user_books

    has_many :comments, :dependent => :destroy

	# isbn example: 9780307887894
	
	def fill_goodreads
		if self.isbn.present?
	   		conn = Faraday.new(:url => 'https://www.goodreads.com')
	    	response = conn.get "/book/isbn", { :isbn => self.isbn, :key => "WJGaq9KTqxo5n03ngpxRg" }
	   
	   		book_hash = Hash.from_xml( response.body )     

	   		# Rails.logger.debug(book_hash.inspect) #add by 雨蒼
	   		
	   		#self.title = book_hash["GoodreadsResponse"]["book"]["title"]
	   		#self.author = book_hash["GoodreadsResponse"]["book"]["authors"]["author"]["name"]
	   		
	   		# TODO: more attributes
			# self.description
			# self.pages
			# self.cover_large_url
			# self.cover_small_url
			# self.publisher
			# self.publish_date
		else
			self.title ||= "N/A"
		end

   		return self
	end

end
