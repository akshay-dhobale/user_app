class BankApp
	include HTTParty
	# format :json
	# base_uri "http://localhost:4000"#Rails.secrets.bank_app_url

	#to protect access we can add IP address validation with AWS
	def self.sign_up(phone_number)
		# options = {params: {phone_number: phone_number}}
    options = {
      body: {phone_number: phone_number}
    }
		HTTParty.post("http://localhost:4000/sign-up", options)
	end
end