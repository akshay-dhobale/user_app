class UserToken < ApplicationRecord
	belongs_to :user

	before_create :add_token_and_revoke_time

	def add_token_and_revoke_time
		self.token = SecureRandom.hex(6)
		self.revoke_at = DateTime.now + 4.hours
		self.status = true
	end
end
