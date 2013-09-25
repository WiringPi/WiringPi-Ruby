module WiringPi
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

    def pull_up_dn_control(pin,mode)
      Wiringpi2.pullUpDnControl(pin, mode)
    end

	def delay(ms)
	  Wiringpi2.delay(ms)
	end

	def delay_microseconds(ms)
	  Wiringpi2.delayMicroseconds(ms)
	end

	def millis()
	  return Wiringpi2.millis()
	end

	def micros()
	  return Wiringpi2.micros()
	end

       def pi_board_rev()
          return Wiringpi2.piBoardRev()
       end

       def wpi_pin_to_gpio(pin)
          return Wiringpi2.wpiPinToGpio(pin)
       end

       def phys_pin_to_gpio(pin)
          return Wiringpi2.physPinToGpio(pin)
       end

	def pwm_set_mode(mode)
	  return Wiringpi2.pwmSetMode(mode)
	end

	def pwm_set_range(range)
	  return Wiringpi2.pwmSetRange(range)
	end

	def pwm_set_clock(divisor)
	  return Wiringpi2.pwmSetClock(divisor)
	end

	def gpio_clock_set(pin, freq)
	  return Wiringpi2.gpioClockSet(pin, freq)
	end

	def wait_for_interrupt(pin, ms)
	  Wiringpi2.waitForInterrupt(pin, ms)
	end

	def wiringpi_isr(pin, mode, fn)
	  Wiringpi2.wiringPiISR(pin, mode, fn)
	end

	def shift_out(dpin, cpin, order, val )
	  Wiringpi2.shiftOut(dpin,cpin,order,val)
	end

	def shift_in(dpin, cpin, order)
	  Wiringpi2.shiftIn(dpin,cpin,order)
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
