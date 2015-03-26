module WiringPi
  class GPIO

    @modules = Array.new
    @pins = Array.new

    attr_reader :modules, :pins

    def initialize(&block)
      Wiringpi.wiringPiSetup
      @pins = Array.new
      instance_eval &block if block_given?
    end

    def read_byte(starting_pin)
      bits = Array.new
      8.times do |time|
        bits << Wiringpi.digitalRead(starting_pin + time)
      end
      bits.join
    end

    def write_byte(starting_pin, byte)
      byte = byte.to_s(2) unless byte.length = 8
      offset = starting_pin
      byte.each_char do |bit|
        Wiringpi.digitalWrite(offset, bit)
        offset += 1
      end
    end

    def digital_read(pin)
      if pin.respond_to?(:each)
        pin.collect do |pin|
          Wiringpi.digitalRead(pin)
        end
      else
        Wiringpi.digitalRead(pin)
      end
    end

    def digital_write(pin, value)
      if pin.respond_to?(:each)
        pin.each do |pin|
          Wiringpi.digitalWrite(pin, value)
        end
      else
        Wiringpi.digitalWrite(pin, value)
      end
    end

    def pin_mode(pin, mode)
      Wiringpi.pinMode(pin, mode)
    end

    def pull_up_dn_control(pin,mode)
      Wiringpi.pullUpDnControl(pin, mode)
    end

	def delay(ms)
	  Wiringpi.delay(ms)
	end

	def delay_microseconds(ms)
	  Wiringpi.delayMicroseconds(ms)
	end

	def millis()
	  return Wiringpi.millis()
	end

	def micros()
	  return Wiringpi.micros()
	end

       def pi_board_rev()
          return Wiringpi.piBoardRev()
       end

       def wpi_pin_to_gpio(pin)
          return Wiringpi.wpiPinToGpio(pin)
       end

       def phys_pin_to_gpio(pin)
          return Wiringpi.physPinToGpio(pin)
       end

	def pwm_set_mode(mode)
	  return Wiringpi.pwmSetMode(mode)
	end

	def pwm_set_range(range)
	  return Wiringpi.pwmSetRange(range)
	end

	def pwm_set_clock(divisor)
	  return Wiringpi.pwmSetClock(divisor)
	end

  def soft_pwm_create(pin, initial_value, pwm_range)
    return Wiringpi.softPwmCreate(pin, initial_value, pwm_range)
  end

  def soft_pwm_write(pin, value)
    Wiringpi.softPwmWrite(pin, value)
  end

	def gpio_clock_set(pin, freq)
	  return Wiringpi.gpioClockSet(pin, freq)
	end

	def wait_for_interrupt(pin, ms)
	  Wiringpi.waitForInterrupt(pin, ms)
	end

	def wiringpi_isr(pin, mode, fn)
	  Wiringpi.wiringPiISR(pin, mode, fn)
	end

	def shift_out(dpin, cpin, order, val )
	  Wiringpi.shiftOut(dpin,cpin,order,val)
	end

	def shift_in(dpin, cpin, order)
	  Wiringpi.shiftIn(dpin,cpin,order)
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
