class ApiV1::AuthController < ApiController

	# POST /api/v1/login
	def create
		render :json => {
				:message => "OK",
				:auth_token => "123456789",
				:user_id => 1
				}
	end

	# POST /api/v1/logout
	def destroy
		render :json => { :message => "OK" }
	end	

end
