class BankApp
	include HTTParty
	format :json
  	base_uri "localhost:4000"#Rails.secrets.bank_app_url

  	#to protect access we can add IP address validation with AWS
  	def self.sign_up(id, phone_number, route, params)
  		options = {
  			{headers: {phone_number: phone_number}
  		}

  		options.merge!(params: params)
  		self.class.post("/sign-up", options)
  	end
end