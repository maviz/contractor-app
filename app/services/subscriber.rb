class Subscriber
	cattr_accessor :connection, :channel
	class << self
		def subscribe
			ex = channel.topic("payment_reqs")
			
			channel.queue("", :exclusive => true).bind(ex, :routing_key => "payment_reqs.update").subscribe do |delivery_info, metadata, payload|
  				puts "Got this ----> #{payload}"
  				PaymentUpdateHandler.new(payload).handle
			end
		end

		def channel
			@@channel ||= connection.create_channel
		end

		def connection
			@@connection ||= Bunny.new.tap { |con|  con.start }
		end
	end
end

