class Book < ActiveRecord::Base

		validates_presence_of :title

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
	   		
	   		unless book_hash["error"]
		   		self.title = book_hash["GoodreadsResponse"]["book"]["title"]
		   		self.author = book_hash["GoodreadsResponse"]["book"]["authors"]["author"]["name"]
		   		
				  self.description = book_hash["GoodreadsResponse"]["book"]["description"]
				  self.pages = book_hash["GoodreadsResponse"]["book"]["num_pages"]
				  self.cover_large_url = book_hash["GoodreadsResponse"]["book"]["image_url"]
				  self.cover_small_url = book_hash["GoodreadsResponse"]["book"]["small_image_url"]
				  self.publisher = book_hash["GoodreadsResponse"]["book"]["publisher"]
				  
				  y = book_hash["GoodreadsResponse"]["book"]["publication_year"]
				  m = book_hash["GoodreadsResponse"]["book"]["publication_month"]
				  d = book_hash["GoodreadsResponse"]["book"]["publication_day"]
			  	self.publish_date = "#{y}-#{m}-#{d}"
			  end
		end

   	return self
	end

end
