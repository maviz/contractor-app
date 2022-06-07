class PaymentReq < ApplicationRecord
	include Hashid::Rails

	enum status: [:pending, :accepted, :rejected]

	before_validation :set_status, on: :create

	after_create :dispatch_creation
	

	private

	def set_status
		self.status = :pending
	end

	def dispatch_creation
		Dispatcher.dispatch(self.attributes.merge!({trans_id: self.hashid}))
	end
end
