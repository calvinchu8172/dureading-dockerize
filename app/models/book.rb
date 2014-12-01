class Book < ActiveRecord::Base

	# isbn example: 9780307887894
	
	def fill_goodreads
		raise "Error! No ISBN!" if self.isbn.blank?

   		conn = Faraday.new(:url => 'https://www.goodreads.com')
    	response = conn.get "/book/isbn", { :isbn => self.isbn, :key => "WJGaq9KTqxo5n03ngpxRg" }
   
   		book_hash = Hash.from_xml( response.body )     

   		Rails.logger.debug(book_hash.inspect)
   		
   		self.title = book_hash["GoodreadsResponse"]["book"]["title"]
   		self.author = book_hash["GoodreadsResponse"]["book"]["authors"]["author"]["name"]
   		
   		# TODO: more attributes
		# self.description
		# self.pages
		# self.cover_large_url
		# self.cover_small_url
		# self.publisher
		# self.publish_date

   		return self
	end

end
