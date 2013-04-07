require 'wiringpi2/wiringpi2'
class WiringPi

  HIGH = 1
  LOW = 0

  INPUT = 0
  OUTPUT = 1
  PWM_OUTPUT = 1

  PUD_OFF = 0
  PUD_DOWN = 1
  PUD_UP = 2

  LSPFIRST = 0
  MSBFIRST = 1


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

  class Modules
    class ModuleBase

      @name = 'Unknown'
      @pin_base = 0
      @pin_count = 0
      @pin_end = 0

      attr_reader :name, :pin_base, :pin_count, :pin_end

      def new
        @pin_end = @pin_base + @pin_count
        updateName
      end

      def updateName
        @name = ' at offset ' + @pin_base.to_s
      end

    end
  end

  class GPIO

    @modules = Array.new
    @pins = Array.new

    attr_reader :modules, :pins

    def initialize(&block)
      Wiringpi2.wiringPiSetup
      @pins = Array.new
      instance_eval &block
    end

    def read_byte(starting_pin)
      bits = Array.new
      8.times do |time|
        bits << Wiringpi2.digitalRead(starting_pin + time)
      end
      bits.join
    end

    def write_byte(starting_pin, byte)
      byte = byte.to_s(2) unless byte.length = 8
      offset = starting_pin
      byte.each_char do |bit|
        Wiringpi2.digitalWrite(offset, bit)
        offset += 1
      end
    end

    def digital_read(pin)
      if pin.respond_to?(:each)
        pin.collect do |pin|
          Wiringpi2.digitalRead(pin)
        end
      else
        Wiringpi2.digitalRead(pin)
      end
    end

    def digital_write(pin, value)
      if pin.respond_to?(:each)
        pin.each do |pin|
          Wiringpi2.digitalWrite(pin, value)
        end
      else
        Wiringpi2.digitalWrite(pin, value)
      end
    end

    def pin_mode(pin, mode)
      Wiringpi2.pinMode(pin, mode)
    end

    def add_module(module_instance)
      @modules = Array.new if @modules.nil?

      @modules << module_instance
      puts 'Added module ' + module_instance.name.to_s

      module_instance.pin_count.times do |offset|
        @pins[offset + module_instance.pin_base] = 'ENABLED'
      end
    end
  end

end
