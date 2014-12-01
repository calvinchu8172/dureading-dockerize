class ApiV1::BooksController < ApiController

	# GET /ap1/v1/books 拿所有書櫃的書跟留言
	def index
		render :json => { 
			:books => [
				{
					:id => 1,
					:user_id => 1,
					:isbn => "1234567890",
					:title => "Test Book",
					:author => "ihover",
					:description => "blahblahblahblahblahblahblah",
					:pages => 500,
					:publish_date => Date.today,
					:cover_large_url => "http://d2hsbzg80yxel6.cloudfront.net/images/87083/medium/ACL038700.jpg",					
					:cover_small_url => "http://d2hsbzg80yxel6.cloudfront.net/images/87083/original/ACL038700.jpg",
					:publisher => "AlphaCamp",
					:updated_at => Time.now,
					:created_at => Time.now,							
					:comments => [
						{
							:id => 1,
							:user_id => 1,
							:content => "Good Book!",
							:photo_small_url => nil,
							:photo_large_url => nil,
							:updated_at => Time.now,
							:created_at => Time.now							
						},
						{
							:id => 2,
							:user_id => 1,
							:content => "Bad Book!",
							:photo_small_url => nil,
							:photo_large_url => nil,
							:updated_at => Time.now,
							:created_at => Time.now							
						}						
					]					
				},
				{
					:id => 2,
					:user_id => 1,
					:isbn => "abcd1234567",
					:title => "Demo Book",
					:author => "jimmy",
					:description => "blahblahblahblahblahblahblah",
					:pages => 100,
					:publish_date => Date.today,
					:cover_large_url => "http://ecx.images-amazon.com/images/I/510KFpOXmAL.jpg",					
					:cover_small_url => "http://ecx.images-amazon.com/images/I/510KFpOXmAL.jpg",
					:publisher => "AlphaCamp",
					:updated_at => Time.now,
					:created_at => Time.now,
					:comments => []					
				}				
			] 
		}
	end

	# POST /api/v1/books  新增一本書
	def create
		render :json => { :message => "Ok", :book_id => 123 }
	end

	# DELETE /api/v1/books/{id} 刪除書
	def destroy
		render :json => { :message => "Ok" }
	end

end
