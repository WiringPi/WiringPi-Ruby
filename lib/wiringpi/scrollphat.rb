module WiringPi
	class ScrollPhat
		def initialize()
			Wiringpi.scrollPhatSetup()
		end

		def printf(text)
			Wiringpi.scrollPhatPrintf(text)
		end

		def point(x, y, colour)
			Wiringpi.scrollPhatPoint(x, y, colour)
		end

		def line(x0, y0, x1, y1, colour)
			Wiringpi.scrollPhatLine(x0, y0, x1, y1, colour)
		end

		def lineTo(x, y, colour)
			Wiringpi.scrollPhatLineTo(x, y, colour)
		end

		def rectangle(x1, y1, x2, y2, colour)
			Wiringpi.scrollPhatRectangle(x1, y1, x2, y2, colour)
		end

		def update()
			Wiringpi.scrollPhatUpdate()
		end

		def clear()
			Wiringpi.scrollPhatClear()
		end

		def putChar(char)
			Wiringpi.scrollPhatPutchar(char)
		end

		def puts(str)
			Wiringpi.scrollPhatPuts(str)
		end

		def printSpeed(cps10)
			Wiringpi.scrollPhatPrintSpeed(cps10)
		end

		def intensity(percent)
			Wiringpi.scrollPhatIntensity(percent)
		end
	end
end
