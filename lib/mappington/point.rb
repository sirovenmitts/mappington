module Mappington
	# A Point is a position on a map. It can be an address
	# or a coordinate.
	class Point
		def initialize point
			@point = point
		end
		def to_s
			@point.is_a?(Array) ? @point.join(',') : @point
		end
	end
end