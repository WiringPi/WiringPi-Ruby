require 'wiringpi2/wiringpi2'
module WiringPi
  extend self

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

end
Dir[File.dirname(__FILE__) + '/wiringpi/*.rb'].each {|file| require file }