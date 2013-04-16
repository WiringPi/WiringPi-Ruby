module WiringPi
  class SPI
    @channel = 0
	def initialize(channel,speed)
	  @channel = channel
	  Wiringpi.wiringPiSPISetup(channel,speed)
	end
	def wiringPiSPIGetFd()
	  return Wiringpi.wiringPiSPIGetFd(@channel)
	end
	def wiringPiSPIDataRW(data)
	  return Wiringpi.wiringPiSPIDataRW(@channel,data)
	end
  end
end
