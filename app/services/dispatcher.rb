class Dispatcher

	cattr_accessor :connection, :channel
	class << self
		def dispatch msg = {}, ex 
			event = channel.fanout("payment_reqs.#{ex}")
			event.publish(msg.to_json)
		end

		def channel
			@@channel ||= connection.create_channel
		end

		def connection
			@@connection ||= Bunny.new.tap { |con|  con.start }
		end
	end

end