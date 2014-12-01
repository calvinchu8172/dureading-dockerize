require 'rails_helper'

RSpec.describe "API_V1::Auth", :type => :request do

	example "login" do
		post '/api/v1/login', :access_token => "facebook-token"

		expect(response).to have_http_status(200)

		expect(response.body).to eq(
			{
				:message => "OK",
				:auth_token => "123456789",
				:user_id => 1
			}.to_json
		)
	end

end	