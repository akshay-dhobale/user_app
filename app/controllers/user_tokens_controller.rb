class UserTokensController < ApplicationController

	# skip_before_action :verify_authenticity_token # before_action
	before_action :validate_headers, only: [:destroy]

    def create
        user = User.find_by_phone_number(params[:phone_number])
        if user && user.authenticate(params[:password])
          # session[:user_id] = user.id
          user_token = UserToken.new(user: user)
          if user_token.save
          	render json: {status: "success", token: user_token.token}
          else
          	render json: {status: "failed"}
          end
        else
          render json: {errors:{error_type:'invalid_params', error_description: "invalid phone_number or password"}}, status: :unprocessable_entity and return
        end
    end

    def destroy
       user_token = UserToken.find_by(token: request.headers[:token])
       if user_token.status?
       	user_token.status = false
       	user_token.save
       
       	render json: {status: "success"}
       else
       	render json: {status: 'failed'}
       end
    end

    private

    def user_params

    	
    end


end
