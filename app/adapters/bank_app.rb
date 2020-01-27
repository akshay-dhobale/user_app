class BankApp
	include HTTParty
	format :json
  	base_uri "random/route"#Rails.secrets.bank_app_url

  	#to protect access we can add IP address validation with AWS
  	def self.send(id, phone_number, route, params)
  		options = {
  			{headers: {phone_number: phone_number}
  		}

  		options.merge!(params: params)
  		self.class.get()
  	end
end