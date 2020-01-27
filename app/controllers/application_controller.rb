class ApplicationController < ActionController::API

	def validate_headers
		render json: {error: 'headers missing'} , status: :unprocessable_entity if request.headers[:token].blank?
	end

	#to validate if user logged in or not
	def is_login?
		user_token = UserToken.find_by_token(request.headers[:token])

		if user_token.status? #&& user_token.revoke_at < DateTime.now
			@user = user_token.user
		else
			render json: {error: "please login"}
		end
		
	end

end
