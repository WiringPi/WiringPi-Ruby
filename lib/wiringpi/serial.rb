module WiringPi
  class Serial

    @id = 0
    @device = '/dev/ttyAMA0'
    @baud = 9600

    def initialize(device='/dev/ttyAMA0', baud=9600)

      @device = device
      @baud = baud

      @id = Wiringpi.serialOpen(@device, @baud)

    end

    def serial_close

      Wiringpi.serialClose(@id)
      @id = 0

    end

    def serial_put_char(char)

      Wiringpi.serialPutchar(@id, char)

    end

    def serial_puts(string)

      Wiringpi.serialPuts(@id, string)

    end

    def serial_data_avail

      Wiringpi.serialDataAvail(@id)

    end

    def serial_get_char

      Wiringpi.serialGetchar(@id)

    end

  end
end
