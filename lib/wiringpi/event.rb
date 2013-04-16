module WiringPi
	class GPIO
		def interrupt(pin, edge, &block)
			Thread.new do
				@value = digital_read(pin)
				@last_value = value
				loop do
					@last_value = @value
					@value = digital_read(pin)

					if @value != @last_value
						next if @value == 0 and edge == :falling_edge
						next if @value == 1 and edge == :rising_edge
						break
					end
					block.call @value				
				end
			end
		end
	end
end
