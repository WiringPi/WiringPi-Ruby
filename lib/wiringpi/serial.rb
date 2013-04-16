module WiringPi
  class Serial

    @id = 0
    @device = '/dev/ttyAMA0'
    @baud = 9600

    def initialize(device='/dev/ttyAMA0', baud=9600)

      @device = device
      @baud = baud

      @id = Wiringpi2.serialOpen(@device, @baud)

    end

    def serial_close

      Wiringpi2.serialClose(@id)
      @id = 0

    end

    def serial_put_char(char)

      Wiringpi2.serialPutchar(@id, char)

    end

    def serial_puts(string)

      Wiringpi2.serialPuts(@id, string)

    end

    def serial_data_avail

      Wiringpi2.serialDataAvail(@id)

    end

    def serial_get_char

      Wiringpi2.serialGetchar(@id)

    end

  end
end