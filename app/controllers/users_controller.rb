class UsersController < ApplicationController
	# skip_before_action :verify_authenticity_token

    def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          render json:{status: "success"} and return
        else
          render json: {errors:{error_type:'invalid_params', error_description: user.errors.full_messages}}, status: :unprocessable_entity and return
        end
    end

    private

    def user_params
        params.permit(:phone_number, :password, :password_confirmation)
    end
end
