module Mappington
	class Point
		def initialize point
			@point = point
		end
		def to_s
			@point.is_a?(Array) ? @point.join(',') : @point
		end
	end
end