Gem::Specification.new do |s|
  s.name	= 'wiringpi2'
  s.version	= '1.0.0'
  s.license = 'GNU General Public License'
  s.date	= '2013-04-07'
  s.platform= Gem::Platform::RUBY
  s.summary	= "Arduino wiring-like library for Raspberry Pi GPIO. Will only work on a Pi. Alpha version."
  s.authors	= ["Gordon","Phil"]
  s.email	= 'phil@gadgetoid.com'
  s.files	= Dir.glob('lib/wiringpi/*.rb') + Dir.glob('lib/*.rb') + Dir.glob('ext/**/**/*.{c,h}') + Dir.glob('ext/**/*.{c,h,rb}')
  s.homepage	= 'http://rubygems.org/gems/wiringpi2'
  s.extensions	= ['ext/wiringpi/extconf.rb']
  s.description = 'WiringPi library wrapper for the Raspberry Pi only. Wraps up version 2.x of the Arduino wiring-like WiringPi library into a convinient Ruby gem. Currently includes GPIO functionality, I2C, SPI, serial and shiftOut/shiftIn support in addition to peripheral drivers for things like the MCP23017. Credit to Gordon for the WiringPi library, which can be found here: http://www.wiringpi.com'
end
