module Mappington
	# A convenience object for specifying the size of
	# a Map's output image.
	class Size
		def initialize size
			@size = size
		end
		def to_s
			@size.join('x')
		end
	end
end