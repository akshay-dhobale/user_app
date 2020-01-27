class User < ApplicationRecord
	has_secure_password
	has_many :user_tokens

	validates_uniqueness_of :phone_number
	validates_presence_of :phone_number
end
