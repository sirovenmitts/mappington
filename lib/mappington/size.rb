module Mappington
	class Size
		def initialize size
			@size = size
		end
		def to_s
			@size.join('x')
		end
	end
end