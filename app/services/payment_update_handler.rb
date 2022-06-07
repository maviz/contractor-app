class PaymentUpdateHandler

	attr_accessor :args

	def initialize(args)
		@args = JSON.parse(args).with_indifferent_access
	end

	def handle
		update_record
	end

	def update_record
		pr = PaymentReq.find(args[:transaction_id])
		pr.update(status: args[:status])
	rescue
		nil
	end
end