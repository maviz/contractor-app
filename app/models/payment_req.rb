class PaymentReq < ApplicationRecord
	enum status: [:pending, :accepted, :rejected]

	before_validation :set_status, on: :create
	

	private

	def set_status
		self.status = :pending
	end
end
