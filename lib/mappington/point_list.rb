module Mappington
	class PointList < Array
		def << point
			super Point.new(point)
		end
		def to_s
			join('|')
		end
	end
end