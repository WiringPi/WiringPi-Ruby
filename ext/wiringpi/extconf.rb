require 'mkmf'

LIBDIR      = RbConfig::CONFIG['libdir']
INCLUDEDIR  = RbConfig::CONFIG['includedir']

$srcs = Dir.glob('WiringPi/wiringPi/*.c')
$srcs += Dir.glob('WiringPi/devLib/*.c')
$srcs << 'wiringpi_wrap.c'

$srcs -= ['WiringPi/devLib/piFaceOld.c']

$objs = $srcs.map{ |file| file.sub('.c','.o') }

HEADER_DIRS = [
  './WiringPi/wiringPi',
  './WiringPi/devLib',
  '/usr/local/include',
  INCLUDEDIR,
  '/usr/include',
]

LIB_DIRS = [
  './WiringPi/wiringPi',
  './WiringPi/devLib',
  '/usr/local/lib',
  LIBDIR,
  '/usr/lib',
]

dir_config('wiringpi', HEADER_DIRS, LIB_DIRS)

create_makefile('wiringpi/wiringpi')    
