module WiringPi
  class I2C
	@device_id = 0
	def initialize(device_address)
	  @device_id = Wiringpi.wiringPiI2CSetup(device_address)
	end
	def read()
	  return Wiringpi.wiringPiI2CRead(@device_id)
	end
	def write(data)
	  return Wiringpi.wiringPiI2CWrite(@device_id,data)
	end
	def read_reg_8(reg)
	  return Wiringpi.wiringPiI2CReadReg8(@device_id,reg)
	end
	def write_reg_8(reg,data)
	  return Wiringpi.wiringPiI2CWriteReg8(@device_id,reg,data)
	end
	def read_reg_16(reg)
	  return Wiringpi.wiringPiI2CReadReg16(@device_id,reg)
	end
	def write_reg_16(reg,data)
	  return Wiringpi.wiringPiI2CWriteReg16(@device_id,reg,data)
	end
  end
end
