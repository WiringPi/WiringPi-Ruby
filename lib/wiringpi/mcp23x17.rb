module WiringPi
  class Modules
    class Mcp23017 < ModuleBase

      @i2c_address = 0x0

      def initialize(pin_base, i2c_address)
        @pin_base = pin_base
        @pin_count = 16
        @i2c_address = i2c_address
        Wiringpi.mcp23017Setup( pin_base, i2c_address )
        super()
      end
    end
    class Mcp23s17 < ModuleBase

      @spi_port = 0
      @device_id = 0

      def initialize(pin_base, spi_port, device_id)
        @pin_base = pin_base
        @pin_count = 16
        @spi_port = spi_port
        @device_id = device_id
        Wiringpi.mcp23s17Setup( pin_base, spi_port, device_id )
        super()
      end

    end
  end
end
