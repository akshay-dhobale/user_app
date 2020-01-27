class PagesController < ApplicationController
	include ReverseProxy::Controller
	before_action :validate_headers, :is_login?

	def authorize_request
		if params[:resource] == 'user'
			forward_request
		else
			render json: {error: 'routing_error'}
		end
	end


	private
	def forward_request
		request.headers["phone-number"] = @user.phone_number
		original_fullpath = request.original_fullpath
		original_path = request.original_fullpath.gsub("/#{params[:resource]}", "")
		url = "localhost:4000" #can replace it with server url in this case with bank app url

		reverse_proxy "http://#{url}", path: "#{original_path}", http_options: {read_timeout: Rails.application.secrets.request_read_timeout} do |config|
		end
	end
end
