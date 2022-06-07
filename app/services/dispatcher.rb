class Dispatcher
	cattr_accessor :connection, :channel
	class << self
		def dispatch msg = {}, ex = nil
			event = channel.fanout("payment_reqs.create")
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