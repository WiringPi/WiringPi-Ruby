#!/usr/bin/env ruby
require 'wiringpi'
STDOUT.write """ScrollPhat Binary Clock

ScrollPhat will show hour, minute and second in binary across 3 lines.

Press Ctrl+C to exit.
"""
class Clock < WiringPi::ScrollPhat

	@@running = false

	def tick
		time = Time.new
		x = 0
		y = 0
		[time.hour, time.min, time.sec].each do |p|
			p.to_s(2).rjust(8,'0').split('').each do |d|
				self.point(x, y, d.to_i)
				x+=1
			end
			y+=2
			x=0
		end
		self.update
	end

	def go!
		@@running = true
		trap("SIGINT") { self.stop! }
		while @@running
			self.tick
			sleep 0.1
		end
	end

	def stop!
		STDOUT.write "\nGoodbye!\n"
		@@running = false
	end

end

clock = Clock.new
clock.go!
